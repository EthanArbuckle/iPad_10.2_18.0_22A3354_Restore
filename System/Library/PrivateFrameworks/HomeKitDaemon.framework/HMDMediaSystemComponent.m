@implementation HMDMediaSystemComponent

- (HMDMediaSystemComponent)initWithUUID:(id)a3 accessory:(id)a4 role:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDMediaSystemComponent *v12;
  HMDMediaSystemComponent *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDMediaSystemComponent;
  v12 = -[HMDMediaSystemComponent init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_uuid, a3);
    objc_storeWeak((id *)&v13->_accessory, v10);
    objc_storeStrong((id *)&v13->_role, a5);
  }

  return v13;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDMediaSystemComponent uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("uuid"), v4);
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDMediaSystemComponent accessory](self, "accessory", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("accessoryUUID"), v8);
  v16[1] = v9;
  v10 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDMediaSystemComponent role](self, "role");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "type");
  HMMediaSystemRoleTypeAsString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("roleType"), v12);
  v16[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDMediaSystemComponent uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dumpState
{
  return 0;
}

- (id)serialize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaSystemComponent uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDD7CE8]);

  -[HMDMediaSystemComponent accessory](self, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("kAccessoryUUID"));

  -[HMDMediaSystemComponent role](self, "role");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serialize");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDD7CE0]);

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
}

- (HMDMediaProfile)mediaProfile
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = WeakRetained;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "mediaProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return (HMDMediaProfile *)v7;
}

- (HMMediaSystemRole)role
{
  os_unfair_lock_s *p_lock;
  HMMediaSystemRole *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_role;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setRole:(id)a3
{
  HMMediaSystemRole *v4;
  HMMediaSystemRole *role;

  v4 = (HMMediaSystemRole *)a3;
  os_unfair_lock_lock_with_options();
  role = self->_role;
  self->_role = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDMediaSystemComponent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDMediaSystemComponent *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD7CE8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD7CE0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HMDMediaSystemComponent initWithUUID:accessory:role:](self, "initWithUUID:accessory:role:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMDMediaSystemComponent uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, *MEMORY[0x24BDD7CE8]);

  -[HMDMediaSystemComponent accessory](self, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeConditionalObject:forKey:", v6, CFSTR("accessory"));

  -[HMDMediaSystemComponent role](self, "role");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, *MEMORY[0x24BDD7CE0]);

}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (HMDAccessory)accessory
{
  return (HMDAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (OS_dispatch_queue)propertyQueue
{
  return self->_propertyQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyQueue, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_role, 0);
}

+ (id)accessoryForMediaSystemComponentWithDictionary:(id)a3 home:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "hmf_UUIDForKey:", CFSTR("kAccessoryUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "accessories");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmf_firstObjectWithUUID:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v12;
      v16 = 2112;
      v17 = v5;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@accessoryUUID is nil transaction dictionary - cannot find accessory with %@in home %@", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  return v9;
}

+ (id)mediaSystemComponentWithDictionary:(id)a3 home:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDMediaSystemComponent *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "hmf_UUIDForKey:", *MEMORY[0x24BDD7CE8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[HMDMediaSystemComponent accessoryForMediaSystemComponentWithDictionary:home:](HMDMediaSystemComponent, "accessoryForMediaSystemComponentWithDictionary:home:", v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v5, "hmf_dictionaryForKey:", *MEMORY[0x24BDD7CE0]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD77F0]), "initWithDictionary:", v9);
      if (v10)
      {
        v11 = -[HMDMediaSystemComponent initWithUUID:accessory:role:]([HMDMediaSystemComponent alloc], "initWithUUID:accessory:role:", v7, v8, v10);
      }
      else
      {
        v18 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 138543618;
          v23 = v20;
          v24 = 2112;
          v25 = v5;
          _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Role entry is nil - cannot create mediaSystemComponent with %@", (uint8_t *)&v22, 0x16u);

        }
        objc_autoreleasePoolPop(v18);
        v11 = 0;
      }

    }
    else
    {
      v15 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543874;
        v23 = v17;
        v24 = 2112;
        v25 = v5;
        v26 = 2112;
        v27 = v6;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@accessory cannot be looked up - cannot create mediaSystemComponent with %@in home %@", (uint8_t *)&v22, 0x20u);

      }
      objc_autoreleasePoolPop(v15);
      v11 = 0;
    }

  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v14;
      v24 = 2112;
      v25 = v5;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@mediaComponentUUID is nil - cannot create mediaSystemComponent with %@", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v11 = 0;
  }

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_143966 != -1)
    dispatch_once(&logCategory__hmf_once_t4_143966, &__block_literal_global_143967);
  return (id)logCategory__hmf_once_v5_143968;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __38__HMDMediaSystemComponent_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_143968;
  logCategory__hmf_once_v5_143968 = v0;

}

@end

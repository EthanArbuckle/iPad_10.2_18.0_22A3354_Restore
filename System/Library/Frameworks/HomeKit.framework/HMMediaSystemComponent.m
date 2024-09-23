@implementation HMMediaSystemComponent

- (HMMediaSystemComponent)initWithMediaProfile:(id)a3 role:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  HMMediaSystemComponent *v10;

  v6 = (void *)MEMORY[0x1E0CB3A28];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMMediaSystemComponent initWithUUID:mediaProfile:role:](self, "initWithUUID:mediaProfile:role:", v9, v8, v7);

  return v10;
}

- (HMMediaSystemComponent)initWithUUID:(id)a3 mediaProfile:(id)a4 role:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMMediaSystemComponent *v12;
  HMMediaSystemComponent *v13;
  void *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMMediaSystemComponent;
  v12 = -[HMMediaSystemComponent init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_uuid, a3);
    objc_msgSend(v10, "accessory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v13->_accessory, v14);

    objc_storeStrong((id *)&v13->_role, a5);
  }

  return v13;
}

- (void)_unconfigure
{
  -[HMMediaSystemComponent setAccessory:](self, "setAccessory:", 0);
  -[HMMediaSystemComponent setRole:](self, "setRole:", 0);
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMMediaSystemComponent uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HMMediaSystemComponent uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaSystemComponent accessory](self, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaSystemComponent role](self, "role");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ uuid: %@ accessory identifier: %@ role: %@>"), v4, v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  HMMediaSystemComponent *v4;
  HMMediaSystemComponent *v5;
  HMMediaSystemComponent *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (HMMediaSystemComponent *)a3;
  if (v4 == self)
  {
    v11 = 1;
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
      -[HMMediaSystemComponent uuid](self, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMediaSystemComponent uuid](v6, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "hmf_isEqualToUUID:", v8))
      {
        -[HMMediaSystemComponent role](self, "role");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMediaSystemComponent role](v6, "role");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMMediaSystemComponent uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)_updateAccessoryReference:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaSystemComponent accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_firstObjectWithUUID:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[HMMediaSystemComponent setAccessory:](self, "setAccessory:", v7);
}

- (HMMediaSystemComponent)initWithCoder:(id)a3
{
  id v4;
  HMMediaSystemComponent *v5;
  uint64_t v6;
  NSUUID *uuid;
  void *v8;
  uint64_t v9;
  HMMediaSystemRole *role;

  v4 = a3;
  v5 = -[HMMediaSystemComponent init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), kMediaSystemComponentUUIDCodingKey);
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessory"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_accessory, v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), kMediaSystemComponentRoleCodingKey);
    v9 = objc_claimAutoreleasedReturnValue();
    role = v5->_role;
    v5->_role = (HMMediaSystemRole *)v9;

  }
  return v5;
}

- (HMMediaProfile)mediaProfile
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  objc_msgSend(WeakRetained, "mediaProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return (HMMediaProfile *)v5;
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

- (NSUUID)uniqueIdentifier
{
  os_unfair_lock_s *p_lock;
  NSUUID *uniqueIdentifier;
  NSUUID *v5;
  NSUUID *v6;
  NSUUID *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "hm_deriveUUIDFromBaseUUID:", self->_uuid);
    v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v6 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v5;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  v7 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (HMAccessory)accessory
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  os_unfair_lock_unlock(p_lock);
  return (HMAccessory *)WeakRetained;
}

- (void)setAccessory:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_accessory, v5);

  os_unfair_lock_unlock(p_lock);
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaSystemComponent uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, kMediaSystemComponentUUIDCodingKey);

  -[HMMediaSystemComponent accessory](self, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("kAccessoryUUID"));

  -[HMMediaSystemComponent role](self, "role");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serialize");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, kMediaSystemComponentRoleCodingKey);

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;
  void *v8;
  HMMediaSystemComponent *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    v7 = -[HMMediaSystemComponent mergeRoleWithComponent:](self, "mergeRoleWithComponent:", v6);
  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get component for merge", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (BOOL)mergeRoleWithComponent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  HMMediaSystemComponent *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMMediaSystemComponent role](self, "role");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "role");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "role");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating component role: %@ during merge", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v4, "role");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMediaSystemComponent setRole:](v9, "setRole:", v13);

  }
  return v7 ^ 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMMediaSystemComponent *v4;
  void *v5;
  void *v6;
  HMMediaSystemComponent *v7;

  v4 = [HMMediaSystemComponent alloc];
  -[HMMediaSystemComponent mediaProfile](self, "mediaProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaSystemComponent role](self, "role");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMMediaSystemComponent initWithMediaProfile:role:](v4, "initWithMediaProfile:role:", v5, v6);

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableMediaSystemComponent *v4;
  void *v5;
  void *v6;
  HMMutableMediaSystemComponent *v7;

  v4 = [HMMutableMediaSystemComponent alloc];
  -[HMMediaSystemComponent mediaProfile](self, "mediaProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaSystemComponent role](self, "role");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMMediaSystemComponent initWithMediaProfile:role:](v4, "initWithMediaProfile:role:", v5, v6);

  return v7;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_destroyWeak((id *)&self->_mediaProfile);
}

+ (id)mediaSystemComponentWithDictionary:(id)a3 home:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMMediaSystemRole *v11;
  void *v12;
  void *v13;
  void *v14;
  HMMediaSystemComponent *v15;

  v5 = kMediaSystemComponentUUIDCodingKey;
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "hmf_UUIDForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hmf_UUIDForKey:", CFSTR("kAccessoryUUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hmf_dictionaryForKey:", kMediaSystemComponentRoleCodingKey);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HMMediaSystemRole initWithDictionary:]([HMMediaSystemRole alloc], "initWithDictionary:", v10);
  objc_msgSend(v6, "accessories");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "hmf_firstObjectWithUUID:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "mediaProfile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HMMediaSystemComponent initWithUUID:mediaProfile:role:]([HMMediaSystemComponent alloc], "initWithUUID:mediaProfile:role:", v8, v14, v11);

  return v15;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_54264 != -1)
    dispatch_once(&logCategory__hmf_once_t0_54264, &__block_literal_global_54265);
  return (id)logCategory__hmf_once_v1_54266;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __37__HMMediaSystemComponent_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_54266;
  logCategory__hmf_once_v1_54266 = v0;

}

@end

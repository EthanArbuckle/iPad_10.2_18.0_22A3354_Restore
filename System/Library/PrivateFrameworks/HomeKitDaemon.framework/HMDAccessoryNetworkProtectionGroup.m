@implementation HMDAccessoryNetworkProtectionGroup

- (HMDAccessoryNetworkProtectionGroup)initWithUUID:(id)a3 manufacturer:(id)a4 category:(id)a5 targetProtectionMode:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  HMDAccessoryNetworkProtectionGroup *v14;
  HMDAccessoryNetworkProtectionGroup *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMDAccessoryNetworkProtectionGroup;
  v14 = -[HMDAccessoryNetworkProtectionGroup init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_uuid, a3);
    objc_storeStrong((id *)&v15->_manufacturer, a4);
    objc_storeStrong((id *)&v15->_category, a5);
    v15->_targetProtectionMode = a6;
  }

  return v15;
}

- (HMDAccessoryNetworkProtectionGroup)initWithModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAccessoryNetworkProtectionGroup *v9;

  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "manufacturer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "category");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetProtectionMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HMDAccessoryNetworkProtectionGroup initWithUUID:manufacturer:category:targetProtectionMode:](self, "initWithUUID:manufacturer:category:targetProtectionMode:", v5, v6, v7, objc_msgSend(v8, "integerValue"));
  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDAccessoryNetworkProtectionGroup uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMDAccessoryNetworkProtectionGroup *v4;
  HMDAccessoryNetworkProtectionGroup *v5;
  HMDAccessoryNetworkProtectionGroup *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMDAccessoryNetworkProtectionGroup *)a3;
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
      -[HMDAccessoryNetworkProtectionGroup uuid](self, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryNetworkProtectionGroup uuid](v6, "uuid");
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

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDAccessoryNetworkProtectionGroup uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryNetworkProtectionGroup manufacturer](self, "manufacturer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryNetworkProtectionGroup category](self, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryNetworkProtectionGroup targetProtectionMode](self, "targetProtectionMode");
  HMAccessoryNetworkProtectionModeAsString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[ uuid = %@, manufacturer = %@, category = %@, targetProtectionMode = %@ ]"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (int64_t)targetProtectionMode
{
  os_unfair_lock_s *p_lock;
  int64_t targetProtectionMode;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  targetProtectionMode = self->_targetProtectionMode;
  os_unfair_lock_unlock(p_lock);
  return targetProtectionMode;
}

- (void)setTargetProtectionMode:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_targetProtectionMode = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSString)manufacturer
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_manufacturer;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setManufacturer:(id)a3
{
  NSString *v4;
  NSString *manufacturer;

  v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  manufacturer = self->_manufacturer;
  self->_manufacturer = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)category
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_category;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCategory:(id)a3
{
  NSNumber *v4;
  NSNumber *category;

  v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  category = self->_category;
  self->_category = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDAccessoryNetworkProtectionGroup)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HMDAccessoryNetworkProtectionGroup *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD4CE0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD4CB0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDAccessoryNetworkProtectionGroupCategoryCodingKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", *MEMORY[0x24BDD4CC0]);

  v9 = -[HMDAccessoryNetworkProtectionGroup initWithUUID:manufacturer:category:targetProtectionMode:](self, "initWithUUID:manufacturer:category:targetProtectionMode:", v5, v6, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  int v4;
  int v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  id v13;

  v13 = a3;
  v4 = objc_msgSend(v13, "hmd_isForXPCTransport");
  v5 = objc_msgSend(v13, "hmd_isForXPCTransportEntitledForSPIAccess");
  if ((objc_msgSend(v13, "hmd_isForRemoteGatewayCoder") & 1) == 0)
  {
    if ((v4 ^ 1 | v5) == 1)
    {
      -[HMDAccessoryNetworkProtectionGroup uuid](self, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "encodeObject:forKey:", v6, *MEMORY[0x24BDD4CE0]);

      -[HMDAccessoryNetworkProtectionGroup manufacturer](self, "manufacturer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "encodeObject:forKey:", v7, *MEMORY[0x24BDD4CB0]);

      v8 = -[HMDAccessoryNetworkProtectionGroup targetProtectionMode](self, "targetProtectionMode");
      objc_msgSend(v13, "encodeInteger:forKey:", v8, *MEMORY[0x24BDD4CC0]);
    }
    if ((v4 & 1) == 0)
    {
      -[HMDAccessoryNetworkProtectionGroup category](self, "category");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("HMDAccessoryNetworkProtectionGroupCategoryCodingKey");
      goto LABEL_8;
    }
    if (v5)
    {
      v9 = (void *)MEMORY[0x24BDD7338];
      -[HMDAccessoryNetworkProtectionGroup category](self, "category");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "categoryWithCategoryIdentifier:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (const __CFString *)*MEMORY[0x24BDD4CA8];
LABEL_8:
      objc_msgSend(v13, "encodeObject:forKey:", v11, v12);

    }
  }

}

- (id)modelWithObjectChangeType:(unint64_t)a3
{
  HMDAccessoryNetworkProtectionGroupModel *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAccessoryNetworkProtectionGroupModel *v9;

  v5 = [HMDAccessoryNetworkProtectionGroupModel alloc];
  -[HMDAccessoryNetworkProtectionGroup uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryNetworkProtectionGroup home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", a3, v6, v8);

  return v9;
}

- (id)modelForVersion:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3 < 4)
  {
    v4 = 0;
  }
  else
  {
    -[HMDAccessoryNetworkProtectionGroup modelWithObjectChangeType:](self, "modelWithObjectChangeType:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryNetworkProtectionGroup manufacturer](self, "manufacturer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setManufacturer:", v5);

    -[HMDAccessoryNetworkProtectionGroup category](self, "category");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCategory:", v6);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDAccessoryNetworkProtectionGroup targetProtectionMode](self, "targetProtectionMode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTargetProtectionMode:", v7);

  }
  return v4;
}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAccessoryNetworkProtectionGroup *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v11;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = (id)objc_opt_class();
    v12 = v19;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectRemoved]", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "respondWithError:", v13);

}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  int64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  HMDAccessoryNetworkProtectionGroup *v36;
  NSObject *v37;
  void *v38;
  id v39;
  _QWORD v40[2];
  _QWORD v41[2];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
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
    objc_msgSend(v10, "transactionResult");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "propertyWasSet:", CFSTR("targetProtectionMode")))
    {
      v15 = -[HMDAccessoryNetworkProtectionGroup targetProtectionMode](self, "targetProtectionMode");
      objc_msgSend(v13, "targetProtectionMode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "integerValue");

      if (v15 != v17)
      {
        objc_msgSend(v13, "targetProtectionMode");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryNetworkProtectionGroup setTargetProtectionMode:](self, "setTargetProtectionMode:", objc_msgSend(v18, "integerValue"));

        objc_msgSend(v14, "markChanged");
        -[HMDAccessoryNetworkProtectionGroup uuid](self, "uuid", *MEMORY[0x24BDD4CE8]);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = v19;
        v40[1] = *MEMORY[0x24BDD4CC8];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDAccessoryNetworkProtectionGroup targetProtectionMode](self, "targetProtectionMode"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v41[1] = v20;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "postNotificationName:object:userInfo:", CFSTR("HMDAccessoryNetworkProtectionGroupProtectionModeUpdated"), self, v21);

      }
    }
    objc_msgSend(v13, "manufacturer");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (void *)v23;
      -[HMDAccessoryNetworkProtectionGroup manufacturer](self, "manufacturer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "manufacturer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = HMFEqualObjects();

      if ((v27 & 1) == 0)
      {
        objc_msgSend(v13, "manufacturer");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryNetworkProtectionGroup setManufacturer:](self, "setManufacturer:", v28);

        objc_msgSend(v14, "markChanged");
      }
    }
    objc_msgSend(v13, "category");
    v29 = objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v30 = (void *)v29;
      -[HMDAccessoryNetworkProtectionGroup category](self, "category");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "category");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = HMFEqualObjects();

      if ((v33 & 1) == 0)
      {
        objc_msgSend(v13, "category");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryNetworkProtectionGroup setCategory:](self, "setCategory:", v34);

        objc_msgSend(v14, "markChanged");
      }
    }
    objc_msgSend(v10, "respondWithPayload:", 0);
  }
  else
  {
    v35 = (void *)MEMORY[0x227676638]();
    v36 = self;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v43 = v38;
      v44 = 2112;
      v45 = v11;
      v46 = 2112;
      v47 = (id)objc_opt_class();
      v39 = v47;
      _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated]", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v35);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "respondWithError:", v14);
  }

}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

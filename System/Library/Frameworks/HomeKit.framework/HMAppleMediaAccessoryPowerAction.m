@implementation HMAppleMediaAccessoryPowerAction

- (HMAppleMediaAccessoryPowerAction)init
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

- (HMAppleMediaAccessoryPowerAction)initWithUUID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (HMAppleMediaAccessoryPowerAction)initWithAccessory:(id)a3 targetSleepWakeState:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  HMAppleMediaAccessoryPowerAction *v10;

  v6 = a3;
  objc_msgSend(v6, "category");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "categoryType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("F6D2A2AC-3A6E-4E6F-8196-678ABE909D8E"));

  v10 = 0;
  if (a4 && v9)
  {
    self = -[HMAppleMediaAccessoryPowerAction initWithAccessory:targetSleepWakeState:uuid:](self, v6, a4);
    v10 = self;
  }

  return v10;
}

- (unint64_t)type
{
  return 4;
}

- (HMAccessory)accessory
{
  os_unfair_lock_s *p_lock;
  HMAccessory *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_accessory;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)targetSleepWakeState
{
  os_unfair_lock_s *p_lock;
  unint64_t targetSleepWakeState;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  targetSleepWakeState = self->_targetSleepWakeState;
  os_unfair_lock_unlock(p_lock);
  return targetSleepWakeState;
}

- (id)copyWithZone:(_NSZone *)a3
{
  os_unfair_lock_s *p_lock;
  _QWORD *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = -[HMAppleMediaAccessoryPowerAction initWithAccessory:targetSleepWakeState:uuid:]([HMAppleMediaAccessoryPowerAction alloc], self->_accessory, self->_targetSleepWakeState);
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (HMAppleMediaAccessoryPowerAction)initWithCoder:(id)a3
{
  id v4;
  HMAppleMediaAccessoryPowerAction *v5;
  uint64_t v6;
  HMAccessory *accessory;
  void *v8;
  HMAppleMediaAccessoryPowerAction *v9;
  void *v10;
  HMAppleMediaAccessoryPowerAction *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMAppleMediaAccessoryPowerAction;
  v5 = -[HMAction initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAPA.accessory"));
  v6 = objc_claimAutoreleasedReturnValue();
  accessory = v5->_accessory;
  v5->_accessory = (HMAccessory *)v6;

  if (v5->_accessory)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAPA.targetState"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_targetSleepWakeState = objc_msgSend(v8, "unsignedIntegerValue");

LABEL_4:
    v9 = v5;
    goto LABEL_8;
  }
  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = v5;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v18 = v13;
    v19 = 2112;
    v20 = v14;
    _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive %@, missing accessory", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  v9 = 0;
LABEL_8:

  return v9;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  unint64_t v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMAppleMediaAccessoryPowerAction accessory](self, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "hmf_isEqualToUUID:", v10);
    v12 = v11 ^ 1;

    if ((v11 & 1) == 0)
      -[HMAppleMediaAccessoryPowerAction setAccessory:](self, "setAccessory:", v8);
    v13 = -[HMAppleMediaAccessoryPowerAction targetSleepWakeState](self, "targetSleepWakeState");
    if (v13 != objc_msgSend(v6, "targetSleepWakeState"))
    {
      -[HMAppleMediaAccessoryPowerAction setTargetSleepWakeState:](self, "setTargetSleepWakeState:", objc_msgSend(v6, "targetSleepWakeState"));
      v12 = 1;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)updateWithAction:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, void *))a4;
  -[HMAction actionSet](self, "actionSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v9, "_serializeForAdd");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_updateAction:changes:completionHandler:", self, v8, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v8);
  }

}

- (BOOL)isValidWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[HMAppleMediaAccessoryPowerAction accessory](self, "accessory", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "categoryType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("F6D2A2AC-3A6E-4E6F-8196-678ABE909D8E")))
    v7 = -[HMAppleMediaAccessoryPowerAction targetSleepWakeState](self, "targetSleepWakeState") != 0;
  else
    v7 = 0;

  return v7;
}

- (BOOL)isAffectedByEndEvents
{
  return -[HMAppleMediaAccessoryPowerAction targetSleepWakeState](self, "targetSleepWakeState") == 2;
}

- (id)_serializeForAdd
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HMAppleMediaAccessoryPowerAction;
  -[HMAction _serializeForAdd](&v11, sel__serializeForAdd);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HMAppleMediaAccessoryPowerAction accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("accessory"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMAppleMediaAccessoryPowerAction targetSleepWakeState](self, "targetSleepWakeState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("targetState"));

  v9 = (void *)objc_msgSend(v4, "copy");
  return v9;
}

- (HMAppleMediaAccessoryPowerAction)initWithDictionary:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HMAppleMediaAccessoryPowerAction *v8;
  void *v9;
  uint64_t v10;
  HMAccessory *accessory;
  void *v12;
  HMAppleMediaAccessoryPowerAction *v13;
  void *v14;
  HMAppleMediaAccessoryPowerAction *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  HMAppleMediaAccessoryPowerAction *v22;
  uint64_t v23;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)HMAppleMediaAccessoryPowerAction;
  v8 = -[HMAction initWithDictionary:home:](&v25, sel_initWithDictionary_home_, v6, v7);
  if (!v8)
    goto LABEL_5;
  objc_msgSend(v6, "hmf_UUIDForKey:", CFSTR("accessory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = v8;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v27 = v17;
      v28 = 2112;
      v29 = v18;
      v19 = "%{public}@Unable to decode %@, missing accessory id";
      v20 = v16;
      v21 = 22;
LABEL_10:
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);

    }
LABEL_11:

    objc_autoreleasePoolPop(v14);
    v13 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v7, "accessoryWithUUID:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  accessory = v8->_accessory;
  v8->_accessory = (HMAccessory *)v10;

  if (!v8->_accessory)
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = v8;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v27 = v17;
      v28 = 2112;
      v29 = v23;
      v30 = 2112;
      v31 = v9;
      v19 = "%{public}@Unable to decode %@, failed to resolve accessory %@";
      v20 = v16;
      v21 = 32;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("targetState"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v8->_targetSleepWakeState = objc_msgSend(v12, "unsignedIntegerValue");

LABEL_5:
  v13 = v8;
LABEL_12:

  return v13;
}

- (BOOL)_handleUpdates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  int v13;

  v4 = a3;
  -[HMAction actionSet](self, "actionSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "hmf_UUIDForKey:", CFSTR("accessory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessoryWithUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("HMAPA.targetState"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "unsignedIntegerValue");
  objc_msgSend(v8, "category");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "categoryType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("F6D2A2AC-3A6E-4E6F-8196-678ABE909D8E"));

  if (v13)
  {
    os_unfair_lock_lock_with_options();
    objc_storeStrong((id *)&self->_accessory, v8);
    self->_targetSleepWakeState = v10;
    os_unfair_lock_unlock(&self->_lock);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  HMAppleMediaAccessoryPowerAction *v4;
  HMAppleMediaAccessoryPowerAction *v5;
  HMAppleMediaAccessoryPowerAction *v6;
  HMAppleMediaAccessoryPowerAction *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;

  v4 = (HMAppleMediaAccessoryPowerAction *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    v7 = v6;
    if (v6)
    {
      -[HMAppleMediaAccessoryPowerAction accessory](v6, "accessory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAppleMediaAccessoryPowerAction accessory](self, "accessory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "hmf_isEqualToUUID:", v11))
      {
        v12 = -[HMAppleMediaAccessoryPowerAction targetSleepWakeState](v7, "targetSleepWakeState");
        v13 = v12 == -[HMAppleMediaAccessoryPowerAction targetSleepWakeState](self, "targetSleepWakeState");
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (void)setAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_accessory, a3);
}

- (void)setTargetSleepWakeState:(unint64_t)a3
{
  self->_targetSleepWakeState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
}

- (_QWORD)initWithAccessory:(_QWORD *)a1 targetSleepWakeState:(void *)a2 uuid:(uint64_t)a3
{
  id v6;
  id v7;
  objc_super v9;

  v6 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)HMAppleMediaAccessoryPowerAction;
    v7 = objc_msgSendSuper2(&v9, sel_initWithUUID_, 0);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong((id *)v7 + 7, a2);
      a1[8] = a3;
    }
  }

  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

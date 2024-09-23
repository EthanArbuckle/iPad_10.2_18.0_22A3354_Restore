@implementation HMCharacteristicWriteAction

- (BOOL)isEqual:(id)a3
{
  HMCharacteristicWriteAction *v4;
  HMCharacteristicWriteAction *v5;
  HMCharacteristicWriteAction *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (HMCharacteristicWriteAction *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6
      && (-[HMCharacteristicWriteAction characteristic](self, "characteristic"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          -[HMCharacteristicWriteAction characteristic](v6, "characteristic"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = HMFEqualObjects(),
          v8,
          v7,
          v9))
    {
      -[HMCharacteristicWriteAction targetValue](self, "targetValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMCharacteristicWriteAction targetValue](v6, "targetValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = HMFEqualObjects();

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (HMCharacteristic)characteristic
{
  os_unfair_lock_s *p_lock;
  HMCharacteristic *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_characteristic;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)type
{
  return 0;
}

- (id)targetValue
{
  os_unfair_lock_s *p_lock;
  NSCopying *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_targetValue;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)__configureWithContext:(id)a3 actionSet:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMCharacteristic *v9;
  HMCharacteristic *characteristic;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMCharacteristicWriteAction;
  -[HMAction __configureWithContext:actionSet:](&v11, sel___configureWithContext_actionSet_, v6, v7);
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  resolveCharacteristic(self->_characteristic, v8);
  v9 = (HMCharacteristic *)objc_claimAutoreleasedReturnValue();
  characteristic = self->_characteristic;
  self->_characteristic = v9;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMCharacteristicWriteAction)initWithCoder:(id)a3
{
  id v4;
  HMCharacteristicWriteAction *v5;
  uint64_t v6;
  HMCharacteristic *characteristic;
  void *v8;
  uint64_t v9;
  NSCopying *targetValue;
  HMCharacteristicWriteAction *v11;
  void *v12;
  HMCharacteristicWriteAction *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HMCharacteristicWriteAction;
  v5 = -[HMAction initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("characteristic"));
  v6 = objc_claimAutoreleasedReturnValue();
  characteristic = v5->_characteristic;
  v5->_characteristic = (HMCharacteristic *)v6;

  if (!v5->_characteristic)
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = v5;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v22 = v15;
      v23 = 2112;
      v24 = v16;
      v17 = "%{public}@Unable to unarchive %@, missing characteristic";
LABEL_9:
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, v17, buf, 0x16u);

    }
LABEL_10:

    objc_autoreleasePoolPop(v12);
    v11 = 0;
    goto LABEL_11;
  }
  allowedCharValueTypes();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("characteristicValue"));
  v9 = objc_claimAutoreleasedReturnValue();
  targetValue = v5->_targetValue;
  v5->_targetValue = (NSCopying *)v9;

  if (!v5->_targetValue)
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = v5;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v22 = v15;
      v23 = 2112;
      v24 = v18;
      v17 = "%{public}@Unable to unarchive %@, missing target value";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
LABEL_4:
  v11 = v5;
LABEL_11:

  return v11;
}

- (HMCharacteristicWriteAction)init
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

- (HMCharacteristicWriteAction)initWithUUID:(id)a3
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

- (HMCharacteristicWriteAction)initWithCharacteristic:(HMCharacteristic *)characteristic targetValue:(id)targetValue
{
  HMCharacteristic *v6;
  id v7;
  void *v8;
  HMCharacteristicWriteAction *v9;
  HMCharacteristicWriteAction *v11;
  SEL v12;
  id v13;
  id v14;

  v6 = characteristic;
  v7 = targetValue;
  if (v6)
  {
    v8 = v7;
    if (v7)
    {
      v9 = (HMCharacteristicWriteAction *)-[HMCharacteristicWriteAction initWithCharacteristic:targetValue:uuid:](self, v6, v7, 0);

      return v9;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  v11 = (HMCharacteristicWriteAction *)_HMFPreconditionFailure();
  return -[HMCharacteristicWriteAction initWithDictionary:home:](v11, v12, v13, v14);
}

- (HMCharacteristicWriteAction)initWithDictionary:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HMCharacteristicWriteAction *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSCopying *targetValue;
  uint64_t v15;
  HMCharacteristic *characteristic;
  HMCharacteristicWriteAction *v17;
  void *v18;
  HMCharacteristicWriteAction *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  HMCharacteristicWriteAction *v24;
  uint64_t v25;
  NSObject *v26;
  uint32_t v27;
  HMCharacteristicWriteAction *v29;
  uint64_t v30;
  objc_super v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)HMCharacteristicWriteAction;
  v8 = -[HMAction initWithDictionary:home:](&v31, sel_initWithDictionary_home_, v6, v7);
  if (!v8)
    goto LABEL_8;
  objc_msgSend(v6, "hmf_UUIDForKey:", CFSTR("kAccessoryUUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("kServiceInstanceID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("kCharacteristicInstanceID"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (!v9 || !v10 || !v11)
  {
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = v8;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v33 = v21;
      v34 = 2112;
      v35 = v22;
      v23 = "%{public}@Unable to decode %@, missing accessory/service/characteristic ids";
LABEL_13:
      v26 = v20;
      v27 = 22;
LABEL_14:
      _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_ERROR, v23, buf, v27);

    }
LABEL_15:

    objc_autoreleasePoolPop(v18);
    v17 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCharacteristicValue"));
  v13 = objc_claimAutoreleasedReturnValue();
  targetValue = v8->_targetValue;
  v8->_targetValue = (NSCopying *)v13;

  if (!v8->_targetValue)
  {
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v24 = v8;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v33 = v21;
      v34 = 2112;
      v35 = v25;
      v23 = "%{public}@Unable to decode %@, missing target value";
      goto LABEL_13;
    }
    goto LABEL_15;
  }
  objc_msgSend(v7, "_findCharacteristic:forService:accessoryUUID:", v12, v10, v9);
  v15 = objc_claimAutoreleasedReturnValue();
  characteristic = v8->_characteristic;
  v8->_characteristic = (HMCharacteristic *)v15;

  if (!v8->_characteristic)
  {
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v29 = v8;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_opt_class();
    *(_DWORD *)buf = 138544386;
    v33 = v21;
    v34 = 2112;
    v35 = v30;
    v36 = 2112;
    v37 = v9;
    v38 = 2112;
    v39 = v10;
    v40 = 2112;
    v41 = v12;
    v23 = "%{public}@Unable to decode %@, failed to resolve characteristic %@/%@/%@";
    v26 = v20;
    v27 = 52;
    goto LABEL_14;
  }

LABEL_8:
  v17 = v8;
LABEL_16:

  return v17;
}

- (void)updateTargetValue:(id)targetValue completionHandler:(void *)completion
{
  id v6;
  void (**v7)(void *, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMCharacteristicWriteAction *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  HMCharacteristicWriteAction *v23;
  NSObject *v24;
  void *v25;
  id v26;
  _QWORD v27[2];
  _QWORD v28[2];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = targetValue;
  v7 = completion;
  -[HMAction context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMCharacteristicWriteAction updateTargetValue:completionHandler:]", CFSTR("completion"));
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1A1AC1AAC]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v25;
      v31 = 2112;
      v32 = (const char *)v21;
      _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v21, 0);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v26);
  }
  v9 = v8;
  if (v8)
  {
    if (v6)
    {
      -[HMAction actionSet](self, "actionSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "home");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = (void *)objc_msgSend(v6, "copy");

        -[HMAction uuid](self, "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v27[0] = CFSTR("kActionType");
          v27[1] = CFSTR("kCharacteristicValue");
          v28[0] = &unk_1E3B2E4B8;
          v28[1] = v12;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_updateAction:changes:completionHandler:", self, v14, v7);
        }
        else
        {
          os_unfair_lock_lock_with_options();
          objc_storeStrong((id *)&self->_targetValue, v12);
          os_unfair_lock_unlock(&self->_lock);
          objc_msgSend(v9, "delegateCaller");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "callCompletion:error:", v7, 0);
        }

        v6 = v12;
      }
      else
      {
        objc_msgSend(v9, "delegateCaller");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "callCompletion:error:", v7, v20);

      }
    }
    else
    {
      objc_msgSend(v8, "delegateCaller");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "callCompletion:error:", v7, v10);
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v18;
      v31 = 2080;
      v32 = "-[HMCharacteristicWriteAction updateTargetValue:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v10);
  }

}

- (BOOL)isValidWithError:(id *)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  -[HMCharacteristicWriteAction characteristic](self, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", CFSTR("HMCharacteristicPropertyWritable"));

  if ((v7 & 1) == 0)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 5);
      v11 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    v11 = 0;
    goto LABEL_7;
  }
  -[HMCharacteristicWriteAction targetValue](self, "targetValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_6;
  objc_msgSend(v5, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 != 0;

LABEL_7:
  return v11;
}

- (BOOL)isAffectedByEndEvents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  char v8;

  -[HMCharacteristicWriteAction characteristic](self, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "characteristicType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (isRestoreSupportedForCharacteristic(v4))
  {
    -[HMCharacteristicWriteAction targetValue](self, "targetValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    v8 = objc_msgSend(v7, "isEqualToNumber:", MEMORY[0x1E0C9AAB0]);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)requiresDeviceUnlock
{
  void *v2;
  char v3;

  -[HMCharacteristicWriteAction characteristic](self, "characteristic");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requiresDeviceUnlock");

  return v3;
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  if (!-[HMAction isValid](self, "isValid"))
    return 0;
  v15.receiver = self;
  v15.super_class = (Class)HMCharacteristicWriteAction;
  -[HMAction _serializeForAdd](&v15, sel__serializeForAdd);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HMCharacteristicWriteAction characteristic](self, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = CFSTR("kAccessoryUUID");
  objc_msgSend(v6, "accessoryUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  v16[1] = CFSTR("kServiceInstanceID");
  objc_msgSend(v6, "instanceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  v16[2] = CFSTR("kCharacteristicInstanceID");
  objc_msgSend(v5, "instanceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v10;
  v16[3] = CFSTR("kCharacteristicValue");
  -[HMCharacteristicWriteAction targetValue](self, "targetValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v12);

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

- (BOOL)_handleUpdates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kActionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && !objc_msgSend(v5, "unsignedIntegerValue"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCharacteristicValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8 != 0;
    if (v8)
    {
      os_unfair_lock_lock_with_options();
      objc_storeStrong((id *)&self->_targetValue, v8);
      os_unfair_lock_unlock(&self->_lock);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
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
  os_unfair_lock_s *p_lock;
  char v12;
  char v13;
  HMCharacteristic *v14;
  HMCharacteristic *characteristic;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    -[HMAction actionSet](self, "actionSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "characteristic");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "targetValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    v12 = HMFEqualObjects();
    if ((v12 & 1) == 0)
      objc_storeStrong((id *)&self->_targetValue, v10);
    if ((HMFEqualObjects() & 1) != 0)
    {
      v13 = v12 ^ 1;
    }
    else
    {
      resolveCharacteristic(v9, v8);
      v14 = (HMCharacteristic *)objc_claimAutoreleasedReturnValue();
      characteristic = self->_characteristic;
      self->_characteristic = v14;

      v13 = 1;
    }
    os_unfair_lock_unlock(p_lock);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  os_unfair_lock_s *p_lock;
  id *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = -[HMCharacteristicWriteAction initWithCharacteristic:targetValue:uuid:]([HMCharacteristicWriteAction alloc], self->_characteristic, self->_targetValue, 0);
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (BOOL)isKindOfAllowedTargetValueClass:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  +[HMCharacteristicWriteAction allowedTargetValueClassesForShortcuts](HMCharacteristicWriteAction, "allowedTargetValueClassesForShortcuts", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)encodeAsProtoBuf
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMPBCharacteristicWriteAction *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  HMPBActionContainer *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMCharacteristicWriteAction *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  HMCharacteristicWriteAction *v29;
  NSObject *v30;
  void *v31;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[HMCharacteristicWriteAction characteristic](self, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(HMPBCharacteristicWriteAction);
    -[HMAction uuid](self, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hm_convertToData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMPBCharacteristicWriteAction setActionUUID:](v7, "setActionUUID:", v9);

    -[HMCharacteristicWriteAction characteristic](self, "characteristic");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMPBCharacteristicReference characteristicReferenceWithCharacteristic:](HMPBCharacteristicReference, "characteristicReferenceWithCharacteristic:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMPBCharacteristicWriteAction setCharacteristicReference:](v7, "setCharacteristicReference:", v11);

    -[HMCharacteristicWriteAction targetValue](self, "targetValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = -[HMCharacteristicWriteAction isKindOfAllowedTargetValueClass:](self, "isKindOfAllowedTargetValueClass:", v12);

    if ((_DWORD)v10)
    {
      v13 = (void *)MEMORY[0x1E0CB36F8];
      -[HMCharacteristicWriteAction targetValue](self, "targetValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      objc_msgSend(v13, "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, &v33);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v33;
      -[HMPBCharacteristicWriteAction setTargetValue:](v7, "setTargetValue:", v15);

      -[HMPBCharacteristicWriteAction targetValue](v7, "targetValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {

        v18 = objc_alloc_init(HMPBActionContainer);
        -[HMPBActionContainer setType:](v18, "setType:", 1);
        -[HMPBActionContainer setCharacteristicWriteAction:](v18, "setCharacteristicWriteAction:", v7);
LABEL_15:

        goto LABEL_16;
      }
      v28 = (void *)MEMORY[0x1A1AC1AAC]();
      v29 = self;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v31;
        v36 = 2112;
        v37 = v16;
        _os_log_impl(&dword_19B1B0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Couldn't encode targetValue: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v28);

    }
    else
    {
      v22 = (void *)MEMORY[0x1A1AC1AAC]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMCharacteristicWriteAction targetValue](v23, "targetValue");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v25;
        v36 = 2112;
        v37 = (id)objc_opt_class();
        v27 = v37;
        _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Target Value is of unhandled class %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
    }
    v18 = 0;
    goto LABEL_15;
  }
  v19 = (void *)MEMORY[0x1A1AC1AAC]();
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v35 = v21;
    v36 = 2112;
    v37 = self;
    v38 = 2112;
    v39 = 0;
    _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed encode action as protobuf, home is invalid %@:%@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v19);
  v18 = 0;
LABEL_16:

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetValue, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
}

- (id)initWithCharacteristic:(void *)a3 targetValue:(uint64_t)a4 uuid:
{
  id v8;
  id v9;
  id *v10;
  id *v11;
  uint64_t v12;
  id v13;
  objc_super v15;

  v8 = a2;
  v9 = a3;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)HMCharacteristicWriteAction;
    v10 = (id *)objc_msgSendSuper2(&v15, sel_initWithUUID_, a4);
    v11 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 7, a2);
      v12 = objc_msgSend(v9, "copy");
      v13 = v11[8];
      v11[8] = (id)v12;

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (HMCharacteristicWriteAction)new
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

+ (NSSet)allowedTargetValueClassesForShortcuts
{
  if (allowedTargetValueClassesForShortcuts__hmf_once_t18 != -1)
    dispatch_once(&allowedTargetValueClassesForShortcuts__hmf_once_t18, &__block_literal_global_18886);
  return (NSSet *)(id)allowedTargetValueClassesForShortcuts__hmf_once_v19;
}

+ (HMCharacteristicWriteAction)actionWithProtoBuf:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "characteristicReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCharacteristic characteristicWithCharacteristicReference:home:](HMCharacteristic, "characteristicWithCharacteristicReference:home:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3710];
    +[HMCharacteristicWriteAction allowedTargetValueClassesForShortcuts](HMCharacteristicWriteAction, "allowedTargetValueClassesForShortcuts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "targetValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(v10, "unarchivedObjectOfClasses:fromData:error:", v11, v12, &v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v24;

    if (v13)
    {
      v15 = (void *)MEMORY[0x1E0CB3A28];
      objc_msgSend(v6, "actionUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hmf_UUIDWithBytesAsData:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = -[HMCharacteristicWriteAction initWithCharacteristic:targetValue:uuid:]([HMCharacteristicWriteAction alloc], v9, v13, (uint64_t)v17);
    }
    else
    {
      v19 = (void *)MEMORY[0x1A1AC1AAC]();
      v20 = a1;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v22;
        v27 = 2112;
        v28 = v14;
        _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive allowed target value from target value data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return (HMCharacteristicWriteAction *)v18;
}

void __68__HMCharacteristicWriteAction_allowedTargetValueClassesForShortcuts__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)allowedTargetValueClassesForShortcuts__hmf_once_v19;
  allowedTargetValueClassesForShortcuts__hmf_once_v19 = v0;

}

@end

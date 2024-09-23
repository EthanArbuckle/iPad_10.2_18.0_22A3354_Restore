@implementation HMCharacteristicEvent

- (HMCharacteristicEvent)initWithDict:(id)a3 characteristic:(id)a4 triggerValue:(id)a5
{
  id v9;
  id v10;
  HMCharacteristicEvent *v11;
  HMCharacteristicEvent *v12;
  uint64_t v13;
  NSCopying *triggerValue;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMCharacteristicEvent;
  v11 = -[HMEvent initWithDict:](&v16, sel_initWithDict_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_characteristic, a4);
    v13 = objc_msgSend(v10, "copy");
    triggerValue = v12->_triggerValue;
    v12->_triggerValue = (NSCopying *)v13;

  }
  return v12;
}

- (HMCharacteristicEvent)initWithCharacteristic:(HMCharacteristic *)characteristic triggerValue:(id)triggerValue
{
  HMCharacteristic *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  HMCharacteristicEvent *v13;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = characteristic;
  v7 = triggerValue;
  if (!v6)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = 3;
    goto LABEL_6;
  }
  v8 = v7;
  -[HMCharacteristic properties](v6, "properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", CFSTR("HMCharacteristicPropertySupportsEventNotification"));

  if ((v10 & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = *MEMORY[0x1E0C99778];
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = 7;
LABEL_6:
    objc_msgSend(v17, "hmStringFromErrorCode:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, v19, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v20);
  }
  v21 = CFSTR("kEventUUIDKey");
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMCharacteristicEvent initWithDict:characteristic:triggerValue:](self, "initWithDict:characteristic:triggerValue:", v12, v6, v8);

  return v13;
}

- (HMCharacteristic)characteristic
{
  os_unfair_lock_s *p_lock;
  HMCharacteristic *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_characteristic;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCharacteristic:(id)a3
{
  HMCharacteristic *v4;
  HMCharacteristic *characteristic;

  v4 = (HMCharacteristic *)a3;
  os_unfair_lock_lock_with_options();
  characteristic = self->_characteristic;
  self->_characteristic = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (id)triggerValue
{
  os_unfair_lock_s *p_lock;
  NSCopying *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_triggerValue;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setTriggerValue:(id)a3
{
  NSCopying *v4;
  NSCopying *triggerValue;

  v4 = (NSCopying *)a3;
  os_unfair_lock_lock_with_options();
  triggerValue = self->_triggerValue;
  self->_triggerValue = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (void)updateTriggerValue:(id)triggerValue completionHandler:(void *)completion
{
  char *v6;
  void (**v7)(void *, void *);
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  HMCharacteristicEvent *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMCharacteristicEvent *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  HMCharacteristicEvent *v28;
  NSObject *v29;
  void *v30;
  id v31;
  const __CFString *v32;
  char *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = (char *)triggerValue;
  v7 = completion;
  -[HMEvent context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMCharacteristicEvent updateTriggerValue:completionHandler:]", CFSTR("completion"));
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x1A1AC1AAC]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v30;
      v36 = 2112;
      v37 = (const char *)v26;
      _os_log_impl(&dword_19B1B0000, v29, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v26, 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v31);
  }
  v9 = (void *)v8;
  if (v8)
  {
    -[HMEvent eventTrigger](self, "eventTrigger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10 || (objc_msgSend(v10, "home"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, !v12))
    {
      objc_msgSend(v9, "delegateCaller");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "callCompletion:error:", v7, v20);

LABEL_10:
      goto LABEL_18;
    }
    -[HMCharacteristicEvent triggerValue](self, "triggerValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = HMFEqualObjects();

    if (v14)
    {
      v15 = (void *)MEMORY[0x1A1AC1AAC]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v18;
        v36 = 2112;
        v37 = v6;
        _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_INFO, "%{public}@Trigger value is already %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(v9, "delegateCaller");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "callCompletion:error:", v7, 0);
      goto LABEL_10;
    }
    if (v6)
    {
      v32 = CFSTR("kCharacteristicValue");
      v33 = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = 0;
    }
    -[HMEvent _updateEventWithPayload:completionHandler:](self, "_updateEventWithPayload:completionHandler:", v25, v7);

  }
  else
  {
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v24;
      v36 = 2080;
      v37 = "-[HMCharacteristicEvent updateTriggerValue:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v11);
  }
LABEL_18:

}

- (id)_serializeForAdd
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  -[HMCharacteristicEvent characteristic](self, "characteristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessory");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = 0;
  if (v4 && v5)
  {
    v18.receiver = self;
    v18.super_class = (Class)HMCharacteristicEvent;
    -[HMEvent _serializeForAdd](&v18, sel__serializeForAdd);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v4, "accessoryUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("kAccessoryUUID"));

    objc_msgSend(v4, "instanceID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("kServiceInstanceID"));

    -[HMCharacteristicEvent characteristic](self, "characteristic");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "instanceID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("kCharacteristicInstanceID"));

    -[HMCharacteristicEvent triggerValue](self, "triggerValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[HMCharacteristicEvent triggerValue](self, "triggerValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("kCharacteristicValue"));

    }
    v7 = (void *)objc_msgSend(v9, "copy");

  }
  return v7;
}

- (void)_updateFromDictionary:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMCharacteristicEvent;
  v4 = a3;
  -[HMEvent _updateFromDictionary:](&v6, sel__updateFromDictionary_, v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCharacteristicValue"), v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMCharacteristicEvent setTriggerValue:](self, "setTriggerValue:", v5);
}

- (HMCharacteristicEvent)initWithCoder:(id)a3
{
  id v4;
  HMCharacteristicEvent *v5;
  void *v6;
  uint64_t v7;
  NSCopying *triggerValue;
  uint64_t v9;
  HMCharacteristic *characteristic;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMCharacteristicEvent;
  v5 = -[HMEvent initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    allowedCharValueTypes();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("characteristicValue"));
    v7 = objc_claimAutoreleasedReturnValue();
    triggerValue = v5->_triggerValue;
    v5->_triggerValue = (NSCopying *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("characteristic"));
    v9 = objc_claimAutoreleasedReturnValue();
    characteristic = v5->_characteristic;
    v5->_characteristic = (HMCharacteristic *)v9;

  }
  return v5;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMCharacteristicEvent;
  v5 = -[HMEvent mergeFromNewObject:](&v12, sel_mergeFromNewObject_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    -[HMCharacteristicEvent triggerValue](self, "triggerValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "triggerValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = HMFEqualObjects();

    if ((v9 & 1) == 0)
    {
      objc_msgSend(v6, "triggerValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMCharacteristicEvent setTriggerValue:](self, "setTriggerValue:", v10);

      v5 = 1;
    }

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMCharacteristicEvent *v4;
  void *v5;
  void *v6;
  HMCharacteristicEvent *v7;

  v4 = [HMCharacteristicEvent alloc];
  -[HMCharacteristicEvent characteristic](self, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCharacteristicEvent triggerValue](self, "triggerValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMCharacteristicEvent initWithCharacteristic:triggerValue:](v4, "initWithCharacteristic:triggerValue:", v5, v6);

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableCharacteristicEvent *v4;
  void *v5;
  void *v6;
  HMMutableCharacteristicEvent *v7;

  v4 = [HMMutableCharacteristicEvent alloc];
  -[HMCharacteristicEvent characteristic](self, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCharacteristicEvent triggerValue](self, "triggerValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMCharacteristicEvent initWithCharacteristic:triggerValue:](v4, "initWithCharacteristic:triggerValue:", v5, v6);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristic, 0);
  objc_storeStrong((id *)&self->_triggerValue, 0);
}

+ (id)createWithDictionary:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  HMCharacteristicEvent *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCharacteristicValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_UUIDForKey:", CFSTR("kAccessoryUUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("kServiceInstanceID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("kCharacteristicInstanceID"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v9 && v10 && v11)
  {
    objc_msgSend(v7, "_findCharacteristic:forService:accessoryUUID:", v11, v10, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = -[HMCharacteristicEvent initWithDict:characteristic:triggerValue:]([HMCharacteristicEvent alloc], "initWithDict:characteristic:triggerValue:", v6, v13, v8);
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
        v24 = v19;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v26 = v22;
        v27 = 2112;
        v28 = objc_opt_class();
        v29 = 2112;
        v30 = v9;
        v31 = 2112;
        v32 = v10;
        v33 = 2112;
        v34 = v12;
        _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode %@, failed to resolve characteristic %@/%@/%@", buf, 0x34u);

        v19 = v24;
      }

      objc_autoreleasePoolPop(v19);
      v14 = 0;
    }

  }
  else
  {
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = a1;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v18;
      v27 = 2112;
      v28 = objc_opt_class();
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode %@, missing accessory/service/characteristic ids", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    v14 = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

@implementation HMCharacteristicThresholdRangeEvent

- (HMCharacteristicThresholdRangeEvent)initWithCharacteristic:(HMCharacteristic *)characteristic thresholdRange:(HMNumberRange *)thresholdRange
{
  HMCharacteristic *v6;
  HMNumberRange *v7;
  HMNumberRange *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  HMCharacteristicThresholdRangeEvent *v13;
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
  v7 = thresholdRange;
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
  v13 = -[HMCharacteristicThresholdRangeEvent initWithDict:characteristic:thresholdRange:](self, "initWithDict:characteristic:thresholdRange:", v12, v6, v8);

  return v13;
}

- (HMCharacteristicThresholdRangeEvent)initWithDict:(id)a3 characteristic:(id)a4 thresholdRange:(id)a5
{
  id v9;
  id v10;
  HMCharacteristicThresholdRangeEvent *v11;
  HMCharacteristicThresholdRangeEvent *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMCharacteristicThresholdRangeEvent;
  v11 = -[HMEvent initWithDict:](&v14, sel_initWithDict_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_characteristic, a4);
    objc_storeStrong((id *)&v12->_thresholdRange, a5);
  }

  return v12;
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

- (HMNumberRange)thresholdRange
{
  os_unfair_lock_s *p_lock;
  HMNumberRange *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_thresholdRange;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setThresholdRange:(id)a3
{
  HMNumberRange *v4;
  HMNumberRange *thresholdRange;

  v4 = (HMNumberRange *)a3;
  os_unfair_lock_lock_with_options();
  thresholdRange = self->_thresholdRange;
  self->_thresholdRange = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (void)_updateFromDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  HMNumberRange *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMCharacteristicThresholdRangeEvent;
  v4 = a3;
  -[HMEvent _updateFromDictionary:](&v8, sel__updateFromDictionary_, v4);
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("kCharacteristicThresholdRangeEventThresholdRangeMin"), v8.receiver, v8.super_class);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("kCharacteristicThresholdRangeEventThresholdRangeMax"));
  v6 = objc_claimAutoreleasedReturnValue();

  if (v5 | v6)
  {
    v7 = -[HMNumberRange initWithMinValue:maxValue:]([HMNumberRange alloc], "initWithMinValue:maxValue:", v5, v6);
    -[HMCharacteristicThresholdRangeEvent setThresholdRange:](self, "setThresholdRange:", v7);

  }
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)HMCharacteristicThresholdRangeEvent;
  -[HMEvent _serializeForAdd](&v22, sel__serializeForAdd);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HMCharacteristicThresholdRangeEvent characteristic](self, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "accessoryUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("kAccessoryUUID"));

  objc_msgSend(v6, "instanceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("kServiceInstanceID"));

  -[HMCharacteristicThresholdRangeEvent characteristic](self, "characteristic");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "instanceID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("kCharacteristicInstanceID"));

  -[HMCharacteristicThresholdRangeEvent thresholdRange](self, "thresholdRange");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "minValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HMCharacteristicThresholdRangeEvent thresholdRange](self, "thresholdRange");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "minValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("kCharacteristicThresholdRangeEventThresholdRangeMin"));

  }
  -[HMCharacteristicThresholdRangeEvent thresholdRange](self, "thresholdRange");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "maxValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[HMCharacteristicThresholdRangeEvent thresholdRange](self, "thresholdRange");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "maxValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("kCharacteristicThresholdRangeEventThresholdRangeMax"));

  }
  v20 = (void *)objc_msgSend(v4, "copy");

  return v20;
}

- (void)updateThresholdRange:(id)a3 completionHandler:(id)a4
{
  char *v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  HMCharacteristicThresholdRangeEvent *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  HMCharacteristicThresholdRangeEvent *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  HMCharacteristicThresholdRangeEvent *v30;
  NSObject *v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = (void (**)(id, void *))a4;
  -[HMEvent context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMCharacteristicThresholdRangeEvent updateThresholdRange:completionHandler:]", CFSTR("completion"));
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)MEMORY[0x1A1AC1AAC]();
    v30 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v32;
      v36 = 2112;
      v37 = (const char *)v28;
      _os_log_impl(&dword_19B1B0000, v31, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v29);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v28, 0);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v33);
  }
  v9 = v8;
  if (!v8)
  {
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v20;
      v36 = 2080;
      v37 = "-[HMCharacteristicThresholdRangeEvent updateThresholdRange:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v16);
    goto LABEL_12;
  }
  if (!v6)
  {
    objc_msgSend(v8, "delegateCaller");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "callCompletion:error:", v7, v21);

LABEL_12:
    goto LABEL_13;
  }
  -[HMCharacteristicThresholdRangeEvent thresholdRange](self, "thresholdRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", v6);

  if (v11)
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v15;
      v36 = 2112;
      v37 = v6;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, "%{public}@Threshold range is already %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(v9, "delegateCaller");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "callCompletion:error:", v7, 0);
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v6, "minValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("kCharacteristicThresholdRangeEventThresholdRangeMin"));

  }
  objc_msgSend(v6, "maxValue");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v6, "maxValue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v26, CFSTR("kCharacteristicThresholdRangeEventThresholdRangeMax"));

  }
  v27 = (void *)objc_msgSend(v22, "copy");
  -[HMEvent _updateEventWithPayload:completionHandler:](self, "_updateEventWithPayload:completionHandler:", v27, v7);

LABEL_13:
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMCharacteristicThresholdRangeEvent;
  v5 = -[HMEvent mergeFromNewObject:](&v14, sel_mergeFromNewObject_, v4);
  v6 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    -[HMCharacteristicThresholdRangeEvent thresholdRange](self, "thresholdRange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "thresholdRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = HMFEqualObjects();

    if ((v11 & 1) == 0)
    {
      objc_msgSend(v8, "thresholdRange");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMCharacteristicThresholdRangeEvent setThresholdRange:](self, "setThresholdRange:", v12);

      v5 = 1;
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMCharacteristicThresholdRangeEvent *v4;
  void *v5;
  void *v6;
  HMCharacteristicThresholdRangeEvent *v7;

  v4 = [HMCharacteristicThresholdRangeEvent alloc];
  -[HMCharacteristicThresholdRangeEvent characteristic](self, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCharacteristicThresholdRangeEvent thresholdRange](self, "thresholdRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMCharacteristicThresholdRangeEvent initWithCharacteristic:thresholdRange:](v4, "initWithCharacteristic:thresholdRange:", v5, v6);

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableCharacteristicThresholdRangeEvent *v4;
  void *v5;
  void *v6;
  HMMutableCharacteristicThresholdRangeEvent *v7;

  v4 = [HMMutableCharacteristicThresholdRangeEvent alloc];
  -[HMCharacteristicThresholdRangeEvent characteristic](self, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCharacteristicThresholdRangeEvent thresholdRange](self, "thresholdRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMCharacteristicThresholdRangeEvent initWithCharacteristic:thresholdRange:](v4, "initWithCharacteristic:thresholdRange:", v5, v6);

  return v7;
}

- (HMCharacteristicThresholdRangeEvent)initWithCoder:(id)a3
{
  id v4;
  HMCharacteristicThresholdRangeEvent *v5;
  uint64_t v6;
  HMCharacteristic *characteristic;
  void *v8;
  void *v9;
  HMNumberRange *v10;
  HMNumberRange *thresholdRange;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMCharacteristicThresholdRangeEvent;
  v5 = -[HMEvent initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("characteristic"));
    v6 = objc_claimAutoreleasedReturnValue();
    characteristic = v5->_characteristic;
    v5->_characteristic = (HMCharacteristic *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCharacteristicThresholdRangeEventThresholdRangeMin"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCharacteristicThresholdRangeEventThresholdRangeMax"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HMNumberRange initWithMinValue:maxValue:]([HMNumberRange alloc], "initWithMinValue:maxValue:", v8, v9);
    thresholdRange = v5->_thresholdRange;
    v5->_thresholdRange = v10;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristic, 0);
  objc_storeStrong((id *)&self->_thresholdRange, 0);
}

+ (BOOL)isSupportedForHome:(id)a3
{
  return +[HMEvent sharedTriggerActivationSupportedForHome:](HMEvent, "sharedTriggerActivationSupportedForHome:", a3);
}

+ (id)createWithDictionary:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMCharacteristicThresholdRangeEvent *v15;
  HMNumberRange *v16;
  HMCharacteristicThresholdRangeEvent *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  int v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "hmf_UUIDForKey:", CFSTR("kAccessoryUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("kServiceInstanceID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("kCharacteristicInstanceID"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v8 && v9 && v10)
  {
    objc_msgSend(v7, "_findCharacteristic:forService:accessoryUUID:", v10, v9, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v6, "hmf_numberForKey:", CFSTR("kCharacteristicThresholdRangeEventThresholdRangeMin"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "hmf_numberForKey:", CFSTR("kCharacteristicThresholdRangeEventThresholdRangeMax"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = [HMCharacteristicThresholdRangeEvent alloc];
      v16 = -[HMNumberRange initWithMinValue:maxValue:]([HMNumberRange alloc], "initWithMinValue:maxValue:", v13, v14);
      v17 = -[HMCharacteristicThresholdRangeEvent initWithDict:characteristic:thresholdRange:](v15, "initWithDict:characteristic:thresholdRange:", v6, v12, v16);

    }
    else
    {
      v22 = (void *)MEMORY[0x1A1AC1AAC]();
      v23 = a1;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138544386;
        v28 = v25;
        v29 = 2112;
        v30 = objc_opt_class();
        v31 = 2112;
        v32 = v8;
        v33 = 2112;
        v34 = v9;
        v35 = 2112;
        v36 = v11;
        _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode %@, failed to resolve characteristic %@/%@/%@", (uint8_t *)&v27, 0x34u);

      }
      objc_autoreleasePoolPop(v22);
      v17 = 0;
    }

  }
  else
  {
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = a1;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = v21;
      v29 = 2112;
      v30 = objc_opt_class();
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode %@, missing accessory/service/characteristic ids", (uint8_t *)&v27, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    v17 = 0;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

@implementation HMDDurationEvent

- (HMDDurationEvent)initWithModel:(id)a3 home:(id)a4
{
  id v6;
  HMDDurationEvent *v7;
  uint64_t v8;
  NSNumber *duration;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDDurationEvent;
  v7 = -[HMDTimeEvent initWithModel:home:](&v11, sel_initWithModel_home_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "duration");
    v8 = objc_claimAutoreleasedReturnValue();
    duration = v7->_duration;
    v7->_duration = (NSNumber *)v8;

    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HMDDurationEvent;
  -[HMDEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDurationEvent duration](self, "duration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[Duration-Event: %@, %@s]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)createPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v9.receiver = self;
  v9.super_class = (Class)HMDDurationEvent;
  -[HMDEvent createPayload](&v9, sel_createPayload);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDDurationEvent duration](self, "duration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("kDurationEventDuration"));

  v7 = (void *)objc_msgSend(v5, "copy");
  return v7;
}

- (id)emptyModelObject
{
  HMDDurationEventModel *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDDurationEventModel *v7;

  v3 = [HMDDurationEventModel alloc];
  -[HMDEvent uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEvent eventTrigger](self, "eventTrigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v3, "initWithObjectChangeType:uuid:parentUUID:", 2, v4, v6);

  return v7;
}

- (void)_handleUpdateRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v4 = a3;
  objc_msgSend(v4, "numberForKey:", CFSTR("kDurationEventDuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMDDurationEvent emptyModelObject](self, "emptyModelObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDuration:", v5);
    -[HMDEvent eventTrigger](self, "eventTrigger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backingStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "transaction:options:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "add:", v6);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __41__HMDDurationEvent__handleUpdateRequest___block_invoke;
    v15[3] = &unk_1E89C21C0;
    v16 = v4;
    v17 = v6;
    v13 = v6;
    objc_msgSend(v12, "run:", v15);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v14);

  }
}

- (NSNumber)duration
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_duration;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDuration:(id)a3
{
  NSNumber *v4;
  NSNumber *duration;

  v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  duration = self->_duration;
  self->_duration = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isCompatbileWithEvent:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMDDurationEvent;
  return -[HMDTimeEvent isCompatibleWithEvent:](&v4, sel_isCompatibleWithEvent_, a3);
}

- (HMDDurationEvent)initWithCoder:(id)a3
{
  id v4;
  HMDDurationEvent *v5;
  uint64_t v6;
  NSNumber *duration;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDDurationEvent;
  v5 = -[HMDTimeEvent initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kDurationEventDuration"));
    v6 = objc_claimAutoreleasedReturnValue();
    duration = v5->_duration;
    v5->_duration = (NSNumber *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDDurationEvent;
  v4 = a3;
  -[HMDTimeEvent encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[HMDDurationEvent duration](self, "duration", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kDurationEventDuration"));

}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  HMDDurationEventModel *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDDurationEventModel *v9;
  void *v10;
  void *v11;

  v5 = [HMDDurationEventModel alloc];
  -[HMDEvent uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEvent eventTrigger](self, "eventTrigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", a3, v6, v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDEvent isEndEvent](self, "isEndEvent"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDurationEventModel setEndEvent:](v9, "setEndEvent:", v10);

  -[HMDDurationEvent duration](self, "duration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDurationEventModel setDuration:](v9, "setDuration:", v11);

  return v9;
}

- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDDurationEvent *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543362;
    v28 = v14;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Handling transaction updated", (uint8_t *)&v27, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  v15 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  if (v17)
  {
    objc_msgSend(v17, "duration");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      -[HMDDurationEvent duration](v12, "duration");
      v20 = objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = (void *)v20;
        -[HMDDurationEvent duration](v12, "duration");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "doubleValue");
        objc_msgSend(v17, "duration");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "doubleValue");
        v24 = HMDurationsApproximatelyEqual();

        if ((v24 & 1) != 0)
          goto LABEL_13;
      }
      else
      {

      }
      objc_msgSend(v17, "duration");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDurationEvent setDuration:](v12, "setDuration:", v25);

      -[HMDEvent eventTrigger](v12, "eventTrigger");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "markChangedForMessage:", v10);

    }
LABEL_13:
    objc_msgSend(v10, "respondWithSuccess");
  }

}

- (id)_nextTimerDate
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDDurationEvent *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:", 252, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "second");
  -[HMDDurationEvent duration](self, "duration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecond:", objc_msgSend(v7, "unsignedIntegerValue") + v6);

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateFromComponents:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v13;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Next Fire Date : [%@]", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v10);

  return v9;
}

- (id)analyticsTriggerEventData
{
  HMDAnalyticsTriggerEventData *v3;
  HMDAnalyticsDurationEventData *v4;

  v3 = objc_alloc_init(HMDAnalyticsTriggerEventData);
  -[HMDAnalyticsTriggerEventData setEndEvent:](v3, "setEndEvent:", -[HMDEvent isEndEvent](self, "isEndEvent"));
  v4 = objc_alloc_init(HMDAnalyticsDurationEventData);
  -[HMDAnalyticsTriggerEventData setDurationEvent:](v3, "setDurationEvent:", v4);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duration, 0);
}

void __41__HMDDurationEvent__handleUpdateRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a2);
  }
  else
  {
    v5 = CFSTR("kDurationEventDuration");
    objc_msgSend(*(id *)(a1 + 40), "duration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "respondWithPayload:", v4);

  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_173352 != -1)
    dispatch_once(&logCategory__hmf_once_t0_173352, &__block_literal_global_173353);
  return (id)logCategory__hmf_once_v1_173354;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __31__HMDDurationEvent_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_173354;
  logCategory__hmf_once_v1_173354 = v0;

}

@end

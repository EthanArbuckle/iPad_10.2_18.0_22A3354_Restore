@implementation HMDSignificantTimeEvent

- (HMDSignificantTimeEvent)initWithModel:(id)a3 home:(id)a4
{
  id v6;
  HMDSignificantTimeEvent *v7;
  uint64_t v8;
  NSString *significantEvent;
  void *v10;
  uint64_t v11;
  NSDateComponents *offset;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMDSignificantTimeEvent;
  v7 = -[HMDTimeEvent initWithModel:home:](&v14, sel_initWithModel_home_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "significantEvent");
    v8 = objc_claimAutoreleasedReturnValue();
    significantEvent = v7->_significantEvent;
    v7->_significantEvent = (NSString *)v8;

    objc_msgSend(v6, "offset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "decodeDateComponents");
    v11 = objc_claimAutoreleasedReturnValue();
    offset = v7->_offset;
    v7->_offset = (NSDateComponents *)v11;

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
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)HMDSignificantTimeEvent;
  -[HMDEvent description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSignificantTimeEvent significantEvent](self, "significantEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSignificantTimeEvent offset](self, "offset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_localTimeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[Sig-Event: %@ Type:%@, %@]"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)createPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v11.receiver = self;
  v11.super_class = (Class)HMDSignificantTimeEvent;
  -[HMDEvent createPayload](&v11, sel_createPayload);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDSignificantTimeEvent significantEvent](self, "significantEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("kSignificantTimeEventSignificantEvent"));

  -[HMDSignificantTimeEvent offset](self, "offset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  encodeRootObject();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("kSignificantTimeEventOffset"));

  v9 = (void *)objc_msgSend(v5, "copy");
  return v9;
}

- (id)emptyModelObject
{
  HMDSignificantTimeEventModel *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDSignificantTimeEventModel *v7;

  v3 = [HMDSignificantTimeEventModel alloc];
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
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v4 = a3;
  objc_msgSend(v4, "stringForKey:", CFSTR("kSignificantTimeEventSignificantEvent"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataForKey:", CFSTR("kSignificantTimeEventOffset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D78], "hmf_unarchiveFromData:error:", v6, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v5 | v7)
  {
    -[HMDSignificantTimeEvent emptyModelObject](self, "emptyModelObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v9, "setSignificantEvent:", v5);
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v5, CFSTR("kSignificantTimeEventSignificantEvent"));
    }
    v19 = v7;
    if (v6)
    {
      objc_msgSend(v9, "setOffset:", v6);
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, CFSTR("kSignificantTimeEventOffset"));
    }
    -[HMDEvent eventTrigger](self, "eventTrigger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "backingStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v18 = v9;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "transaction:options:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "add:", v18);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __48__HMDSignificantTimeEvent__handleUpdateRequest___block_invoke;
    v20[3] = &unk_1E89C21C0;
    v21 = v4;
    v22 = v10;
    v17 = v10;
    objc_msgSend(v16, "run:", v20);

    v7 = v19;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v8);

  }
}

- (NSString)significantEvent
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_significantEvent;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSignificantEvent:(id)a3
{
  NSString *v4;
  NSString *significantEvent;

  v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  significantEvent = self->_significantEvent;
  self->_significantEvent = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDateComponents)offset
{
  os_unfair_lock_s *p_lock;
  NSDateComponents *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_offset;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setOffset:(id)a3
{
  NSDateComponents *v4;
  NSDateComponents *offset;

  v4 = (NSDateComponents *)a3;
  os_unfair_lock_lock_with_options();
  offset = self->_offset;
  self->_offset = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isCompatibleWithEvent:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMDSignificantTimeEvent;
  return -[HMDTimeEvent isCompatibleWithEvent:](&v4, sel_isCompatibleWithEvent_, a3);
}

- (HMDSignificantTimeEvent)initWithCoder:(id)a3
{
  id v4;
  HMDSignificantTimeEvent *v5;
  uint64_t v6;
  NSString *significantEvent;
  uint64_t v8;
  NSDateComponents *offset;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDSignificantTimeEvent;
  v5 = -[HMDTimeEvent initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSignificantTimeEventSignificantEvent"));
    v6 = objc_claimAutoreleasedReturnValue();
    significantEvent = v5->_significantEvent;
    v5->_significantEvent = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSignificantTimeEventOffset"));
    v8 = objc_claimAutoreleasedReturnValue();
    offset = v5->_offset;
    v5->_offset = (NSDateComponents *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDSignificantTimeEvent;
  v4 = a3;
  -[HMDTimeEvent encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[HMDSignificantTimeEvent significantEvent](self, "significantEvent", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kSignificantTimeEventSignificantEvent"));

  -[HMDSignificantTimeEvent offset](self, "offset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kSignificantTimeEventOffset"));

}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  HMDSignificantTimeEventModel *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDSignificantTimeEventModel *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = [HMDSignificantTimeEventModel alloc];
  -[HMDEvent uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEvent eventTrigger](self, "eventTrigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", a3, v6, v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDEvent isEndEvent](self, "isEndEvent"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSignificantTimeEventModel setEndEvent:](v9, "setEndEvent:", v10);

  -[HMDSignificantTimeEvent significantEvent](self, "significantEvent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSignificantTimeEventModel setSignificantEvent:](v9, "setSignificantEvent:", v11);

  -[HMDSignificantTimeEvent offset](self, "offset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  encodeRootObject();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSignificantTimeEventModel setOffset:](v9, "setOffset:", v13);

  return v9;
}

- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDSignificantTimeEvent *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  char v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
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
    v30 = 138543362;
    v31 = v14;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Handling transaction updated", (uint8_t *)&v30, 0xCu);

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
    if (objc_msgSend(v17, "propertyWasSet:", CFSTR("significantEvent"))
      && (-[HMDSignificantTimeEvent significantEvent](v12, "significantEvent"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v17, "significantEvent"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v20 = HMFEqualObjects(),
          v19,
          v18,
          (v20 & 1) == 0))
    {
      objc_msgSend(v17, "significantEvent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSignificantTimeEvent setSignificantEvent:](v12, "setSignificantEvent:", v22);

      v21 = 1;
    }
    else
    {
      v21 = 0;
    }
    objc_msgSend(v17, "offset");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v24 = (void *)MEMORY[0x1E0C99D78];
      objc_msgSend(v17, "offset");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "hmf_unarchiveFromData:error:", v25, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26
        && (-[HMDSignificantTimeEvent offset](v12, "offset"),
            v27 = (void *)objc_claimAutoreleasedReturnValue(),
            v28 = objc_msgSend(v27, "isEqual:", v26),
            v27,
            (v28 & 1) == 0))
      {
        -[HMDSignificantTimeEvent setOffset:](v12, "setOffset:", v26);

      }
      else
      {

        if ((v21 & 1) == 0)
          goto LABEL_20;
      }
    }
    else if (!v21)
    {
      goto LABEL_20;
    }
    -[HMDEvent eventTrigger](v12, "eventTrigger");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "markChangedForMessage:", v10);

LABEL_20:
    objc_msgSend(v10, "respondWithSuccess");
  }

}

- (id)_nextTimerDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[HMDEvent eventTrigger](self, "eventTrigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeLocationHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSignificantTimeEvent significantEvent](self, "significantEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSignificantTimeEvent offset](self, "offset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDSignificantTimeEvent nextTimerDateFromHomeLocation:signifiantEvent:offset:loggingObject:](HMDSignificantTimeEvent, "nextTimerDateFromHomeLocation:signifiantEvent:offset:loggingObject:", v6, v7, v8, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)analyticsTriggerEventData
{
  HMDAnalyticsTriggerEventData *v3;
  HMDAnalyticsSignificantTimeEventData *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(HMDAnalyticsTriggerEventData);
  -[HMDAnalyticsTriggerEventData setEndEvent:](v3, "setEndEvent:", -[HMDEvent isEndEvent](self, "isEndEvent"));
  v4 = objc_alloc_init(HMDAnalyticsSignificantTimeEventData);
  -[HMDSignificantTimeEvent significantEvent](self, "significantEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAnalyticsSignificantTimeEventData setSignificantEvent:](v4, "setSignificantEvent:", v5);

  -[HMDSignificantTimeEvent offset](self, "offset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAnalyticsSignificantTimeEventData setOffsetPresent:](v4, "setOffsetPresent:", v6 != 0);

  -[HMDAnalyticsTriggerEventData setSignificantTimeEvent:](v3, "setSignificantTimeEvent:", v4);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offset, 0);
  objc_storeStrong((id *)&self->_significantEvent, 0);
}

void __48__HMDSignificantTimeEvent__handleUpdateRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a2);
  }
  else
  {
    v3 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
    objc_msgSend(v2, "respondWithPayload:", v3);

  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_65186 != -1)
    dispatch_once(&logCategory__hmf_once_t0_65186, &__block_literal_global_65187);
  return (id)logCategory__hmf_once_v1_65188;
}

+ (id)nextTimerDateFromHomeLocation:(id)a3 signifiantEvent:(id)a4 offset:(id)a5 loggingObject:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  void *v54;
  void *v55;
  unint64_t v56;
  void *v57;
  unint64_t v58;
  id v60;
  NSObject *v61;
  void *v62;
  id v63;
  void *v64;
  id v66;
  void *context;
  id v68;
  void *v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t v75[128];
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  id v79;
  __int16 v80;
  uint64_t v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v9)
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = v12;
    v21 = v12;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v77 = v23;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to get next significant event fire date because home location is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    v24 = 0;
    v12 = v20;
    goto LABEL_51;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1D17BA0A0]();
  v15 = v12;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v77 = v17;
    v78 = 2112;
    v79 = v9;
    v80 = 2112;
    v81 = v13;
    _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Current Home Location & time : %@ / %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v14);
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB9B88]))
  {
    +[HMDLocation nextSunriseTimeForLocation:date:](HMDLocation, "nextSunriseTimeForLocation:date:", v9, v13);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB9B90]))
    {
      v25 = 0;
      goto LABEL_13;
    }
    +[HMDLocation nextSunsetTimeForLocation:date:](HMDLocation, "nextSunsetTimeForLocation:date:", v9, v13);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v18;
LABEL_13:
  v26 = (void *)MEMORY[0x1D17BA0A0]();
  v27 = v15;
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v77 = v29;
    v78 = 2112;
    v79 = v25;
    _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@nextSunEventDates %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v26);
  v30 = (void *)MEMORY[0x1D17BA0A0]();
  v31 = v27;
  HMFGetOSLogHandle();
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = v32;
  v70 = (void *)v13;
  if (v25)
  {
    v68 = v10;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "describeElements:", &__block_literal_global_17_65175);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v77 = v34;
      v78 = 2112;
      v79 = v35;
      _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_INFO, "%{public}@Set of events to pick from %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v30);
    v69 = v25;
    if (v11)
    {
      v66 = v12;
      v36 = (void *)MEMORY[0x1D17BA0A0]();
      v37 = v31;
      HMFGetOSLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v77 = v39;
        v78 = 2112;
        v79 = v11;
        _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_INFO, "%{public}@Adding offset %@ to the sun event dates", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v36);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = 0u;
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v41 = v25;
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
      if (v42)
      {
        v43 = v42;
        v44 = *(_QWORD *)v72;
        do
        {
          for (i = 0; i != v43; ++i)
          {
            if (*(_QWORD *)v72 != v44)
              objc_enumerationMutation(v41);
            v46 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "dateByAddingComponents:toDate:options:", v11, v46, 0);
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v40, "addObject:", v48);
          }
          v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
        }
        while (v43);
      }

      v12 = v66;
      v25 = v69;
      v13 = (uint64_t)v70;
    }
    else
    {
      v40 = (void *)objc_msgSend(v25, "mutableCopy");
    }
    objc_msgSend(v40, "addObject:", v13);
    objc_msgSend(v40, "sortedArrayUsingComparator:", &__block_literal_global_22_65180);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)MEMORY[0x1D17BA0A0]();
    v52 = v31;
    HMFGetOSLogHandle();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "describeElements:", &__block_literal_global_23);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v77 = v54;
      v78 = 2112;
      v79 = v55;
      _os_log_impl(&dword_1CD062000, v53, OS_LOG_TYPE_INFO, "%{public}@Set of events to pick after offset & current time addition from %@", buf, 0x16u);

      v25 = v69;
    }

    objc_autoreleasePoolPop(v51);
    if (objc_msgSend(v50, "count"))
    {
      v56 = 1;
      while (1)
      {
        objc_msgSend(v50, "objectAtIndex:", v56 - 1);
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        v58 = objc_msgSend(v50, "count");
        if (v57 == v70)
          break;
        if (v56++ >= v58)
        {
          v24 = 0;
          v25 = v69;
          goto LABEL_49;
        }
      }
      if (v56 == v58)
      {
        context = (void *)MEMORY[0x1D17BA0A0]();
        v60 = v52;
        HMFGetOSLogHandle();
        v61 = objc_claimAutoreleasedReturnValue();
        v25 = v69;
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v77 = v62;
          _os_log_impl(&dword_1CD062000, v61, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine next timer event for Significant Event", buf, 0xCu);

        }
        v24 = 0;
      }
      else
      {
        objc_msgSend(v50, "objectAtIndex:", v56);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        context = (void *)MEMORY[0x1D17BA0A0]();
        v63 = v52;
        HMFGetOSLogHandle();
        v61 = objc_claimAutoreleasedReturnValue();
        v25 = v69;
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v77 = v64;
          v78 = 2112;
          v79 = v24;
          _os_log_impl(&dword_1CD062000, v61, OS_LOG_TYPE_INFO, "%{public}@Event next fire date : %@", buf, 0x16u);

        }
      }

      objc_autoreleasePoolPop(context);
    }
    else
    {
      v24 = 0;
    }
LABEL_49:

    v10 = v68;
  }
  else
  {
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v77 = v49;
      _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to get the sun event dates based on home location", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v30);
    v24 = 0;
  }

LABEL_51:
  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __94__HMDSignificantTimeEvent_nextTimerDateFromHomeLocation_signifiantEvent_offset_loggingObject___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hmf_localTimeDescription");
}

uint64_t __94__HMDSignificantTimeEvent_nextTimerDateFromHomeLocation_signifiantEvent_offset_loggingObject___block_invoke_20(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __94__HMDSignificantTimeEvent_nextTimerDateFromHomeLocation_signifiantEvent_offset_loggingObject___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hmf_localTimeDescription");
}

void __38__HMDSignificantTimeEvent_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_65188;
  logCategory__hmf_once_v1_65188 = v0;

}

@end

@implementation HMWeeklyScheduleEntry

- (HMWeeklyScheduleEntry)initWithStart:(id)a3 end:(id)a4
{
  id v7;
  id v8;
  HMWeeklyScheduleEntry *v9;
  HMWeeklyScheduleEntry *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMWeeklyScheduleEntry;
  v9 = -[HMWeeklyScheduleEntry init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_start, a3);
    objc_storeStrong((id *)&v10->_end, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  HMWeeklyScheduleEntry *v4;
  HMWeeklyScheduleEntry *v5;
  HMWeeklyScheduleEntry *v6;
  HMWeeklyScheduleEntry *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (HMWeeklyScheduleEntry *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
      v7 = v6;

      -[HMWeeklyScheduleEntry start](self, "start");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMWeeklyScheduleEntry start](v7, "start");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqual:", v9))
      {
        -[HMWeeklyScheduleEntry end](self, "end");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMWeeklyScheduleEntry end](v7, "end");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMWeeklyScheduleEntry start](self, "start");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMScheduleEntryStartCodingKey"));

  -[HMWeeklyScheduleEntry end](self, "end");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMScheduleEntryEndCodingKey"));

}

- (HMWeeklyScheduleEntry)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMWeeklyScheduleEntry *v12;
  HMWeeklyScheduleEntry *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMScheduleEntryStartCodingKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMScheduleEntryEndCodingKey"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v11;
      v17 = 2112;
      v18 = v5;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize due to nil object after decoding start:%@, end:%@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    v13 = 0;
  }
  else
  {
    v12 = -[HMWeeklyScheduleEntry initWithStart:end:](self, "initWithStart:end:", v5, v6);
    v13 = v12;
  }

  return v13;
}

- (id)serializeForAdd
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
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[6];
  _QWORD v24[7];

  v24[6] = *MEMORY[0x1E0C80C00];
  v23[0] = CFSTR("startWeekday");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[HMWeeklyScheduleEntry start](self, "start");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v22, "weekday"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v21;
  v23[1] = CFSTR("startHour");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[HMWeeklyScheduleEntry start](self, "start");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v20, "hour"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v5;
  v23[2] = CFSTR("startMinute");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[HMWeeklyScheduleEntry start](self, "start");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "minute"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v8;
  v23[3] = CFSTR("endWeekday");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[HMWeeklyScheduleEntry end](self, "end");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "weekday"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v11;
  v23[4] = CFSTR("endHour");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[HMWeeklyScheduleEntry end](self, "end");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "hour"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v14;
  v23[5] = CFSTR("endMinute");
  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[HMWeeklyScheduleEntry end](self, "end");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v16, "minute"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (HMWeeklyScheduleEntry)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  HMWeeklyScheduleEntry *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "hmf_integerForKey:error:", CFSTR("startWeekday"), 0);
    v7 = objc_msgSend(v5, "hmf_integerForKey:error:", CFSTR("startHour"), 0);
    v8 = objc_msgSend(v5, "hmf_integerForKey:error:", CFSTR("startMinute"), 0);
    v9 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v9, "setWeekday:", v6);
    objc_msgSend(v9, "setHour:", v7);
    v10 = objc_msgSend(v9, "setMinute:", v8);
    if (v9)
    {
      v11 = objc_msgSend(v5, "hmf_integerForKey:error:", CFSTR("endWeekday"), 0);
      v12 = objc_msgSend(v5, "hmf_integerForKey:error:", CFSTR("endHour"), 0);
      v13 = objc_msgSend(v5, "hmf_integerForKey:error:", CFSTR("endMinute"), 0);
      v14 = objc_alloc_init(MEMORY[0x1E0C99D78]);
      objc_msgSend(v14, "setWeekday:", v11);
      objc_msgSend(v14, "setHour:", v12);
      v15 = objc_msgSend(v14, "setMinute:", v13);
      if (v14)
      {
        self = -[HMWeeklyScheduleEntry initWithStart:end:](self, "initWithStart:end:", v9, v14);
        v16 = self;
      }
      else
      {
        v20 = (void *)MEMORY[0x1A1AC1AAC](v15);
        self = self;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 138543362;
          v25 = v22;
          _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine the end date components", (uint8_t *)&v24, 0xCu);

        }
        objc_autoreleasePoolPop(v20);
        v16 = 0;
      }

    }
    else
    {
      v17 = (void *)MEMORY[0x1A1AC1AAC](v10);
      self = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543362;
        v25 = v19;
        _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine the start date components", (uint8_t *)&v24, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSDateComponents)start
{
  return self->_start;
}

- (NSDateComponents)end
{
  return self->_end;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4 != -1)
    dispatch_once(&logCategory__hmf_once_t4, &__block_literal_global_610);
  return (id)logCategory__hmf_once_v5;
}

void __36__HMWeeklyScheduleEntry_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5;
  logCategory__hmf_once_v5 = v0;

}

@end

@implementation HMDurationEvent

- (HMDurationEvent)initWithDuration:(NSTimeInterval)duration
{
  void *v5;
  void *v6;
  HMDurationEvent *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("kEventUUIDKey");
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("kEventTriggerEndEvent");
  v10[0] = v5;
  v10[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDurationEvent initWithDict:duration:](self, "initWithDict:duration:", v6, duration);

  return v7;
}

- (HMDurationEvent)initWithDict:(id)a3 duration:(double)a4
{
  HMDurationEvent *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDurationEvent;
  result = -[HMEvent initWithDict:](&v6, sel_initWithDict_, a3);
  if (result)
    result->_duration = a4;
  return result;
}

- (NSTimeInterval)duration
{
  os_unfair_lock_s *p_lock;
  double duration;

  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  duration = self->_duration;
  os_unfair_lock_unlock(p_lock);
  return duration;
}

- (void)setOffset:(double)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  self->_duration = a3;
  os_unfair_lock_unlock(p_lock);
}

- (id)_serializeForAdd
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMDurationEvent;
  -[HMEvent _serializeForAdd](&v9, sel__serializeForAdd);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDurationEvent duration](self, "duration");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("kDurationEventDuration"));

  v7 = (void *)objc_msgSend(v4, "copy");
  return v7;
}

- (void)_updateFromDictionary:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDurationEvent;
  v4 = a3;
  -[HMEvent _updateFromDictionary:](&v6, sel__updateFromDictionary_, v4);
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("kDurationEventDuration"), v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    -[HMDurationEvent setDuration:](self, "setDuration:");
  }

}

- (void)updateDuration:(double)a3 completionHandler:(id)a4
{
  void (**v6)(id, void *);
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  void *v11;
  HMDurationEvent *v12;
  NSObject *v13;
  void *v14;
  char *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDurationEvent *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  HMDurationEvent *v26;
  NSObject *v27;
  void *v28;
  id v29;
  const __CFString *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a4;
  -[HMEvent context](self, "context");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMDurationEvent updateDuration:completionHandler:]", CFSTR("completion"));
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1A1AC1AAC]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v28;
      v34 = 2112;
      v35 = (const char *)v24;
      _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v24, 0);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v29);
  }
  v8 = (void *)v7;
  if (v7)
  {
    v9 = -[HMDurationEvent duration](self, "duration");
    if (vabdd_f64(v10, a3) >= 0.001)
    {
      v30 = CFSTR("kDurationEventDuration");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMEvent _updateEventWithPayload:completionHandler:](self, "_updateEventWithPayload:completionHandler:", v23, v6);

    }
    else
    {
      v11 = (void *)MEMORY[0x1A1AC1AAC](v9);
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
        v15 = (char *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0CB37E8];
        -[HMDurationEvent duration](v12, "duration");
        objc_msgSend(v16, "numberWithDouble:");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v33 = v14;
        v34 = 2112;
        v35 = v15;
        v36 = 2112;
        v37 = v17;
        _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Duration is already approximately %@ (%@)", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(v8, "delegateCaller");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "callCompletion:error:", v6, 0);
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x1A1AC1AAC]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v22;
      v34 = 2080;
      v35 = "-[HMDurationEvent updateDuration:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v18);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  HMDurationEvent *v4;

  v4 = [HMDurationEvent alloc];
  -[HMDurationEvent duration](self, "duration");
  return -[HMDurationEvent initWithDuration:](v4, "initWithDuration:");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableDurationEvent *v4;

  v4 = [HMMutableDurationEvent alloc];
  -[HMDurationEvent duration](self, "duration");
  return -[HMDurationEvent initWithDuration:](v4, "initWithDuration:");
}

- (HMDurationEvent)initWithCoder:(id)a3
{
  id v4;
  HMDurationEvent *v5;
  void *v6;
  double v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDurationEvent;
  v5 = -[HMEvent initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kDurationEventDuration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v5->_duration = v7;

  }
  return v5;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

+ (id)createWithDictionary:(id)a3 home:(id)a4
{
  id v4;
  void *v5;
  HMDurationEvent *v6;
  HMDurationEvent *v7;

  v4 = a3;
  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("kDurationEventDuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [HMDurationEvent alloc];
  objc_msgSend(v5, "doubleValue");
  v7 = -[HMDurationEvent initWithDict:duration:](v6, "initWithDict:duration:", v4);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

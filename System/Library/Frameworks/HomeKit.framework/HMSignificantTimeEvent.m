@implementation HMSignificantTimeEvent

- (HMSignificantTimeEvent)initWithSignificantEvent:(HMSignificantEvent)significantEvent offset:(NSDateComponents *)offset
{
  void *v6;
  NSDateComponents *v7;
  NSString *v8;
  void *v9;
  void *v10;
  HMSignificantTimeEvent *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = CFSTR("kEventUUIDKey");
  v6 = (void *)MEMORY[0x1E0CB3A28];
  v7 = offset;
  v8 = significantEvent;
  objc_msgSend(v6, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMSignificantTimeEvent initWithDict:significantEvent:offset:](self, "initWithDict:significantEvent:offset:", v10, v8, v7);

  return v11;
}

- (HMSignificantTimeEvent)initWithDict:(id)a3 significantEvent:(id)a4 offset:(id)a5
{
  id v9;
  id v10;
  HMSignificantTimeEvent *v11;
  HMSignificantTimeEvent *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMSignificantTimeEvent;
  v11 = -[HMEvent initWithDict:](&v14, sel_initWithDict_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_significantEvent, a4);
    objc_storeStrong((id *)&v12->_offset, a5);
  }

  return v12;
}

- (HMSignificantEvent)significantEvent
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->super.super._lock;
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

  os_unfair_lock_unlock(&self->super.super._lock);
}

- (NSDateComponents)offset
{
  os_unfair_lock_s *p_lock;
  NSDateComponents *v4;

  p_lock = &self->super.super._lock;
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

  os_unfair_lock_unlock(&self->super.super._lock);
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
  v11.super_class = (Class)HMSignificantTimeEvent;
  -[HMEvent _serializeForAdd](&v11, sel__serializeForAdd);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HMSignificantTimeEvent significantEvent](self, "significantEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("kSignificantTimeEventSignificantEvent"));

  -[HMSignificantTimeEvent offset](self, "offset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMSignificantTimeEvent offset](self, "offset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    encodeRootObject(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("kSignificantTimeEventOffset"));

  }
  v9 = (void *)objc_msgSend(v4, "copy");

  return v9;
}

- (void)_updateFromDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HMSignificantTimeEvent;
  -[HMEvent _updateFromDictionary:](&v7, sel__updateFromDictionary_, v4);
  objc_msgSend(v4, "hmf_stringForKey:", CFSTR("kSignificantTimeEventSignificantEvent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[HMSignificantTimeEvent setSignificantEvent:](self, "setSignificantEvent:", v5);
  objc_msgSend(v4, "dateComponentsForKey:", CFSTR("kSignificantTimeEventOffset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[HMSignificantTimeEvent setOffset:](self, "setOffset:", v6);

}

- (void)updateSignificantEvent:(id)a3 completionHandler:(id)a4
{
  char *v6;
  void (**v7)(id, void *);
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  HMSignificantTimeEvent *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  HMSignificantTimeEvent *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  HMSignificantTimeEvent *v23;
  NSObject *v24;
  void *v25;
  id v26;
  const __CFString *v27;
  char *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = (void (**)(id, void *))a4;
  -[HMEvent context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMSignificantTimeEvent updateSignificantEvent:completionHandler:]", CFSTR("completion"));
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
  v9 = (void *)v8;
  if (v8)
  {
    -[HMSignificantTimeEvent significantEvent](self, "significantEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", v6);

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
        v30 = v15;
        v31 = 2112;
        v32 = v6;
        _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, "%{public}@Significant event is already %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(v9, "delegateCaller");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "callCompletion:error:", v7, 0);
    }
    else
    {
      v27 = CFSTR("kSignificantTimeEventSignificantEvent");
      v28 = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMEvent _updateEventWithPayload:completionHandler:](self, "_updateEventWithPayload:completionHandler:", v16, v7);
    }
  }
  else
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
      v30 = v20;
      v31 = 2080;
      v32 = "-[HMSignificantTimeEvent updateSignificantEvent:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v16);
  }

}

- (void)updateOffset:(id)a3 completionHandler:(id)a4
{
  char *v6;
  void (**v7)(id, void *);
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  HMSignificantTimeEvent *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  HMSignificantTimeEvent *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  HMSignificantTimeEvent *v27;
  NSObject *v28;
  void *v29;
  id v30;
  const __CFString *v31;
  uint64_t v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = (void (**)(id, void *))a4;
  -[HMEvent context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMSignificantTimeEvent updateOffset:completionHandler:]", CFSTR("completion"));
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1A1AC1AAC]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v29;
      v35 = 2112;
      v36 = (const char *)v25;
      _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v26);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v25, 0);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v30);
  }
  v9 = (void *)v8;
  if (v8)
  {
    -[HMSignificantTimeEvent offset](self, "offset");
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
        v34 = v15;
        v35 = 2112;
        v36 = v6;
        _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, "%{public}@Offset is already %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(v9, "delegateCaller");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "callCompletion:error:", v7, 0);
    }
    else
    {
      encodeRootObject(v6);
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v16 = (void *)v21;
        v31 = CFSTR("kSignificantTimeEventOffset");
        v32 = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMEvent _updateEventWithPayload:completionHandler:](self, "_updateEventWithPayload:completionHandler:", v22, v7);

      }
      else
      {
        objc_msgSend(v9, "delegateCaller");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "callCompletion:error:", v7, v24);

        v16 = 0;
      }
    }
  }
  else
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
      v34 = v20;
      v35 = 2080;
      v36 = "-[HMSignificantTimeEvent updateOffset:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v16);
  }

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
  void *v13;
  void *v14;
  char v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HMSignificantTimeEvent;
  v5 = -[HMEvent mergeFromNewObject:](&v18, sel_mergeFromNewObject_, v4);
  v6 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    -[HMSignificantTimeEvent significantEvent](self, "significantEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "significantEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = HMFEqualObjects();

    if ((v11 & 1) == 0)
    {
      objc_msgSend(v8, "significantEvent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSignificantTimeEvent setSignificantEvent:](self, "setSignificantEvent:", v12);

      v5 = 1;
    }
    -[HMSignificantTimeEvent offset](self, "offset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "offset");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = HMFEqualObjects();

    if ((v15 & 1) == 0)
    {
      objc_msgSend(v8, "offset");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMSignificantTimeEvent setOffset:](self, "setOffset:", v16);

      v5 = 1;
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMSignificantTimeEvent *v4;
  void *v5;
  void *v6;
  HMSignificantTimeEvent *v7;

  v4 = [HMSignificantTimeEvent alloc];
  -[HMSignificantTimeEvent significantEvent](self, "significantEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSignificantTimeEvent offset](self, "offset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMSignificantTimeEvent initWithSignificantEvent:offset:](v4, "initWithSignificantEvent:offset:", v5, v6);

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableSignificantTimeEvent *v4;
  void *v5;
  void *v6;
  HMMutableSignificantTimeEvent *v7;

  v4 = [HMMutableSignificantTimeEvent alloc];
  -[HMSignificantTimeEvent significantEvent](self, "significantEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMSignificantTimeEvent offset](self, "offset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMSignificantTimeEvent initWithSignificantEvent:offset:](v4, "initWithSignificantEvent:offset:", v5, v6);

  return v7;
}

- (HMSignificantTimeEvent)initWithCoder:(id)a3
{
  id v4;
  HMSignificantTimeEvent *v5;
  uint64_t v6;
  NSString *significantEvent;
  uint64_t v8;
  NSDateComponents *offset;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMSignificantTimeEvent;
  v5 = -[HMEvent initWithCoder:](&v11, sel_initWithCoder_, v4);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offset, 0);
  objc_storeStrong((id *)&self->_significantEvent, 0);
}

+ (id)createWithDictionary:(id)a3 home:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  HMSignificantTimeEvent *v7;

  v4 = a3;
  objc_msgSend(v4, "hmf_stringForKey:", CFSTR("kSignificantTimeEventSignificantEvent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateComponentsForKey:", CFSTR("kSignificantTimeEventOffset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMSignificantTimeEvent initWithDict:significantEvent:offset:]([HMSignificantTimeEvent alloc], "initWithDict:significantEvent:offset:", v4, v5, v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

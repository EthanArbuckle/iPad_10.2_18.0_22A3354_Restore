@implementation HMCalendarEvent

- (HMCalendarEvent)initWithFireDateComponents:(NSDateComponents *)fireDateComponents
{
  void *v4;
  NSDateComponents *v5;
  void *v6;
  void *v7;
  HMCalendarEvent *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = CFSTR("kEventUUIDKey");
  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = fireDateComponents;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMCalendarEvent initWithDict:fireDateComponents:](self, "initWithDict:fireDateComponents:", v7, v5);

  return v8;
}

- (HMCalendarEvent)initWithDict:(id)a3 fireDateComponents:(id)a4
{
  id v6;
  HMCalendarEvent *v7;
  uint64_t v8;
  NSDateComponents *fireDateComponents;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMCalendarEvent;
  v7 = -[HMEvent initWithDict:](&v11, sel_initWithDict_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    fireDateComponents = v7->_fireDateComponents;
    v7->_fireDateComponents = (NSDateComponents *)v8;

  }
  return v7;
}

- (NSDateComponents)fireDateComponents
{
  os_unfair_lock_s *p_lock;
  NSDateComponents *v4;

  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_fireDateComponents;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setFireDateComponents:(id)a3
{
  NSDateComponents *v4;
  NSDateComponents *fireDateComponents;

  v4 = (NSDateComponents *)a3;
  os_unfair_lock_lock_with_options();
  fireDateComponents = self->_fireDateComponents;
  self->_fireDateComponents = v4;

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
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HMCalendarEvent;
  -[HMEvent _serializeForAdd](&v10, sel__serializeForAdd);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (void *)MEMORY[0x1E0CB36F8];
  -[HMCalendarEvent fireDateComponents](self, "fireDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("kCalendarTimeEventFireDateComponents"));

  v8 = (void *)objc_msgSend(v4, "copy");
  return v8;
}

- (void)updateFireDateComponents:(id)a3 completionHandler:(id)a4
{
  char *v6;
  void (**v7)(id, void *);
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  HMCalendarEvent *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  HMCalendarEvent *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  HMCalendarEvent *v27;
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
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMCalendarEvent updateFireDateComponents:completionHandler:]", CFSTR("completion"));
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
    -[HMCalendarEvent fireDateComponents](self, "fireDateComponents");
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
        _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, "%{public}@Fire date is already %@", buf, 0x16u);

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
        v31 = CFSTR("kCalendarTimeEventFireDateComponents");
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
      v36 = "-[HMCalendarEvent updateFireDateComponents:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v16);
  }

}

- (void)_updateFromDictionary:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMCalendarEvent;
  v4 = a3;
  -[HMEvent _updateFromDictionary:](&v6, sel__updateFromDictionary_, v4);
  objc_msgSend(v4, "dateComponentsFromDataForKey:", CFSTR("kCalendarTimeEventFireDateComponents"), v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[HMCalendarEvent setFireDateComponents:](self, "setFireDateComponents:", v5);

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
  v14.super_class = (Class)HMCalendarEvent;
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
    -[HMCalendarEvent fireDateComponents](self, "fireDateComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fireDateComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = HMFEqualObjects();

    if ((v11 & 1) == 0)
    {
      objc_msgSend(v8, "fireDateComponents");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMCalendarEvent setFireDateComponents:](self, "setFireDateComponents:", v12);

      v5 = 1;
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMCalendarEvent *v4;
  void *v5;
  HMCalendarEvent *v6;

  v4 = [HMCalendarEvent alloc];
  -[HMCalendarEvent fireDateComponents](self, "fireDateComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMCalendarEvent initWithFireDateComponents:](v4, "initWithFireDateComponents:", v5);

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableCalendarEvent *v4;
  void *v5;
  HMMutableCalendarEvent *v6;

  v4 = [HMMutableCalendarEvent alloc];
  -[HMCalendarEvent fireDateComponents](self, "fireDateComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMCalendarEvent initWithFireDateComponents:](v4, "initWithFireDateComponents:", v5);

  return v6;
}

- (HMCalendarEvent)initWithCoder:(id)a3
{
  id v4;
  HMCalendarEvent *v5;
  uint64_t v6;
  NSDateComponents *fireDateComponents;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMCalendarEvent;
  v5 = -[HMEvent initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCalendarTimeEventFireDateComponents"));
    v6 = objc_claimAutoreleasedReturnValue();
    fireDateComponents = v5->_fireDateComponents;
    v5->_fireDateComponents = (NSDateComponents *)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fireDateComponents, 0);
}

+ (id)createWithDictionary:(id)a3 home:(id)a4
{
  id v4;
  void *v5;
  HMCalendarEvent *v6;

  v4 = a3;
  objc_msgSend(v4, "dateComponentsForKey:", CFSTR("kCalendarTimeEventFireDateComponents"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMCalendarEvent initWithDict:fireDateComponents:]([HMCalendarEvent alloc], "initWithDict:fireDateComponents:", v4, v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

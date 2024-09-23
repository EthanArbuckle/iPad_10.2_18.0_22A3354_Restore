@implementation HMTimerTrigger

- (HMTimerTrigger)init
{

  return 0;
}

- (HMTimerTrigger)initWithName:(NSString *)name fireDate:(NSDate *)fireDate recurrence:(NSDateComponents *)recurrence
{
  return -[HMTimerTrigger initWithName:fireDate:timeZone:recurrence:](self, "initWithName:fireDate:timeZone:recurrence:", name, fireDate, 0, recurrence);
}

- (HMTimerTrigger)initWithName:(id)a3 fireDate:(id)a4 timeZone:(id)a5 recurrence:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMTimerTrigger *v15;
  uint64_t v16;
  NSDate *fireDate;
  uint64_t v18;
  NSTimeZone *timeZone;
  uint64_t v20;
  NSDateComponents *recurrence;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  objc_super v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v11)
  {
    v23 = (void *)MEMORY[0x1E0C99DA0];
    v24 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmStringFromErrorCode:", 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "exceptionWithName:reason:userInfo:", v24, v25, 0);
    v26 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v26);
  }
  v14 = v13;
  v27.receiver = self;
  v27.super_class = (Class)HMTimerTrigger;
  v15 = -[HMTrigger initWithName:configuredName:](&v27, sel_initWithName_configuredName_, v10, v10);
  if (v15)
  {
    v16 = objc_msgSend(v11, "copy");
    fireDate = v15->_fireDate;
    v15->_fireDate = (NSDate *)v16;

    v18 = objc_msgSend(v12, "copy");
    timeZone = v15->_timeZone;
    v15->_timeZone = (NSTimeZone *)v18;

    v20 = objc_msgSend(v14, "copy");
    recurrence = v15->_recurrence;
    v15->_recurrence = (NSDateComponents *)v20;

  }
  return v15;
}

- (HMTimerTrigger)initWithName:(id)a3 fireDate:(id)a4 timeZone:(id)a5 recurrences:(id)a6
{
  id v10;
  HMTimerTrigger *v11;
  uint64_t v12;
  NSArray *recurrences;

  v10 = a6;
  v11 = -[HMTimerTrigger initWithName:fireDate:timeZone:recurrence:](self, "initWithName:fireDate:timeZone:recurrence:", a3, a4, a5, 0);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    recurrences = v11->_recurrences;
    v11->_recurrences = (NSArray *)v12;

  }
  return v11;
}

- (HMTimerTrigger)initWithName:(id)a3 significantEvent:(id)a4 significantEventOffset:(id)a5 recurrences:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMTimerTrigger *v15;
  uint64_t v16;
  NSString *significantEvent;
  uint64_t v18;
  NSDateComponents *significantEventOffset;
  uint64_t v20;
  NSArray *recurrences;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  objc_super v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v11)
  {
    v23 = (void *)MEMORY[0x1E0C99DA0];
    v24 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmStringFromErrorCode:", 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "exceptionWithName:reason:userInfo:", v24, v25, 0);
    v26 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v26);
  }
  v14 = v13;
  v27.receiver = self;
  v27.super_class = (Class)HMTimerTrigger;
  v15 = -[HMTrigger initWithName:configuredName:](&v27, sel_initWithName_configuredName_, v10, v10);
  if (v15)
  {
    v16 = objc_msgSend(v11, "copy");
    significantEvent = v15->_significantEvent;
    v15->_significantEvent = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    significantEventOffset = v15->_significantEventOffset;
    v15->_significantEventOffset = (NSDateComponents *)v18;

    v20 = objc_msgSend(v14, "copy");
    recurrences = v15->_recurrences;
    v15->_recurrences = (NSArray *)v20;

  }
  return v15;
}

- (HMTimerTrigger)initWithDictionary:(id)a3 home:(id)a4
{
  id v6;
  HMTimerTrigger *v7;
  uint64_t v8;
  NSDate *fireDate;
  void *v10;
  void *v11;
  uint64_t v12;
  NSTimeZone *timeZone;
  void *v14;
  void *v15;
  uint64_t v16;
  NSDateComponents *recurrence;
  uint64_t v18;
  NSString *significantEvent;
  void *v20;
  void *v21;
  uint64_t v22;
  NSDateComponents *significantEventOffset;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSArray *recurrences;
  objc_super v30;

  v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)HMTimerTrigger;
  v7 = -[HMTrigger initWithDictionary:home:](&v30, sel_initWithDictionary_home_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kTimerTriggerInitialFireDateKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    fireDate = v7->_fireDate;
    v7->_fireDate = (NSDate *)v8;

    v10 = (void *)MEMORY[0x1E0C99E80];
    objc_msgSend(v6, "hmf_dataForKey:", CFSTR("kTimerTriggerTimeZoneDataKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hmf_unarchiveFromData:error:", v11, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    timeZone = v7->_timeZone;
    v7->_timeZone = (NSTimeZone *)v12;

    v14 = (void *)MEMORY[0x1E0C99D78];
    objc_msgSend(v6, "hmf_dataForKey:", CFSTR("kTimerTriggerRecurrenceDataKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hmf_unarchiveFromData:error:", v15, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    recurrence = v7->_recurrence;
    v7->_recurrence = (NSDateComponents *)v16;

    objc_msgSend(v6, "hmf_stringForKey:", CFSTR("kTimerTriggerSignificantEventKey"));
    v18 = objc_claimAutoreleasedReturnValue();
    significantEvent = v7->_significantEvent;
    v7->_significantEvent = (NSString *)v18;

    v20 = (void *)MEMORY[0x1E0C99D78];
    objc_msgSend(v6, "hmf_dataForKey:", CFSTR("kTimerTriggerSignificantEventOffsetKey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "hmf_unarchiveFromData:error:", v21, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    significantEventOffset = v7->_significantEventOffset;
    v7->_significantEventOffset = (NSDateComponents *)v22;

    objc_msgSend(v6, "hmf_numberForKey:", CFSTR("kTimerTriggerRecurrencesKey"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      v26 = objc_msgSend(v24, "unsignedIntegerValue");
      if (v26 == 127)
      {
LABEL_7:

        goto LABEL_8;
      }
      HMDaysOfTheWeekToDateComponents(v26);
      v27 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "arrayOfDateComponentsFromDataForKey:", CFSTR("kTimerTriggerRecurrencesKey"));
      v27 = objc_claimAutoreleasedReturnValue();
    }
    recurrences = v7->_recurrences;
    v7->_recurrences = (NSArray *)v27;

    goto LABEL_7;
  }
LABEL_8:

  return v7;
}

- (NSDate)fireDate
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_fireDate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setFireDate:(id)a3
{
  NSDate *v4;
  NSDate *fireDate;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSDate *)objc_msgSend(v6, "copy");
  fireDate = self->_fireDate;
  self->_fireDate = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (NSTimeZone)timeZone
{
  os_unfair_lock_s *p_lock;
  NSTimeZone *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_timeZone;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setTimeZone:(id)a3
{
  NSTimeZone *v4;
  NSTimeZone *timeZone;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSTimeZone *)objc_msgSend(v6, "copy");
  timeZone = self->_timeZone;
  self->_timeZone = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (NSDateComponents)recurrence
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSDateComponents copy](self->_recurrence, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDateComponents *)v4;
}

- (void)setRecurrence:(id)a3
{
  NSDateComponents *v4;
  NSDateComponents *recurrence;

  v4 = (NSDateComponents *)a3;
  os_unfair_lock_lock_with_options();
  recurrence = self->_recurrence;
  self->_recurrence = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (NSArray)recurrences
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_recurrences;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setRecurrences:(id)a3
{
  NSArray *v4;
  NSArray *recurrences;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  recurrences = self->_recurrences;
  self->_recurrences = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (NSString)significantEvent
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_significantEvent;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSignificantEvent:(id)a3
{
  NSString *v4;
  NSString *significantEvent;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  significantEvent = self->_significantEvent;
  self->_significantEvent = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (NSDateComponents)significantEventOffset
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSDateComponents copy](self->_significantEventOffset, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDateComponents *)v4;
}

- (void)setSignificantEventOffset:(id)a3
{
  NSDateComponents *v4;
  NSDateComponents *significantEventOffset;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSDateComponents *)objc_msgSend(v6, "copy");
  significantEventOffset = self->_significantEventOffset;
  self->_significantEventOffset = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (void)updateFireDate:(NSDate *)fireDate completionHandler:(void *)completion
{
  NSDate *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMTimerTrigger *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMTimerTrigger *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD block[5];
  NSDate *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = fireDate;
  v7 = completion;
  -[HMTrigger context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMTimerTrigger updateFireDate:completionHandler:]", CFSTR("completion"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      v27 = 2112;
      v28 = (const char *)v16;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__HMTimerTrigger_updateFireDate_completionHandler___block_invoke;
    block[3] = &unk_1E3AB5C58;
    block[4] = self;
    v23 = v6;
    v24 = v7;
    dispatch_async(v10, block);

  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v14;
      v27 = 2080;
      v28 = "-[HMTimerTrigger updateFireDate:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);

  }
}

- (void)_updateFireDate:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMTimerTrigger *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HMTimerTrigger *v24;
  NSObject *v25;
  void *v26;
  id v27;
  const __CFString *v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[HMTrigger context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMTimerTrigger _updateFireDate:completionHandler:]", CFSTR("clientCompletionHandler"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1A1AC1AAC]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v26;
      v32 = 2112;
      v33 = (const char *)v22;
      _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v22, 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v27);
  }
  v9 = (void *)v8;
  if (!v8)
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v15;
      v32 = 2080;
      v33 = "-[HMTimerTrigger _updateFireDate:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v16);
    goto LABEL_10;
  }
  if (!v6)
  {
    -[HMTrigger context](self, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "delegateCaller");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 20, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "callCompletion:error:", v7, v18);

LABEL_10:
    goto LABEL_13;
  }
  -[HMTrigger home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v28 = CFSTR("kTimerTriggerInitialFireDateKey");
    v29 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMTimerTrigger _updateTimerTriggerWithResponse:payloadToSend:](self, "_updateTimerTriggerWithResponse:payloadToSend:", v7, v11);

  }
  else
  {
    -[HMTrigger context](self, "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "delegateCaller");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 12, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "callCompletion:error:", v7, v21);

  }
LABEL_13:

}

- (void)updateTimeZone:(NSTimeZone *)timeZone completionHandler:(void *)completion
{
  NSTimeZone *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMTimerTrigger *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMTimerTrigger *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD block[5];
  NSTimeZone *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = timeZone;
  v7 = completion;
  -[HMTrigger context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMTimerTrigger updateTimeZone:completionHandler:]", CFSTR("completion"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      v27 = 2112;
      v28 = (const char *)v16;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__HMTimerTrigger_updateTimeZone_completionHandler___block_invoke;
    block[3] = &unk_1E3AB5C58;
    block[4] = self;
    v23 = v6;
    v24 = v7;
    dispatch_async(v10, block);

  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v14;
      v27 = 2080;
      v28 = "-[HMTimerTrigger updateTimeZone:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);

  }
}

- (void)_updateTimeZone:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMTimerTrigger *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMTrigger context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[HMTrigger home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (v6)
      {
        v21 = CFSTR("kTimerTriggerTimeZoneDataKey");
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v19 = CFSTR("kTimerTriggerResetTimeZoneDataKey");
        v20 = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[HMTimerTrigger _updateTimerTriggerWithResponse:payloadToSend:](self, "_updateTimerTriggerWithResponse:payloadToSend:", v7, v11);

    }
    else
    {
      -[HMTrigger context](self, "context");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "delegateCaller");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 12, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "callCompletion:error:", v7, v18);

    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v15;
      v25 = 2080;
      v26 = "-[HMTimerTrigger _updateTimeZone:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)updateSignificantEvent:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMTimerTrigger *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMTimerTrigger *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMTrigger context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMTimerTrigger updateSignificantEvent:completionHandler:]", CFSTR("completion"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      v27 = 2112;
      v28 = (const char *)v16;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__HMTimerTrigger_updateSignificantEvent_completionHandler___block_invoke;
    block[3] = &unk_1E3AB5C58;
    block[4] = self;
    v23 = v6;
    v24 = v7;
    dispatch_async(v10, block);

  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v14;
      v27 = 2080;
      v28 = "-[HMTimerTrigger updateSignificantEvent:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v15);

  }
}

- (void)_updateSignificantEvent:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMTimerTrigger *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMTrigger context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v6)
    {
      -[HMTrigger home](self, "home");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v18 = CFSTR("kTimerTriggerSignificantEventKey");
        v19 = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMTimerTrigger _updateTimerTriggerWithResponse:payloadToSend:](self, "_updateTimerTriggerWithResponse:payloadToSend:", v7, v10);

LABEL_11:
        goto LABEL_12;
      }
      -[HMTrigger context](self, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "delegateCaller");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 12, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "callCompletion:error:", v7, v17);

    }
    else
    {
      -[HMTrigger context](self, "context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "delegateCaller");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 20, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "callCompletion:error:", v7, v16);
    }

    goto LABEL_11;
  }
  v11 = (void *)MEMORY[0x1A1AC1AAC]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v14;
    v22 = 2080;
    v23 = "-[HMTimerTrigger _updateSignificantEvent:completionHandler:]";
    _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
LABEL_12:

}

- (void)updateSignificantEventOffset:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMTimerTrigger *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMTimerTrigger *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMTrigger context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMTimerTrigger updateSignificantEventOffset:completionHandler:]", CFSTR("completion"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      v27 = 2112;
      v28 = (const char *)v16;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__HMTimerTrigger_updateSignificantEventOffset_completionHandler___block_invoke;
    block[3] = &unk_1E3AB5C58;
    block[4] = self;
    v23 = v6;
    v24 = v7;
    dispatch_async(v10, block);

  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v14;
      v27 = 2080;
      v28 = "-[HMTimerTrigger updateSignificantEventOffset:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v15);

  }
}

- (void)_updateSignificantEventOffset:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMTimerTrigger *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMTrigger context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[HMTrigger home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (v6)
      {
        v21 = CFSTR("kTimerTriggerSignificantEventOffsetKey");
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v19 = CFSTR("kTimerTriggerResetSignificantEventOffsetKey");
        v20 = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[HMTimerTrigger _updateTimerTriggerWithResponse:payloadToSend:](self, "_updateTimerTriggerWithResponse:payloadToSend:", v7, v11);

    }
    else
    {
      -[HMTrigger context](self, "context");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "delegateCaller");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 12, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "callCompletion:error:", v7, v18);

    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v15;
      v25 = 2080;
      v26 = "-[HMTimerTrigger _updateSignificantEventOffset:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)updateRecurrence:(NSDateComponents *)recurrence completionHandler:(void *)completion
{
  NSDateComponents *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMTimerTrigger *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMTimerTrigger *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD block[5];
  NSDateComponents *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = recurrence;
  v7 = completion;
  -[HMTrigger context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMTimerTrigger updateRecurrence:completionHandler:]", CFSTR("completion"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      v27 = 2112;
      v28 = (const char *)v16;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__HMTimerTrigger_updateRecurrence_completionHandler___block_invoke;
    block[3] = &unk_1E3AB5C58;
    block[4] = self;
    v23 = v6;
    v24 = v7;
    dispatch_async(v10, block);

  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v14;
      v27 = 2080;
      v28 = "-[HMTimerTrigger updateRecurrence:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v7 + 2))(v7, v15);

  }
}

- (void)_updateRecurrence:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMTimerTrigger *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMTrigger context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[HMTrigger home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (v6)
      {
        v21 = CFSTR("kTimerTriggerRecurrenceDataKey");
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v19 = CFSTR("kTimerTriggerResetRecurrenceDataKey");
        v20 = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[HMTimerTrigger _updateTimerTriggerWithResponse:payloadToSend:](self, "_updateTimerTriggerWithResponse:payloadToSend:", v7, v11);

    }
    else
    {
      -[HMTrigger context](self, "context");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "delegateCaller");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 12, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "callCompletion:error:", v7, v18);

    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v15;
      v25 = 2080;
      v26 = "-[HMTimerTrigger _updateRecurrence:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)updateRecurrences:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMTimerTrigger *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMTimerTrigger *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMTrigger context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMTimerTrigger updateRecurrences:completionHandler:]", CFSTR("completion"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      v27 = 2112;
      v28 = (const char *)v16;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__HMTimerTrigger_updateRecurrences_completionHandler___block_invoke;
    block[3] = &unk_1E3AB5C58;
    block[4] = self;
    v23 = v6;
    v24 = v7;
    dispatch_async(v10, block);

  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v14;
      v27 = 2080;
      v28 = "-[HMTimerTrigger updateRecurrences:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v15);

  }
}

- (void)_updateRecurrences:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMTimerTrigger *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  HMTimerTrigger *v23;
  NSObject *v24;
  void *v25;
  id v26;
  const __CFString *v27;
  uint64_t v28;
  const __CFString *v29;
  void *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[HMTrigger context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMTimerTrigger _updateRecurrences:completionHandler:]", CFSTR("clientCompletionHandler"));
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
      v32 = v25;
      v33 = 2112;
      v34 = (const char *)v21;
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
    -[HMTrigger home](self, "home");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      if (v6)
      {
        v29 = CFSTR("kTimerTriggerRecurrencesKey");
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v27 = CFSTR("kTimerTriggerResetRecurrencesKey");
        v28 = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[HMTimerTrigger _updateTimerTriggerWithResponse:payloadToSend:](self, "_updateTimerTriggerWithResponse:payloadToSend:", v7, v13);

    }
    else
    {
      -[HMTrigger context](self, "context");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "delegateCaller");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 12, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "callCompletion:error:", v7, v20);

      v11 = 0;
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v17;
      v33 = 2080;
      v34 = "-[HMTimerTrigger _updateRecurrences:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v11);
  }

}

- (void)_updateTimerTriggerWithResponse:(id)a3 payloadToSend:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMTimerTrigger *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, void *);
  void *v22;
  id v23;
  id v24;
  _BYTE location[12];
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMTrigger context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0D285F8];
    v10 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMTrigger uuid](self, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithTarget:", v11);
    objc_msgSend(v9, "messageWithName:destination:payload:", CFSTR("kScheduleTimerTriggerRequestKey"), v12, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)location, self);
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __64__HMTimerTrigger__updateTimerTriggerWithResponse_payloadToSend___block_invoke;
    v22 = &unk_1E3AB4AE0;
    objc_copyWeak(&v24, (id *)location);
    v23 = v6;
    objc_msgSend(v13, "setResponseHandler:", &v19);
    objc_msgSend(v8, "messageDispatcher", v19, v20, v21, v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendMessage:completionHandler:", v13, 0);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)location);

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
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v18;
      v26 = 2080;
      v27 = "-[HMTimerTrigger _updateTimerTriggerWithResponse:payloadToSend:]";
      _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v28.receiver = self;
  v28.super_class = (Class)HMTimerTrigger;
  -[HMTrigger _serializeForAdd](&v28, sel__serializeForAdd);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMTimerTrigger fireDate](self, "fireDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMTimerTrigger fireDate](self, "fireDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("kTimerTriggerInitialFireDateKey"));

  }
  -[HMTimerTrigger timeZone](self, "timeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB36F8];
    -[HMTimerTrigger timeZone](self, "timeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("kTimerTriggerTimeZoneDataKey"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("kTimerTriggerResetTimeZoneDataKey"));
  }
  -[HMTimerTrigger recurrence](self, "recurrence");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB36F8];
    -[HMTimerTrigger recurrence](self, "recurrence");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("kTimerTriggerRecurrenceDataKey"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("kTimerTriggerResetRecurrenceDataKey"));
  }
  -[HMTimerTrigger recurrences](self, "recurrences");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0CB36F8];
    -[HMTimerTrigger recurrences](self, "recurrences");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "archivedDataWithRootObject:requiringSecureCoding:error:", v18, 1, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("kTimerTriggerRecurrencesKey"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("kTimerTriggerResetRecurrencesKey"));
  }
  -[HMTimerTrigger significantEvent](self, "significantEvent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[HMTimerTrigger significantEvent](self, "significantEvent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("kTimerTriggerSignificantEventKey"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("kTimerTriggerResetSignificantEventKey"));
  }
  -[HMTimerTrigger significantEventOffset](self, "significantEventOffset");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = (void *)MEMORY[0x1E0CB36F8];
    -[HMTimerTrigger significantEventOffset](self, "significantEventOffset");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "archivedDataWithRootObject:requiringSecureCoding:error:", v24, 1, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, CFSTR("kTimerTriggerSignificantEventOffsetKey"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("kTimerTriggerResetSignificantEventOffsetKey"));
  }
  v26 = (void *)objc_msgSend(v5, "copy");

  return v26;
}

- (void)_updateTimerTriggerPropertiesFromResponse:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMTimerTrigger *v9;
  void *v10;
  void *v11;
  HMTimerTrigger *v12;
  void *v13;
  void *v14;
  HMTimerTrigger *v15;
  void *v16;
  void *v17;
  HMTimerTrigger *v18;
  void *v19;
  void *v20;
  HMTimerTrigger *v21;
  void *v22;
  id v23;

  v23 = a3;
  objc_msgSend(v23, "hmf_dateForKey:", CFSTR("kTimerTriggerInitialFireDateKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = v4;
  else
    v5 = 0;
  -[HMTimerTrigger setFireDate:](self, "setFireDate:", v5);
  v6 = (void *)MEMORY[0x1E0C99E80];
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("kTimerTriggerTimeZoneDataKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_unarchiveFromData:error:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = self;
    v10 = v8;
  }
  else
  {
    if (!objc_msgSend(v23, "hmf_BOOLForKey:", CFSTR("kTimerTriggerResetTimeZoneDataKey")))
      goto LABEL_9;
    v9 = self;
    v10 = 0;
  }
  -[HMTimerTrigger setTimeZone:](v9, "setTimeZone:", v10);
LABEL_9:
  objc_msgSend(v23, "dateComponentsForKey:", CFSTR("kTimerTriggerRecurrenceDataKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = self;
    v13 = v11;
  }
  else
  {
    if (!objc_msgSend(v23, "hmf_BOOLForKey:", CFSTR("kTimerTriggerResetRecurrenceDataKey")))
      goto LABEL_14;
    v12 = self;
    v13 = 0;
  }
  -[HMTimerTrigger setRecurrence:](v12, "setRecurrence:", v13);
LABEL_14:
  objc_msgSend(v23, "arrayOfDateComponentsFromDataForKey:", CFSTR("kTimerTriggerRecurrencesKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = self;
    v16 = v14;
  }
  else
  {
    if (!objc_msgSend(v23, "hmf_BOOLForKey:", CFSTR("kTimerTriggerResetRecurrencesKey")))
      goto LABEL_19;
    v15 = self;
    v16 = 0;
  }
  -[HMTimerTrigger setRecurrences:](v15, "setRecurrences:", v16);
LABEL_19:
  objc_msgSend(v23, "hmf_stringForKey:", CFSTR("kTimerTriggerSignificantEventKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = self;
    v19 = v17;
  }
  else
  {
    if (!objc_msgSend(v23, "hmf_BOOLForKey:", CFSTR("kTimerTriggerResetSignificantEventKey")))
      goto LABEL_24;
    v18 = self;
    v19 = 0;
  }
  -[HMTimerTrigger setSignificantEvent:](v18, "setSignificantEvent:", v19);
LABEL_24:
  objc_msgSend(v23, "hmf_dateComponentsForKey:", CFSTR("kTimerTriggerSignificantEventOffsetKey"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = self;
    v22 = v20;
LABEL_28:
    -[HMTimerTrigger setSignificantEventOffset:](v21, "setSignificantEventOffset:", v22);
    goto LABEL_29;
  }
  if (objc_msgSend(v23, "hmf_BOOLForKey:", CFSTR("kTimerTriggerResetSignificantEventOffsetKey")))
  {
    v21 = self;
    v22 = 0;
    goto LABEL_28;
  }
LABEL_29:

}

- (void)_handleTriggerFired:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMTimerTrigger;
  -[HMTrigger _handleTriggerFired:](&v3, sel__handleTriggerFired_, a3);
}

- (HMTimerTrigger)initWithCoder:(id)a3
{
  id v4;
  HMTimerTrigger *v5;
  uint64_t v6;
  NSDate *fireDate;
  uint64_t v8;
  NSTimeZone *timeZone;
  uint64_t v10;
  NSString *significantEvent;
  uint64_t v12;
  NSDateComponents *significantEventOffset;
  uint64_t v14;
  NSDateComponents *recurrence;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *recurrences;
  objc_super v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HMTimerTrigger;
  v5 = -[HMTrigger initWithCoder:](&v22, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timerTriggerInitialFireDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    fireDate = v5->_fireDate;
    v5->_fireDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timerTriggerTimeZone"));
    v8 = objc_claimAutoreleasedReturnValue();
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.timerTriggerSignificantEvent"));
    v10 = objc_claimAutoreleasedReturnValue();
    significantEvent = v5->_significantEvent;
    v5->_significantEvent = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.timerTriggerSignificantEventOffset"));
    v12 = objc_claimAutoreleasedReturnValue();
    significantEventOffset = v5->_significantEventOffset;
    v5->_significantEventOffset = (NSDateComponents *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timerTriggerRepeatInterval"));
    v14 = objc_claimAutoreleasedReturnValue();
    recurrence = v5->_recurrence;
    v5->_recurrence = (NSDateComponents *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("HM.timerTriggerRecurrences"));
    v19 = objc_claimAutoreleasedReturnValue();
    recurrences = v5->_recurrences;
    v5->_recurrences = (NSArray *)v19;

  }
  return v5;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  NSObject *v45;
  _QWORD block[5];
  objc_super v48;

  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)HMTimerTrigger;
  LODWORD(v5) = -[HMTrigger mergeFromNewObject:](&v48, sel_mergeFromNewObject_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    -[HMTimerTrigger fireDate](self, "fireDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fireDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToDate:", v8);

    if ((v9 & 1) == 0)
    {
      objc_msgSend(v6, "fireDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMTimerTrigger setFireDate:](self, "setFireDate:", v5);

      LODWORD(v5) = 1;
    }
    -[HMTimerTrigger timeZone](self, "timeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "timeZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {

      if (!v12)
      {
        -[HMTimerTrigger setTimeZone:](self, "setTimeZone:", 0);
        goto LABEL_11;
      }
      -[HMTimerTrigger timeZone](self, "timeZone");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timeZone");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqualToTimeZone:", v14);

      if ((v15 & 1) != 0)
      {
LABEL_12:
        -[HMTimerTrigger recurrence](self, "recurrence");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "recurrence");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v17)
        {

          if (!v19)
          {
            -[HMTimerTrigger setRecurrence:](self, "setRecurrence:", 0);
            goto LABEL_19;
          }
          -[HMTimerTrigger recurrence](self, "recurrence");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "recurrence");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v20, "isEqual:", v21);

          if ((v22 & 1) != 0)
          {
LABEL_20:
            -[HMTimerTrigger recurrences](self, "recurrences");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v6, "recurrences");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v25;
            if (v24)
            {

              if (!v26)
              {
                -[HMTimerTrigger setRecurrences:](self, "setRecurrences:", 0);
                goto LABEL_27;
              }
              -[HMTimerTrigger recurrences](self, "recurrences");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "recurrences");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v27, "isEqual:", v28);

              if ((v29 & 1) != 0)
              {
LABEL_28:
                -[HMTimerTrigger significantEvent](self, "significantEvent");
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v6, "significantEvent");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = v32;
                if (v31)
                {

                  if (!v33)
                  {
                    -[HMTimerTrigger setSignificantEvent:](self, "setSignificantEvent:", 0);
                    goto LABEL_35;
                  }
                  -[HMTimerTrigger significantEvent](self, "significantEvent");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v6, "significantEvent");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v36 = objc_msgSend(v34, "isEqual:", v35);

                  if ((v36 & 1) != 0)
                  {
LABEL_36:
                    -[HMTimerTrigger significantEventOffset](self, "significantEventOffset");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v6, "significantEventOffset");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    v40 = v39;
                    if (v38)
                    {

                      if (!v40)
                      {
                        -[HMTimerTrigger setSignificantEventOffset:](self, "setSignificantEventOffset:", 0);
                        goto LABEL_44;
                      }
                      -[HMTimerTrigger significantEventOffset](self, "significantEventOffset");
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v6, "significantEventOffset");
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      v43 = objc_msgSend(v41, "isEqual:", v42);

                      if ((v43 & 1) != 0)
                        goto LABEL_39;
                    }
                    else
                    {

                      if (!v40)
                      {
LABEL_39:
                        if (!(_DWORD)v5)
                          goto LABEL_45;
                        goto LABEL_44;
                      }
                    }
                    objc_msgSend(v6, "significantEventOffset");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    -[HMTimerTrigger setSignificantEventOffset:](self, "setSignificantEventOffset:", v44);

LABEL_44:
                    -[HMTrigger context](self, "context");
                    v5 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v5, "queue");
                    v45 = objc_claimAutoreleasedReturnValue();
                    block[0] = MEMORY[0x1E0C809B0];
                    block[1] = 3221225472;
                    block[2] = __37__HMTimerTrigger_mergeFromNewObject___block_invoke;
                    block[3] = &unk_1E3AB5E18;
                    block[4] = self;
                    dispatch_async(v45, block);

                    LOBYTE(v5) = 1;
LABEL_45:

                    goto LABEL_46;
                  }
                }
                else
                {

                  if (!v33)
                    goto LABEL_36;
                }
                objc_msgSend(v6, "significantEvent");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                -[HMTimerTrigger setSignificantEvent:](self, "setSignificantEvent:", v37);

LABEL_35:
                LODWORD(v5) = 1;
                goto LABEL_36;
              }
            }
            else
            {

              if (!v26)
                goto LABEL_28;
            }
            objc_msgSend(v6, "recurrences");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMTimerTrigger setRecurrences:](self, "setRecurrences:", v30);

LABEL_27:
            LODWORD(v5) = 1;
            goto LABEL_28;
          }
        }
        else
        {

          if (!v19)
            goto LABEL_20;
        }
        objc_msgSend(v6, "recurrence");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMTimerTrigger setRecurrence:](self, "setRecurrence:", v23);

LABEL_19:
        LODWORD(v5) = 1;
        goto LABEL_20;
      }
    }
    else
    {

      if (!v12)
        goto LABEL_12;
    }
    objc_msgSend(v6, "timeZone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMTimerTrigger setTimeZone:](self, "setTimeZone:", v16);

LABEL_11:
    LODWORD(v5) = 1;
    goto LABEL_12;
  }
LABEL_46:

  return (char)v5;
}

- (NSCalendar)recurrenceCalendar
{
  return self->_recurrenceCalendar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recurrenceCalendar, 0);
  objc_storeStrong((id *)&self->_recurrence, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_significantEventOffset, 0);
  objc_storeStrong((id *)&self->_significantEvent, 0);
  objc_storeStrong((id *)&self->_recurrences, 0);
}

void __37__HMTimerTrigger_mergeFromNewObject___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_notifyDelegateOfTriggerUpdated:", *(_QWORD *)(a1 + 32));

}

void __64__HMTimerTrigger__updateTimerTriggerWithResponse_payloadToSend___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = _Block_copy(*(const void **)(a1 + 32));
    v13 = 138544130;
    v14 = v11;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v12;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Update timer trigger properties : %@, completionHandler: %@ error %@", (uint8_t *)&v13, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  if (!v5 && v6)
    objc_msgSend(v9, "_updateTimerTriggerPropertiesFromResponse:", v6);
  objc_msgSend(v9, "_updateClientWithResults:withError:", *(_QWORD *)(a1 + 32), v5);

}

uint64_t __54__HMTimerTrigger_updateRecurrences_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateRecurrences:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __53__HMTimerTrigger_updateRecurrence_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateRecurrence:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __65__HMTimerTrigger_updateSignificantEventOffset_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSignificantEventOffset:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __59__HMTimerTrigger_updateSignificantEvent_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSignificantEvent:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __51__HMTimerTrigger_updateTimeZone_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTimeZone:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __51__HMTimerTrigger_updateFireDate_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFireDate:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

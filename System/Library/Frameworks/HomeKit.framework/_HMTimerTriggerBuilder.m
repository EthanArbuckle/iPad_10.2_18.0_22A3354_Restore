@implementation _HMTimerTriggerBuilder

- (Class)class
{
  return (Class)objc_opt_class();
}

- (NSDate)fireDate
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[_HMTimerTriggerBuilder fireDateIfSet](self, "fireDateIfSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (NSDate *)v5;
}

- (NSDate)fireDateIfSet
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->super.super.super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_fireDate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setFireDate:(id)a3
{
  NSDate *v4;
  void *fireDate;
  NSDate *v6;
  NSTimeZone *timeZone;
  id v8;

  v8 = a3;
  os_unfair_lock_lock_with_options();
  if (v8)
  {
    v4 = (NSDate *)objc_msgSend(v8, "copy");
    fireDate = self->_fireDate;
    self->_fireDate = v4;
  }
  else
  {
    v6 = self->_fireDate;
    self->_fireDate = 0;

    timeZone = self->_timeZone;
    self->_timeZone = 0;

    fireDate = self->_recurrence;
    self->_recurrence = 0;
  }

  os_unfair_lock_unlock(&self->super.super.super._lock);
}

- (void)updateFireDate:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  _HMContext *context;
  _HMContext *v9;
  void *v10;
  _HMContext *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _HMTimerTriggerBuilder *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMTimerTriggerBuilder updateFireDate:completionHandler:]", CFSTR("completion"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v17;
      v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v13, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  v7 = v6;
  if (v19)
  {
    -[_HMTimerTriggerBuilder setFireDate:](self, "setFireDate:");
    if (self)
      context = self->super.super.super._context;
    else
      context = 0;
    v9 = context;
    -[_HMContext delegateCaller](v9, "delegateCaller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "callCompletion:error:", v7, 0);
  }
  else
  {
    if (self)
      v11 = self->super.super.super._context;
    else
      v11 = 0;
    v9 = v11;
    -[_HMContext delegateCaller](v9, "delegateCaller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "callCompletion:error:", v7, v12);

  }
}

- (NSTimeZone)timeZone
{
  os_unfair_lock_s *p_lock;
  NSTimeZone *v4;

  p_lock = &self->super.super.super._lock;
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

  os_unfair_lock_unlock(&self->super.super.super._lock);
}

- (void)updateTimeZone:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  _HMContext *context;
  _HMContext *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _HMTimerTriggerBuilder *v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMTimerTriggerBuilder updateTimeZone:completionHandler:]", CFSTR("completion"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v15;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v11, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v16);
  }
  v7 = v6;
  -[_HMTimerTriggerBuilder setTimeZone:](self, "setTimeZone:", v17);
  if (self)
    context = self->super.super.super._context;
  else
    context = 0;
  v9 = context;
  -[_HMContext delegateCaller](v9, "delegateCaller");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "callCompletion:error:", v7, 0);

}

- (NSDateComponents)recurrence
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->super.super.super._lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSDateComponents copy](self->_recurrence, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDateComponents *)v4;
}

- (void)setRecurrence:(id)a3
{
  NSDateComponents *v4;
  NSDateComponents *recurrence;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSDateComponents *)objc_msgSend(v6, "copy");
  recurrence = self->_recurrence;
  self->_recurrence = v4;

  os_unfair_lock_unlock(&self->super.super.super._lock);
}

- (void)updateRecurrence:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  _HMContext *context;
  _HMContext *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _HMTimerTriggerBuilder *v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMTimerTriggerBuilder updateRecurrence:completionHandler:]", CFSTR("completion"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v15;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v11, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v16);
  }
  v7 = v6;
  -[_HMTimerTriggerBuilder setRecurrence:](self, "setRecurrence:", v17);
  if (self)
    context = self->super.super.super._context;
  else
    context = 0;
  v9 = context;
  -[_HMContext delegateCaller](v9, "delegateCaller");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "callCompletion:error:", v7, 0);

}

- (NSString)significantEvent
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->super.super.super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_significantEvent;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSignificantEvent:(id)a3
{
  NSString *v4;
  NSDateComponents *significantEvent;
  NSString *v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock_with_options();
  if (v7)
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    significantEvent = (NSDateComponents *)self->_significantEvent;
    self->_significantEvent = v4;
  }
  else
  {
    v6 = self->_significantEvent;
    self->_significantEvent = 0;

    significantEvent = self->_significantEventOffset;
    self->_significantEventOffset = 0;
  }

  os_unfair_lock_unlock(&self->super.super.super._lock);
}

- (void)updateSignificantEvent:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  _HMContext *context;
  _HMContext *v9;
  void *v10;
  _HMContext *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _HMTimerTriggerBuilder *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMTimerTriggerBuilder updateSignificantEvent:completionHandler:]", CFSTR("completion"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v17;
      v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v13, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  v7 = v6;
  if (v19)
  {
    -[_HMTimerTriggerBuilder setSignificantEvent:](self, "setSignificantEvent:");
    if (self)
      context = self->super.super.super._context;
    else
      context = 0;
    v9 = context;
    -[_HMContext delegateCaller](v9, "delegateCaller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "callCompletion:error:", v7, 0);
  }
  else
  {
    if (self)
      v11 = self->super.super.super._context;
    else
      v11 = 0;
    v9 = v11;
    -[_HMContext delegateCaller](v9, "delegateCaller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "callCompletion:error:", v7, v12);

  }
}

- (NSDateComponents)significantEventOffset
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->super.super.super._lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSDateComponents copy](self->_significantEventOffset, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDateComponents *)v4;
}

- (void)setSignificantEventOffset:(id)a3
{
  id v4;
  id v5;
  BOOL valid;
  _HMTimerTriggerBuilder *v7;
  SEL v8;
  id v9;
  id v10;

  v4 = a3;
  v5 = v4;
  v10 = v4;
  if (v4 && (valid = HMIsValidSignificantEventOffset(v4), v5 = v10, !valid))
  {
    v7 = (_HMTimerTriggerBuilder *)_HMFPreconditionFailure();
    -[_HMTimerTriggerBuilder _setSignificantEventOffset:](v7, v8, v9);
  }
  else
  {
    -[_HMTimerTriggerBuilder _setSignificantEventOffset:](self, "_setSignificantEventOffset:", v5);

  }
}

- (void)_setSignificantEventOffset:(id)a3
{
  NSDateComponents *v4;
  NSDateComponents *significantEventOffset;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSDateComponents *)objc_msgSend(v6, "copy");
  significantEventOffset = self->_significantEventOffset;
  self->_significantEventOffset = v4;

  os_unfair_lock_unlock(&self->super.super.super._lock);
}

- (void)updateSignificantEventOffset:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  _HMContext *context;
  _HMContext *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _HMTimerTriggerBuilder *v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMTimerTriggerBuilder updateSignificantEventOffset:completionHandler:]", CFSTR("completion"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v15;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v11, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v16);
  }
  v7 = v6;
  -[_HMTimerTriggerBuilder _setSignificantEventOffset:](self, "_setSignificantEventOffset:", v17);
  if (self)
    context = self->super.super.super._context;
  else
    context = 0;
  v9 = context;
  -[_HMContext delegateCaller](v9, "delegateCaller");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "callCompletion:error:", v7, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_significantEventOffset, 0);
  objc_storeStrong((id *)&self->_significantEvent, 0);
  objc_storeStrong((id *)&self->_recurrence, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);
}

+ (void)initialize
{
  uint64_t v3;

  if ((id)objc_opt_class() == a1)
  {
    v3 = objc_opt_class();
    objc_msgSend(a1, "adoptExternalCategoriesFromClasses:", v3, objc_opt_class(), 0);
  }
}

- (id)recurrenceCalendar
{
  return 0;
}

@end

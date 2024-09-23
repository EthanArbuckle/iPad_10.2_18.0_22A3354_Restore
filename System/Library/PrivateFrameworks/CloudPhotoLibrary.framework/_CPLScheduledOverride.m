@implementation _CPLScheduledOverride

- (_CPLScheduledOverride)initWithBudget:(unint64_t)a3 withReason:(unint64_t)a4 queue:(id)a5
{
  id v9;
  _CPLScheduledOverride *v10;
  _CPLScheduledOverride *v11;
  uint64_t v12;
  NSString *expirationDateStorageKey;
  uint64_t v14;
  NSString *overrideReasonKey;
  objc_super v17;

  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_CPLScheduledOverride;
  v10 = -[_CPLScheduledOverride init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_budget = a3;
    objc_storeStrong((id *)&v10->_queue, a5);
    v11->_reason = a4;
    +[_CPLScheduledOverride _expirationDateStorageKeyForBudget:](_CPLScheduledOverride, "_expirationDateStorageKeyForBudget:", a3);
    v12 = objc_claimAutoreleasedReturnValue();
    expirationDateStorageKey = v11->_expirationDateStorageKey;
    v11->_expirationDateStorageKey = (NSString *)v12;

    +[_CPLScheduledOverride budgetOverrideReasonStorageKeyForBudget:](_CPLScheduledOverride, "budgetOverrideReasonStorageKeyForBudget:", a3);
    v14 = objc_claimAutoreleasedReturnValue();
    overrideReasonKey = v11->_overrideReasonKey;
    v11->_overrideReasonKey = (NSString *)v14;

  }
  return v11;
}

- (void)_scheduleEndWithTimeInterval:(double)a3
{
  dispatch_source_t v5;
  NSObject *v6;
  uint64_t v7;
  dispatch_time_t v8;
  OS_dispatch_source *timer;
  NSObject *v10;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD handler[4];
  NSObject *v18;
  _CPLScheduledOverride *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->_timer)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        +[CPLEngineSystemMonitor descriptionForBudget:](CPLEngineSystemMonitor, "descriptionForBudget:", self->_budget);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v21 = v13;
        _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_ERROR, "Timer for end of system budget override %@ called too many times", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSystemMonitor.m");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPLEngineSystemMonitor descriptionForBudget:](CPLEngineSystemMonitor, "descriptionForBudget:", self->_budget);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v15, 1196, CFSTR("Timer for end of system budget override %@ called too many times"), v16);

    abort();
  }
  v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __54___CPLScheduledOverride__scheduleEndWithTimeInterval___block_invoke;
  handler[3] = &unk_1E60D6F88;
  v6 = v5;
  v18 = v6;
  v19 = self;
  dispatch_source_set_event_handler(v6, handler);
  v7 = (uint64_t)a3;
  if ((uint64_t)a3 <= 1)
    v7 = 1;
  v8 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 1000000000 * v7);
  dispatch_source_set_timer(v6, v8, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  dispatch_activate(v6);
  timer = self->_timer;
  self->_timer = (OS_dispatch_source *)v6;
  v10 = v6;

}

- (BOOL)scheduleEndFromPersistedOverride
{
  void *v4;
  NSDate *v5;
  NSDate *endDate;
  void *v7;
  void *v8;
  unint64_t v9;
  __CFString *v10;
  BOOL v11;
  NSObject *v12;
  NSString *expirationDateStorageKey;
  NSDate *v14;
  id v15;
  NSDate *v16;
  NSObject *v17;
  NSString *overrideReasonKey;
  id v19;
  double v20;
  double v21;
  double v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v27;
  NSString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  NSString *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_expirationDateStorageKey)
    return 0;
  if (self->_endDate)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v28 = (NSString *)objc_claimAutoreleasedReturnValue();
        +[CPLEngineSystemMonitor descriptionForBudget:](CPLEngineSystemMonitor, "descriptionForBudget:", self->_budget);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v35 = v28;
        v36 = 2112;
        v37 = (uint64_t)v29;
        _os_log_impl(&dword_1B03C2000, v27, OS_LOG_TYPE_ERROR, "%@ called to many times for %@", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSystemMonitor.m");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[CPLEngineSystemMonitor descriptionForBudget:](CPLEngineSystemMonitor, "descriptionForBudget:", self->_budget);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v31, 1221, CFSTR("%@ called to many times for %@"), v32, v33);

    abort();
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", self->_expirationDateStorageKey);
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  endDate = self->_endDate;
  self->_endDate = v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", self->_overrideReasonKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_endDate && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (!_CPLSilentLogging)
    {
      __CPLSystemMonitorOSLogDomain();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        expirationDateStorageKey = self->_expirationDateStorageKey;
        v14 = self->_endDate;
        *(_DWORD *)buf = 138543874;
        v35 = expirationDateStorageKey;
        v36 = 2112;
        v37 = (uint64_t)v14;
        v38 = 2114;
        v39 = (id)objc_opt_class();
        v15 = v39;
        _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_ERROR, "Incorrect value for %{public}@: %@ (%{public}@)", buf, 0x20u);

      }
    }
    v16 = self->_endDate;
    self->_endDate = 0;

  }
  else if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (self->_endDate)
      {
        v9 = self->_reason - 1;
        v10 = v9 > 3 ? CFSTR("forced by user") : off_1E60DCE88[v9];
        if (-[__CFString isEqualToString:](v10, "isEqualToString:", v8))
        {
          -[NSDate timeIntervalSinceNow](self->_endDate, "timeIntervalSinceNow");
          if (v20 <= 0.0)
          {
            objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "removeObjectForKey:", self->_expirationDateStorageKey);

            objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "removeObjectForKey:", self->_overrideReasonKey);

          }
          else
          {
            v21 = v20;
            v22 = 86400.0;
            if (v20 <= 86400.0)
            {
              v22 = v20;
            }
            else if (!_CPLSilentLogging)
            {
              __CPLSystemMonitorOSLogDomain();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                v35 = *(NSString **)&v21;
                v36 = 2048;
                v37 = 0x40F5180000000000;
                _os_log_impl(&dword_1B03C2000, v23, OS_LOG_TYPE_ERROR, "Override duration is too long (%.0fs) - will cap at %.0fs", buf, 0x16u);
              }

            }
            -[_CPLScheduledOverride _scheduleEndWithTimeInterval:](self, "_scheduleEndWithTimeInterval:", v22);
          }
        }
      }
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLSystemMonitorOSLogDomain();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          overrideReasonKey = self->_overrideReasonKey;
          *(_DWORD *)buf = 138543874;
          v35 = overrideReasonKey;
          v36 = 2112;
          v37 = (uint64_t)v8;
          v38 = 2114;
          v39 = (id)objc_opt_class();
          v19 = v39;
          _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_ERROR, "Incorrect value for %{public}@: %@ (%{public}@)", buf, 0x20u);

        }
      }

      v8 = 0;
    }
  }
  v11 = self->_timer != 0;

  return v11;
}

- (BOOL)scheduleEndOfOverride
{
  NSString *expirationDateStorageKey;
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  NSDate *v9;
  NSDate *endDate;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  const __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  id v21;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  double v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  expirationDateStorageKey = self->_expirationDateStorageKey;
  if (expirationDateStorageKey)
  {
    if (self->_endDate)
    {
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          +[CPLEngineSystemMonitor descriptionForBudget:](CPLEngineSystemMonitor, "descriptionForBudget:", self->_budget);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v31 = *(double *)&v24;
          v32 = 2112;
          v33 = (uint64_t)v25;
          _os_log_impl(&dword_1B03C2000, v23, OS_LOG_TYPE_ERROR, "%@ called to many times for %@", buf, 0x16u);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLEngineSystemMonitor.m");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[CPLEngineSystemMonitor descriptionForBudget:](CPLEngineSystemMonitor, "descriptionForBudget:", self->_budget);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v27, 1270, CFSTR("%@ called to many times for %@"), v28, v29);

      abort();
    }
    objc_msgSend((id)objc_opt_class(), "nextTimeIntervalForOverridingBudget:withReason:", self->_budget, self->_reason);
    if (v5 <= 0.0)
      v6 = 3600.0;
    else
      v6 = v5;
    v7 = 86400.0;
    if (v6 <= 86400.0)
    {
      v7 = v6;
    }
    else if (!_CPLSilentLogging)
    {
      __CPLSystemMonitorOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        v31 = v6;
        v32 = 2048;
        v33 = 0x40F5180000000000;
        _os_log_impl(&dword_1B03C2000, v8, OS_LOG_TYPE_ERROR, "Override duration is too long (%.0fs) - will cap at %.0fs", buf, 0x16u);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v7);
    v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
    endDate = self->_endDate;
    self->_endDate = v9;

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", self->_endDate, self->_expirationDateStorageKey);

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = self->_reason - 1;
    if (v14 > 3)
      v15 = CFSTR("forced by user");
    else
      v15 = off_1E60DCE88[v14];
    objc_msgSend(v12, "setObject:forKey:", v15, self->_overrideReasonKey);

    if (objc_msgSend((id)objc_opt_class(), "isBudgetTypeSupportedForProgressiveOverriding:withReason:", self->_budget, self->_reason))
    {
      objc_msgSend((id)objc_opt_class(), "currentBudgetOverrideTimeIntervalStorageKeyForBudget:", self->_budget);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFPreferencesSetAppValue(v16, 0, CFSTR("com.apple.mobileslideshow"));
      CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      CFPreferencesSetAppValue(v16, v17, CFSTR("com.apple.mobileslideshow"));

      CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dateByAddingTimeInterval:", 259200.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "currentBudgetOverrideTimeIntervalExpiryDateStorageKeyForBudget:", self->_budget);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v21 = v19;
      CFPreferencesSetAppValue(v20, 0, CFSTR("com.apple.mobileslideshow"));
      CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
      CFPreferencesSetAppValue(v20, v21, CFSTR("com.apple.mobileslideshow"));

      CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
    }
    -[_CPLScheduledOverride _scheduleEndWithTimeInterval:](self, "_scheduleEndWithTimeInterval:", v7);
  }
  return expirationDateStorageKey != 0;
}

- (void)resetHeuristics
{
  __CFString *v3;
  __CFString *v4;

  if (self->_expirationDateStorageKey)
  {
    objc_msgSend((id)objc_opt_class(), "currentBudgetOverrideTimeIntervalStorageKeyForBudget:", self->_budget);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFPreferencesSetAppValue(v3, 0, CFSTR("com.apple.mobileslideshow"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));

    objc_msgSend((id)objc_opt_class(), "currentBudgetOverrideTimeIntervalExpiryDateStorageKeyForBudget:", self->_budget);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFPreferencesSetAppValue(v4, 0, CFSTR("com.apple.mobileslideshow"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));

  }
}

- (void)cancel
{
  void *v3;
  void *v4;
  NSObject *timer;
  OS_dispatch_source *v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_expirationDateStorageKey)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObjectForKey:", self->_expirationDateStorageKey);

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", self->_overrideReasonKey);

    timer = self->_timer;
    if (timer)
    {
      dispatch_source_cancel(timer);
      v6 = self->_timer;
      self->_timer = 0;

    }
  }
}

- (NSString)status
{
  void *v3;
  double v4;
  id v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  id v9;

  if (self->_endDate)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDate timeIntervalSinceDate:](self->_endDate, "timeIntervalSinceDate:", v3);
    if (v4 <= 1.0)
    {
      if (v4 >= -1.0)
      {
        v8 = CFSTR("ending very soon");
        goto LABEL_9;
      }
      v9 = objc_alloc(MEMORY[0x1E0CB3940]);
      +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", self->_endDate, v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "initWithFormat:", CFSTR("should have ended %@"), v6);
    }
    else
    {
      v5 = objc_alloc(MEMORY[0x1E0CB3940]);
      +[CPLDateFormatter stringFromDateAgo:now:](CPLDateFormatter, "stringFromDateAgo:now:", self->_endDate, v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "initWithFormat:", CFSTR("ending %@"), v6);
    }
    v8 = (__CFString *)v7;

LABEL_9:
    return (NSString *)v8;
  }
  v8 = CFSTR("ending very soon");
  return (NSString *)v8;
}

- (unint64_t)budget
{
  return self->_budget;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (_CPLScheduledOverrideDelegate)delegate
{
  return (_CPLScheduledOverrideDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_overrideReasonKey, 0);
  objc_storeStrong((id *)&self->_expirationDateStorageKey, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

+ (double)nextTimeIntervalToUseGivenCurrent:(double)a3 expiryDate:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;

  v5 = a4;
  if (nextTimeIntervalToUseGivenCurrent_expiryDate__onceToken != -1)
    dispatch_once(&nextTimeIntervalToUseGivenCurrent_expiryDate__onceToken, &__block_literal_global_302);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = 3600.0;
  if (v5)
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "compare:", v5);

      if (v10 != 1)
      {
        v11 = objc_msgSend((id)nextTimeIntervalToUseGivenCurrent_expiryDate__budgetOverrideTimeIntervalHeuristics, "indexOfObject:", v7);
        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v12 = v11;
          v13 = v11 + 1;
          v14 = objc_msgSend((id)nextTimeIntervalToUseGivenCurrent_expiryDate__budgetOverrideTimeIntervalHeuristics, "count");
          if (v13 < v14 - 1)
            v15 = v12 + 1;
          else
            v15 = v14 - 1;
          objc_msgSend((id)nextTimeIntervalToUseGivenCurrent_expiryDate__budgetOverrideTimeIntervalHeuristics, "objectAtIndexedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "doubleValue");
          v8 = v17;

        }
      }
    }
  }

  return v8;
}

+ (unint64_t)_systemBudgetForBudgetKey:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CPLOverrideDataBudgetExpirationDate")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CPLOverrideEnergyBudgetExpirationDate")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CPLOverrideSignificantWorkBudgetExpirationDate")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CPLOverrideForegroundBudgetExpirationDate")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CPLOverrideLowDataModeBudgetExpirationDate")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CPLOverrideLowPowerModeBudgetExpirationDate")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CPLOverrideThermalModerateExpirationDate")) & 1) != 0)
  {
    v4 = 2048;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CPLOverrideAllOtherExpirationDate")))
  {
    v4 = 0x4000;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)isBudgetTypeSupportedForProgressiveOverriding:(unint64_t)a3 withReason:(unint64_t)a4
{
  BOOL result;

  if (a4)
    return 0;
  result = 1;
  if ((uint64_t)a3 > 2047)
  {
    if (a3 != 0x4000)
      return 0;
  }
  else if (a3 > 0x20 || ((1 << a3) & 0x100010006) == 0)
  {
    return 0;
  }
  return result;
}

+ (id)currentBudgetOverrideTimeIntervalStorageKeyForBudget:(unint64_t)a3
{
  void *v3;
  void *v4;

  +[_CPLScheduledOverride _expirationDateStorageKeyForBudget:](_CPLScheduledOverride, "_expirationDateStorageKeyForBudget:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-currentBudgetOverrideTimeInterval"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)currentBudgetOverrideTimeIntervalExpiryDateStorageKeyForBudget:(unint64_t)a3
{
  void *v3;
  void *v4;

  +[_CPLScheduledOverride _expirationDateStorageKeyForBudget:](_CPLScheduledOverride, "_expirationDateStorageKeyForBudget:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-currentBudgetOverrideTimeIntervalExpiryDate"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)budgetOverrideReasonStorageKeyForBudget:(unint64_t)a3
{
  void *v3;
  void *v4;

  +[_CPLScheduledOverride _expirationDateStorageKeyForBudget:](_CPLScheduledOverride, "_expirationDateStorageKeyForBudget:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-overrideReason"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_expirationDateStorageKeyForBudget:(unint64_t)a3
{
  id result;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((uint64_t)a3 > 15)
  {
    if ((uint64_t)a3 > 2047)
    {
      if (a3 == 2048)
        return CFSTR("CPLOverrideThermalModerateExpirationDate");
      if (a3 == 0x4000)
        return CFSTR("CPLOverrideAllOtherExpirationDate");
    }
    else
    {
      if (a3 == 16)
        return CFSTR("CPLOverrideLowDataModeBudgetExpirationDate");
      if (a3 == 32)
        return CFSTR("CPLOverrideLowPowerModeBudgetExpirationDate");
    }
LABEL_15:
    if (!_CPLSilentLogging)
    {
      __CPLSystemMonitorOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        +[CPLEngineSystemMonitor descriptionForBudget:](CPLEngineSystemMonitor, "descriptionForBudget:", a3);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 138543362;
        v8 = v6;
        _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_ERROR, "Unknown system budget %{public}@", (uint8_t *)&v7, 0xCu);

      }
    }
    return 0;
  }
  else
  {
    result = CFSTR("CPLOverrideDataBudgetExpirationDate");
    switch(a3)
    {
      case 1uLL:
        return result;
      case 2uLL:
        result = CFSTR("CPLOverrideEnergyBudgetExpirationDate");
        break;
      case 4uLL:
        result = CFSTR("CPLOverrideSignificantWorkBudgetExpirationDate");
        break;
      case 8uLL:
        result = CFSTR("CPLOverrideForegroundBudgetExpirationDate");
        break;
      default:
        goto LABEL_15;
    }
  }
  return result;
}

+ (double)nextTimeIntervalForOverridingBudget:(unint64_t)a3 withReason:(unint64_t)a4
{
  void *v5;
  double OverrideTimeIntervalFromSharedDefaults;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double result;
  void *v12;
  void *v13;
  double v14;
  double v15;

  if (objc_msgSend((id)objc_opt_class(), "isBudgetTypeSupportedForProgressiveOverriding:withReason:", a3, a4))
  {
    objc_msgSend((id)objc_opt_class(), "currentBudgetOverrideTimeIntervalStorageKeyForBudget:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    OverrideTimeIntervalFromSharedDefaults = _CPLSystemMonitorReadOverrideTimeIntervalFromSharedDefaults(v5);

    objc_msgSend((id)objc_opt_class(), "currentBudgetOverrideTimeIntervalExpiryDateStorageKeyForBudget:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _CPLSystemMonitorReadOverrideTimeIntervalExpiryDateFromSharedDefaults(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "nextTimeIntervalToUseGivenCurrent:expiryDate:", v8, OverrideTimeIntervalFromSharedDefaults);
    v10 = v9;

    return v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("CPLOverrideBudgetExpirationSeconds"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v14;

    result = 3600.0;
    if (v15 > 0.0)
      return v15;
  }
  return result;
}

@end

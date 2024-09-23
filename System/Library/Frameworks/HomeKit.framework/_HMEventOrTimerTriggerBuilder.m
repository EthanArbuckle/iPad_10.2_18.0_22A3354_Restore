@implementation _HMEventOrTimerTriggerBuilder

- (unint64_t)recurrenceDays
{
  os_unfair_lock_s *p_lock;
  unint64_t recurrenceDays;

  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  if (self->_recurrenceDays)
    recurrenceDays = self->_recurrenceDays;
  else
    recurrenceDays = 127;
  os_unfair_lock_unlock(p_lock);
  return recurrenceDays;
}

- (void)setRecurrenceDays:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  unint64_t v6;
  _HMEventOrTimerTriggerBuilder *v7;
  SEL v8;

  if (a3 - 128 <= 0xFFFFFFFFFFFFFF80)
  {
    v7 = (_HMEventOrTimerTriggerBuilder *)_HMFPreconditionFailureWithFormat();
    -[_HMEventOrTimerTriggerBuilder recurrences](v7, v8);
  }
  else
  {
    p_lock = &self->super.super._lock;
    os_unfair_lock_lock_with_options();
    if (a3 == 127)
      v6 = 0;
    else
      v6 = a3;
    self->_recurrenceDays = v6;
    os_unfair_lock_unlock(p_lock);
  }
}

- (NSArray)recurrences
{
  os_unfair_lock_s *p_lock;
  unint64_t recurrenceDays;
  void *v5;

  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  recurrenceDays = self->_recurrenceDays;
  if (recurrenceDays)
  {
    HMDaysOfTheWeekToDateComponents(recurrenceDays);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v5;
}

- (void)setRecurrences:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  _HMEventOrTimerTriggerBuilder *v7;
  SEL v8;
  id v9;
  id v10;
  BOOL v11;

  v4 = a3;
  v11 = 0;
  v5 = HMDaysOfTheWeekFromDateComponents(v4, &v11);
  if (v11)
  {
    v6 = v5;
    os_unfair_lock_lock_with_options();
    self->_recurrenceDays = v6;
    os_unfair_lock_unlock(&self->super.super._lock);

  }
  else
  {
    v7 = (_HMEventOrTimerTriggerBuilder *)_HMFPreconditionFailure();
    -[_HMEventOrTimerTriggerBuilder updateRecurrences:completionHandler:](v7, v8, v9, v10);
  }
}

- (void)updateRecurrences:(id)a3 completionHandler:(id)a4
{
  id v6;
  uint64_t v7;
  unint64_t v8;
  _HMContext *v9;
  void *v10;
  _HMContext *context;
  uint64_t v12;
  BOOL v13;

  v13 = 0;
  v6 = a4;
  v7 = HMDaysOfTheWeekFromDateComponents(a3, &v13);
  if (v13)
  {
    v8 = v7;
    os_unfair_lock_lock_with_options();
    self->_recurrenceDays = v8;
    os_unfair_lock_unlock(&self->super.super._lock);
    v9 = self->super.super._context;
    -[_HMContext delegateCaller](v9, "delegateCaller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "callCompletion:error:", v6, 0);
  }
  else
  {
    if (self)
      context = self->super.super._context;
    else
      context = 0;
    v9 = context;
    -[_HMContext delegateCaller](v9, "delegateCaller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "callCompletion:error:", v6, v12);

    v6 = (id)v12;
  }

}

@end

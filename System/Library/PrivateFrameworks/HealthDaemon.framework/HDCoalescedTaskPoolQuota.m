@implementation HDCoalescedTaskPoolQuota

- (HDCoalescedTaskPoolQuota)initWithAvailableQuota:(int64_t)a3 maximumQuota:(int64_t)a4 refillInterval:(double)a5 minimumInterval:(double)a6 lastTrigger:(double)a7
{
  HDCoalescedTaskPoolQuota *result;
  void *v15;
  void *v16;
  objc_super v17;

  if (a5 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCoalescedTaskPoolQuota.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("refillInterval > 0.0"));

  }
  if (a4 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCoalescedTaskPoolQuota.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("maximumQuota > 0"));

  }
  v17.receiver = self;
  v17.super_class = (Class)HDCoalescedTaskPoolQuota;
  result = -[HDCoalescedTaskPoolQuota init](&v17, sel_init);
  if (result)
  {
    result->_lock._os_unfair_lock_opaque = 0;
    result->_availableQuotaAfterLastTrigger = a3;
    result->_maximumQuota = a4;
    result->_quotaRefillInterval = a5;
    result->_minimumInterval = a6;
    result->_lastTrigger = a7;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HDCoalescedTaskPoolQuota initWithAvailableQuota:maximumQuota:refillInterval:minimumInterval:lastTrigger:]([HDCoalescedTaskPoolQuota alloc], "initWithAvailableQuota:maximumQuota:refillInterval:minimumInterval:lastTrigger:", self->_availableQuotaAfterLastTrigger, self->_maximumQuota, self->_quotaRefillInterval, self->_minimumInterval, self->_lastTrigger);
}

- (int64_t)availableQuota
{
  os_unfair_lock_s *p_lock;
  CFAbsoluteTime v4;
  double v5;
  int64_t availableQuotaAfterLastTrigger;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = CFAbsoluteTimeGetCurrent() - self->_lastTrigger;
  os_unfair_lock_unlock(p_lock);
  v5 = v4 / self->_quotaRefillInterval;
  availableQuotaAfterLastTrigger = self->_availableQuotaAfterLastTrigger;
  if (self->_maximumQuota >= ((uint64_t)v5 & ~((uint64_t)v5 >> 63)) + availableQuotaAfterLastTrigger)
    return ((uint64_t)v5 & ~((uint64_t)v5 >> 63)) + availableQuotaAfterLastTrigger;
  else
    return self->_maximumQuota;
}

- (void)consumeQuota
{
  os_unfair_lock_s *p_lock;
  double Current;
  double v5;
  int64_t maximumQuota;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  Current = CFAbsoluteTimeGetCurrent();
  v5 = (Current - self->_lastTrigger) / self->_quotaRefillInterval;
  self->_lastTrigger = Current;
  maximumQuota = self->_availableQuotaAfterLastTrigger + ((uint64_t)v5 & ~((uint64_t)v5 >> 63));
  if (self->_maximumQuota < maximumQuota)
    maximumQuota = self->_maximumQuota;
  if (maximumQuota <= 1)
    maximumQuota = 1;
  self->_availableQuotaAfterLastTrigger = maximumQuota - 1;
  os_unfair_lock_unlock(p_lock);
}

- (double)timeUntilNextAvailableTrigger
{
  os_unfair_lock_s *p_lock;
  double v4;
  double v5;
  double v6;
  double v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = CFAbsoluteTimeGetCurrent() - self->_lastTrigger;
  v5 = 0.0;
  if (self->_availableQuotaAfterLastTrigger <= 0)
    v5 = self->_quotaRefillInterval - v4;
  v6 = self->_minimumInterval - v4;
  os_unfair_lock_unlock(p_lock);
  if (v6 >= v5)
    v7 = v6;
  else
    v7 = v5;
  return fmax(v7, 0.0);
}

- (int64_t)maximumQuota
{
  return self->_maximumQuota;
}

- (double)quotaRefillInterval
{
  return self->_quotaRefillInterval;
}

- (double)minimumInterval
{
  return self->_minimumInterval;
}

- (double)lastTrigger
{
  return self->_lastTrigger;
}

@end

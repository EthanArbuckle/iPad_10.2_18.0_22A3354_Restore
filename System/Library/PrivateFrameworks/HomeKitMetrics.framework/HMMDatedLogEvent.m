@implementation HMMDatedLogEvent

- (HMMDatedLogEvent)init
{
  HMMDatedLogEvent *v2;
  uint64_t v3;
  NSDate *startDate;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMMDatedLogEvent;
  v2 = -[HMMLogEvent init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    startDate = v2->_startDate;
    v2->_startDate = (NSDate *)v3;

  }
  return v2;
}

- (void)markEndTime
{
  NSDate *v3;
  NSDate *endDate;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMMDatedLogEvent;
  -[HMMLogEvent markEndTime](&v5, sel_markEndTime);
  os_unfair_lock_lock_with_options();
  if (!self->_endDate)
  {
    HMMLogEventEndDateAfterStartDate(self->_startDate);
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
    endDate = self->_endDate;
    self->_endDate = v3;

  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSDate)endDate
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_endDate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
}

@end

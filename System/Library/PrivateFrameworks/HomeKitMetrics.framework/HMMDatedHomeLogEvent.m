@implementation HMMDatedHomeLogEvent

- (HMMDatedHomeLogEvent)initWithHomeUUID:(id)a3
{
  HMMDatedHomeLogEvent *v3;
  uint64_t v4;
  NSDate *startDate;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMMDatedHomeLogEvent;
  v3 = -[HMMHomeLogEvent initWithHomeUUID:](&v7, sel_initWithHomeUUID_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = objc_claimAutoreleasedReturnValue();
    startDate = v3->_startDate;
    v3->_startDate = (NSDate *)v4;

  }
  return v3;
}

- (HMMDatedHomeLogEvent)initWithStartTime:(double)a3 homeUUID:(id)a4
{
  HMMDatedHomeLogEvent *v4;
  uint64_t v5;
  NSDate *startDate;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMMDatedHomeLogEvent;
  v4 = -[HMMHomeLogEvent initWithStartTime:homeUUID:](&v8, sel_initWithStartTime_homeUUID_, a4, a3);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = objc_claimAutoreleasedReturnValue();
    startDate = v4->_startDate;
    v4->_startDate = (NSDate *)v5;

  }
  return v4;
}

- (void)markEndTime
{
  NSDate *v3;
  NSDate *endDate;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMMDatedHomeLogEvent;
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
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
}

@end

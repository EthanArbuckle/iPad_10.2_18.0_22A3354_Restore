@implementation HMMLogEvent

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)isSubmitted
{
  HMMLogEvent *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_submitted;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)markEndTime
{
  os_unfair_lock_s *p_lock;
  double v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_endTime == 0.0)
  {
    +[HMMLogEvent currentTime](HMMLogEvent, "currentTime");
    self->_endTime = v4;
  }
  os_unfair_lock_unlock(p_lock);
}

- (HMMLogEvent)init
{
  HMMLogEvent *v2;
  HMMLogEvent *v3;
  double v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMMLogEvent;
  v2 = -[HMMLogEvent init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_submitted = 0;
    +[HMMLogEvent currentTime](HMMLogEvent, "currentTime");
    v3->_startTime = v4;
  }
  return v3;
}

- (BOOL)shouldSubmit
{
  return 1;
}

- (HMMLogEvent)initWithStartTime:(double)a3
{
  HMMLogEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMMLogEvent;
  result = -[HMMLogEvent init](&v5, sel_init);
  if (result)
  {
    result->_submitted = 0;
    result->_startTime = a3;
  }
  return result;
}

- (BOOL)confirmSubmission
{
  os_unfair_lock_s *p_lock;
  BOOL v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = !self->_submitted;
  self->_submitted = 1;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (double)endTime
{
  os_unfair_lock_s *p_lock;
  double endTime;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  endTime = self->_endTime;
  os_unfair_lock_unlock(p_lock);
  return endTime;
}

- (double)duration
{
  double v3;
  double v4;
  double v5;

  -[HMMLogEvent endTime](self, "endTime");
  v4 = v3;
  -[HMMLogEvent startTime](self, "startTime");
  return v4 - v5;
}

- (int64_t)durationMilliseconds
{
  double v2;

  -[HMMLogEvent duration](self, "duration");
  return (uint64_t)(v2 * 1000.0);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (double)startTime
{
  return self->_startTime;
}

@end

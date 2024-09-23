@implementation AMSMediaTokenServiceThrottler

- (void)setBaseSleepInterval:(double)a3
{
  self->_baseSleepInterval = a3;
}

- (void)setMaxSleepInterval:(double)a3
{
  self->_maxSleepInterval = a3;
}

- (AMSMediaTokenServiceThrottler)initWithBaseSleepInterval:(double)a3 maxSleepInterval:(double)a4
{
  AMSMediaTokenServiceThrottler *v6;
  AMSMediaTokenServiceThrottler *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AMSMediaTokenServiceThrottler;
  v6 = -[AMSMediaTokenServiceThrottler init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_baseSleepInterval = a3;
    v6->_maxSleepInterval = a4;
    -[AMSMediaTokenServiceThrottler reset](v6, "reset");
  }
  return v7;
}

- (void)setAttemptNumber:(unint64_t)a3
{
  self->_attemptNumber = a3;
}

- (void)reset
{
  -[AMSMediaTokenServiceThrottler setThrottleDate:](self, "setThrottleDate:", 0);
  -[AMSMediaTokenServiceThrottler setAttemptNumber:](self, "setAttemptNumber:", 0);
}

- (void)setThrottleDate:(id)a3
{
  objc_storeStrong((id *)&self->_throttleDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttleDate, 0);
}

- (void)throttle
{
  double v3;
  void *v4;

  -[AMSMediaTokenServiceThrottler _calculateThrottleInterval](self, "_calculateThrottleInterval");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", v3);
  -[AMSMediaTokenServiceThrottler setThrottleDate:](self, "setThrottleDate:", v4);

  -[AMSMediaTokenServiceThrottler setAttemptNumber:](self, "setAttemptNumber:", -[AMSMediaTokenServiceThrottler attemptNumber](self, "attemptNumber") + 1);
}

- (NSDate)throttleDate
{
  return self->_throttleDate;
}

- (BOOL)shouldThrottle
{
  void *v2;
  double v3;
  BOOL v4;

  -[AMSMediaTokenServiceThrottler throttleDate](self, "throttleDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceNow");
  v4 = v3 > 0.0;

  return v4;
}

- (double)maxSleepInterval
{
  return self->_maxSleepInterval;
}

- (double)baseSleepInterval
{
  return self->_baseSleepInterval;
}

- (unint64_t)attemptNumber
{
  return self->_attemptNumber;
}

- (double)_calculateThrottleInterval
{
  double v3;
  double v4;
  double v5;
  double v6;

  v3 = (double)-[AMSMediaTokenServiceThrottler attemptNumber](self, "attemptNumber");
  -[AMSMediaTokenServiceThrottler baseSleepInterval](self, "baseSleepInterval");
  v5 = exp2(v4 * v3);
  -[AMSMediaTokenServiceThrottler maxSleepInterval](self, "maxSleepInterval");
  if (v5 < v6)
    v6 = v5;
  return (double)arc4random_uniform(v6);
}

@end

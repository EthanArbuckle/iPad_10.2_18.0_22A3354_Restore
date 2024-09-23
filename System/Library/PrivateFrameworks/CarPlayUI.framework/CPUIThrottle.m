@implementation CPUIThrottle

- (CPUIThrottle)initWithBase:(double)a3
{
  return -[CPUIThrottle initWithBase:factor:max:](self, "initWithBase:factor:max:", a3, 2.0, a3 * 10.0);
}

- (CPUIThrottle)initWithBase:(double)a3 factor:(double)a4 max:(double)a5
{
  CPUIThrottle *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CPUIThrottle;
  result = -[CPUIThrottle init](&v9, sel_init);
  if (result)
  {
    result->_base = a3;
    result->_factor = a4;
    result->_max = a5;
    result->_attempts = 0;
  }
  return result;
}

- (BOOL)isThrottled
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[CPUIThrottle unthrottleDate](self, "unthrottleDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIThrottle unthrottleDate](self, "unthrottleDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5) == -1;

  return v6;
}

- (void)unthrottle
{
  NSDate *throttleDate;
  NSDate *unthrottleDate;

  throttleDate = self->_throttleDate;
  self->_throttleDate = 0;
  self->_attempts = 0;

  unthrottleDate = self->_unthrottleDate;
  self->_unthrottleDate = 0;

}

- (BOOL)incrementAttempts
{
  unint64_t v3;
  double base;
  double v5;
  _BOOL4 v6;
  NSDate *v7;
  NSDate *throttleDate;
  NSDate *v9;
  NSDate *unthrottleDate;

  v3 = self->_attempts + 1;
  self->_attempts = v3;
  base = self->_base;
  v5 = base * pow(self->_factor, (double)v3);
  if (v5 >= base)
  {
    base = v5;
    if (v5 > self->_max)
      base = self->_max;
  }
  v6 = -[CPUIThrottle isThrottled](self, "isThrottled");
  if (!v6)
  {
    self->_attempts = 1;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
    throttleDate = self->_throttleDate;
    self->_throttleDate = v7;

  }
  -[NSDate dateByAddingTimeInterval:](self->_throttleDate, "dateByAddingTimeInterval:", base);
  v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
  unthrottleDate = self->_unthrottleDate;
  self->_unthrottleDate = v9;

  return !v6;
}

- (NSDate)unthrottleDate
{
  return self->_unthrottleDate;
}

- (NSDate)throttleDate
{
  return self->_throttleDate;
}

- (unint64_t)attempts
{
  return self->_attempts;
}

- (double)base
{
  return self->_base;
}

- (double)factor
{
  return self->_factor;
}

- (double)max
{
  return self->_max;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttleDate, 0);
  objc_storeStrong((id *)&self->_unthrottleDate, 0);
}

@end

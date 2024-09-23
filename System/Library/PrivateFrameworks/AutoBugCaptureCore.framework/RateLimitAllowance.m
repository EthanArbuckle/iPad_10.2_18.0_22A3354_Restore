@implementation RateLimitAllowance

- (NSDate)lastCheckedAt
{
  return self->_lastCheckedAt;
}

- (void)setLastCheckedAt:(id)a3
{
  objc_storeStrong((id *)&self->_lastCheckedAt, a3);
}

- (double)allowance
{
  return self->_allowance;
}

- (void)setAllowance:(double)a3
{
  self->_allowance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCheckedAt, 0);
}

@end

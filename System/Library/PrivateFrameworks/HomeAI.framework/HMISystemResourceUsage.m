@implementation HMISystemResourceUsage

- (HMISystemResourceUsage)init
{
  HMISystemResourceUsage *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMISystemResourceUsage;
  result = -[HMISystemResourceUsage init](&v3, sel_init);
  if (result)
    result->_systemResourceUsageLevel = 0;
  return result;
}

- (int64_t)systemResourceUsageLevel
{
  return self->_systemResourceUsageLevel;
}

- (void)setSystemResourceUsageLevel:(int64_t)a3
{
  self->_systemResourceUsageLevel = a3;
}

@end

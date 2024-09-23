@implementation DTSysmonCPUUsageEntry

- (DTSysmonCPUUsageEntry)initWithTotal:(double)a3 user:(double)a4 system:(double)a5 nice:(double)a6
{
  DTSysmonCPUUsageEntry *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DTSysmonCPUUsageEntry;
  result = -[DTSysmonCPUUsageEntry init](&v11, sel_init);
  if (result)
  {
    result->_totalLoad = a3;
    result->_userLoad = a4;
    result->_systemLoad = a5;
    result->_niceLoad = a6;
  }
  return result;
}

- (double)totalLoad
{
  return self->_totalLoad;
}

- (void)setTotalLoad:(double)a3
{
  self->_totalLoad = a3;
}

- (double)userLoad
{
  return self->_userLoad;
}

- (void)setUserLoad:(double)a3
{
  self->_userLoad = a3;
}

- (double)systemLoad
{
  return self->_systemLoad;
}

- (void)setSystemLoad:(double)a3
{
  self->_systemLoad = a3;
}

- (double)niceLoad
{
  return self->_niceLoad;
}

- (void)setNiceLoad:(double)a3
{
  self->_niceLoad = a3;
}

@end

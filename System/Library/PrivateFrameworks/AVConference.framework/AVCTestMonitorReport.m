@implementation AVCTestMonitorReport

- (unint64_t)initialMemoryUsageMB
{
  return self->_initialMemoryUsageMB;
}

- (void)setInitialMemoryUsageMB:(unint64_t)a3
{
  self->_initialMemoryUsageMB = a3;
}

- (unint64_t)memoryUsageMB
{
  return self->_memoryUsageMB;
}

- (void)setMemoryUsageMB:(unint64_t)a3
{
  self->_memoryUsageMB = a3;
}

- (unint64_t)networkAgentRefCount
{
  return self->_networkAgentRefCount;
}

- (void)setNetworkAgentRefCount:(unint64_t)a3
{
  self->_networkAgentRefCount = a3;
}

@end

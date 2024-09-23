@implementation CPLSchedulerOSLogDomain

void ____CPLSchedulerOSLogDomain_block_invoke()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.scheduler.session");
  v1 = (void *)__CPLSchedulerOSLogDomain_result;
  __CPLSchedulerOSLogDomain_result = (uint64_t)v0;

}

void ____CPLSchedulerOSLogDomain_block_invoke_6448()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.scheduler");
  v1 = (void *)__CPLSchedulerOSLogDomain_result_6447;
  __CPLSchedulerOSLogDomain_result_6447 = (uint64_t)v0;

}

@end

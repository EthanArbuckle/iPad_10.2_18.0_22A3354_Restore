@implementation CPLCheckOSLogDomain

void ____CPLCheckOSLogDomain_block_invoke()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.sync.pushtotransport.check");
  v1 = (void *)__CPLCheckOSLogDomain_result;
  __CPLCheckOSLogDomain_result = (uint64_t)v0;

}

@end

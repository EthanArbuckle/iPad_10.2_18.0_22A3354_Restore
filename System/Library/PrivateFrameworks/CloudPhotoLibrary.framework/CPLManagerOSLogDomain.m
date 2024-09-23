@implementation CPLManagerOSLogDomain

void ____CPLManagerOSLogDomain_block_invoke()
{
  const char *v0;
  os_log_t v1;
  void *v2;

  v0 = _CPLOSLogSubsystem();
  v1 = os_log_create(v0, "client.librarymanager.proxy");
  v2 = (void *)__CPLManagerOSLogDomain_result;
  __CPLManagerOSLogDomain_result = (uint64_t)v1;

}

void ____CPLManagerOSLogDomain_block_invoke_0()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "client.librarymanager");
  v1 = (void *)__CPLManagerOSLogDomain_result_0;
  __CPLManagerOSLogDomain_result_0 = (uint64_t)v0;

}

@end

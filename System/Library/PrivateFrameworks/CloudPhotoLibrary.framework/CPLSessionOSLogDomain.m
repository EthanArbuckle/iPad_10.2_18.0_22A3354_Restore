@implementation CPLSessionOSLogDomain

void ____CPLSessionOSLogDomain_block_invoke()
{
  const char *v0;
  os_log_t v1;
  void *v2;

  v0 = _CPLOSLogSubsystem();
  v1 = os_log_create(v0, "client.session.proxy");
  v2 = (void *)__CPLSessionOSLogDomain_result;
  __CPLSessionOSLogDomain_result = (uint64_t)v1;

}

void ____CPLSessionOSLogDomain_block_invoke_0()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "client.session.pull");
  v1 = (void *)__CPLSessionOSLogDomain_result_0;
  __CPLSessionOSLogDomain_result_0 = (uint64_t)v0;

}

void ____CPLSessionOSLogDomain_block_invoke_14179()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "client.session.push.compute");
  v1 = (void *)__CPLSessionOSLogDomain_result_14178;
  __CPLSessionOSLogDomain_result_14178 = (uint64_t)v0;

}

void ____CPLSessionOSLogDomain_block_invoke_15871()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "client.session.push");
  v1 = (void *)__CPLSessionOSLogDomain_result_15870;
  __CPLSessionOSLogDomain_result_15870 = (uint64_t)v0;

}

void ____CPLSessionOSLogDomain_block_invoke_19962()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "client.session");
  v1 = (void *)__CPLSessionOSLogDomain_result_19961;
  __CPLSessionOSLogDomain_result_19961 = (uint64_t)v0;

}

@end

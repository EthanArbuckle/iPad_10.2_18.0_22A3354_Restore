@implementation CPLForceSyncOSLogDomain

void ____CPLForceSyncOSLogDomain_block_invoke()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.syncmanager.forcesync.task");
  v1 = (void *)__CPLForceSyncOSLogDomain_result;
  __CPLForceSyncOSLogDomain_result = (uint64_t)v0;

}

void ____CPLForceSyncOSLogDomain_block_invoke_18282()
{
  os_log_t v0;
  void *v1;

  if (_CPLOSLogSubsystem_onceToken != -1)
    dispatch_once(&_CPLOSLogSubsystem_onceToken, &__block_literal_global_27);
  v0 = os_log_create("com.apple.photos.cpl", "engine.syncmanager.forcesync");
  v1 = (void *)__CPLForceSyncOSLogDomain_result_18281;
  __CPLForceSyncOSLogDomain_result_18281 = (uint64_t)v0;

}

@end

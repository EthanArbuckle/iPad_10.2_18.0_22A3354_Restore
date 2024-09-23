@implementation EKTravelEngineLogInitialize

void __EKTravelEngineLogInitialize_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = os_log_create("com.apple.calendar", "store.log.travel.engine");
  v1 = (void *)EKTravelEngineLogHandle;
  EKTravelEngineLogHandle = (uint64_t)v0;

  v2 = os_log_create("com.apple.calendar", "store.log.travel.engine.throttle");
  v3 = (void *)EKTravelEngineThrottleLogHandle;
  EKTravelEngineThrottleLogHandle = (uint64_t)v2;

}

@end

@implementation HearingInitializeLogging

void __HearingInitializeLogging_block_invoke()
{
  os_log_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = os_log_create("com.apple.Hearing", "Hearing");
  v1 = (void *)HearingEngineeringLog;
  HearingEngineeringLog = (uint64_t)v0;

  v2 = dispatch_queue_create("HearingLoggingQueue", 0);
  v3 = (void *)HearingLoggingQueue;
  HearingLoggingQueue = (uint64_t)v2;

}

@end

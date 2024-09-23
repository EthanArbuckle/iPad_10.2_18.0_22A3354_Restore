@implementation HCHPInitializeLogging

void __HCHPInitializeLogging_block_invoke()
{
  os_log_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = os_log_create("com.apple.Hearing", "HearingProtection");
  v1 = (void *)HCHPEngineeringLog;
  HCHPEngineeringLog = (uint64_t)v0;

  v2 = dispatch_queue_create("HCHPLoggingQueue", 0);
  v3 = (void *)HCHPLoggingQueue;
  HCHPLoggingQueue = (uint64_t)v2;

}

@end

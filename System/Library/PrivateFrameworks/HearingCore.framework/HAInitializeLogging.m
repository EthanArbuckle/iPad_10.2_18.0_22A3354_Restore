@implementation HAInitializeLogging

void __HAInitializeLogging_block_invoke()
{
  os_log_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = os_log_create("com.apple.Hearing", "HearingAids");
  v1 = (void *)HAEngineeringLog;
  HAEngineeringLog = (uint64_t)v0;

  v2 = dispatch_queue_create("HALoggingQueue", 0);
  v3 = (void *)HALoggingQueue;
  HALoggingQueue = (uint64_t)v2;

}

@end

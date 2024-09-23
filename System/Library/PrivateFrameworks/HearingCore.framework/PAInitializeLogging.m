@implementation PAInitializeLogging

void __PAInitializeLogging_block_invoke()
{
  os_log_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = os_log_create("com.apple.Hearing", "AudioAccommodations");
  v1 = (void *)PAEngineeringLog;
  PAEngineeringLog = (uint64_t)v0;

  v2 = dispatch_queue_create("PALoggingQueue", 0);
  v3 = (void *)PALoggingQueue;
  PALoggingQueue = (uint64_t)v2;

}

@end

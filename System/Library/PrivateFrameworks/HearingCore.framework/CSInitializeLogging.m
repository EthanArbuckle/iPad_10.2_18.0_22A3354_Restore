@implementation CSInitializeLogging

void __CSInitializeLogging_block_invoke()
{
  os_log_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = os_log_create("com.apple.Hearing", "ComfortSounds");
  v1 = (void *)CSEngineeringLog;
  CSEngineeringLog = (uint64_t)v0;

  v2 = dispatch_queue_create("CSLoggingQueue", 0);
  v3 = (void *)CSLoggingQueue;
  CSLoggingQueue = (uint64_t)v2;

}

@end

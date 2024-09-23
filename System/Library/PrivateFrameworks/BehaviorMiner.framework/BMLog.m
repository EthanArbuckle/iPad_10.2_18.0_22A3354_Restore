@implementation BMLog

void __BMLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BehaviorMiner", "general");
  v1 = (void *)BMLog_log;
  BMLog_log = (uint64_t)v0;

}

@end

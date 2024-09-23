@implementation BSServiceXPCBatchLog

void __BSServiceXPCBatchLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BoardServices", "XPCBatch");
  v1 = (void *)BSServiceXPCBatchLog___logObj;
  BSServiceXPCBatchLog___logObj = (uint64_t)v0;

}

@end

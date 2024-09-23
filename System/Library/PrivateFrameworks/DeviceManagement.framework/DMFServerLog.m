@implementation DMFServerLog

void __DMFServerLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.dmd", "Server");
  v1 = (void *)DMFServerLog_log;
  DMFServerLog_log = (uint64_t)v0;

}

@end

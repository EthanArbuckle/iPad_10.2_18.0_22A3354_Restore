@implementation LCSLogSandboxing

void __LCSLogSandboxing_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LockedContentServices", "Sandboxing");
  v1 = (void *)LCSLogSandboxing___logObj;
  LCSLogSandboxing___logObj = (uint64_t)v0;

}

@end

@implementation DIV

void __DIV_LOG_KEXT_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.CoreIDV.telemetry", "kextCall");
  v1 = (void *)DIV_LOG_KEXT_log;
  DIV_LOG_KEXT_log = (uint64_t)v0;

}

@end

@implementation LogCategory

void __LogCategory_Daemon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.fmfd", "_");
  v1 = (void *)LogCategory_Daemon_log;
  LogCategory_Daemon_log = (uint64_t)v0;

}

void __LogCategory_FMFMapXPC_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.icloud.fmfd", "FMFMapXPC");
  v1 = (void *)LogCategory_FMFMapXPC_log;
  LogCategory_FMFMapXPC_log = (uint64_t)v0;

}

@end

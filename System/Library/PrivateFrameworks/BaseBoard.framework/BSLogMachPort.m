@implementation BSLogMachPort

void __BSLogMachPort_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BaseBoard", "MachPort");
  v1 = (void *)BSLogMachPort___logObj;
  BSLogMachPort___logObj = (uint64_t)v0;

}

@end

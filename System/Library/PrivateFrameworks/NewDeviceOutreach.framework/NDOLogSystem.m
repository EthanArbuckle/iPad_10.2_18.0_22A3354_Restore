@implementation NDOLogSystem

void ___NDOLogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.NewDeviceOutreach", "core");
  v1 = (void *)_NDOLogSystem_log;
  _NDOLogSystem_log = (uint64_t)v0;

}

@end

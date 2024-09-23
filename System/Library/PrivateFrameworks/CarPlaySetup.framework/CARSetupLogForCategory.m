@implementation CARSetupLogForCategory

void __CARSetupLogForCategory_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.carplaysetup", "Default");
  v1 = (void *)CARSetupLogForCategory_logObjects_0;
  CARSetupLogForCategory_logObjects_0 = (uint64_t)v0;

}

@end

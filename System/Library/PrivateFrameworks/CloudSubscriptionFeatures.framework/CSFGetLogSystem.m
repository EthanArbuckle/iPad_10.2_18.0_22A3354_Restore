@implementation CSFGetLogSystem

void ___CSFGetLogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.CloudSubscriptionFeatures", "objc");
  v1 = (void *)_CSFGetLogSystem_log;
  _CSFGetLogSystem_log = (uint64_t)v0;

}

@end

@implementation DNDSSysdiagnoseDataProviders

void ___DNDSSysdiagnoseDataProviders_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  _sysdiagnoseInProgress = 0;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.donotdisturb.sysdiagnose.statehandler", v0);
  v2 = (void *)_sysdiagnoseQueue;
  _sysdiagnoseQueue = (uint64_t)v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_DNDSSysdiagnoseDataProviders_sysdiagnoseDataProviders;
  _DNDSSysdiagnoseDataProviders_sysdiagnoseDataProviders = v3;

}

@end

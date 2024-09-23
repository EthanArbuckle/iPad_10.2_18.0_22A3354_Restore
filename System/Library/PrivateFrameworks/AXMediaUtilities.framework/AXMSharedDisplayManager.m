@implementation AXMSharedDisplayManager

void __AXMSharedDisplayManager_block_invoke()
{
  id v0;
  void *v1;

  v0 = -[AXMDisplayManager initAndWaitForMainDisplayConfiguration]([AXMDisplayManager alloc], "initAndWaitForMainDisplayConfiguration");
  v1 = (void *)AXMSharedDisplayManager_DisplayManager;
  AXMSharedDisplayManager_DisplayManager = (uint64_t)v0;

}

@end

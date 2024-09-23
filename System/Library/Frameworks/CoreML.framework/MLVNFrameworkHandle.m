@implementation MLVNFrameworkHandle

void __36___MLVNFrameworkHandle_sharedHandle__block_invoke()
{
  _MLVNFrameworkHandle *v0;
  void *v1;

  v0 = objc_alloc_init(_MLVNFrameworkHandle);
  v1 = (void *)sharedHandle_singleton_9014;
  sharedHandle_singleton_9014 = (uint64_t)v0;

}

@end

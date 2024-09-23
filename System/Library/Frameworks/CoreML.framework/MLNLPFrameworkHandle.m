@implementation MLNLPFrameworkHandle

void __37___MLNLPFrameworkHandle_sharedHandle__block_invoke()
{
  _MLNLPFrameworkHandle *v0;
  void *v1;

  v0 = objc_alloc_init(_MLNLPFrameworkHandle);
  v1 = (void *)sharedHandle_singleton_21104;
  sharedHandle_singleton_21104 = (uint64_t)v0;

}

@end

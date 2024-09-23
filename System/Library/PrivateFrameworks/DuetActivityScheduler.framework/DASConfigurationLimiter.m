@implementation DASConfigurationLimiter

void __41___DASConfigurationLimiter_sharedLimiter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedLimiter_limitation_0;
  sharedLimiter_limitation_0 = (uint64_t)v0;

}

@end

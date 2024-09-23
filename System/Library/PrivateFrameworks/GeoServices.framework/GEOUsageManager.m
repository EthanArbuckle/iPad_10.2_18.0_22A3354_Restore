@implementation GEOUsageManager

+ (id)sharedManager
{
  if (qword_1ECDBC0F0 != -1)
    dispatch_once(&qword_1ECDBC0F0, &__block_literal_global_98);
  return (id)_MergedGlobals_245;
}

void __32__GEOUsageManager_sharedManager__block_invoke()
{
  GEOUsageManager *v0;
  void *v1;

  v0 = objc_alloc_init(GEOUsageManager);
  v1 = (void *)_MergedGlobals_245;
  _MergedGlobals_245 = (uint64_t)v0;

}

@end

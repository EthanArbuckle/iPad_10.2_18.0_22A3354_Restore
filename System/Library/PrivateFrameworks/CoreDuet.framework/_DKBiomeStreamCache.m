@implementation _DKBiomeStreamCache

+ (id)sharedCache
{
  if (sharedCache_onceToken_0 != -1)
    dispatch_once(&sharedCache_onceToken_0, &__block_literal_global_14);
  return (id)sharedCache_cache;
}

@end

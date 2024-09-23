@implementation C3DResourceCacheGetSharedInstance

uint64_t __C3DResourceCacheGetSharedInstance_block_invoke()
{
  uint64_t result;

  result = C3DResourceCacheCreate();
  _sharedInstance = result;
  return result;
}

@end

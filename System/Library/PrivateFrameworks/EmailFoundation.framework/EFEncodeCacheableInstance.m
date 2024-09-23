@implementation EFEncodeCacheableInstance

uint64_t __EFEncodeCacheableInstance_block_invoke()
{
  uint64_t result;

  result = getpid();
  EFEncodeCacheableInstance_sInstanceID = (unint64_t)__rbit32(result) << 32;
  return result;
}

@end

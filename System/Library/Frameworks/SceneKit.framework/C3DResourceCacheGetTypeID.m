@implementation C3DResourceCacheGetTypeID

uint64_t __C3DResourceCacheGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DResourceCacheGetTypeID_typeID = result;
  return result;
}

@end

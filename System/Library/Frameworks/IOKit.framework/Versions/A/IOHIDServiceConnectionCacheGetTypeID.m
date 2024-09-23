@implementation IOHIDServiceConnectionCacheGetTypeID

uint64_t __IOHIDServiceConnectionCacheGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __serviceConnectionCacheTypeID = result;
  return result;
}

@end

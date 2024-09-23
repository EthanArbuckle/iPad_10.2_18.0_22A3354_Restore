@implementation IOHIDServiceClientCreate

CFSetRef ___IOHIDServiceClientCreate_block_invoke()
{
  CFSetRef result;

  result = CFSetCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)_servicePropertyCacheKeys, 15, MEMORY[0x1E0C9B3B0]);
  __serviceKeysSet = (uint64_t)result;
  return result;
}

@end

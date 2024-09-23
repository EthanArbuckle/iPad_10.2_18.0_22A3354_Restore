@implementation C3DAllocatorGetTypeID

uint64_t __C3DAllocatorGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DAllocatorGetTypeID_typeID = result;
  return result;
}

@end

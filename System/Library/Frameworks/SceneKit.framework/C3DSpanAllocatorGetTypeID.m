@implementation C3DSpanAllocatorGetTypeID

uint64_t __C3DSpanAllocatorGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DSpanAllocatorGetTypeID_typeID = result;
  return result;
}

@end

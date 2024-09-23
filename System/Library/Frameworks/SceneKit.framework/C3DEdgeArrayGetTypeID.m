@implementation C3DEdgeArrayGetTypeID

uint64_t __C3DEdgeArrayGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DEdgeArrayGetTypeID_typeID = result;
  return result;
}

@end

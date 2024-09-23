@implementation C3DArrayGetTypeID

uint64_t __C3DArrayGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DArrayGetTypeID_typeID = result;
  return result;
}

@end

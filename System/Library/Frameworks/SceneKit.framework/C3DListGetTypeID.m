@implementation C3DListGetTypeID

uint64_t __C3DListGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DListGetTypeID_typeID = result;
  return result;
}

@end

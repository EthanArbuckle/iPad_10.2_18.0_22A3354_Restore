@implementation C3DIndexSetGetTypeID

uint64_t __C3DIndexSetGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DIndexSetGetTypeID_typeID = result;
  return result;
}

@end

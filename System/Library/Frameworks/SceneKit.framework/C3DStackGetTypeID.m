@implementation C3DStackGetTypeID

uint64_t __C3DStackGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DStackGetTypeID_typeID = result;
  return result;
}

@end

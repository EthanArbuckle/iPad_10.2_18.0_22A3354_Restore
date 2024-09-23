@implementation C3DShapeGetTypeID

uint64_t __C3DShapeGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DShapeGetTypeID_typeID = result;
  return result;
}

@end

@implementation C3DDeformerStackGetTypeID

uint64_t __C3DDeformerStackGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DDeformerStackGetTypeID_typeID = result;
  return result;
}

@end

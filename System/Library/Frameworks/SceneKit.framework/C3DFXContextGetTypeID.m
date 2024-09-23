@implementation C3DFXContextGetTypeID

uint64_t __C3DFXContextGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DFXContextGetTypeID_typeID = result;
  return result;
}

@end

@implementation C3DLightingSystemGetTypeID

uint64_t __C3DLightingSystemGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DLightingSystemGetTypeID_typeID = result;
  return result;
}

@end

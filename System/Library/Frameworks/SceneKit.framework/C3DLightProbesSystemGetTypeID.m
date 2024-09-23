@implementation C3DLightProbesSystemGetTypeID

uint64_t __C3DLightProbesSystemGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DLightProbesSystemGetTypeID_typeID = result;
  return result;
}

@end

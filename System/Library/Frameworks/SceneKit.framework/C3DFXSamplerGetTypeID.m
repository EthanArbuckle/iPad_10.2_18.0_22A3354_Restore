@implementation C3DFXSamplerGetTypeID

uint64_t __C3DFXSamplerGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DFXSamplerGetTypeID_typeID = result;
  qword_1F03BF300 = (uint64_t)_C3DFXSamplerCopyInstanceVariables;
  return result;
}

@end

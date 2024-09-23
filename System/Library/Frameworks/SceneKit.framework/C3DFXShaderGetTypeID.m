@implementation C3DFXShaderGetTypeID

uint64_t __C3DFXShaderGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DFXShaderGetTypeID_typeID = result;
  qword_1F03BF3E8 = (uint64_t)_C3DFXShaderCopyInstanceVariables;
  return result;
}

@end

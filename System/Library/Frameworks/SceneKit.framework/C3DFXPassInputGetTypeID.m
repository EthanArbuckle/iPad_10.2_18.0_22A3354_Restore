@implementation C3DFXPassInputGetTypeID

uint64_t __C3DFXPassInputGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DFXPassInputGetTypeID_typeID = result;
  qword_1F03BF218 = (uint64_t)_C3DFXPassInputCopyInstanceVariables;
  return result;
}

@end

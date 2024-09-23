@implementation C3DFXMetalProgramGetTypeID

uint64_t __C3DFXMetalProgramGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DFXMetalProgramGetTypeID_typeID = result;
  qword_1F03C0098 = (uint64_t)_C3DFXMetalProgramCopyInstanceVariables;
  return result;
}

@end

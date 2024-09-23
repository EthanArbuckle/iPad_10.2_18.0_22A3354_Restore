@implementation C3DFXGLSLProgramGetTypeID

uint64_t __C3DFXGLSLProgramGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DFXGLSLProgramGetTypeID_typeID = result;
  qword_1F03BFFB0 = (uint64_t)_C3DFXGLSLProgramCopyInstanceVariables;
  return result;
}

@end

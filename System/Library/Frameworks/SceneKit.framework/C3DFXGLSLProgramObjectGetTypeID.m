@implementation C3DFXGLSLProgramObjectGetTypeID

uint64_t __C3DFXGLSLProgramObjectGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DFXGLSLProgramObjectGetTypeID_typeID = result;
  return result;
}

@end

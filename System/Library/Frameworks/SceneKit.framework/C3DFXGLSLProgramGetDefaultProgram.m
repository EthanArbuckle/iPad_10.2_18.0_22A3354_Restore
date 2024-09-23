@implementation C3DFXGLSLProgramGetDefaultProgram

void __C3DFXGLSLProgramGetDefaultProgram_block_invoke()
{
  C3DFXGLSLProgramGetDefaultProgram_defaultProgram = _C3DFXGLSLProgramCreateProgramWithName(CFSTR("C3D-DefaultProgram"), 0);
  C3DFXGLSLProgramSetUniformIndex((CFMutableDictionaryRef *)C3DFXGLSLProgramGetDefaultProgram_defaultProgram, CFSTR("u_modelViewProjectionTransform"), (char *)7);
}

@end

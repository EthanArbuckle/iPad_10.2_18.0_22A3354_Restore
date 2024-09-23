@implementation C3DFXTechniqueGetTypeID

uint64_t __C3DFXTechniqueGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DFXTechniqueGetTypeID_typeID = result;
  qword_1F03C0180 = (uint64_t)_C3DFXTechniqueCopyInstanceVariables;
  return result;
}

@end

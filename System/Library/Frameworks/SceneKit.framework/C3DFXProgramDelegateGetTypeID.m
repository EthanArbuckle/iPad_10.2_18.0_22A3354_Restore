@implementation C3DFXProgramDelegateGetTypeID

uint64_t __C3DFXProgramDelegateGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DFXProgramDelegateGetTypeID_typeID = result;
  return result;
}

@end

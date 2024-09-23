@implementation C3DProgramHashCodeGetTypeID

uint64_t __C3DProgramHashCodeGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DProgramHashCodeGetTypeID_typeID = result;
  return result;
}

@end

@implementation C3DFXPassGetTypeID

uint64_t __C3DFXPassGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DFXPassGetTypeID_typeID = result;
  qword_1F03BF130 = (uint64_t)_C3DFXPassCopyInstanceVariables;
  return result;
}

@end

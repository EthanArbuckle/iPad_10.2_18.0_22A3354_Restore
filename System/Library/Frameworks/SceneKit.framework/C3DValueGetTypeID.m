@implementation C3DValueGetTypeID

uint64_t __C3DValueGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DValueGetTypeID_typeID = result;
  qword_1F03C1AE0 = (uint64_t)_C3DValueCopyInstanceVariables;
  return result;
}

@end

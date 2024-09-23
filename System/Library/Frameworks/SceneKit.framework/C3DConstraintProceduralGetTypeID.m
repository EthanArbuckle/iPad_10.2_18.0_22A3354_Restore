@implementation C3DConstraintProceduralGetTypeID

uint64_t __C3DConstraintProceduralGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DConstraintProceduralGetTypeID_typeID = result;
  return result;
}

@end

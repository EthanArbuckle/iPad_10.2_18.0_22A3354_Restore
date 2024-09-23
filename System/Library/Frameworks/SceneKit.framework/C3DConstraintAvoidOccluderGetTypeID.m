@implementation C3DConstraintAvoidOccluderGetTypeID

uint64_t __C3DConstraintAvoidOccluderGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DConstraintAvoidOccluderGetTypeID::typeID = result;
  return result;
}

@end

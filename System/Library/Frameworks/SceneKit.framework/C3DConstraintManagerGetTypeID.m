@implementation C3DConstraintManagerGetTypeID

uint64_t __C3DConstraintManagerGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DConstraintManagerGetTypeID_typeID = result;
  return result;
}

@end

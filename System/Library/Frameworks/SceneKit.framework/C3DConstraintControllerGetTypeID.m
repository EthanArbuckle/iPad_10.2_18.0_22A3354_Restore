@implementation C3DConstraintControllerGetTypeID

uint64_t __C3DConstraintControllerGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DConstraintControllerGetTypeID_typeID = result;
  return result;
}

@end

@implementation C3DConstraintSliderGetTypeID

uint64_t __C3DConstraintSliderGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DConstraintSliderGetTypeID::typeID = result;
  return result;
}

@end

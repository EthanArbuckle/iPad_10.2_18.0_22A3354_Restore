@implementation FigTransformUtilityGetTypeID

uint64_t __FigTransformUtilityGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  FigTransformUtilityGetTypeID_sTypeID = result;
  return result;
}

@end

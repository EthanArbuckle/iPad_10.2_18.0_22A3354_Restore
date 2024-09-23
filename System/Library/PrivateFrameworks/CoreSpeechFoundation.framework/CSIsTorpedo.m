@implementation CSIsTorpedo

uint64_t __CSIsTorpedo_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  CSIsTorpedo_isTorpedo = result;
  return result;
}

@end

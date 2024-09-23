@implementation CADeviceSupportsDCP

uint64_t __CADeviceSupportsDCP_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  CADeviceSupportsDCP::has_dcp = result;
  return result;
}

@end

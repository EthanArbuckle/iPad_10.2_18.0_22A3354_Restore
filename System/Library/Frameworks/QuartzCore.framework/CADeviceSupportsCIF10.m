@implementation CADeviceSupportsCIF10

uint64_t __CADeviceSupportsCIF10_block_invoke()
{
  uint64_t result;

  result = MGGetSInt64Answer();
  if (result)
    CADeviceSupportsCIF10::supports_cif10 = result != 28672;
  return result;
}

@end

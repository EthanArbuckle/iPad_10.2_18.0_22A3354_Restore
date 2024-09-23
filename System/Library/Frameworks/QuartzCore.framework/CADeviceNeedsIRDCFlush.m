@implementation CADeviceNeedsIRDCFlush

uint64_t __CADeviceNeedsIRDCFlush_block_invoke()
{
  uint64_t result;

  result = MGIsDeviceOneOfType();
  CADeviceNeedsIRDCFlush::b = result;
  return result;
}

@end

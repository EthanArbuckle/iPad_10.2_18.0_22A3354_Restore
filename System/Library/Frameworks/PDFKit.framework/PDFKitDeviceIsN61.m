@implementation PDFKitDeviceIsN61

uint64_t __PDFKitDeviceIsN61_block_invoke()
{
  uint64_t result;

  result = MGIsDeviceOneOfType();
  PDFKitDeviceIsN61_deviceIsN61 = result;
  return result;
}

@end

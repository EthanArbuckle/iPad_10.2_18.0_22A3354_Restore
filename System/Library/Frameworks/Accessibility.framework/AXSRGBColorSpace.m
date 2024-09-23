@implementation AXSRGBColorSpace

CGColorSpaceRef ___AXSRGBColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
  _AXSRGBColorSpace_RGBColorSpace = (uint64_t)result;
  return result;
}

@end

@implementation AXExtendedSRGBColorSpace

CGColorSpaceRef ___AXExtendedSRGBColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF278]);
  _AXExtendedSRGBColorSpace_ExtendedSRGBColorSpace = (uint64_t)result;
  return result;
}

@end

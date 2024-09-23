@implementation DKUDeviceGrayColorSpace

CGColorSpaceRef __DKUDeviceGrayColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateDeviceGray();
  qword_1ECEE63D0 = (uint64_t)result;
  return result;
}

@end

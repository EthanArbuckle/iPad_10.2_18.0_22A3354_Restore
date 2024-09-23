@implementation DCTSUDeviceCMYKColorSpace

CGColorSpaceRef __DCTSUDeviceCMYKColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateDeviceCMYK();
  DCTSUDeviceCMYKColorSpace_sDeviceCMYKColorSpace = (uint64_t)result;
  return result;
}

@end

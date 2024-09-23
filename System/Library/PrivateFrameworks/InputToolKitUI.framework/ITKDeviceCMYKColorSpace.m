@implementation ITKDeviceCMYKColorSpace

CGColorSpaceRef __ITKDeviceCMYKColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateDeviceCMYK();
  ITKDeviceCMYKColorSpace_sDeviceCMYKColorSpace = (uint64_t)result;
  return result;
}

@end

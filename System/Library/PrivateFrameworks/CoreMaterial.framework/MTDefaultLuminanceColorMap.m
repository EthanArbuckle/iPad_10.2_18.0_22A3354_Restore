@implementation MTDefaultLuminanceColorMap

CGImageRef __MTDefaultLuminanceColorMap_block_invoke()
{
  CGImageRef result;

  result = MTCGImageCreateWithName(CFSTR("luminanceColorMap"), 0, 0.0);
  MTDefaultLuminanceColorMap___defaultLuminanceColorMap = (uint64_t)result;
  return result;
}

@end

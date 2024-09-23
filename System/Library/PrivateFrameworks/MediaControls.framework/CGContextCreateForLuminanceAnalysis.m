@implementation CGContextCreateForLuminanceAnalysis

CGColorSpaceRef __CGContextCreateForLuminanceAnalysis_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateDeviceRGB();
  CGContextCreateForLuminanceAnalysis_analysisColorSpace = (uint64_t)result;
  return result;
}

@end

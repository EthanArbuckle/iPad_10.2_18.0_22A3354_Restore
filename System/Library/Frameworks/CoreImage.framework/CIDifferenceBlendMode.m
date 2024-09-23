@implementation CIDifferenceBlendMode

- (id)_kernel
{
  return +[CIBlendKernel difference](CIBlendKernel, "difference");
}

@end

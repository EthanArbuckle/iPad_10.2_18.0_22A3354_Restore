@implementation CIExclusionBlendMode

- (id)_kernel
{
  return +[CIBlendKernel exclusion](CIBlendKernel, "exclusion");
}

@end

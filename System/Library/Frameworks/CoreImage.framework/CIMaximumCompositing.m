@implementation CIMaximumCompositing

+ (id)_kernel
{
  return +[CIBlendKernel componentMax](CIBlendKernel, "componentMax");
}

@end

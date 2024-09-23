@implementation CIMultiplyCompositing

+ (id)_kernel
{
  return +[CIBlendKernel componentMultiply](CIBlendKernel, "componentMultiply");
}

@end

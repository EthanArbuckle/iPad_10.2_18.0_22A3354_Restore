@implementation CISourceAtopCompositing

+ (id)_kernel
{
  return +[CIBlendKernel sourceAtop](CIBlendKernel, "sourceAtop");
}

@end

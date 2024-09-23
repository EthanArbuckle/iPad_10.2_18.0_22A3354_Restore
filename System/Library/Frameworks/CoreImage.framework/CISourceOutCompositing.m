@implementation CISourceOutCompositing

+ (id)_kernel
{
  return +[CIBlendKernel sourceOut](CIBlendKernel, "sourceOut");
}

@end

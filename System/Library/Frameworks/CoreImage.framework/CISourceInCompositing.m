@implementation CISourceInCompositing

+ (id)_kernel
{
  return +[CIBlendKernel sourceIn](CIBlendKernel, "sourceIn");
}

@end

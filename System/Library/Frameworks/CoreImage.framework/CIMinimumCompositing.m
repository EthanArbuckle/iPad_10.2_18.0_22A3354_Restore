@implementation CIMinimumCompositing

+ (id)_kernel
{
  return +[CIBlendKernel componentMin](CIBlendKernel, "componentMin");
}

@end

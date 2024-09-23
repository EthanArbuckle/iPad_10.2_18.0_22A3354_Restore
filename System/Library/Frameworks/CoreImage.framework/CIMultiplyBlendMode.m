@implementation CIMultiplyBlendMode

- (id)_kernel
{
  return +[CIBlendKernel multiply](CIBlendKernel, "multiply");
}

@end

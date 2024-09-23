@implementation CIColorBurnBlendMode

- (id)_kernel
{
  return +[CIBlendKernel colorBurn](CIBlendKernel, "colorBurn");
}

@end

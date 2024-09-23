@implementation CILightenBlendMode

- (id)_kernel
{
  return +[CIBlendKernel lighten](CIBlendKernel, "lighten");
}

@end

@implementation CISoftLightBlendMode

- (id)_kernel
{
  return +[CIBlendKernel softLight](CIBlendKernel, "softLight");
}

@end

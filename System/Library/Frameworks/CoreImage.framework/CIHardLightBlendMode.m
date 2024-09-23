@implementation CIHardLightBlendMode

- (id)_kernel
{
  return +[CIBlendKernel hardLight](CIBlendKernel, "hardLight");
}

@end

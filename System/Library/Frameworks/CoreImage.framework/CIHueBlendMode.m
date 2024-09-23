@implementation CIHueBlendMode

- (id)_kernel_v0
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_hueBlendMode_v0);
}

- (id)_kernel_v1
{
  return +[CIBlendKernel hue](CIBlendKernel, "hue");
}

@end

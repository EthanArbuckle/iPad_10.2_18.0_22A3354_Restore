@implementation CILuminosityBlendMode

- (id)_kernel_v0
{
  return +[CIBlendKernel kernelWithInternalRepresentation:](CIBlendKernel, "kernelWithInternalRepresentation:", &CI::_luminosityBlendMode_v0);
}

- (id)_kernel_v1
{
  return +[CIBlendKernel luminosity](CIBlendKernel, "luminosity");
}

@end

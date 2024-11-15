@implementation CIAreaMaximumAlpha

- (id)_reduce2X2
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_areaMaxAlphaS4);
}

- (id)_reduce4X1
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_areaMaxAlphaH4);
}

- (id)_reduce1X4
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_areaMaxAlphaV4);
}

@end

@implementation CIAreaMaximum

- (id)_reduce2X2
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_areaMax4);
}

- (id)_reduce4X1
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_horizMax4);
}

- (id)_reduce1X4
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_vertMax4);
}

@end

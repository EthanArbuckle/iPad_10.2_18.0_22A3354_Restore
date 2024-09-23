@implementation CIASG80Percent

- (id)outputImage
{
  return -[CIASGPercent outputImageScale:outset:hKernel:vKernel:](self, "outputImageScale:outset:hKernel:vKernel:", 4, +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_ASGh80), +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_ASGv80), 0.8);
}

@end

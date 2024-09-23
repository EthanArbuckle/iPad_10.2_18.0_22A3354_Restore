@implementation CIASG50Percent

- (id)outputImage
{
  return -[CIASGPercent outputImageScale:outset:hKernel:vKernel:](self, "outputImageScale:outset:hKernel:vKernel:", 5, +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_ASGh50), +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_ASGv50), 0.5);
}

@end

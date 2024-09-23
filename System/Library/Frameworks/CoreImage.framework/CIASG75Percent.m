@implementation CIASG75Percent

- (id)outputImage
{
  return -[CIASGPercent outputImageScale:outset:hKernel:vKernel:](self, "outputImageScale:outset:hKernel:vKernel:", 4, +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_ASGh66), +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_ASGv75), 0.75);
}

@end

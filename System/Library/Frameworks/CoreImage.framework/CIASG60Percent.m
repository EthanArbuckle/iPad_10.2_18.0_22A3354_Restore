@implementation CIASG60Percent

- (id)outputImage
{
  return -[CIASGPercent outputImageScale:outset:hKernel:vKernel:](self, "outputImageScale:outset:hKernel:vKernel:", 4, +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_ASGh60), +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_ASGv60), 0.6);
}

@end

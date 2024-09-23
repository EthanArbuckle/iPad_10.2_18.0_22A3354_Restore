@implementation CIAdditionCompositing

+ (id)_kernel
{
  return +[CIBlendKernel componentAdd](CIBlendKernel, "componentAdd");
}

- (id)outputImage
{
  CIImage *inputImage;
  CIImage *v4;
  CIImage *inputBackgroundImage;
  CIImage *v7;
  objc_super v8;

  inputImage = self->super.inputImage;
  v4 = +[CIImage emptyImage](CIImage, "emptyImage");
  inputBackgroundImage = self->super.inputBackgroundImage;
  if (inputImage == v4)
    return inputBackgroundImage;
  if (inputBackgroundImage == +[CIImage emptyImage](CIImage, "emptyImage"))
  {
    v7 = self->super.inputImage;
    return v7;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CIAdditionCompositing;
    return -[_CICompositeFilter outputImage](&v8, sel_outputImage);
  }
}

@end

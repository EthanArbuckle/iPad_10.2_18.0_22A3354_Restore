@implementation CIPlusDarkerCompositing

+ (id)_kernel
{
  return +[CIBlendKernel plusDarker](CIBlendKernel, "plusDarker");
}

+ (id)customAttributes
{
  _QWORD v3[7];
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("CIAttributeFilterCategories");
  v3[0] = CFSTR("CICategoryCompositeOperation");
  v3[1] = CFSTR("CICategoryVideo");
  v3[2] = CFSTR("CICategoryStillImage");
  v3[3] = CFSTR("CICategoryInterlaced");
  v3[4] = CFSTR("CICategoryNonSquarePixels");
  v3[5] = CFSTR("CICategoryBuiltIn");
  v3[6] = CFSTR("CICategoryApplePrivate");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 7);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
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
    v8.super_class = (Class)CIPlusDarkerCompositing;
    return -[_CICompositeFilter outputImage](&v8, sel_outputImage);
  }
}

@end

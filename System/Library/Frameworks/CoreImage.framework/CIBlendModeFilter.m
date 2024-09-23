@implementation CIBlendModeFilter

- (id)_kernel
{
  return 0;
}

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("CIAttributeFilterCategories");
  v3[0] = CFSTR("CICategoryCompositeOperation");
  v3[1] = CFSTR("CICategoryVideo");
  v3[2] = CFSTR("CICategoryStillImage");
  v3[3] = CFSTR("CICategoryInterlaced");
  v3[4] = CFSTR("CICategoryNonSquarePixels");
  v3[5] = CFSTR("CICategoryBuiltIn");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 6);
  v5[1] = CFSTR("5");
  v4[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v4[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v5[2] = CFSTR("10.4");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (id)outputImage
{
  CIImage *inputImage;
  CIImage *inputBackgroundImage;
  CIImage *v5;

  inputImage = self->inputImage;
  inputBackgroundImage = self->inputBackgroundImage;
  if (inputImage)
  {
    if (inputBackgroundImage)
      return (id)objc_msgSend(-[CIBlendModeFilter _kernel](self, "_kernel"), "applyWithForeground:background:", self->inputImage, self->inputBackgroundImage);
    v5 = inputImage;
    return v5;
  }
  if (inputBackgroundImage)
  {
    v5 = inputBackgroundImage;
    return v5;
  }
  return 0;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIImage)inputBackgroundImage
{
  return self->inputBackgroundImage;
}

- (void)setInputBackgroundImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end

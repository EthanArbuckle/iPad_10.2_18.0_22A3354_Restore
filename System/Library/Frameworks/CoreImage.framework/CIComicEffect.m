@implementation CIComicEffect

- (id)outputImage
{
  id result;

  result = self->inputImage;
  if (result)
    return -[CIImage imageByCompositingOverImage:](-[CIImage imageByApplyingFilter:withInputParameters:](self->inputImage, "imageByApplyingFilter:withInputParameters:", CFSTR("CILineOverlay"), 0), "imageByCompositingOverImage:", objc_msgSend((id)objc_msgSend(result, "imageByApplyingFilter:withInputParameters:", CFSTR("CISpotColor"), 0), "imageByApplyingFilter:withInputParameters:", CFSTR("CICMYKHalftone"), &unk_1E2F1D4E0));
  return result;
}

+ (id)customAttributes
{
  _QWORD v3[4];
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("CIAttributeFilterCategories");
  v3[0] = CFSTR("CICategoryStylize");
  v3[1] = CFSTR("CICategoryVideo");
  v3[2] = CFSTR("CICategoryStillImage");
  v3[3] = CFSTR("CICategoryBuiltIn");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  v5[1] = CFSTR("9");
  v4[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v4[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v5[2] = CFSTR("10.5");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

@end

@implementation CISRGBToneCurveToLinear

+ (id)customAttributes
{
  _QWORD v3[7];
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("CIAttributeFilterCategories");
  v3[0] = CFSTR("CICategoryColorAdjustment");
  v3[1] = CFSTR("CICategoryVideo");
  v3[2] = CFSTR("CICategoryStillImage");
  v3[3] = CFSTR("CICategoryInterlaced");
  v3[4] = CFSTR("CICategoryNonSquarePixels");
  v3[5] = CFSTR("CICategoryHighDynamicRange");
  v3[6] = CFSTR("CICategoryBuiltIn");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 7);
  v5[1] = CFSTR("7");
  v4[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v4[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v5[2] = CFSTR("10.10");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (id)outputImage
{
  id result;
  CI::Image *v3;
  CI::SRGBImage *v4;
  CIImage *v5;

  result = self->inputImage;
  if (result)
  {
    v3 = (CI::Image *)objc_msgSend(result, "_internalRepresentation");
    v4 = (CI::SRGBImage *)operator new();
    CI::SRGBImage::SRGBImage(v4, v3, -1);
    v5 = +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", v4);
    CI::Object::unref(v4);
    return v5;
  }
  return result;
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

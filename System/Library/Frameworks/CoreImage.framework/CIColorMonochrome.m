@implementation CIColorMonochrome

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_colorMonochrome);
}

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[7];
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("CIAttributeFilterCategories");
  v7[0] = CFSTR("CICategoryColorEffect");
  v7[1] = CFSTR("CICategoryVideo");
  v7[2] = CFSTR("CICategoryInterlaced");
  v7[3] = CFSTR("CICategoryNonSquarePixels");
  v7[4] = CFSTR("CICategoryStillImage");
  v7[5] = CFSTR("CICategoryHighDynamicRange");
  v7[6] = CFSTR("CICategoryBuiltIn");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 7);
  v9[1] = CFSTR("5");
  v8[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v8[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v9[2] = CFSTR("10.4");
  v8[3] = CFSTR("inputColor");
  v5[0] = CFSTR("CIAttributeDefault");
  v5[1] = CFSTR("CIAttributeType");
  v6[0] = +[CIColor colorWithRed:green:blue:](CIColor, "colorWithRed:green:blue:", 0.6, 0.45, 0.3);
  v6[1] = CFSTR("CIAttributeTypeOpaqueColor");
  v9[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v8[4] = CFSTR("inputIntensity");
  v3[0] = CFSTR("CIAttributeSliderMin");
  v3[1] = CFSTR("CIAttributeSliderMax");
  v4[0] = &unk_1E2F19070;
  v4[1] = &unk_1E2F19080;
  v3[2] = CFSTR("CIAttributeDefault");
  v3[3] = CFSTR("CIAttributeIdentity");
  v4[2] = &unk_1E2F19080;
  v4[3] = &unk_1E2F19070;
  v3[4] = CFSTR("CIAttributeType");
  v4[4] = CFSTR("CIAttributeTypeScalar");
  v9[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
}

- (id)outputImage
{
  float v3;
  CIImage *inputImage;
  uint64_t v6;
  id v7;
  CIColor *inputColor;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage || !self->inputColor)
    return 0;
  -[NSNumber floatValue](self->inputIntensity, "floatValue");
  inputImage = self->inputImage;
  if (v3 < 0.001)
    return inputImage;
  v6 = -[CIImage imageByUnpremultiplyingAlpha](inputImage, "imageByUnpremultiplyingAlpha");
  v7 = -[CIColorMonochrome _kernel](self, "_kernel");
  -[CIImage extent](self->inputImage, "extent");
  inputColor = self->inputColor;
  v13[0] = v6;
  v13[1] = inputColor;
  v13[2] = self->inputIntensity;
  return (id)objc_msgSend((id)objc_msgSend(v7, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3), v9, v10, v11, v12), "imageByPremultiplyingAlpha");
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIColor)inputColor
{
  return self->inputColor;
}

- (void)setInputColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputIntensity
{
  return self->inputIntensity;
}

- (void)setInputIntensity:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end

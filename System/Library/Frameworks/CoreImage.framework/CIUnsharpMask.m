@implementation CIUnsharpMask

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[4];
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("CIAttributeFilterCategories");
  v7[0] = CFSTR("CICategorySharpen");
  v7[1] = CFSTR("CICategoryVideo");
  v7[2] = CFSTR("CICategoryStillImage");
  v7[3] = CFSTR("CICategoryBuiltIn");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v9[1] = CFSTR("6");
  v8[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v8[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v9[2] = CFSTR("10.4");
  v8[3] = CFSTR("inputIntensity");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F1B0F0;
  v6[1] = &unk_1E2F1B0F0;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F1B100;
  v6[3] = &unk_1E2F1B110;
  v5[4] = CFSTR("CIAttributeIdentity");
  v5[5] = CFSTR("CIAttributeType");
  v6[4] = &unk_1E2F1B0F0;
  v6[5] = CFSTR("CIAttributeTypeScalar");
  v9[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v8[4] = CFSTR("inputRadius");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F1B0F0;
  v4[1] = &unk_1E2F1B0F0;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F1B120;
  v4[3] = &unk_1E2F1B130;
  v3[4] = CFSTR("CIAttributeIdentity");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F1B0F0;
  v4[5] = CFSTR("CIAttributeTypeDistance");
  v9[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
}

- (BOOL)_isIdentity
{
  double v3;
  double v5;

  -[NSNumber doubleValue](self->inputRadius, "doubleValue");
  if (v3 < 0.16)
    return 1;
  -[NSNumber doubleValue](self->inputIntensity, "doubleValue");
  return v5 < 0.001;
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_unsharpmask);
}

- (id)outputImage
{
  _BOOL4 v3;
  CIImage *inputImage;
  uint64_t v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  v3 = -[CIUnsharpMask _isIdentity](self, "_isIdentity");
  inputImage = self->inputImage;
  if (v3)
    return inputImage;
  -[NSNumber doubleValue](self->inputRadius, "doubleValue");
  v6 = -[CIImage imageByApplyingGaussianBlurWithSigma:](inputImage, "imageByApplyingGaussianBlurWithSigma:");
  v7 = -[CIUnsharpMask _kernel](self, "_kernel");
  -[CIImage extent](self->inputImage, "extent");
  v12[0] = self->inputImage;
  v12[1] = v6;
  v12[2] = self->inputIntensity;
  return (id)objc_msgSend(v7, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3), v8, v9, v10, v11);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
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

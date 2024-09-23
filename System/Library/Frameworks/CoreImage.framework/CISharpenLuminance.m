@implementation CISharpenLuminance

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[5];
  _QWORD v6[5];
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
  v8[3] = CFSTR("inputSharpness");
  v5[0] = CFSTR("CIAttributeSliderMin");
  v5[1] = CFSTR("CIAttributeSliderMax");
  v6[0] = &unk_1E2F1AB20;
  v6[1] = &unk_1E2F1AB30;
  v5[2] = CFSTR("CIAttributeDefault");
  v5[3] = CFSTR("CIAttributeIdentity");
  v6[2] = &unk_1E2F1AB40;
  v6[3] = &unk_1E2F1AB20;
  v5[4] = CFSTR("CIAttributeType");
  v6[4] = CFSTR("CIAttributeTypeScalar");
  v9[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  v8[4] = CFSTR("inputRadius");
  v3[0] = CFSTR("CIAttributeSliderMin");
  v3[1] = CFSTR("CIAttributeSliderMax");
  v4[0] = &unk_1E2F1AB20;
  v4[1] = &unk_1E2F1AB50;
  v3[2] = CFSTR("CIAttributeDefault");
  v3[3] = CFSTR("CIAttributeIdentity");
  v4[2] = &unk_1E2F1AB60;
  v4[3] = &unk_1E2F1AB20;
  v3[4] = CFSTR("CIAttributeType");
  v4[4] = CFSTR("CIAttributeTypeScalar");
  v9[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
}

- (BOOL)_isIdentity
{
  float v3;
  float v4;

  -[NSNumber floatValue](self->inputSharpness, "floatValue");
  if (fabsf(v3) <= 0.001)
    return 1;
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  return v4 < 0.16;
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_sharpenLuminance);
}

- (id)outputImage
{
  _BOOL4 v3;
  CIImage *inputImage;
  CIImage *v6;
  float v7;
  uint64_t v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  v3 = -[CISharpenLuminance _isIdentity](self, "_isIdentity");
  inputImage = self->inputImage;
  if (v3)
    return inputImage;
  v6 = -[CIImage imageByClampingToExtent](inputImage, "imageByClampingToExtent");
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  v8 = -[CIImage imageByApplyingGaussianBlurWithSigma:](v6, "imageByApplyingGaussianBlurWithSigma:", v7);
  v9 = -[CISharpenLuminance _kernel](self, "_kernel");
  -[CIImage extent](v6, "extent");
  v15[0] = v6;
  v15[1] = v8;
  v15[2] = self->inputSharpness;
  v14 = (void *)objc_msgSend(v9, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3), v10, v11, v12, v13);
  -[CIImage extent](self->inputImage, "extent");
  return (id)objc_msgSend(v14, "imageByCroppingToRect:");
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputSharpness
{
  return self->inputSharpness;
}

- (void)setInputSharpness:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end

@implementation CIGloom

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("CIAttributeFilterCategories");
  v7[0] = CFSTR("CICategoryStylize");
  v7[1] = CFSTR("CICategoryVideo");
  v7[2] = CFSTR("CICategoryStillImage");
  v7[3] = CFSTR("CICategoryHighDynamicRange");
  v7[4] = CFSTR("CICategoryBuiltIn");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 5);
  v9[1] = CFSTR("6");
  v8[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v8[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v9[2] = CFSTR("10.4");
  v8[3] = CFSTR("inputIntensity");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F18CE0;
  v6[1] = &unk_1E2F18CE0;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F18D20;
  v6[3] = &unk_1E2F18CF0;
  v5[4] = CFSTR("CIAttributeIdentity");
  v5[5] = CFSTR("CIAttributeType");
  v6[4] = &unk_1E2F18CE0;
  v6[5] = CFSTR("CIAttributeTypeScalar");
  v9[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v8[4] = CFSTR("inputRadius");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F18CE0;
  v4[1] = &unk_1E2F18CE0;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F18D00;
  v4[3] = &unk_1E2F18D10;
  v3[4] = CFSTR("CIAttributeIdentity");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F18CE0;
  v4[5] = CFSTR("CIAttributeTypeDistance");
  v9[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_gloom);
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

- (id)outputImage
{
  _BOOL4 v3;
  CIImage *inputImage;
  CIImage *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double x;
  double y;
  double width;
  double height;
  id v23;
  _QWORD v24[4];
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v24[3] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  v3 = -[CIGloom _isIdentity](self, "_isIdentity");
  inputImage = self->inputImage;
  if (v3)
    return inputImage;
  -[NSNumber doubleValue](self->inputRadius, "doubleValue");
  v6 = -[CIImage imageByApplyingGaussianBlurWithSigma:](inputImage, "imageByApplyingGaussianBlurWithSigma:");
  -[CIImage extent](v6, "extent");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[CIImage extent](self->inputImage, "extent");
  v27.origin.x = v15;
  v27.origin.y = v16;
  v27.size.width = v17;
  v27.size.height = v18;
  v25.origin.x = v8;
  v25.origin.y = v10;
  v25.size.width = v12;
  v25.size.height = v14;
  v26 = CGRectUnion(v25, v27);
  x = v26.origin.x;
  y = v26.origin.y;
  width = v26.size.width;
  height = v26.size.height;
  v23 = -[CIGloom _kernel](self, "_kernel");
  v24[0] = self->inputImage;
  v24[1] = v6;
  v24[2] = self->inputIntensity;
  return (id)objc_msgSend(v23, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3), x, y, width, height);
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

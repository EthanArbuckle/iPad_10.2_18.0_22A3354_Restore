@implementation CIVignette

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[7];
  _QWORD v6[7];
  _QWORD v7[6];
  _QWORD v8[5];
  _QWORD v9[7];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("CIAttributeFilterCategories");
  v7[0] = CFSTR("CICategoryColorEffect");
  v7[1] = CFSTR("CICategoryVideo");
  v7[2] = CFSTR("CICategoryInterlaced");
  v7[3] = CFSTR("CICategoryStillImage");
  v7[4] = CFSTR("CICategoryHighDynamicRange");
  v7[5] = CFSTR("CICategoryBuiltIn");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 6);
  v9[1] = CFSTR("5");
  v8[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v8[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v9[2] = CFSTR("10.9");
  v8[3] = CFSTR("inputIntensity");
  v5[0] = CFSTR("CIAttributeSliderMin");
  v5[1] = CFSTR("CIAttributeSliderMax");
  v6[0] = &unk_1E2F1B180;
  v6[1] = &unk_1E2F1B190;
  v5[2] = CFSTR("CIAttributeMin");
  v5[3] = CFSTR("CIAttributeMax");
  v6[2] = &unk_1E2F1B180;
  v6[3] = &unk_1E2F1B190;
  v5[4] = CFSTR("CIAttributeDefault");
  v5[5] = CFSTR("CIAttributeIdentity");
  v6[4] = &unk_1E2F1B1A0;
  v6[5] = &unk_1E2F1B1A0;
  v5[6] = CFSTR("CIAttributeType");
  v6[6] = CFSTR("CIAttributeTypeScalar");
  v9[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 7);
  v8[4] = CFSTR("inputRadius");
  v3[0] = CFSTR("CIAttributeSliderMin");
  v3[1] = CFSTR("CIAttributeSliderMax");
  v4[0] = &unk_1E2F1B1A0;
  v4[1] = &unk_1E2F1B1B0;
  v3[2] = CFSTR("CIAttributeMin");
  v3[3] = CFSTR("CIAttributeMax");
  v4[2] = &unk_1E2F1B1A0;
  v4[3] = &unk_1E2F1B1B0;
  v3[4] = CFSTR("CIAttributeDefault");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F1B190;
  v4[5] = CFSTR("CIAttributeTypeScalar");
  v9[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
}

- (BOOL)_isIdentity
{
  double v2;

  -[NSNumber doubleValue](self->inputIntensity, "doubleValue");
  return fabs(v2) < 0.01;
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_vignette);
}

- (id)outputImage
{
  double v3;
  double v4;
  CIImage *inputImage;
  CIImage *v6;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double v12;
  double v13;
  double v14;
  double v15;
  double MidX;
  CIVector *v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _QWORD v23[3];
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v23[2] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  -[NSNumber doubleValue](self->inputIntensity, "doubleValue");
  v4 = v3;
  inputImage = self->inputImage;
  if (fabs(v3) < 0.01)
  {
    v6 = inputImage;
    return v6;
  }
  -[CIImage extent](inputImage, "extent");
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  if (CGRectIsInfinite(v24))
  {
    v6 = self->inputImage;
    return v6;
  }
  -[NSNumber doubleValue](self->inputRadius, "doubleValue");
  v13 = fmin(fmax(v12, 0.0), 2.0);
  v14 = fmin(width, height);
  v15 = 1.0 / (v14 * 0.5 * (4.0 - v13) * (v14 * 0.5 * (4.0 - v13)));
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MidX = CGRectGetMidX(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v17 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", MidX, CGRectGetMidY(v26), v4 + v4, v15);
  v18 = -[CIVignette _kernel](self, "_kernel");
  -[CIImage extent](self->inputImage, "extent");
  v23[0] = self->inputImage;
  v23[1] = v17;
  return (id)objc_msgSend(v18, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2), v19, v20, v21, v22);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputIntensity
{
  return self->inputIntensity;
}

- (void)setInputIntensity:(id)a3
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

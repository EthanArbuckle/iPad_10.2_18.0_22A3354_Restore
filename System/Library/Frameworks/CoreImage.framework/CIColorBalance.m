@implementation CIColorBalance

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[7];
  _QWORD v8[7];
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[7];
  _QWORD v12[5];
  _QWORD v13[7];

  v13[5] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("CIAttributeFilterCategories");
  v11[0] = CFSTR("CICategoryColorAdjustment");
  v11[1] = CFSTR("CICategoryVideo");
  v11[2] = CFSTR("CICategoryStillImage");
  v11[3] = CFSTR("CICategoryInterlaced");
  v11[4] = CFSTR("CICategoryNonSquarePixels");
  v11[5] = CFSTR("CICategoryBuiltIn");
  v11[6] = CFSTR("CICategoryApplePrivate");
  v13[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v12[1] = CFSTR("inputColor");
  v9[0] = CFSTR("CIAttributeDefault");
  v9[1] = CFSTR("CIAttributeType");
  v10[0] = +[CIColor colorWithRed:green:blue:](CIColor, "colorWithRed:green:blue:", 0.5, 0.5, 0.5);
  v10[1] = CFSTR("CIAttributeTypeColor");
  v13[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v12[2] = CFSTR("inputStrength");
  v7[0] = CFSTR("CIAttributeSliderMin");
  v7[1] = CFSTR("CIAttributeSliderMax");
  v8[0] = &unk_1E2F18FB0;
  v8[1] = &unk_1E2F18FC0;
  v7[2] = CFSTR("CIAttributeMin");
  v7[3] = CFSTR("CIAttributeMax");
  v8[2] = &unk_1E2F18FB0;
  v8[3] = &unk_1E2F18FC0;
  v7[4] = CFSTR("CIAttributeDefault");
  v7[5] = CFSTR("CIAttributeIdentity");
  v8[4] = &unk_1E2F18FD0;
  v8[5] = &unk_1E2F18FB0;
  v7[6] = CFSTR("CIAttributeType");
  v8[6] = CFSTR("CIAttributeTypeScalar");
  v13[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 7);
  v12[3] = CFSTR("inputWarmth");
  v5[0] = CFSTR("CIAttributeSliderMin");
  v5[1] = CFSTR("CIAttributeSliderMax");
  v6[0] = &unk_1E2F18FB0;
  v6[1] = &unk_1E2F18FE0;
  v5[2] = CFSTR("CIAttributeMin");
  v5[3] = CFSTR("CIAttributeMax");
  v6[2] = &unk_1E2F18FB0;
  v6[3] = &unk_1E2F18FE0;
  v5[4] = CFSTR("CIAttributeDefault");
  v5[5] = CFSTR("CIAttributeType");
  v6[4] = &unk_1E2F18FD0;
  v6[5] = CFSTR("CIAttributeTypeScalar");
  v13[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v12[4] = CFSTR("inputDamping");
  v3[0] = CFSTR("CIAttributeSliderMin");
  v3[1] = CFSTR("CIAttributeSliderMax");
  v4[0] = &unk_1E2F18FB0;
  v4[1] = &unk_1E2F18FE0;
  v3[2] = CFSTR("CIAttributeMin");
  v3[3] = CFSTR("CIAttributeMax");
  v4[2] = &unk_1E2F18FB0;
  v4[3] = &unk_1E2F18FE0;
  v3[4] = CFSTR("CIAttributeDefault");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F18FE0;
  v4[5] = CFSTR("CIAttributeTypeScalar");
  v13[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 5);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_colorbalance);
}

- (id)outputImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  -[NSNumber doubleValue](self->inputWarmth, "doubleValue");
  v4 = v3;
  -[NSNumber doubleValue](self->inputStrength, "doubleValue");
  v6 = fmin(fmax(v5, 0.0), 2.0);
  -[NSNumber doubleValue](self->inputDamping, "doubleValue");
  if (fabs(v6) < 0.001)
    return self->inputImage;
  v9 = fmin(fmax(v4, 0.0), 1.0);
  v10 = (1.0 - v9) * 0.05 + v9 * -0.05;
  v11 = (1.0 - v9) * -0.2 + v9 * 0.2;
  v12 = fmin(fmax(v7, 0.001), 1.0);
  v13 = objc_msgSend(-[CIImage _imageByApplyingGamma:](self->inputImage, "_imageByApplyingGamma:", 0.25), "imageByUnpremultiplyingAlpha");
  v14 = -[CIColorBalance _kernel](self, "_kernel");
  -[CIImage extent](self->inputImage, "extent");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23[2] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v11, v10, v6, v12, v13, self->inputColor);
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3), v16, v18, v20, v22), "imageByPremultiplyingAlpha"), "_imageByApplyingGamma:", 4.0);
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

- (NSNumber)inputStrength
{
  return self->inputStrength;
}

- (void)setInputStrength:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputWarmth
{
  return self->inputWarmth;
}

- (void)setInputWarmth:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSNumber)inputDamping
{
  return self->inputDamping;
}

- (void)setInputDamping:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

@end

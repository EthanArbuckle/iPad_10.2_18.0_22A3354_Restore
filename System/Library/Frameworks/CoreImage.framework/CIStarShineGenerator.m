@implementation CIStarShineGenerator

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[4];
  _QWORD v10[4];
  _QWORD v11[6];
  _QWORD v12[6];
  _QWORD v13[5];
  _QWORD v14[5];
  const __CFString *v15;
  CIColor *v16;
  _QWORD v17[5];
  _QWORD v18[10];
  _QWORD v19[12];

  v19[10] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("CIAttributeFilterCategories");
  v17[0] = CFSTR("CICategoryGenerator");
  v17[1] = CFSTR("CICategoryVideo");
  v17[2] = CFSTR("CICategoryStillImage");
  v17[3] = CFSTR("CICategoryHighDynamicRange");
  v17[4] = CFSTR("CICategoryBuiltIn");
  v19[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 5);
  v19[1] = CFSTR("6");
  v18[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v18[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v19[2] = CFSTR("10.4");
  v18[3] = CFSTR("inputColor");
  v15 = CFSTR("CIAttributeDefault");
  v16 = +[CIColor colorWithRed:green:blue:](CIColor, "colorWithRed:green:blue:", 1.0, 0.8, 0.6);
  v19[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v18[4] = CFSTR("inputRadius");
  v13[0] = CFSTR("CIAttributeMin");
  v13[1] = CFSTR("CIAttributeSliderMin");
  v14[0] = &unk_1E2F1AD40;
  v14[1] = &unk_1E2F1AD40;
  v13[2] = CFSTR("CIAttributeSliderMax");
  v13[3] = CFSTR("CIAttributeDefault");
  v14[2] = &unk_1E2F1AD50;
  v14[3] = &unk_1E2F1AD60;
  v13[4] = CFSTR("CIAttributeType");
  v14[4] = CFSTR("CIAttributeTypeDistance");
  v19[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v18[5] = CFSTR("inputCrossScale");
  v11[0] = CFSTR("CIAttributeMin");
  v11[1] = CFSTR("CIAttributeSliderMin");
  v12[0] = &unk_1E2F1AD40;
  v12[1] = &unk_1E2F1AD40;
  v11[2] = CFSTR("CIAttributeSliderMax");
  v11[3] = CFSTR("CIAttributeDefault");
  v12[2] = &unk_1E2F1AD70;
  v12[3] = &unk_1E2F1AD80;
  v11[4] = CFSTR("CIAttributeIdentity");
  v11[5] = CFSTR("CIAttributeType");
  v12[4] = &unk_1E2F1AD80;
  v12[5] = CFSTR("CIAttributeTypeScalar");
  v19[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 6);
  v18[6] = CFSTR("inputCrossAngle");
  v9[0] = CFSTR("CIAttributeSliderMin");
  v9[1] = CFSTR("CIAttributeSliderMax");
  v10[0] = &unk_1E2F1AD90;
  v10[1] = &unk_1E2F1ADA0;
  v9[2] = CFSTR("CIAttributeDefault");
  v9[3] = CFSTR("CIAttributeType");
  v10[2] = &unk_1E2F1ADB0;
  v10[3] = CFSTR("CIAttributeTypeAngle");
  v19[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v18[7] = CFSTR("inputCrossOpacity");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeSliderMin");
  v8[0] = &unk_1E2F1ADC0;
  v8[1] = &unk_1E2F1ADC0;
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeDefault");
  v8[2] = &unk_1E2F1AD40;
  v8[3] = &unk_1E2F1ADD0;
  v7[4] = CFSTR("CIAttributeIdentity");
  v7[5] = CFSTR("CIAttributeType");
  v8[4] = &unk_1E2F1ADD0;
  v8[5] = CFSTR("CIAttributeTypeScalar");
  v19[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v18[8] = CFSTR("inputCrossWidth");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F1AD40;
  v6[1] = &unk_1E2F1ADE0;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F1ADF0;
  v6[3] = &unk_1E2F1AE00;
  v5[4] = CFSTR("CIAttributeType");
  v6[4] = CFSTR("CIAttributeTypeDistance");
  v19[8] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  v18[9] = CFSTR("inputEpsilon");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F1ADC0;
  v4[1] = &unk_1E2F1ADC0;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F1AD40;
  v4[3] = &unk_1E2F1ADD0;
  v3[4] = CFSTR("CIAttributeIdentity");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F1ADD0;
  v4[5] = CFSTR("CIAttributeTypeScalar");
  v19[9] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 10);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_starshine);
}

- (id)outputImage
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  __float2 v15;
  CIVector *v16;
  CIVector *v17;
  float v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  CIColor *inputColor;
  _QWORD v28[6];

  v28[5] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  v4 = v3;
  -[NSNumber floatValue](self->inputCrossScale, "floatValue");
  v6 = v5;
  -[NSNumber floatValue](self->inputCrossAngle, "floatValue");
  v8 = v7;
  -[NSNumber floatValue](self->inputCrossOpacity, "floatValue");
  v10 = __exp10(v9);
  -[NSNumber floatValue](self->inputCrossWidth, "floatValue");
  v12 = v11;
  -[NSNumber floatValue](self->inputEpsilon, "floatValue");
  v14 = __exp10(v13);
  v15 = __sincosf_stret(v8);
  v16 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v15.__cosval, v15.__sinval, (float)-v15.__sinval);
  v17 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v4, (float)(1.0 / (float)(v4 * v6)), v10, v14);
  v18 = 1.0 / v12;
  v19 = -[CIStarShineGenerator _kernel](self, "_kernel");
  v20 = *MEMORY[0x1E0C9D5E0];
  v21 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v22 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v23 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  *(float *)&v24 = v18;
  v25 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24, self->inputCenter, v16, v17);
  inputColor = self->inputColor;
  v28[3] = v25;
  v28[4] = inputColor;
  return (id)objc_msgSend(v19, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 5), v20, v21, v22, v23);
}

- (CIVector)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
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

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputEpsilon
{
  return self->inputEpsilon;
}

- (void)setInputEpsilon:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (NSNumber)inputCrossAngle
{
  return self->inputCrossAngle;
}

- (void)setInputCrossAngle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSNumber)inputCrossScale
{
  return self->inputCrossScale;
}

- (void)setInputCrossScale:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSNumber)inputCrossWidth
{
  return self->inputCrossWidth;
}

- (void)setInputCrossWidth:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (NSNumber)inputCrossOpacity
{
  return self->inputCrossOpacity;
}

- (void)setInputCrossOpacity:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

@end

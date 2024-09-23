@implementation CIStripesGenerator

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_stripes);
}

+ (id)customAttributes
{
  uint64_t v3;
  CIColor *v4;
  const __CFString *v5;
  CIColor *v6;
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[4];
  _QWORD v10[4];
  _QWORD v11[5];
  _QWORD v12[7];
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("CIAttributeFilterCategories");
  v11[0] = CFSTR("CICategoryGenerator");
  v11[1] = CFSTR("CICategoryVideo");
  v11[2] = CFSTR("CICategoryStillImage");
  v11[3] = CFSTR("CICategoryHighDynamicRange");
  v11[4] = CFSTR("CICategoryBuiltIn");
  v13[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 5);
  v13[1] = CFSTR("5");
  v12[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v12[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v13[2] = CFSTR("10.4");
  v12[3] = CFSTR("inputWidth");
  v9[0] = CFSTR("CIAttributeSliderMin");
  v9[1] = CFSTR("CIAttributeSliderMax");
  v10[0] = &unk_1E2F1AE40;
  v10[1] = &unk_1E2F1AE50;
  v9[2] = CFSTR("CIAttributeDefault");
  v9[3] = CFSTR("CIAttributeType");
  v10[2] = &unk_1E2F1AE60;
  v10[3] = CFSTR("CIAttributeTypeDistance");
  v13[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v12[4] = CFSTR("inputSharpness");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeMax");
  v8[0] = &unk_1E2F1AE40;
  v8[1] = &unk_1E2F1AE70;
  v7[2] = CFSTR("CIAttributeSliderMin");
  v7[3] = CFSTR("CIAttributeSliderMax");
  v8[2] = &unk_1E2F1AE40;
  v8[3] = &unk_1E2F1AE70;
  v7[4] = CFSTR("CIAttributeDefault");
  v7[5] = CFSTR("CIAttributeType");
  v8[4] = &unk_1E2F1AE70;
  v8[5] = CFSTR("CIAttributeTypeScalar");
  v13[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v12[5] = CFSTR("inputColor0");
  v5 = CFSTR("CIAttributeDefault");
  v6 = +[CIColor colorWithRed:green:blue:](CIColor, "colorWithRed:green:blue:", 1.0, 1.0, 1.0);
  v13[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1);
  v12[6] = CFSTR("inputColor1");
  v4 = +[CIColor colorWithRed:green:blue:](CIColor, "colorWithRed:green:blue:", 0.0, 0.0, 0.0, CFSTR("CIAttributeDefault"));
  v13[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
}

- (id)outputImage
{
  float v3;
  float v4;
  CIColor *inputColor0;
  CIColor *inputColor1;
  float v7;
  float v8;
  float v9;
  CIVector *inputCenter;
  CIVector *v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputWidth, "floatValue");
  v4 = v3;
  if (fabsf(v3) <= 0.000001)
    return +[CIImage imageWithColor:](CIImage, "imageWithColor:", self->inputColor0);
  inputColor0 = self->inputColor0;
  if (!inputColor0)
    inputColor0 = +[CIColor colorWithRed:green:blue:alpha:](CIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
  inputColor1 = self->inputColor1;
  if (!inputColor1)
    inputColor1 = +[CIColor colorWithRed:green:blue:alpha:](CIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
  -[NSNumber floatValue](self->inputSharpness, "floatValue");
  v8 = 1.0 / (1.00001 - fminf(fmaxf(v7, 0.0), 1.0));
  v9 = 1.0 / (float)(v4 + v4);
  inputCenter = self->inputCenter;
  if (!inputCenter)
    inputCenter = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.0, 0.0);
  v11 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v9, (float)(v8 + v8), (float)((float)(1.0 - v8) * 0.5));
  v12 = -[CIStripesGenerator _kernel](self, "_kernel");
  v13 = *MEMORY[0x1E0C9D5E0];
  v14 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v15 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v16 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  v18[0] = inputCenter;
  v18[1] = inputColor0;
  v18[2] = inputColor1;
  v18[3] = v11;
  return (id)objc_msgSend(v12, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4), v13, v14, v15, v16);
}

- (CIVector)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIColor)inputColor0
{
  return self->inputColor0;
}

- (void)setInputColor0:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CIColor)inputColor1
{
  return self->inputColor1;
}

- (void)setInputColor1:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputWidth
{
  return self->inputWidth;
}

- (void)setInputWidth:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSNumber)inputSharpness
{
  return self->inputSharpness;
}

- (void)setInputSharpness:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

@end

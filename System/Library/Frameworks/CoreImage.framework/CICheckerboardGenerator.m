@implementation CICheckerboardGenerator

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_checker);
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
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[5];
  _QWORD v14[8];
  _QWORD v15[9];

  v15[8] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("CIAttributeFilterCategories");
  v13[0] = CFSTR("CICategoryGenerator");
  v13[1] = CFSTR("CICategoryVideo");
  v13[2] = CFSTR("CICategoryStillImage");
  v13[3] = CFSTR("CICategoryHighDynamicRange");
  v13[4] = CFSTR("CICategoryBuiltIn");
  v15[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 5);
  v15[1] = CFSTR("5");
  v14[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v14[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v15[2] = CFSTR("10.4");
  v14[3] = CFSTR("inputCenter");
  v11[0] = CFSTR("CIAttributeDefault");
  v11[1] = CFSTR("CIAttributeType");
  v12[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 150.0, 150.0);
  v12[1] = CFSTR("CIAttributeTypePosition");
  v15[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v14[4] = CFSTR("inputWidth");
  v9[0] = CFSTR("CIAttributeSliderMin");
  v9[1] = CFSTR("CIAttributeSliderMax");
  v10[0] = &unk_1E2F18EC0;
  v10[1] = &unk_1E2F18ED0;
  v9[2] = CFSTR("CIAttributeDefault");
  v9[3] = CFSTR("CIAttributeType");
  v10[2] = &unk_1E2F18EE0;
  v10[3] = CFSTR("CIAttributeTypeDistance");
  v15[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v14[5] = CFSTR("inputSharpness");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeMax");
  v8[0] = &unk_1E2F18EC0;
  v8[1] = &unk_1E2F18EF0;
  v7[2] = CFSTR("CIAttributeSliderMin");
  v7[3] = CFSTR("CIAttributeSliderMax");
  v8[2] = &unk_1E2F18EC0;
  v8[3] = &unk_1E2F18EF0;
  v7[4] = CFSTR("CIAttributeDefault");
  v7[5] = CFSTR("CIAttributeType");
  v8[4] = &unk_1E2F18EF0;
  v8[5] = CFSTR("CIAttributeTypeScalar");
  v15[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v14[6] = CFSTR("inputColor0");
  v5 = CFSTR("CIAttributeDefault");
  v6 = +[CIColor colorWithRed:green:blue:](CIColor, "colorWithRed:green:blue:", 1.0, 1.0, 1.0);
  v15[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1);
  v14[7] = CFSTR("inputColor1");
  v4 = +[CIColor colorWithRed:green:blue:](CIColor, "colorWithRed:green:blue:", 0.0, 0.0, 0.0, CFSTR("CIAttributeDefault"));
  v15[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 8);
}

- (id)outputImage
{
  float v3;
  float v4;
  int *v5;
  double v6;
  uint64_t v7;
  float v8;
  double v9;
  float v10;
  CIVector *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CIVector *v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CIColor *inputColor0;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputWidth, "floatValue");
  v4 = v3;
  v5 = &OBJC_IVAR___CICheckerboardGenerator_inputColor1;
  v6 = fabsf(v3);
  if (v6 <= 0.000001)
    v5 = &OBJC_IVAR___CICheckerboardGenerator_inputColor0;
  v7 = *(uint64_t *)((char *)&self->super.super.isa + *v5);
  -[NSNumber floatValue](self->inputSharpness, "floatValue");
  if (v6 > 0.000001)
    v9 = (float)(1.0 / (float)(v4 + v4));
  else
    v9 = 500000.0;
  v10 = 1.0 / (1.00001 - fminf(fmaxf(v8, 0.0), 1.0));
  v11 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v9, (float)(v10 + v10), (float)((float)(1.0 - v10) * 0.5));
  -[CIVector X](self->inputCenter, "X");
  v12 = 0.25 / v9;
  v14 = 0.25 / v9 + v13;
  -[CIVector Y](self->inputCenter, "Y");
  v16 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v14, v12 + v15);
  v17 = -[CICheckerboardGenerator _kernel](self, "_kernel");
  v18 = *MEMORY[0x1E0C9D5E0];
  v19 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v20 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v21 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  inputColor0 = self->inputColor0;
  v24[0] = v16;
  v24[1] = inputColor0;
  v24[2] = v7;
  v24[3] = v11;
  return (id)objc_msgSend(v17, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4), v18, v19, v20, v21);
}

- (CIVector)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
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

@end

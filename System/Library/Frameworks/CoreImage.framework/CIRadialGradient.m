@implementation CIRadialGradient

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_radialGradient);
}

+ (id)customAttributes
{
  _QWORD v3[2];
  _QWORD v4[2];
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[5];
  _QWORD v14[8];
  _QWORD v15[9];

  v15[8] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("CIAttributeFilterCategories");
  v13[0] = CFSTR("CICategoryGradient");
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
  v14[4] = CFSTR("inputRadius0");
  v9[0] = CFSTR("CIAttributeMin");
  v9[1] = CFSTR("CIAttributeSliderMin");
  v10[0] = &unk_1E2F19D00;
  v10[1] = &unk_1E2F19D00;
  v9[2] = CFSTR("CIAttributeSliderMax");
  v9[3] = CFSTR("CIAttributeDefault");
  v10[2] = &unk_1E2F19D10;
  v10[3] = &unk_1E2F19D20;
  v9[4] = CFSTR("CIAttributeType");
  v10[4] = CFSTR("CIAttributeTypeDistance");
  v15[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v14[5] = CFSTR("inputRadius1");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeSliderMin");
  v8[0] = &unk_1E2F19D00;
  v8[1] = &unk_1E2F19D00;
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeDefault");
  v8[2] = &unk_1E2F19D10;
  v8[3] = &unk_1E2F19D30;
  v7[4] = CFSTR("CIAttributeType");
  v8[4] = CFSTR("CIAttributeTypeDistance");
  v15[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v14[6] = CFSTR("inputColor0");
  v5[0] = CFSTR("CIAttributeDefault");
  v5[1] = CFSTR("CIAttributeType");
  v6[0] = +[CIColor colorWithRed:green:blue:](CIColor, "colorWithRed:green:blue:", 1.0, 1.0, 1.0);
  v6[1] = CFSTR("CIAttributeTypeColor");
  v15[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v14[7] = CFSTR("inputColor1");
  v3[1] = CFSTR("CIAttributeType");
  v4[0] = +[CIColor colorWithRed:green:blue:](CIColor, "colorWithRed:green:blue:", 0.0, 0.0, 0.0, CFSTR("CIAttributeDefault"));
  v4[1] = CFSTR("CIAttributeTypeColor");
  v15[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 8);
}

- (id)outputImage
{
  CIColor **p_inputColor0;
  double v4;
  double v5;
  float v7;
  float v8;
  float v9;
  float v10;
  CIColor **p_inputColor1;
  double v12;
  float v13;
  double v14;
  double v15;
  double v16;
  CIVector *v17;
  float v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  double v27;
  CIColor *v28;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  p_inputColor0 = &self->inputColor0;
  -[CIColor alpha](self->inputColor0, "alpha");
  if (v4 == 0.0)
  {
    -[CIColor alpha](self->inputColor1, "alpha");
    if (v5 == 0.0)
      return 0;
  }
  -[NSNumber floatValue](self->inputRadius0, "floatValue");
  v8 = v7;
  -[NSNumber floatValue](self->inputRadius1, "floatValue");
  v10 = v9;
  if (vabds_f32(v8, v9) < 0.001)
  {
    if (v8 <= v9)
      v8 = v8 + -0.001;
    else
      v10 = v9 + -0.001;
  }
  p_inputColor1 = p_inputColor0;
  if (v8 <= v10)
    p_inputColor1 = &self->inputColor1;
  -[CIColor alpha](*p_inputColor1, "alpha");
  v13 = v12;
  -[CIVector X](self->inputCenter, "X");
  v15 = v14;
  -[CIVector Y](self->inputCenter, "Y");
  v17 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v15, v16, (float)(1.0 / (float)(v10 - v8)), (float)((float)-v8 / (float)(v10 - v8)));
  if (v13 == 0.0)
  {
    v18 = fmaxf(fmaxf(v8, v10), 0.0);
    -[CIVector X](self->inputCenter, "X");
    v20 = v19;
    -[CIVector Y](self->inputCenter, "Y");
    v21 = v18;
    v22 = v20 - v18;
    v24 = v23 - v21;
    v25 = v21 + v21;
  }
  else
  {
    v25 = 1.79769313e308;
    v22 = -8.98846567e307;
    v24 = -8.98846567e307;
  }
  v26 = -[CIRadialGradient _kernel](self, "_kernel");
  if (v25 == 1.79769313e308 && v22 == -8.98846567e307)
  {
    v27 = v25;
    if (v24 == -8.98846567e307)
    {
      v25 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
      v27 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
      v22 = *MEMORY[0x1E0C9D5E0];
      v24 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
    }
  }
  else
  {
    v27 = v25;
  }
  v28 = *p_inputColor0;
  v29[0] = v17;
  v29[1] = v28;
  v29[2] = self->inputColor1;
  return (id)objc_msgSend(v26, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3), v22, v24, v25, v27);
}

- (CIVector)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputRadius0
{
  return self->inputRadius0;
}

- (void)setInputRadius0:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputRadius1
{
  return self->inputRadius1;
}

- (void)setInputRadius1:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (CIColor)inputColor0
{
  return self->inputColor0;
}

- (void)setInputColor0:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (CIColor)inputColor1
{
  return self->inputColor1;
}

- (void)setInputColor1:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

@end

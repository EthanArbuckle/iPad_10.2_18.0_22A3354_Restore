@implementation CIGaussianGradient

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_gaussianGradient);
}

+ (id)customAttributes
{
  _QWORD v3[2];
  _QWORD v4[2];
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[5];
  _QWORD v12[7];
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("CIAttributeFilterCategories");
  v11[0] = CFSTR("CICategoryGradient");
  v11[1] = CFSTR("CICategoryVideo");
  v11[2] = CFSTR("CICategoryStillImage");
  v11[3] = CFSTR("CICategoryHighDynamicRange");
  v11[4] = CFSTR("CICategoryBuiltIn");
  v13[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 5);
  v13[1] = CFSTR("5");
  v12[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v12[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v13[2] = CFSTR("10.4");
  v12[3] = CFSTR("inputCenter");
  v9[0] = CFSTR("CIAttributeDefault");
  v9[1] = CFSTR("CIAttributeType");
  v10[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 150.0, 150.0);
  v10[1] = CFSTR("CIAttributeTypePosition");
  v13[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v12[4] = CFSTR("inputRadius");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeSliderMin");
  v8[0] = &unk_1E2F19D00;
  v8[1] = &unk_1E2F19D00;
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeDefault");
  v8[2] = &unk_1E2F19D10;
  v8[3] = &unk_1E2F19D40;
  v7[4] = CFSTR("CIAttributeType");
  v8[4] = CFSTR("CIAttributeTypeDistance");
  v13[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v12[5] = CFSTR("inputColor0");
  v5[0] = CFSTR("CIAttributeDefault");
  v5[1] = CFSTR("CIAttributeType");
  v6[0] = +[CIColor colorWithRed:green:blue:alpha:](CIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
  v6[1] = CFSTR("CIAttributeTypeColor");
  v13[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v12[6] = CFSTR("inputColor1");
  v3[1] = CFSTR("CIAttributeType");
  v4[0] = +[CIColor colorWithRed:green:blue:alpha:](CIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0, CFSTR("CIAttributeDefault"));
  v4[1] = CFSTR("CIAttributeTypeColor");
  v13[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
}

- (id)outputImage
{
  float v3;
  double v4;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CIVector *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  double v26;
  CIColor *inputColor0;
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  v4 = v3;
  if (v3 < 0.01)
    return +[CIImage imageWithColor:](CIImage, "imageWithColor:", self->inputColor1);
  -[CIColor alpha](self->inputColor0, "alpha");
  if (v6 == 0.0)
  {
    -[CIColor alpha](self->inputColor1, "alpha");
    if (v7 == 0.0)
      return 0;
  }
  -[CIVector X](self->inputCenter, "X");
  v9 = v8;
  -[CIVector Y](self->inputCenter, "Y");
  v11 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v9, v10, 1.0 / v4);
  -[CIColor red](self->inputColor1, "red");
  v13 = v12;
  -[CIColor green](self->inputColor1, "green");
  v15 = v14;
  -[CIColor blue](self->inputColor1, "blue");
  v17 = v16;
  -[CIColor alpha](self->inputColor1, "alpha");
  if (fabs(v13) + fabs(v15) + fabs(v17) + fabs(v18) == 0.0)
  {
    -[CIVector X](self->inputCenter, "X");
    v20 = v19;
    -[CIVector Y](self->inputCenter, "Y");
    v21 = v20 - v4;
    v23 = v22 - v4;
    v24 = v4 + v4;
  }
  else
  {
    v24 = 1.79769313e308;
    v21 = -8.98846567e307;
    v23 = -8.98846567e307;
  }
  v25 = -[CIGaussianGradient _kernel](self, "_kernel");
  if (v24 == 1.79769313e308 && v21 == -8.98846567e307)
  {
    v26 = v24;
    if (v23 == -8.98846567e307)
    {
      v24 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
      v26 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
      v21 = *MEMORY[0x1E0C9D5E0];
      v23 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
    }
  }
  else
  {
    v26 = v24;
  }
  inputColor0 = self->inputColor0;
  v28[0] = v11;
  v28[1] = inputColor0;
  v28[2] = self->inputColor1;
  return (id)objc_msgSend(v25, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3), v21, v23, v24, v26);
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

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

@end

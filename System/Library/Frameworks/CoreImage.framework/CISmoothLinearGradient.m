@implementation CISmoothLinearGradient

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_smoothLinearGradient);
}

+ (id)customAttributes
{
  _QWORD v3[2];
  _QWORD v4[2];
  _QWORD v5[2];
  _QWORD v6[2];
  _QWORD v7[2];
  _QWORD v8[2];
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
  v13[1] = CFSTR("6");
  v12[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v12[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v13[2] = CFSTR("10.10");
  v12[3] = CFSTR("inputPoint0");
  v9[0] = CFSTR("CIAttributeDefault");
  v9[1] = CFSTR("CIAttributeType");
  v10[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 0.0, 0.0);
  v10[1] = CFSTR("CIAttributeTypePosition");
  v13[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v12[4] = CFSTR("inputPoint1");
  v7[0] = CFSTR("CIAttributeDefault");
  v7[1] = CFSTR("CIAttributeType");
  v8[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 200.0, 200.0);
  v8[1] = CFSTR("CIAttributeTypePosition");
  v13[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v12[5] = CFSTR("inputColor0");
  v5[0] = CFSTR("CIAttributeDefault");
  v5[1] = CFSTR("CIAttributeType");
  v6[0] = +[CIColor colorWithRed:green:blue:](CIColor, "colorWithRed:green:blue:", 1.0, 1.0, 1.0);
  v6[1] = CFSTR("CIAttributeTypeColor");
  v13[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v12[6] = CFSTR("inputColor1");
  v3[1] = CFSTR("CIAttributeType");
  v4[0] = +[CIColor colorWithRed:green:blue:](CIColor, "colorWithRed:green:blue:", 0.0, 0.0, 0.0, CFSTR("CIAttributeDefault"));
  v4[1] = CFSTR("CIAttributeTypeColor");
  v13[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
}

- (id)outputImage
{
  double v3;
  double v4;
  double v6;
  float64x2_t v7;
  float64_t v8;
  float32x2_t v9;
  double v10;
  float64x2_t v11;
  float64_t v12;
  float32x2_t v13;
  uint64_t v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CIVector *inputPoint1;
  CIColor *inputColor0;
  CIColor *inputColor1;
  float64_t v23;
  float64_t v24;
  _QWORD v25[6];

  v25[5] = *MEMORY[0x1E0C80C00];
  -[CIColor alpha](self->inputColor0, "alpha");
  if (v3 == 0.0)
  {
    -[CIColor alpha](self->inputColor1, "alpha");
    if (v4 == 0.0)
      return 0;
  }
  -[CIVector X](self->inputPoint0, "X");
  v23 = v6;
  -[CIVector Y](self->inputPoint0, "Y");
  v7.f64[0] = v23;
  v7.f64[1] = v8;
  v9 = vcvt_f32_f64(v7);
  -[CIVector X](self->inputPoint1, "X");
  v24 = v10;
  -[CIVector Y](self->inputPoint1, "Y");
  v11.f64[0] = v24;
  v11.f64[1] = v12;
  v13 = vsub_f32(vcvt_f32_f64(v11), v9);
  v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 / vaddv_f32(vmul_f32(v13, v13)));
  v15 = -[CISmoothLinearGradient _kernel](self, "_kernel");
  v16 = *MEMORY[0x1E0C9D5E0];
  v17 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v18 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v19 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  inputPoint1 = self->inputPoint1;
  inputColor0 = self->inputColor0;
  inputColor1 = self->inputColor1;
  v25[0] = self->inputPoint0;
  v25[1] = inputPoint1;
  v25[2] = inputColor0;
  v25[3] = inputColor1;
  v25[4] = v14;
  return (id)objc_msgSend(v15, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 5), v16, v17, v18, v19);
}

- (CIVector)inputPoint0
{
  return self->inputPoint0;
}

- (void)setInputPoint0:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIVector)inputPoint1
{
  return self->inputPoint1;
}

- (void)setInputPoint1:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CIColor)inputColor0
{
  return self->inputColor0;
}

- (void)setInputColor0:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (CIColor)inputColor1
{
  return self->inputColor1;
}

- (void)setInputColor1:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

@end

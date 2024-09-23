@implementation _CIScreenFilter

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[4];
  _QWORD v8[4];
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[4];
  _QWORD v12[7];
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("CIAttributeFilterCategories");
  v11[0] = CFSTR("CICategoryHalftoneEffect");
  v11[1] = CFSTR("CICategoryVideo");
  v11[2] = CFSTR("CICategoryStillImage");
  v11[3] = CFSTR("CICategoryBuiltIn");
  v13[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v13[1] = CFSTR("6");
  v12[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v12[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v13[2] = CFSTR("10.4");
  v12[3] = CFSTR("inputCenter");
  v9[0] = CFSTR("CIAttributeDefault");
  v9[1] = CFSTR("CIAttributeType");
  v10[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 150.0, 150.0);
  v10[1] = CFSTR("CIAttributeTypePosition");
  v13[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v12[4] = CFSTR("inputAngle");
  v7[0] = CFSTR("CIAttributeSliderMin");
  v7[1] = CFSTR("CIAttributeSliderMax");
  v8[0] = &unk_1E2F19DC0;
  v8[1] = &unk_1E2F19DD0;
  v7[2] = CFSTR("CIAttributeDefault");
  v7[3] = CFSTR("CIAttributeType");
  v8[2] = &unk_1E2F19DE0;
  v8[3] = CFSTR("CIAttributeTypeAngle");
  v13[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
  v12[5] = CFSTR("inputWidth");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F19DF0;
  v6[1] = &unk_1E2F19E00;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F19E10;
  v6[3] = &unk_1E2F19E20;
  v5[4] = CFSTR("CIAttributeType");
  v6[4] = CFSTR("CIAttributeTypeDistance");
  v13[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  v12[6] = CFSTR("inputSharpness");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeMax");
  v4[0] = &unk_1E2F19DE0;
  v4[1] = &unk_1E2F19DF0;
  v3[2] = CFSTR("CIAttributeSliderMin");
  v3[3] = CFSTR("CIAttributeSliderMax");
  v4[2] = &unk_1E2F19DE0;
  v4[3] = &unk_1E2F19DF0;
  v3[4] = CFSTR("CIAttributeDefault");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F19E30;
  v4[5] = CFSTR("CIAttributeTypeScalar");
  v13[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
}

- (id)_kernel
{
  return 0;
}

- (id)outputImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  __double2 v9;
  CIVector *v10;
  double v11;
  double v12;
  double v13;
  CIVector *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  -[NSNumber doubleValue](self->inputSharpness, "doubleValue");
  v4 = 1.0 / (1.0 - fmin(fmax(v3, 0.0), 0.99999));
  -[NSNumber doubleValue](self->inputAngle, "doubleValue");
  v6 = v5;
  -[NSNumber doubleValue](self->inputWidth, "doubleValue");
  v8 = 1.0 / v7;
  v9 = __sincos_stret(v6);
  v10 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v9.__cosval * v8, v9.__sinval * v8, -(v9.__sinval * v8));
  -[CIVector X](self->inputCenter, "X");
  v12 = v11;
  -[CIVector Y](self->inputCenter, "Y");
  v14 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v12, v13, v4);
  v15 = -[_CIScreenFilter _kernel](self, "_kernel");
  -[CIImage extent](self->inputImage, "extent");
  v21[0] = self->inputImage;
  v21[1] = v14;
  v21[2] = v10;
  return (id)objc_msgSend(v15, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3), v16, v17, v18, v19);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIVector)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputAngle
{
  return self->inputAngle;
}

- (void)setInputAngle:(id)a3
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

@implementation CINoiseReduction

- (id)_CINoiseReduction
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_noiseReduction);
}

- (id)outputImage
{
  float v3;
  float v4;
  float v5;
  float v6;
  double v7;
  double v8;
  CIVector *v9;
  CIVector *v10;
  CIVector *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CIImage *v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputSharpness, "floatValue");
  v4 = v3;
  -[NSNumber floatValue](self->inputNoiseLevel, "floatValue");
  if (v5 <= 0.0)
  {
    v7 = (float)-v4;
    v8 = 0.0;
  }
  else
  {
    v6 = (v4 + 1.0) / -0.0199999996;
    v7 = (float)-(float)(v4 + (float)(v6 * v5));
    v8 = v6 / 3.0;
  }
  v9 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v7, v8, (float)-v4);
  v10 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 1.2912, 1.2921);
  v11 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", 0.109088909, 0.114934928, 0.103904704);
  -[CIImage extent](self->inputImage, "extent");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = -[CIImage imageByClampingToExtent](self->inputImage, "imageByClampingToExtent");
  v21 = -[CINoiseReduction _CINoiseReduction](self, "_CINoiseReduction");
  v22 = *MEMORY[0x1E0C9D5E0];
  v23 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v24 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v25 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  v27[0] = v20;
  v27[1] = v10;
  v27[2] = v11;
  v27[3] = v9;
  return (id)objc_msgSend((id)objc_msgSend(v21, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_64, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4), v22, v23, v24, v25), "imageByCroppingToRect:", v13, v15, v17, v19);
}

double __31__CINoiseReduction_outputImage__block_invoke(double a1, double a2, double a3, double a4)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a1, -2.0, -2.0);
  return result;
}

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[4];
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("CIAttributeFilterCategories");
  v7[0] = CFSTR("CICategoryBlur");
  v7[1] = CFSTR("CICategoryVideo");
  v7[2] = CFSTR("CICategoryStillImage");
  v7[3] = CFSTR("CICategoryBuiltIn");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 4);
  v9[1] = CFSTR("9");
  v8[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v8[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v9[2] = CFSTR("10.4");
  v8[3] = CFSTR("inputSharpness");
  v5[0] = CFSTR("CIAttributeType");
  v5[1] = CFSTR("CIAttributeMin");
  v6[0] = CFSTR("CIAttributeTypeScalar");
  v6[1] = &unk_1E2F1AA80;
  v5[2] = CFSTR("CIAttributeSliderMin");
  v5[3] = CFSTR("CIAttributeSliderMax");
  v6[2] = &unk_1E2F1AA80;
  v6[3] = &unk_1E2F1AA90;
  v5[4] = CFSTR("CIAttributeDefault");
  v5[5] = CFSTR("CIAttributeIdentity");
  v6[4] = &unk_1E2F1AAA0;
  v6[5] = &unk_1E2F1AA80;
  v9[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v8[4] = CFSTR("inputNoiseLevel");
  v3[0] = CFSTR("CIAttributeType");
  v3[1] = CFSTR("CIAttributeMin");
  v4[0] = CFSTR("CIAttributeTypeScalar");
  v4[1] = &unk_1E2F1AA80;
  v3[2] = CFSTR("CIAttributeSliderMin");
  v3[3] = CFSTR("CIAttributeSliderMax");
  v4[2] = &unk_1E2F1AA80;
  v4[3] = &unk_1E2F1AAB0;
  v3[4] = CFSTR("CIAttributeDefault");
  v3[5] = CFSTR("CIAttributeIdentity");
  v4[4] = &unk_1E2F1AAC0;
  v4[5] = &unk_1E2F1AA80;
  v9[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputNoiseLevel
{
  return self->inputNoiseLevel;
}

- (void)setInputNoiseLevel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputSharpness
{
  return self->inputSharpness;
}

- (void)setInputSharpness:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end

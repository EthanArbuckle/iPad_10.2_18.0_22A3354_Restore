@implementation CIVignetteEffect

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[7];
  _QWORD v6[7];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[8];

  v11[6] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("CIAttributeFilterCategories");
  v9[0] = CFSTR("CICategoryColorEffect");
  v9[1] = CFSTR("CICategoryVideo");
  v9[2] = CFSTR("CICategoryInterlaced");
  v9[3] = CFSTR("CICategoryStillImage");
  v9[4] = CFSTR("CICategoryHighDynamicRange");
  v9[5] = CFSTR("CICategoryBuiltIn");
  v11[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 6);
  v11[1] = CFSTR("7");
  v10[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v10[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v11[2] = CFSTR("10.9");
  v10[3] = CFSTR("inputRadius");
  v7[0] = CFSTR("CIAttributeSliderMin");
  v7[1] = CFSTR("CIAttributeSliderMax");
  v8[0] = &unk_1E2F1B1A0;
  v8[1] = &unk_1E2F1B1C0;
  v7[2] = CFSTR("CIAttributeMin");
  v7[3] = CFSTR("CIAttributeDefault");
  v8[2] = &unk_1E2F1B1A0;
  v8[3] = &unk_1E2F1B1D0;
  v7[4] = CFSTR("CIAttributeType");
  v8[4] = CFSTR("CIAttributeTypeDistance");
  v11[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v10[4] = CFSTR("inputIntensity");
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
  v6[4] = &unk_1E2F1B190;
  v6[5] = &unk_1E2F1B1A0;
  v5[6] = CFSTR("CIAttributeType");
  v6[6] = CFSTR("CIAttributeTypeScalar");
  v11[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 7);
  v10[5] = CFSTR("inputFalloff");
  v3[0] = CFSTR("CIAttributeSliderMin");
  v3[1] = CFSTR("CIAttributeSliderMax");
  v4[0] = &unk_1E2F1B1A0;
  v4[1] = &unk_1E2F1B190;
  v3[2] = CFSTR("CIAttributeMin");
  v3[3] = CFSTR("CIAttributeMax");
  v4[2] = &unk_1E2F1B1A0;
  v4[3] = &unk_1E2F1B190;
  v3[4] = CFSTR("CIAttributeDefault");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F1B1E0;
  v4[5] = CFSTR("CIAttributeTypeScalar");
  v11[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
}

- (BOOL)_isIdentity
{
  double v2;

  -[NSNumber doubleValue](self->inputIntensity, "doubleValue");
  return fabs(v2) < 0.01;
}

- (id)_poskernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_vignetteeffect);
}

- (id)_negkernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_vignetteeffectneg);
}

- (id)outputImage
{
  double v4;
  double v5;
  double v6;
  CIVector *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CIVector *v17;
  void *v18;
  _QWORD *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CIVector *inputCenter;
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  if (-[CIVignetteEffect _isIdentity](self, "_isIdentity"))
    return self->inputImage;
  -[NSNumber doubleValue](self->inputIntensity, "doubleValue");
  v5 = fmin(fmax(v4, -1.0), 1.0);
  -[NSNumber doubleValue](self->inputFalloff, "doubleValue");
  -[NSNumber doubleValue](self->inputRadius, "doubleValue");
  v7 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 1.0 / fmax(v6, 0.001));
  if (v5 >= 0.0)
  {
    v8 = -[CIVignetteEffect _poskernel](self, "_poskernel");
    -[CIImage extent](self->inputImage, "extent");
    v10 = v20;
    v12 = v21;
    v14 = v22;
    v16 = v23;
    inputCenter = self->inputCenter;
    v26[0] = self->inputImage;
    v26[1] = inputCenter;
    v26[2] = v7;
    v18 = (void *)MEMORY[0x1E0C99D20];
    v19 = v26;
  }
  else
  {
    v8 = -[CIVignetteEffect _negkernel](self, "_negkernel");
    -[CIImage extent](self->inputImage, "extent");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v17 = self->inputCenter;
    v25[0] = self->inputImage;
    v25[1] = v17;
    v25[2] = v7;
    v18 = (void *)MEMORY[0x1E0C99D20];
    v19 = v25;
  }
  return (id)objc_msgSend(v8, "applyWithExtent:arguments:", objc_msgSend(v18, "arrayWithObjects:count:", v19, 3), v10, v12, v14, v16);
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

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputIntensity
{
  return self->inputIntensity;
}

- (void)setInputIntensity:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSNumber)inputFalloff
{
  return self->inputFalloff;
}

- (void)setInputFalloff:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

@end

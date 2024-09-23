@implementation CIModTransition

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[4];
  _QWORD v8[4];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[4];
  _QWORD v14[8];
  _QWORD v15[9];

  v15[8] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("CIAttributeFilterCategories");
  v13[0] = CFSTR("CICategoryTransition");
  v13[1] = CFSTR("CICategoryVideo");
  v13[2] = CFSTR("CICategoryStillImage");
  v13[3] = CFSTR("CICategoryBuiltIn");
  v15[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 4);
  v15[1] = CFSTR("6");
  v14[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v14[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v15[2] = CFSTR("10.4");
  v14[3] = CFSTR("inputColor");
  v11[0] = CFSTR("CIAttributeDefault");
  v11[1] = CFSTR("CIAttributeType");
  v12[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 150.0, 150.0);
  v12[1] = CFSTR("CIAttributeTypePosition");
  v15[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v14[4] = CFSTR("inputTime");
  v9[0] = CFSTR("CIAttributeMin");
  v9[1] = CFSTR("CIAttributeSliderMin");
  v10[0] = &unk_1E2F1A370;
  v10[1] = &unk_1E2F1A370;
  v9[2] = CFSTR("CIAttributeSliderMax");
  v9[3] = CFSTR("CIAttributeDefault");
  v10[2] = &unk_1E2F1A380;
  v10[3] = &unk_1E2F1A370;
  v9[4] = CFSTR("CIAttributeType");
  v10[4] = CFSTR("CIAttributeTypeTime");
  v15[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v14[5] = CFSTR("inputAngle");
  v7[0] = CFSTR("CIAttributeSliderMin");
  v7[1] = CFSTR("CIAttributeSliderMax");
  v8[0] = &unk_1E2F1A390;
  v8[1] = &unk_1E2F1A3A0;
  v7[2] = CFSTR("CIAttributeDefault");
  v7[3] = CFSTR("CIAttributeType");
  v8[2] = &unk_1E2F1A3B0;
  v8[3] = CFSTR("CIAttributeTypeAngle");
  v15[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
  v14[6] = CFSTR("inputRadius");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F1A380;
  v6[1] = &unk_1E2F1A380;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F1A3C0;
  v6[3] = &unk_1E2F1A3D0;
  v5[4] = CFSTR("CIAttributeType");
  v6[4] = CFSTR("CIAttributeTypeDistance");
  v15[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  v14[7] = CFSTR("inputCompression");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F1A380;
  v4[1] = &unk_1E2F1A3E0;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F1A3F0;
  v4[3] = &unk_1E2F1A400;
  v3[4] = CFSTR("CIAttributeType");
  v4[4] = CFSTR("CIAttributeTypeDistance");
  v15[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 8);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_modTransition);
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
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double x;
  double y;
  double width;
  double height;
  CIVector *v27;
  __float2 v28;
  CIVector *v29;
  CIVector *v30;
  CIVector *v31;
  id v32;
  CIImage *inputTargetImage;
  _QWORD v35[8];
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v35[7] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage || !self->inputTargetImage)
    return 0;
  -[NSNumber floatValue](self->inputAngle, "floatValue");
  v4 = v3;
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  v6 = v5;
  -[NSNumber floatValue](self->inputCompression, "floatValue");
  v8 = v7;
  -[NSNumber floatValue](self->inputTime, "floatValue");
  v10 = v9;
  -[CIImage extent](self->inputImage, "extent");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[CIImage extent](self->inputTargetImage, "extent");
  v38.origin.x = v19;
  v38.origin.y = v20;
  v38.size.width = v21;
  v38.size.height = v22;
  v36.origin.x = v12;
  v36.origin.y = v14;
  v36.size.width = v16;
  v36.size.height = v18;
  v37 = CGRectUnion(v36, v38);
  x = v37.origin.x;
  y = v37.origin.y;
  width = v37.size.width;
  height = v37.size.height;
  *(float *)&v37.origin.x = v10 * 1.47303709;
  v27 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", (float)(17.0 / *(float *)&v37.origin.x), -16.5, 1.0 / v8, (float)(v8 * 1.1738));
  v28 = __sincosf_stret((float)(v10 * (float)(v4 + -0.7854)) + 0.7854);
  v29 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", (float)(v28.__cosval / v6), (float)(v28.__sinval / v6), (float)((float)-v28.__sinval / v6));
  v30 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", -0.643644094, 1.17377448, 1.5536536, -1.32363904);
  v31 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.643644094, 0.530130386, -1.5536536, 2.32363892);
  v32 = -[CIModTransition _kernel](self, "_kernel");
  inputTargetImage = self->inputTargetImage;
  v35[0] = self->inputImage;
  v35[1] = inputTargetImage;
  v35[2] = self->inputCenter;
  v35[3] = v27;
  v35[4] = v29;
  v35[5] = v30;
  v35[6] = v31;
  return (id)objc_msgSend(v32, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 7), x, y, width, height);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIImage)inputTargetImage
{
  return self->inputTargetImage;
}

- (void)setInputTargetImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CIVector)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputTime
{
  return self->inputTime;
}

- (void)setInputTime:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSNumber)inputAngle
{
  return self->inputAngle;
}

- (void)setInputAngle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (NSNumber)inputCompression
{
  return self->inputCompression;
}

- (void)setInputCompression:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

@end

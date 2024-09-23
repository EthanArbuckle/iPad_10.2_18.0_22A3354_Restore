@implementation CITileFilter

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[4];
  _QWORD v10[6];
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("CIAttributeFilterCategories");
  v9[0] = CFSTR("CICategoryTileEffect");
  v9[1] = CFSTR("CICategoryVideo");
  v9[2] = CFSTR("CICategoryStillImage");
  v9[3] = CFSTR("CICategoryBuiltIn");
  v11[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v11[1] = CFSTR("6");
  v10[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v10[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v11[2] = CFSTR("10.5");
  v10[3] = CFSTR("inputCenter");
  v7[0] = CFSTR("CIAttributeDefault");
  v7[1] = CFSTR("CIAttributeType");
  v8[0] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 150.0, 150.0);
  v8[1] = CFSTR("CIAttributeTypePosition");
  v11[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v10[4] = CFSTR("inputAngle");
  v5[0] = CFSTR("CIAttributeSliderMin");
  v5[1] = CFSTR("CIAttributeSliderMax");
  v6[0] = &unk_1E2F1A970;
  v6[1] = &unk_1E2F1A980;
  v5[2] = CFSTR("CIAttributeDefault");
  v5[3] = CFSTR("CIAttributeIdentity");
  v6[2] = &unk_1E2F1A990;
  v6[3] = &unk_1E2F1A990;
  v5[4] = CFSTR("CIAttributeType");
  v6[4] = CFSTR("CIAttributeTypeAngle");
  v11[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  v10[5] = CFSTR("inputWidth");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F1A990;
  v4[1] = &unk_1E2F1A9A0;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F1A9B0;
  v4[3] = &unk_1E2F1A9C0;
  v3[4] = CFSTR("CIAttributeIdentity");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F1A9C0;
  v4[5] = CFSTR("CIAttributeTypeDistance");
  v11[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
}

- (id)_kernel
{
  return 0;
}

- (id)_croppedCenterPixelImage
{
  double v3;
  float64x2_t v4;
  float64_t v5;
  float64_t v7;

  -[CIVector X](self->inputCenter, "X");
  v7 = v3;
  -[CIVector Y](self->inputCenter, "Y");
  v4.f64[0] = v7;
  v4.f64[1] = v5;
  *(float32x2_t *)&v4.f64[0] = vrndm_f32(vcvt_f32_f64(v4));
  return -[CIImage imageByClampingToExtent](-[CIImage imageByCroppingToRect:](self->inputImage, "imageByCroppingToRect:", *(float *)v4.f64, *((float *)v4.f64 + 1), 1.0, 1.0), "imageByClampingToExtent");
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

@end

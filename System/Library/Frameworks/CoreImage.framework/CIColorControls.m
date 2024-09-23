@implementation CIColorControls

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[7];
  _QWORD v10[6];
  _QWORD v11[8];

  v11[6] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("CIAttributeFilterCategories");
  v9[0] = CFSTR("CICategoryColorAdjustment");
  v9[1] = CFSTR("CICategoryVideo");
  v9[2] = CFSTR("CICategoryStillImage");
  v9[3] = CFSTR("CICategoryInterlaced");
  v9[4] = CFSTR("CICategoryNonSquarePixels");
  v9[5] = CFSTR("CICategoryHighDynamicRange");
  v9[6] = CFSTR("CICategoryBuiltIn");
  v11[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 7);
  v11[1] = CFSTR("5");
  v10[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v10[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v11[2] = CFSTR("10.4");
  v10[3] = CFSTR("inputSaturation");
  v7[0] = CFSTR("CIAttributeMin");
  v7[1] = CFSTR("CIAttributeSliderMin");
  v8[0] = &unk_1E2F18FF0;
  v8[1] = &unk_1E2F18FF0;
  v7[2] = CFSTR("CIAttributeSliderMax");
  v7[3] = CFSTR("CIAttributeDefault");
  v8[2] = &unk_1E2F19000;
  v8[3] = &unk_1E2F19010;
  v7[4] = CFSTR("CIAttributeIdentity");
  v7[5] = CFSTR("CIAttributeType");
  v8[4] = &unk_1E2F19010;
  v8[5] = CFSTR("CIAttributeTypeScalar");
  v11[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v10[4] = CFSTR("inputBrightness");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeSliderMin");
  v6[0] = &unk_1E2F19020;
  v6[1] = &unk_1E2F19020;
  v5[2] = CFSTR("CIAttributeSliderMax");
  v5[3] = CFSTR("CIAttributeDefault");
  v6[2] = &unk_1E2F19010;
  v6[3] = &unk_1E2F18FF0;
  v5[4] = CFSTR("CIAttributeIdentity");
  v5[5] = CFSTR("CIAttributeType");
  v6[4] = &unk_1E2F18FF0;
  v6[5] = CFSTR("CIAttributeTypeScalar");
  v11[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v10[5] = CFSTR("inputContrast");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F18FF0;
  v4[1] = &unk_1E2F19030;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F19040;
  v4[3] = &unk_1E2F19010;
  v3[4] = CFSTR("CIAttributeIdentity");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F19010;
  v4[5] = CFSTR("CIAttributeTypeScalar");
  v11[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
}

- (id)outputImage
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  double v8;
  double v9;
  BOOL v10;

  if (!self->inputImage)
    return 0;
  -[NSNumber floatValue](self->inputSaturation, "floatValue");
  v4 = v3;
  -[NSNumber floatValue](self->inputContrast, "floatValue");
  v6 = v5;
  -[NSNumber floatValue](self->inputBrightness, "floatValue");
  v10 = v4 == 1.0 && v6 == 1.0;
  if (v10 && v7 == 0.0)
    return self->inputImage;
  *(float *)&v8 = v6 - (float)(v4 * v6);
  *(float *)&v9 = (float)(v7 + 0.5) + (float)(v6 * -0.5);
  return _imageByApplyingColorMatrix(self->inputImage, (float)(v4 * v6) + (float)(*(float *)&v8 * 0.2125), *(float *)&v8 * 0.7154, *(float *)&v8 * 0.0721, *(float *)&v8 * 0.2125, (float)(v4 * v6) + (float)(*(float *)&v8 * 0.7154), *(float *)&v8 * 0.0721, v8, v9, *(float *)&v8 * 0.2125, *(float *)&v8 * 0.7154, (float)(v4 * v6) + (float)(*(float *)&v8 * 0.0721), *(float *)&v9, *(float *)&v9, *(float *)&v9);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputSaturation
{
  return self->inputSaturation;
}

- (void)setInputSaturation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputBrightness
{
  return self->inputBrightness;
}

- (void)setInputBrightness:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputContrast
{
  return self->inputContrast;
}

- (void)setInputContrast:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

@end

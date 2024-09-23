@implementation CIPaperWash

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[4];
  _QWORD v6[4];
  _QWORD v7[5];
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("CIAttributeFilterCategories");
  v7[0] = CFSTR("CICategoryColorEffect");
  v7[1] = CFSTR("CICategoryNonSquarePixels");
  v7[2] = CFSTR("CICategoryStillImage");
  v7[3] = CFSTR("CICategoryBuiltIn");
  v7[4] = CFSTR("CICategoryApplePrivate");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 5);
  v8[1] = CFSTR("inputGreyscale");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeMax");
  v6[0] = MEMORY[0x1E0C9AAA0];
  v6[1] = MEMORY[0x1E0C9AAB0];
  v5[2] = CFSTR("CIAttributeDefault");
  v5[3] = CFSTR("CIAttributeType");
  v6[2] = MEMORY[0x1E0C9AAA0];
  v6[3] = CFSTR("CIAttributeTypeBoolean");
  v9[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
  v8[2] = CFSTR("inputSaturation");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F195B0;
  v4[1] = &unk_1E2F195B0;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeMax");
  v4[2] = &unk_1E2F195E0;
  v4[3] = &unk_1E2F195E0;
  v3[4] = CFSTR("CIAttributeDefault");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F195E0;
  v4[5] = CFSTR("CIAttributeTypeScalar");
  v9[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
}

- (id)outputImage
{
  CIImage *inputImage;
  CIImage *v4;
  double v5;
  float v6;
  _QWORD v8[3];
  _QWORD v9[3];
  _QWORD v10[3];
  _QWORD v11[3];
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  v12 = CFSTR("inputAmount");
  v13[0] = &unk_1E2F1D948;
  v4 = -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", CFSTR("CIDocumentEnhancer"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1));
  -[NSNumber floatValue](self->inputSaturation, "floatValue");
  v6 = fminf(fmaxf(*(float *)&v5, 0.0), 1.0);
  if (v6 < 1.0)
  {
    v10[0] = CFSTR("inputSaturation");
    *(float *)&v5 = v6;
    v11[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v11[1] = &unk_1E2F195F0;
    v10[1] = CFSTR("inputBrightness");
    v10[2] = CFSTR("inputContrast");
    v11[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (float)(1.0 - v6) * 0.35 + 1.0);
    v4 = -[CIImage imageByApplyingFilter:withInputParameters:](v4, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorControls"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3));
  }
  if (-[NSNumber BOOLValue](self->inputGreyscale, "BOOLValue"))
  {
    v8[0] = CFSTR("inputSaturation");
    v8[1] = CFSTR("inputBrightness");
    v9[0] = &unk_1E2F195B0;
    v9[1] = &unk_1E2F1D9B8;
    v8[2] = CFSTR("inputContrast");
    v9[2] = &unk_1E2F1D9C8;
    return -[CIImage imageByApplyingFilter:withInputParameters:](v4, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorControls"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3));
  }
  return v4;
}

- (NSNumber)inputSaturation
{
  return self->inputSaturation;
}

- (void)setInputSaturation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)inputGreyscale
{
  return self->inputGreyscale;
}

- (void)setInputGreyscale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

@end

@implementation CILocalLightMapPrepare

+ (id)customAttributes
{
  _QWORD v3[4];
  _QWORD v4[4];
  _QWORD v5[4];
  _QWORD v6[4];
  _QWORD v7[3];
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("CIAttributeFilterCategories");
  v7[0] = CFSTR("CICategoryColorAdjustment");
  v7[1] = CFSTR("CICategoryStillImage");
  v7[2] = CFSTR("CICategoryApplePrivate");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v8[1] = CFSTR("inputLightMapWidth");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeDefault");
  v6[0] = &unk_1E2F1A1D0;
  v6[1] = &unk_1E2F1A1D0;
  v5[2] = CFSTR("CIAttributeType");
  v5[3] = CFSTR("CIAttributeClass");
  v6[2] = CFSTR("CIAttributeTypeDistance");
  v6[3] = CFSTR("NSNumber");
  v9[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
  v8[2] = CFSTR("inputLightMapHeight");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeDefault");
  v4[0] = &unk_1E2F1A1D0;
  v4[1] = &unk_1E2F1A1D0;
  v3[2] = CFSTR("CIAttributeType");
  v3[3] = CFSTR("CIAttributeClass");
  v4[2] = CFSTR("CIAttributeTypeDistance");
  v4[3] = CFSTR("NSNumber");
  v9[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
}

- (id)outputImage
{
  id result;
  CIImage *inputGuideImage;

  result = self->inputLightMap;
  if (result)
  {
    result = _lightMapImageFromData((NSData *)result, self->inputLightMapWidth, self->inputLightMapHeight);
    inputGuideImage = self->inputGuideImage;
    if (inputGuideImage)
      return _scaledLightMapImage((CIImage *)result, inputGuideImage);
  }
  return result;
}

@end

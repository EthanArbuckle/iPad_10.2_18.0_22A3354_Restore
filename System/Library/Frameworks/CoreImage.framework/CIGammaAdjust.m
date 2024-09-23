@implementation CIGammaAdjust

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[7];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryColorAdjustment");
  v5[1] = CFSTR("CICategoryVideo");
  v5[2] = CFSTR("CICategoryStillImage");
  v5[3] = CFSTR("CICategoryInterlaced");
  v5[4] = CFSTR("CICategoryNonSquarePixels");
  v5[5] = CFSTR("CICategoryHighDynamicRange");
  v5[6] = CFSTR("CICategoryBuiltIn");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 7);
  v7[1] = CFSTR("5");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.4");
  v6[3] = CFSTR("inputPower");
  v3[0] = CFSTR("CIAttributeSliderMin");
  v3[1] = CFSTR("CIAttributeSliderMax");
  v4[0] = &unk_1E2F19C60;
  v4[1] = &unk_1E2F19C70;
  v3[2] = CFSTR("CIAttributeDefault");
  v3[3] = CFSTR("CIAttributeIdentity");
  v4[2] = &unk_1E2F19C80;
  v4[3] = &unk_1E2F19C80;
  v3[4] = CFSTR("CIAttributeType");
  v4[4] = CFSTR("CIAttributeTypeScalar");
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

- (BOOL)_isIdentity
{
  double v2;

  -[NSNumber doubleValue](self->inputPower, "doubleValue");
  return fabs(v2 + -1.0) < 0.01;
}

- (id)outputImage
{
  _BOOL4 v3;
  CIImage *inputImage;

  if (!self->inputImage)
    return 0;
  v3 = -[CIGammaAdjust _isIdentity](self, "_isIdentity");
  inputImage = self->inputImage;
  if (v3)
    return inputImage;
  -[NSNumber doubleValue](self->inputPower, "doubleValue");
  return -[CIImage _imageByApplyingGamma:](inputImage, "_imageByApplyingGamma:");
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputPower
{
  return self->inputPower;
}

- (void)setInputPower:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end

@implementation CIExposureAdjust

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[8];
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
  v5[7] = CFSTR("CICategoryXMPSerializable");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 8);
  v7[1] = CFSTR("5");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.4");
  v6[3] = CFSTR("inputEV");
  v3[0] = CFSTR("CIAttributeSliderMin");
  v3[1] = CFSTR("CIAttributeSliderMax");
  v4[0] = &unk_1E2F19AD0;
  v4[1] = &unk_1E2F19AE0;
  v3[2] = CFSTR("CIAttributeDefault");
  v3[3] = CFSTR("CIAttributeIdentity");
  v4[2] = &unk_1E2F19AF0;
  v4[3] = &unk_1E2F19AF0;
  v3[4] = CFSTR("CIAttributeType");
  v4[4] = CFSTR("CIAttributeTypeScalar");
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

- (BOOL)_isIdentity
{
  double v2;

  -[NSNumber doubleValue](self->inputEV, "doubleValue");
  return fabs(v2) < 0.001;
}

- (id)outputImage
{
  double v3;
  long double v4;
  double v5;
  double v7;

  if (!self->inputImage)
    return 0;
  -[NSNumber doubleValue](self->inputEV, "doubleValue");
  v4 = v3;
  -[NSNumber doubleValue](self->inputEV, "doubleValue");
  if (fabs(v5) < 0.001)
    return self->inputImage;
  v7 = exp2(v4);
  return -[CIImage filteredImage:keysAndValues:](self->inputImage, "filteredImage:keysAndValues:", CFSTR("CIColorMatrix"), CFSTR("inputRVector"), +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v7, 0.0, 0.0), CFSTR("inputGVector"), +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", 0.0, v7, 0.0), CFSTR("inputBVector"), +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", 0.0, 0.0, v7), CFSTR("inputAVector"), +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 1.0), CFSTR("inputBiasVector"), +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", 0.0, 0.0, 0.0), 0);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputEV
{
  return self->inputEV;
}

- (void)setInputEV:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end

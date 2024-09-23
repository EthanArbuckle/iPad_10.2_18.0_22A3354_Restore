@implementation CIOpacity

+ (id)customAttributes
{
  uint64_t v2;
  _QWORD v4[7];
  _QWORD v5[7];
  _QWORD v6[7];
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("CIAttributeFilterCategories");
  v6[0] = CFSTR("CICategoryColorAdjustment");
  v6[1] = CFSTR("CICategoryVideo");
  v6[2] = CFSTR("CICategoryStillImage");
  v6[3] = CFSTR("CICategoryInterlaced");
  v6[4] = CFSTR("CICategoryNonSquarePixels");
  v6[5] = CFSTR("CICategoryBuiltIn");
  v6[6] = CFSTR("CICategoryApplePrivate");
  v2 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 7);
  v7[1] = CFSTR("inputOpacity");
  v8[0] = v2;
  v4[0] = CFSTR("CIAttributeSliderMin");
  v4[1] = CFSTR("CIAttributeSliderMax");
  v5[0] = &unk_1E2F1A540;
  v5[1] = &unk_1E2F1A550;
  v4[2] = CFSTR("CIAttributeMin");
  v4[3] = CFSTR("CIAttributeMax");
  v5[2] = &unk_1E2F1A540;
  v5[3] = &unk_1E2F1A550;
  v4[4] = CFSTR("CIAttributeDefault");
  v4[5] = CFSTR("CIAttributeIdentity");
  v5[4] = &unk_1E2F1A550;
  v5[5] = &unk_1E2F1A540;
  v4[6] = CFSTR("CIAttributeType");
  v5[6] = CFSTR("CIAttributeTypeScalar");
  v8[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 7);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
}

- (id)outputImage
{
  float v3;

  if (!self->inputImage)
    return 0;
  -[NSNumber floatValue](self->inputOpacity, "floatValue");
  if (v3 == 1.0)
    return self->inputImage;
  if (v3 == 0.0)
    return +[CIImage nullImage](CIImage, "nullImage");
  return -[CIImage filteredImage:keysAndValues:](self->inputImage, "filteredImage:keysAndValues:", CFSTR("CIColorMatrix"), CFSTR("inputAVector"), +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, v3), 0);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputOpacity
{
  return self->inputOpacity;
}

- (void)setInputOpacity:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end

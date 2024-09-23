@implementation CIDisplacementDistortion

- (id)_CIDisplaceFromImage
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_displaceFromImage);
}

- (id)outputImage
{
  float v3;
  id v4;
  CIImage *inputDisplacementImage;
  double v6;
  double v7;
  double v8;
  double v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputScale, "floatValue");
  if (fabsf(v3) < 0.001 || !self->inputDisplacementImage)
    return self->inputImage;
  v4 = -[CIDisplacementDistortion _CIDisplaceFromImage](self, "_CIDisplaceFromImage");
  -[CIImage extent](self->inputImage, "extent");
  inputDisplacementImage = self->inputDisplacementImage;
  v11[0] = self->inputImage;
  v11[1] = inputDisplacementImage;
  v11[2] = self->inputScale;
  return (id)objc_msgSend(v4, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_19, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3), v6, v7, v8, v9);
}

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[4];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryDistortionEffect");
  v5[1] = CFSTR("CICategoryVideo");
  v5[2] = CFSTR("CICategoryStillImage");
  v5[3] = CFSTR("CICategoryBuiltIn");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v7[1] = CFSTR("9");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.4");
  v6[3] = CFSTR("inputScale");
  v3[0] = CFSTR("CIAttributeType");
  v3[1] = CFSTR("CIAttributeMin");
  v4[0] = CFSTR("CIAttributeTypeDistance");
  v4[1] = &unk_1E2F19560;
  v3[2] = CFSTR("CIAttributeSliderMin");
  v3[3] = CFSTR("CIAttributeSliderMax");
  v4[2] = &unk_1E2F19560;
  v4[3] = &unk_1E2F19570;
  v3[4] = CFSTR("CIAttributeDefault");
  v3[5] = CFSTR("CIAttributeIdentity");
  v4[4] = &unk_1E2F19580;
  v4[5] = &unk_1E2F19560;
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIImage)inputDisplacementImage
{
  return self->inputDisplacementImage;
}

- (void)setInputDisplacementImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end

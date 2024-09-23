@implementation CISkyAndGrassAdjust

+ (id)customAttributes
{
  _QWORD v3[7];
  _QWORD v4[7];
  _QWORD v5[7];
  _QWORD v6[7];
  _QWORD v7[7];
  _QWORD v8[3];
  _QWORD v9[5];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("CIAttributeFilterCategories");
  v7[0] = CFSTR("CICategoryColorAdjustment");
  v7[1] = CFSTR("CICategoryVideo");
  v7[2] = CFSTR("CICategoryStillImage");
  v7[3] = CFSTR("CICategoryInterlaced");
  v7[4] = CFSTR("CICategoryNonSquarePixels");
  v7[5] = CFSTR("CICategoryBuiltIn");
  v7[6] = CFSTR("CICategoryApplePrivate");
  v9[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 7);
  v8[1] = CFSTR("inputSkyAmount");
  v5[0] = CFSTR("CIAttributeMin");
  v5[1] = CFSTR("CIAttributeMax");
  v6[0] = &unk_1E2F1AB70;
  v6[1] = &unk_1E2F1AB80;
  v5[2] = CFSTR("CIAttributeSliderMin");
  v5[3] = CFSTR("CIAttributeSliderMax");
  v6[2] = &unk_1E2F1AB70;
  v6[3] = &unk_1E2F1AB80;
  v5[4] = CFSTR("CIAttributeDefault");
  v5[5] = CFSTR("CIAttributeIdentity");
  v6[4] = &unk_1E2F1AB90;
  v6[5] = &unk_1E2F1AB90;
  v5[6] = CFSTR("CIAttributeType");
  v6[6] = CFSTR("CIAttributeTypeScalar");
  v9[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 7);
  v8[2] = CFSTR("inputGrassAmount");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeMax");
  v4[0] = &unk_1E2F1AB90;
  v4[1] = &unk_1E2F1ABA0;
  v3[2] = CFSTR("CIAttributeSliderMin");
  v3[3] = CFSTR("CIAttributeSliderMax");
  v4[2] = &unk_1E2F1AB90;
  v4[3] = &unk_1E2F1ABA0;
  v3[4] = CFSTR("CIAttributeDefault");
  v3[5] = CFSTR("CIAttributeIdentity");
  v4[4] = &unk_1E2F1AB80;
  v4[5] = &unk_1E2F1AB80;
  v3[6] = CFSTR("CIAttributeType");
  v4[6] = CFSTR("CIAttributeTypeScalar");
  v9[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 7);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_grassAndSkyAdjust);
}

- (id)outputImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  CIVector *v8;
  CIImage *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  -[NSNumber doubleValue](self->inputSkyAmount, "doubleValue");
  v4 = fmin(fmax(v3, -1.0), 1.0);
  -[NSNumber doubleValue](self->inputGrassAmount, "doubleValue");
  v6 = fmin(fmax(v5, 0.0), 4.0);
  if (v4 > -0.05 && v4 < 0.05 && v6 > 0.95 && v6 < 1.05)
    return self->inputImage;
  v8 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v6, v4);
  v9 = -[CIImage imageByUnpremultiplyingAlpha](self->inputImage, "imageByUnpremultiplyingAlpha");
  v10 = -[CISkyAndGrassAdjust _kernel](self, "_kernel");
  -[CIImage extent](v9, "extent");
  v15[0] = v9;
  v15[1] = v8;
  return (id)objc_msgSend((id)objc_msgSend(v10, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2), v11, v12, v13, v14), "imageByPremultiplyingAlpha");
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputSkyAmount
{
  return self->inputSkyAmount;
}

- (void)setInputSkyAmount:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputGrassAmount
{
  return self->inputGrassAmount;
}

- (void)setInputGrassAmount:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

@end

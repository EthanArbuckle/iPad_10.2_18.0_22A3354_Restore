@implementation CIPointillize

- (id)_CIPointillize
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_pointillize);
}

- (id)outputImage
{
  float v3;
  double v4;
  float v5;
  double v6;
  float v7;
  double v8;
  float v9;
  double x;
  double y;
  double width;
  double height;
  id v14;
  _QWORD v16[4];
  float v17;
  _QWORD v18[4];
  CGRect v19;
  CGRect v20;

  v18[3] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  v4 = round(v3 * 0.5);
  v5 = v4 + v4;
  -[CIVector X](self->inputCenter, "X");
  v7 = round(v6);
  -[CIVector Y](self->inputCenter, "Y");
  v9 = round(v8);
  -[CIImage extent](self->inputImage, "extent");
  v20 = CGRectInset(v19, v5 * -1.5, v5 * -1.5);
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  v14 = -[CIPointillize _CIPointillize](self, "_CIPointillize");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __28__CIPointillize_outputImage__block_invoke;
  v16[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v17 = v5;
  v18[0] = self->inputImage;
  v18[1] = +[CIImage noiseImageNearest](CIImage, "noiseImageNearest");
  v18[2] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v7, v9, v5, (float)(1.0 / v5));
  return (id)objc_msgSend(v14, "applyWithExtent:roiCallback:arguments:", v16, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3), x, y, width, height);
}

double __28__CIPointillize_outputImage__block_invoke(uint64_t a1, int a2, double a3)
{
  float v4;

  if (a2 == 1)
    return 0.0;
  v4 = *(float *)(a1 + 32) * -1.32499999 + 0.5;
  return a3 + v4;
}

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[5];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryStylize");
  v5[1] = CFSTR("CICategoryVideo");
  v5[2] = CFSTR("CICategoryStillImage");
  v5[3] = CFSTR("CICategoryHighDynamicRange");
  v5[4] = CFSTR("CICategoryBuiltIn");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 5);
  v7[1] = CFSTR("9");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.4");
  v6[3] = CFSTR("inputRadius");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F1A790;
  v4[3] = &unk_1E2F1A7A0;
  v3[4] = CFSTR("CIAttributeIdentity");
  v3[5] = CFSTR("CIAttributeType");
  v4[0] = &unk_1E2F1A780;
  v4[1] = &unk_1E2F1A780;
  v4[4] = &unk_1E2F1A780;
  v4[5] = CFSTR("CIAttributeTypeDistance");
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

- (NSNumber)inputRadius
{
  return self->inputRadius;
}

- (void)setInputRadius:(id)a3
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

@end

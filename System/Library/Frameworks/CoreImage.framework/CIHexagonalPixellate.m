@implementation CIHexagonalPixellate

- (id)_CIHexagonalPixellate
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_hexagonalPixellate);
}

- (id)outputImage
{
  float v3;
  float v4;
  double v5;
  double v6;
  CIVector *v7;
  CIVector *v8;
  id v9;
  double x;
  double y;
  double width;
  double height;
  _QWORD v15[6];
  CGRect v16;
  CGRect v17;

  v15[5] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputScale, "floatValue");
  v4 = v3;
  v5 = v3;
  v6 = (float)(v3 * 1.7321) * 0.5;
  v7 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", 1.0 / v3, 1.0 / v6);
  v8 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v5, v6);
  v9 = -[CIHexagonalPixellate _CIHexagonalPixellate](self, "_CIHexagonalPixellate");
  -[CIImage extent](self->inputImage, "extent");
  v17 = CGRectInset(v16, (float)-v4, (float)-v4);
  x = v17.origin.x;
  y = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;
  LODWORD(v17.origin.x) = 1058262330;
  v15[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17.origin.x, self->inputImage, self->inputCenter, v7, v8);
  return (id)objc_msgSend(v9, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_57, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 5), x, y, width, height);
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
  v7[2] = CFSTR("10.5");
  v6[3] = CFSTR("inputScale");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F1A760;
  v4[3] = &unk_1E2F1A770;
  v3[4] = CFSTR("CIAttributeIdentity");
  v3[5] = CFSTR("CIAttributeType");
  v4[0] = &unk_1E2F1A750;
  v4[1] = &unk_1E2F1A750;
  v4[4] = &unk_1E2F1A750;
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

- (CIVector)inputCenter
{
  return self->inputCenter;
}

- (void)setInputCenter:(id)a3
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

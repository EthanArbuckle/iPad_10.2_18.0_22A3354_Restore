@implementation CIColorThreshold

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[6];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryColorAdjustment");
  v5[1] = CFSTR("CICategoryVideo");
  v5[2] = CFSTR("CICategoryInterlaced");
  v5[3] = CFSTR("CICategoryNonSquarePixels");
  v5[4] = CFSTR("CICategoryStillImage");
  v5[5] = CFSTR("CICategoryBuiltIn");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 6);
  v7[1] = CFSTR("14");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("11.0");
  v6[3] = CFSTR("inputThreshold");
  v3[0] = CFSTR("CIAttributeSliderMin");
  v3[1] = CFSTR("CIAttributeSliderMax");
  v4[0] = &unk_1E2F19120;
  v4[1] = &unk_1E2F19130;
  v3[2] = CFSTR("CIAttributeDefault");
  v3[3] = CFSTR("CIAttributeClass");
  v4[2] = &unk_1E2F19140;
  v4[3] = CFSTR("NSNumber");
  v3[4] = CFSTR("CIAttributeType");
  v4[4] = CFSTR("CIAttributeTypeScalar");
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

- (id)outputImage
{
  CIImage *inputImage;
  CIColorKernel *v5;
  int v6;
  int v7;
  CIImage *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _QWORD v17[3];
  CGRect v18;

  v17[2] = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  if (!inputImage)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  -[CIImage extent](inputImage, "extent");
  if (CGRectIsEmpty(v18))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v5 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_colorThreshold);
  -[NSNumber floatValue](self->inputThreshold, "floatValue");
  v7 = v6;
  v8 = -[CIImage imageByUnpremultiplyingAlpha](self->inputImage, "imageByUnpremultiplyingAlpha");
  -[CIImage extent](self->inputImage, "extent");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17[0] = v8;
  LODWORD(v9) = v7;
  v17[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  return -[CIImage imageByPremultiplyingAlpha](-[CIColorKernel applyWithExtent:arguments:](v5, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2), v10, v12, v14, v16), "imageByPremultiplyingAlpha");
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputThreshold
{
  return self->inputThreshold;
}

- (void)setInputThreshold:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end

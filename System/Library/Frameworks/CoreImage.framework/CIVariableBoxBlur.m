@implementation CIVariableBoxBlur

+ (id)customAttributes
{
  _QWORD v3[3];
  _QWORD v4[3];
  _QWORD v5[5];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryStylize");
  v5[1] = CFSTR("CICategoryVideo");
  v5[2] = CFSTR("CICategoryStillImage");
  v5[3] = CFSTR("CICategoryBuiltIn");
  v5[4] = CFSTR("CICategoryApplePrivate");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 5);
  v7[1] = CFSTR("10");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.12");
  v6[3] = CFSTR("inputScale");
  v3[0] = CFSTR("CIAttributeIdentity");
  v3[1] = CFSTR("CIAttributeDefault");
  v4[0] = &unk_1E2F1B140;
  v4[1] = &unk_1E2F1B140;
  v3[2] = CFSTR("CIAttributeMin");
  v4[2] = &unk_1E2F1B140;
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

- (id)outputImage
{
  float v3;
  CIKernel *v4;
  CIImage *v5;
  CIImage *v6;
  CIVector *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CIImage *v16;
  NSNumber *inputScale;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage || !self->inputRadiusImage)
    return 0;
  -[NSNumber floatValue](self->inputScale, "floatValue");
  if (v3 < 0.5)
    return self->inputImage;
  v4 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_variableBoxBlur);
  v5 = -[CIImage imageByApplyingFilter:withInputParameters:](self->inputImage, "imageByApplyingFilter:withInputParameters:", CFSTR("CIIntegralImage"), 0);
  if (!v5)
    return self->inputImage;
  v6 = v5;
  -[CIImage extent](self->inputImage, "extent");
  v7 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  -[CIImage extent](self->inputImage, "extent");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v19[0] = v6;
  v16 = -[CIImage imageByClampingToExtent](self->inputRadiusImage, "imageByClampingToExtent");
  inputScale = self->inputScale;
  v19[1] = v16;
  v19[2] = inputScale;
  v19[3] = v7;
  return -[CIKernel applyWithExtent:roiCallback:arguments:](v4, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_69, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4), v9, v11, v13, v15);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIImage)inputRadiusImage
{
  return self->inputRadiusImage;
}

- (void)setInputRadiusImage:(id)a3
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

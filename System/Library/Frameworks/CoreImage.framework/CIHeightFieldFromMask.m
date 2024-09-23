@implementation CIHeightFieldFromMask

- (id)_CIResetalpha
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_resetalpha);
}

- (id)outputImage
{
  float v3;
  float v4;
  CIImage *inputImage;
  id v7;
  CIImage *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputRadius, "floatValue");
  v4 = v3;
  inputImage = self->inputImage;
  if (v3 < 1.0)
    return inputImage;
  do
  {
    inputImage = -[CIBlendKernel applyWithForeground:background:](+[CIBlendKernel componentMultiply](CIBlendKernel, "componentMultiply"), "applyWithForeground:background:", self->inputImage, -[CIImage imageByApplyingGaussianBlurWithSigma:](inputImage, "imageByApplyingGaussianBlurWithSigma:", v4));
    v4 = v4 * 0.5;
  }
  while (v4 >= 1.0);
  v7 = -[CIHeightFieldFromMask _CIResetalpha](self, "_CIResetalpha");
  -[CIImage extent](self->inputImage, "extent");
  v8 = self->inputImage;
  v13[0] = inputImage;
  v13[1] = v8;
  return (id)objc_msgSend(v7, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2), v9, v10, v11, v12);
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
  v5[0] = CFSTR("CICategoryStylize");
  v5[1] = CFSTR("CICategoryVideo");
  v5[2] = CFSTR("CICategoryStillImage");
  v5[3] = CFSTR("CICategoryBuiltIn");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v7[1] = CFSTR("9");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.4");
  v6[3] = CFSTR("inputRadius");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F19E40;
  v4[1] = &unk_1E2F19E40;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v3[4] = CFSTR("CIAttributeIdentity");
  v3[5] = CFSTR("CIAttributeType");
  v4[2] = &unk_1E2F19E50;
  v4[3] = &unk_1E2F19E60;
  v4[4] = &unk_1E2F19E60;
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

@end

@implementation CIConvertLabToRGB

+ (id)customAttributes
{
  _QWORD v3[4];
  _QWORD v4[4];
  _QWORD v5[7];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryColorEffect");
  v5[1] = CFSTR("CICategoryVideo");
  v5[2] = CFSTR("CICategoryInterlaced");
  v5[3] = CFSTR("CICategoryNonSquarePixels");
  v5[4] = CFSTR("CICategoryStillImage");
  v5[5] = CFSTR("CICategoryHighDynamicRange");
  v5[6] = CFSTR("CICategoryBuiltIn");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 7);
  v7[1] = CFSTR("16");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("13.0");
  v6[3] = CFSTR("inputNormalize");
  v3[0] = CFSTR("CIAttributeDefault");
  v3[1] = CFSTR("CIAttributeMin");
  v4[0] = MEMORY[0x1E0C9AAA0];
  v4[1] = MEMORY[0x1E0C9AAA0];
  v3[2] = CFSTR("CIAttributeMax");
  v3[3] = CFSTR("CIAttributeType");
  v4[2] = MEMORY[0x1E0C9AAB0];
  v4[3] = CFSTR("CIAttributeTypeBoolean");
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

- (id)outputImage
{
  CIColorKernel *v3;
  CIImage *inputImage;
  double v5;
  double v6;
  double v7;
  double v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_LAB_denormalize);
  inputImage = self->inputImage;
  if (-[NSNumber BOOLValue](self->inputNormalize, "BOOLValue"))
  {
    -[CIImage extent](self->inputImage, "extent");
    v10[0] = inputImage;
    inputImage = -[CIColorKernel applyWithExtent:arguments:](v3, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1), v5, v6, v7, v8);
  }
  return -[CIImage imageByConvertingLabToWorkingSpace](inputImage, "imageByConvertingLabToWorkingSpace");
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputNormalize
{
  return self->inputNormalize;
}

- (void)setInputNormalize:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end

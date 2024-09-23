@implementation CICircularMaskFromPointImage

+ (id)customAttributes
{
  _QWORD v3[3];
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("CIAttributeFilterCategories");
  v3[0] = CFSTR("CICategoryColorEffect");
  v3[1] = CFSTR("CICategoryBuiltIn");
  v3[2] = CFSTR("CICategoryApplePrivate");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  v5[1] = CFSTR("12");
  v4[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v4[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v5[2] = CFSTR("10.13");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (id)_kernelDraw
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_PSDrawSpread);
}

- (id)outputImage
{
  NSNumber *inputInnerRadius;
  NSNumber *inputOuterRadius;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  float v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  if (!self->inputCoordinate)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  inputInnerRadius = self->inputInnerRadius;
  if (!inputInnerRadius)
    inputInnerRadius = (NSNumber *)&unk_1E2F1BEC0;
  self->inputInnerRadius = inputInnerRadius;
  if (self->inputOuterRadius)
    inputOuterRadius = self->inputOuterRadius;
  else
    inputOuterRadius = (NSNumber *)&unk_1E2F1BE30;
  self->inputOuterRadius = inputOuterRadius;
  -[NSNumber floatValue](inputOuterRadius, "floatValue");
  v6 = v5;
  -[NSNumber floatValue](self->inputInnerRadius, "floatValue");
  v8 = v7;
  -[NSNumber floatValue](self->inputInnerRadius, "floatValue");
  v10 = v8 * v9;
  v11 = -[CICircularMaskFromPointImage _kernelDraw](self, "_kernelDraw");
  v12 = *MEMORY[0x1E0C9D5E0];
  v13 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v14 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v15 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  v20[0] = -[CIImage imageByClampingToExtent](self->inputCoordinate, "imageByClampingToExtent");
  *(float *)&v16 = v10;
  v20[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
  v17 = (void *)objc_msgSend(v11, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2), v12, v13, v14, v15);
  -[NSNumber floatValue](self->inputOuterRadius, "floatValue");
  if (v18 > 0.0001)
    return (id)objc_msgSend(v17, "imageByApplyingGaussianBlurWithSigma:", (float)(v6 / 3.0));
  return v17;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIImage)inputCoordinate
{
  return self->inputCoordinate;
}

- (void)setInputCoordinate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputInnerRadius
{
  return self->inputInnerRadius;
}

- (void)setInputInnerRadius:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)inputOuterRadius
{
  return self->inputOuterRadius;
}

- (void)setInputOuterRadius:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

@end

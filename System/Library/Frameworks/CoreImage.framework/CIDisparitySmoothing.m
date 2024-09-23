@implementation CIDisparitySmoothing

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[5];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryBlur");
  v5[1] = CFSTR("CICategoryVideo");
  v5[2] = CFSTR("CICategoryStillImage");
  v5[3] = CFSTR("CICategoryBuiltIn");
  v5[4] = CFSTR("CICategoryApplePrivate");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 5);
  v7[1] = CFSTR("11");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.13");
  v6[3] = CFSTR("inputNumIterations");
  v3[0] = CFSTR("CIAttributeType");
  v3[1] = CFSTR("CIAttributeMin");
  v3[2] = CFSTR("CIAttributeSliderMin");
  v3[3] = CFSTR("CIAttributeSliderMax");
  v4[0] = CFSTR("CIAttributeTypeInteger");
  v4[1] = &unk_1E2F1B6E0;
  v4[2] = &unk_1E2F1B6E0;
  v4[3] = &unk_1E2F1B6F8;
  v3[4] = CFSTR("CIAttributeDefault");
  v4[4] = &unk_1E2F1B710;
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

- (id)_customBoxBlur5Kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_CIBoxBlur5Min);
}

- (id)outputImageMetal
{
  NSInteger v3;
  CIImage *inputImage;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v16;
  _QWORD v17[2];
  CGRect v18;

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = -[NSNumber integerValue](self->inputNumIterations, "integerValue");
  inputImage = self->inputImage;
  if (v3)
  {
    v5 = v3;
    -[CIImage extent](inputImage, "extent");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    inputImage = -[CIImage imageByClampingToExtent](inputImage, "imageByClampingToExtent");
    v16 = 0;
    if (v5 >= 1)
    {
      v14 = MEMORY[0x1E0C9AA70];
      do
      {
        v17[0] = inputImage;
        inputImage = +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](CIDisparitySmoothingProcessor, "applyWithExtent:inputs:arguments:error:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1), v14, &v16, v7, v9, v11, v13);
        --v5;
      }
      while (v5);
    }
    v18.origin.x = v7;
    v18.origin.y = v9;
    v18.size.width = v11;
    v18.size.height = v13;
    if (!CGRectIsInfinite(v18))
      return -[CIImage imageByCroppingToRect:](inputImage, "imageByCroppingToRect:", v7, v9, v11, v13);
  }
  return inputImage;
}

- (id)outputImage
{
  NSInteger v3;
  CIImage *inputImage;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CIImage *v14;
  uint64_t v15;
  id v16;
  double x;
  double y;
  double width;
  double height;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  CGRect v27;
  CGRect v28;

  v26[1] = *MEMORY[0x1E0C80C00];
  v3 = -[NSNumber integerValue](self->inputNumIterations, "integerValue");
  inputImage = self->inputImage;
  if (v3)
  {
    v5 = v3;
    saveImage(self->inputImage, (uint64_t)CFSTR("/tmp/inputToBoxBlur.tiff"), 1);
    -[CIImage extent](inputImage, "extent");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = -[CIImage imageByClampingToExtent](inputImage, "imageByClampingToExtent");
    if (v5 >= 1)
    {
      v15 = MEMORY[0x1E0C9AAB0];
      do
      {
        v16 = -[CIDisparitySmoothing _customBoxBlur5Kernel](self, "_customBoxBlur5Kernel");
        -[CIImage extent](v14, "extent");
        v28 = CGRectInset(v27, -2.0, -2.0);
        x = v28.origin.x;
        y = v28.origin.y;
        width = v28.size.width;
        height = v28.size.height;
        v26[0] = v14;
        v21 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
        v22 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2053, CFSTR("kCIKernelOutputFormat"));
        v24[1] = CFSTR("kCIImageAlphaOne");
        v25[0] = v22;
        v25[1] = v15;
        v14 = (CIImage *)objc_msgSend(v16, "applyWithExtent:roiCallback:arguments:options:", &__block_literal_global_18, v21, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2), x, y, width, height);
        --v5;
      }
      while (v5);
    }
    inputImage = -[CIImage imageByCroppingToRect:](v14, "imageByCroppingToRect:", v7, v9, v11, v13);
    saveImage(inputImage, (uint64_t)CFSTR("/tmp/outputFromBoxBlur.tiff"), 1);
  }
  return inputImage;
}

double __35__CIDisparitySmoothing_outputImage__block_invoke(double a1, double a2, double a3, double a4)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a1, -2.0, -2.0);
  return result;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSNumber)inputNumIterations
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputNumIterations:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

@end

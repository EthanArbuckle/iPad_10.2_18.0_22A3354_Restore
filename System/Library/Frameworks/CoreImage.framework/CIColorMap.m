@implementation CIColorMap

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("CIAttributeFilterCategories");
  v3[0] = CFSTR("CICategoryColorEffect");
  v3[1] = CFSTR("CICategoryVideo");
  v3[2] = CFSTR("CICategoryInterlaced");
  v3[3] = CFSTR("CICategoryNonSquarePixels");
  v3[4] = CFSTR("CICategoryStillImage");
  v3[5] = CFSTR("CICategoryBuiltIn");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 6);
  v5[1] = CFSTR("6");
  v4[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v4[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v5[2] = CFSTR("10.4");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_colorMap);
}

- (id)outputImage
{
  CIImage *inputImage;
  id result;
  CGFloat x;
  CGFloat y;
  double width;
  CGFloat height;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CIImage *inputGradientImage;
  _QWORD v19[8];
  _QWORD v20[4];
  CGRect v21;

  v20[3] = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  if (!inputImage)
    return 0;
  result = self->inputGradientImage;
  if (!result)
    return result;
  objc_msgSend(result, "extent");
  x = v21.origin.x;
  y = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;
  if (CGRectIsInfinite(v21))
  {
    NSLog(CFSTR("%s requires the inputGradientImage to be finite"), "-[CIColorMap outputImage]");
    return 0;
  }
  v9 = -[CIColorMap _kernel](self, "_kernel");
  -[CIImage extent](self->inputImage, "extent");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __25__CIColorMap_outputImage__block_invoke;
  v19[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  *(CGFloat *)&v19[4] = x;
  *(CGFloat *)&v19[5] = y;
  *(double *)&v19[6] = width;
  *(CGFloat *)&v19[7] = height;
  inputGradientImage = self->inputGradientImage;
  v20[0] = inputImage;
  v20[1] = inputGradientImage;
  v20[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", width + -1.0);
  return (id)objc_msgSend(v9, "applyWithExtent:roiCallback:arguments:", v19, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3), v11, v13, v15, v17);
}

double __25__CIColorMap_outputImage__block_invoke(uint64_t a1, int a2)
{
  double result;

  if (a2)
    return *(double *)(a1 + 32);
  return result;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIImage)inputGradientImage
{
  return self->inputGradientImage;
}

- (void)setInputGradientImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end

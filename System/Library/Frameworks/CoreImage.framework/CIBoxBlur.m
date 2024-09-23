@implementation CIBoxBlur

- (id)outputImage
{
  double v4;
  double v5;
  uint64_t v6;
  CIKernel *v7;
  CIImage *v8;
  CIImage *v9;
  CIImage *inputImage;
  uint64_t v11;
  _QWORD v12[2];
  CGRect v13;
  CGRect v14;
  CGRect v15;

  v12[1] = *MEMORY[0x1E0C80C00];
  -[CIImage extent](self->inputImage, "extent");
  if (CGRectIsEmpty(v13))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  -[NSNumber doubleValue](self->inputRadius, "doubleValue");
  v5 = fmax(floor(v4 * 0.5 + -0.25) * 2.0 + 1.0, 1.0);
  v6 = (int)v5;
  if ((int)v6 <= 1)
    return self->inputImage;
  if ((_DWORD)v6 == 3)
  {
    v7 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_boxBlur3x3);
    -[CIImage extent](self->inputImage, "extent");
    v15 = CGRectInset(v14, -1.0, -1.0);
    v12[0] = self->inputImage;
    return -[CIKernel applyWithExtent:roiCallback:arguments:](v7, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_3, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1), v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
  }
  v9 = boxBlurImage(self->inputImage, (int)v5, 1, 0);
  v8 = boxBlurImage(v9, v6, 0, 1);
  if (!CI_ENABLE_MPS())
    return v8;
  inputImage = self->inputImage;
  v11 = v6;
  if (v6 > 9)
  {
    inputImage = +[CIConvolutionProcessor applyBoxToImage:width:height:](CIConvolutionProcessor, "applyBoxToImage:width:height:", inputImage, v6, 1);
    v11 = 1;
  }
  return +[CIImage imageForRenderingWithMPS:orNonMPS:](CIImage, "imageForRenderingWithMPS:orNonMPS:", +[CIConvolutionProcessor applyBoxToImage:width:height:](CIConvolutionProcessor, "applyBoxToImage:width:height:", inputImage, v11, v6), v8);
}

double __24__CIBoxBlur_outputImage__block_invoke(double a1, double a2, double a3, double a4)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a1, -1.0, -1.0);
  return result;
}

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[5];
  _QWORD v5[4];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryBlur");
  v5[1] = CFSTR("CICategoryVideo");
  v5[2] = CFSTR("CICategoryStillImage");
  v5[3] = CFSTR("CICategoryBuiltIn");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v7[1] = CFSTR("9");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.5");
  v6[3] = CFSTR("inputRadius");
  v3[0] = CFSTR("CIAttributeType");
  v3[1] = CFSTR("CIAttributeMin");
  v3[2] = CFSTR("CIAttributeSliderMin");
  v3[3] = CFSTR("CIAttributeSliderMax");
  v4[0] = CFSTR("CIAttributeTypeDistance");
  v4[1] = &unk_1E2F18D30;
  v4[2] = &unk_1E2F18D30;
  v4[3] = &unk_1E2F18D40;
  v3[4] = CFSTR("CIAttributeDefault");
  v4[4] = &unk_1E2F18D50;
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
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

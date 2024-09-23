@implementation CIMedianFilter

- (id)_kernel3x3
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_median3x3);
}

+ (id)customAttributes
{
  _QWORD v3[4];
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("CIAttributeFilterCategories");
  v3[0] = CFSTR("CICategoryBlur");
  v3[1] = CFSTR("CICategoryStillImage");
  v3[2] = CFSTR("CICategoryVideo");
  v3[3] = CFSTR("CICategoryBuiltIn");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  v5[1] = CFSTR("9");
  v4[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v4[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v5[2] = CFSTR("10.4");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (id)outputImage
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[2];
  CGRect v13;
  CGRect v14;

  v12[1] = *MEMORY[0x1E0C80C00];
  -[CIImage extent](self->inputImage, "extent");
  if (CGRectIsEmpty(v13))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v4 = -[CIMedianFilter _kernel3x3](self, "_kernel3x3");
  -[CIImage extent](self->inputImage, "extent");
  v12[0] = self->inputImage;
  v9 = (void *)objc_msgSend(v4, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_49, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1), v5, v6, v7, v8);
  if (CI_ENABLE_MPS())
  {
    v10 = +[CIMedianProcessor applyMedianToImage:width:](CIMedianProcessor, "applyMedianToImage:width:", self->inputImage, 3);
    if (v10)
    {
      v11 = v10;
      objc_msgSend(v10, "extent");
      if (!CGRectIsEmpty(v14))
        return +[CIImage imageForRenderingWithMPS:orNonMPS:](CIImage, "imageForRenderingWithMPS:orNonMPS:", v11, v9);
    }
  }
  return v9;
}

double __29__CIMedianFilter_outputImage__block_invoke(double a1, double a2, double a3, double a4)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a1, -1.0, -1.0);
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

@end

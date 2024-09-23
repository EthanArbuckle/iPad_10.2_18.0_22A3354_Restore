@implementation CIGaborGradients

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("CIAttributeFilterCategories");
  v3[0] = CFSTR("CICategoryStylize");
  v3[1] = CFSTR("CICategoryVideo");
  v3[2] = CFSTR("CICategoryStillImage");
  v3[3] = CFSTR("CICategoryHighDynamicRange");
  v3[4] = CFSTR("CICategoryBuiltIn");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  v5[1] = CFSTR("13");
  v4[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v4[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v5[2] = CFSTR("10.15");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (id)outputImage
{
  CIKernel *v3;
  CIImage *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CIImage *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_gabor);
  v4 = -[CIImage imageByClampingToExtent](self->inputImage, "imageByClampingToExtent");
  v5 = *MEMORY[0x1E0C9D5E0];
  v6 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  v11[0] = v4;
  v9 = -[CIKernel applyWithExtent:roiCallback:arguments:](v3, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_30, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1), v5, v6, v7, v8);
  -[CIImage extent](self->inputImage, "extent");
  return -[CIImage imageByCroppingToRect:](v9, "imageByCroppingToRect:");
}

double __31__CIGaborGradients_outputImage__block_invoke(double a1, double a2, double a3, double a4)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a1, -2.0, -2.0);
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

@implementation CIIntegralImage

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
  v3[3] = CFSTR("CICategoryBuiltIn");
  v3[4] = CFSTR("CICategoryApplePrivate");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  v5[1] = CFSTR("10");
  v4[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v4[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v5[2] = CFSTR("10.12");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (id)outputImage
{
  CIImage *inputImage;
  double x;
  double y;
  double width;
  double height;
  CIImage *v8;
  CIImage *v10;
  int v11;
  CIImage *v12;
  uint64_t v13;
  CIImage *v14;
  _QWORD v15[2];
  CGRect v16;
  CGRect v17;

  v15[1] = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  if (!inputImage)
    return 0;
  -[CIImage extent](inputImage, "extent");
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  if (CGRectIsEmpty(v16))
    return 0;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  if (CGRectIsInfinite(v17))
    return 0;
  v10 = self->inputImage;
  v15[0] = v10;
  v8 = +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](CIIntegralImageProcessorCPU, "applyWithExtent:inputs:arguments:error:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1), 0, 0, x, y, width, height);
  if (CI_ENABLE_MPS())
  {
    v11 = CI_FLIP_IMAGE_PROCESSOR();
    if (v11)
      v10 = -[CIImage imageByApplyingOrientation:](v10, "imageByApplyingOrientation:", 4);
    v14 = v10;
    v12 = +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](CIIntegralImageProcessorGPU, "applyWithExtent:inputs:arguments:error:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1), 0, 0, x, y, width, height);
    v13 = (uint64_t)v12;
    if (v11)
      v13 = -[CIImage imageByApplyingOrientation:](v12, "imageByApplyingOrientation:", 4);
    return +[CIImage imageForRenderingWithMPS:orNonMPS:](CIImage, "imageForRenderingWithMPS:orNonMPS:", v13, v8);
  }
  return v8;
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

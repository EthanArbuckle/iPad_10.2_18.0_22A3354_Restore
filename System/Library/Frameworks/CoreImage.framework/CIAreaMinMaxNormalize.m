@implementation CIAreaMinMaxNormalize

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("CIAttributeFilterCategories");
  v3[0] = CFSTR("CICategoryColorAdjustment");
  v3[1] = CFSTR("CICategoryVideo");
  v3[2] = CFSTR("CICategoryStillImage");
  v3[3] = CFSTR("CICategoryBuiltIn");
  v3[4] = CFSTR("CICategoryHighDynamicRange");
  v3[5] = CFSTR("CICategoryApplePrivate");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 6);
  v5[1] = CFSTR("11");
  v4[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v4[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v5[2] = CFSTR("10.13");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (id)outputImage
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CIImage *inputImage;
  CIVector *inputExtent;
  uint64_t v18;
  CIImage *v19;
  CIVector *v20;
  uint64_t v21;
  CIColorKernel *v22;
  CIImage *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _QWORD v28[3];
  const __CFString *v29;
  CIVector *v30;
  const __CFString *v31;
  _QWORD v32[2];
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v32[1] = *MEMORY[0x1E0C80C00];
  -[CIImage extent](self->inputImage, "extent");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CIVector CGRectValue](self->inputExtent, "CGRectValue");
  v35.origin.x = v11;
  v35.origin.y = v12;
  v35.size.width = v13;
  v35.size.height = v14;
  v33.origin.x = v4;
  v33.origin.y = v6;
  v33.size.width = v8;
  v33.size.height = v10;
  v34 = CGRectIntersection(v33, v35);
  if (CGRectIsEmpty(v34))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  inputImage = self->inputImage;
  inputExtent = self->inputExtent;
  v31 = CFSTR("inputExtent");
  v32[0] = inputExtent;
  v18 = -[CIImage imageByUnpremultiplyingAlpha](-[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaMinimum"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1)), "imageByClampingToExtent"), "imageByUnpremultiplyingAlpha");
  v19 = self->inputImage;
  v20 = self->inputExtent;
  v29 = CFSTR("inputExtent");
  v30 = v20;
  v21 = -[CIImage imageByUnpremultiplyingAlpha](-[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](v19, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaMaximum"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1)), "imageByClampingToExtent"), "imageByUnpremultiplyingAlpha");
  v22 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_minMaxNormalize);
  v23 = -[CIImage imageByUnpremultiplyingAlpha](self->inputImage, "imageByUnpremultiplyingAlpha");
  -[CIImage extent](v23, "extent");
  v28[0] = v23;
  v28[1] = v18;
  v28[2] = v21;
  return -[CIImage imageByPremultiplyingAlpha](-[CIColorKernel applyWithExtent:arguments:](v22, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3), v24, v25, v26, v27), "imageByPremultiplyingAlpha");
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIVector)inputExtent
{
  return self->inputExtent;
}

- (void)setInputExtent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end

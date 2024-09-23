@implementation CIAreaMinMaxRedNormalize

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
  CIColorKernel *v19;
  CIImage *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _QWORD v25[2];
  const __CFString *v26;
  _QWORD v27[2];
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v27[1] = *MEMORY[0x1E0C80C00];
  -[CIImage extent](self->inputImage, "extent");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CIVector CGRectValue](self->inputExtent, "CGRectValue");
  v30.origin.x = v11;
  v30.origin.y = v12;
  v30.size.width = v13;
  v30.size.height = v14;
  v28.origin.x = v4;
  v28.origin.y = v6;
  v28.size.width = v8;
  v28.size.height = v10;
  v29 = CGRectIntersection(v28, v30);
  if (CGRectIsEmpty(v29))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  inputImage = self->inputImage;
  inputExtent = self->inputExtent;
  v26 = CFSTR("inputExtent");
  v27[0] = inputExtent;
  v18 = -[CIImage imageByUnpremultiplyingAlpha](-[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaMinMaxRed"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1)), "imageByClampingToExtent"), "imageByUnpremultiplyingAlpha");
  v19 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_minMaxRedNormalize);
  v20 = -[CIImage imageByUnpremultiplyingAlpha](self->inputImage, "imageByUnpremultiplyingAlpha");
  -[CIImage extent](v20, "extent");
  v25[0] = v20;
  v25[1] = v18;
  return -[CIImage imageByPremultiplyingAlpha](-[CIColorKernel applyWithExtent:arguments:](v19, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2), v21, v22, v23, v24), "imageByPremultiplyingAlpha");
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

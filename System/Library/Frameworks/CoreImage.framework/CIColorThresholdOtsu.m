@implementation CIColorThresholdOtsu

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("CIAttributeFilterCategories");
  v3[0] = CFSTR("CICategoryColorAdjustment");
  v3[1] = CFSTR("CICategoryVideo");
  v3[2] = CFSTR("CICategoryInterlaced");
  v3[3] = CFSTR("CICategoryNonSquarePixels");
  v3[4] = CFSTR("CICategoryStillImage");
  v3[5] = CFSTR("CICategoryBuiltIn");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 6);
  v5[1] = CFSTR("14");
  v4[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v4[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v5[2] = CFSTR("11.0");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (id)outputImage
{
  CIImage *inputImage;
  CIImage *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  float v14;
  CIImage *v15;
  CIImage *v16;
  CIImage *v17;
  CIVector *v18;
  uint64_t v19;
  CIKernel *v20;
  CIColorKernel *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[3];
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v33[2] = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  if (!inputImage)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  -[CIImage extent](inputImage, "extent");
  if (CGRectIsEmpty(v34))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  -[CIImage extent](self->inputImage, "extent");
  if (CGRectIsInfinite(v35))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v5 = self->inputImage;
  -[CIImage extent](v5, "extent");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  *(float *)&v8 = 1024.0 / v10;
  *(float *)&v6 = 1024.0 / v12;
  v14 = fminf(fminf(*(float *)&v8, *(float *)&v6), 1.0);
  v15 = -[CIImage imageByUnpremultiplyingAlpha](v5, "imageByUnpremultiplyingAlpha");
  memset(&v29, 0, sizeof(v29));
  CGAffineTransformMakeScale(&v29, v14, v14);
  v16 = -[CIImage imageByClampingToExtent](v15, "imageByClampingToExtent");
  v28 = v29;
  v17 = -[CIImage imageByApplyingTransform:](v16, "imageByApplyingTransform:", &v28);
  v27 = v29;
  v36.origin.x = v7;
  v36.origin.y = v9;
  v36.size.width = v11;
  v36.size.height = v13;
  v37 = CGRectApplyAffineTransform(v36, &v27);
  v38 = CGRectInset(v37, 0.001, 0.001);
  v39 = CGRectIntegral(v38);
  v32[0] = CFSTR("inputExtent");
  v18 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v39.origin.x, v39.origin.y, v39.size.width, v39.size.height);
  v32[1] = CFSTR("inputCount");
  v33[0] = v18;
  v33[1] = &unk_1E2F1B5A8;
  v19 = -[CIImage imageByApplyingFilter:withInputParameters:](v17, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaHistogram"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2));
  v20 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_otsu);
  v21 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_otsuThresh);
  v31[0] = v19;
  v31[1] = &unk_1E2F1B5A8;
  v22 = -[CIImage imageByClampingToExtent](-[CIKernel applyWithExtent:roiCallback:arguments:](v20, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_9, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2), 0.0, 0.0, 1.0, 1.0), "imageByClampingToExtent");
  -[CIImage extent](v15, "extent");
  v30[0] = v15;
  v30[1] = v22;
  return -[CIImage imageByPremultiplyingAlpha](-[CIColorKernel applyWithExtent:arguments:](v21, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2), v23, v24, v25, v26), "imageByPremultiplyingAlpha");
}

double __35__CIColorThresholdOtsu_outputImage__block_invoke()
{
  return 0.0;
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

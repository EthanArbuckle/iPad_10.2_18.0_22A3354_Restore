@implementation CIBlurmapSmoothing

+ (id)customAttributes
{
  _QWORD v3[4];
  _QWORD v4[4];
  _QWORD v5[5];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryColorAdjustment");
  v5[1] = CFSTR("CICategoryVideo");
  v5[2] = CFSTR("CICategoryStillImage");
  v5[3] = CFSTR("CICategoryBuiltIn");
  v5[4] = CFSTR("CICategoryApplePrivate");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 5);
  v7[1] = CFSTR("11");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.13");
  v6[3] = CFSTR("inputDraftMode");
  v3[0] = CFSTR("CIAttributeType");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = CFSTR("CIAttributeTypeInteger");
  v4[1] = &unk_1E2F1BC68;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F1BC80;
  v4[3] = &unk_1E2F1BC68;
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

- (id)_kernelH
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_xSmooth);
}

- (id)_kernelV
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_ySmooth);
}

- (id)performPass:(id)a3 reference:(id)a4 values:(id)a5 rect:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  uint64_t v28;
  void *v29;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[3];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[3];
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v36[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "extent");
  v38 = CGRectInset(v37, -4.0, 0.0);
  v14 = v38.origin.x;
  v15 = v38.origin.y;
  v16 = v38.size.width;
  v17 = v38.size.height;
  v18 = -[CIBlurmapSmoothing _kernelH](self, "_kernelH");
  v36[0] = objc_msgSend(a3, "imageByClampingToExtent");
  v19 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v34[0] = CFSTR("kCIKernelOutputFormat");
  v20 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2054);
  v34[1] = CFSTR("kCIImageAlphaOne");
  v21 = MEMORY[0x1E0C9AAB0];
  v35[0] = v20;
  v35[1] = MEMORY[0x1E0C9AAB0];
  v22 = (void *)objc_msgSend(v18, "applyWithExtent:roiCallback:arguments:options:", &__block_literal_global_58, v19, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2), v14, v15, v16, v17);
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = height;
  if (!CGRectIsInfinite(v39))
    v22 = (void *)objc_msgSend(v22, "imageByCroppingToRect:", x, y, width, height);
  objc_msgSend(v22, "extent");
  v41 = CGRectInset(v40, 0.0, -4.0);
  v23 = v41.origin.x;
  v24 = v41.origin.y;
  v25 = v41.size.width;
  v26 = v41.size.height;
  v27 = -[CIBlurmapSmoothing _kernelV](self, "_kernelV");
  v33[0] = objc_msgSend(v22, "imageByClampingToExtent");
  v33[1] = a4;
  v33[2] = a5;
  v28 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
  v31[0] = CFSTR("kCIKernelOutputFormat");
  v31[1] = CFSTR("kCIImageAlphaOne");
  v32[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2053);
  v32[1] = v21;
  v29 = (void *)objc_msgSend(v27, "applyWithExtent:roiCallback:arguments:options:", &__block_literal_global_27, v28, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2), v23, v24, v25, v26);
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  if (!CGRectIsInfinite(v42))
    return (id)objc_msgSend(v29, "imageByCroppingToRect:", x, y, width, height);
  return v29;
}

double __56__CIBlurmapSmoothing_performPass_reference_values_rect___block_invoke(double a1, double a2, double a3, double a4)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a1, -4.0, 0.0);
  return result;
}

double __56__CIBlurmapSmoothing_performPass_reference_values_rect___block_invoke_2(double result, double a2, double a3, double a4, uint64_t a5, int a6)
{
  if (!a6)
    *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&result, 0.0, -4.0);
  return result;
}

- (id)outputImage
{
  float v3;
  int v4;
  int v5;
  float v6;
  float v7;
  float v9;
  int v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float v20;
  double v21;
  float v22;
  double v23;
  float v24;
  double v25;
  float v26;
  CIVector *v27;
  uint64_t v28;
  id v29;
  CGRect v30;

  if (!self->inputImage)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  SDOFBlurmapSmoothingParameterValue(CFSTR("nIterations"), self->inputTuningParameters);
  v4 = (int)v3;
  if ((int)v3 <= 0)
    return self->inputImage;
  -[NSNumber floatValue](self->inputScale, "floatValue");
  v5 = v4;
  if (v6 < 1.0)
  {
    -[NSNumber floatValue](self->inputScale, "floatValue");
    if (ceilf(v7 * (float)v4) >= 1.0)
    {
      -[NSNumber floatValue](self->inputScale, "floatValue");
      v5 = vcvtps_s32_f32(v9 * (float)v4);
    }
    else
    {
      v5 = 1;
    }
  }
  v10 = +[CIDepthBlurEffect getDraftMode:](CIDepthBlurEffect, "getDraftMode:", -[CIBlurmapSmoothing inputDraftMode](self, "inputDraftMode"));
  if (v10 == 1)
    return self->inputImage;
  if (v10 != 2)
  {
    v4 = v5;
    if (v5 <= 0)
      return self->inputImage;
  }
  v11 = -[CIImage _imageByApplyingGamma:](self->inputImage, "_imageByApplyingGamma:", 2.0);
  -[CIImage extent](self->inputImage, "extent");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  SDOFBlurmapSmoothingParameterValue(CFSTR("originalBlurValueT0"), self->inputTuningParameters);
  v21 = v20;
  SDOFBlurmapSmoothingParameterValue(CFSTR("originalBlurValueT1"), self->inputTuningParameters);
  v23 = v22;
  SDOFBlurmapSmoothingParameterValue(CFSTR("localMinimumBlurValueT0"), self->inputTuningParameters);
  v25 = v24;
  SDOFBlurmapSmoothingParameterValue(CFSTR("localMinimumBlurValueT1"), self->inputTuningParameters);
  v27 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v21, v23, v25, v26);
  v28 = objc_msgSend(v11, "imageByClampingToExtent");
  v29 = (id)v28;
  do
  {
    v29 = -[CIBlurmapSmoothing performPass:reference:values:rect:](self, "performPass:reference:values:rect:", v29, v28, v27, v13, v15, v17, v19);
    --v4;
  }
  while (v4);
  v30.origin.x = v13;
  v30.origin.y = v15;
  v30.size.width = v17;
  v30.size.height = v19;
  if (!CGRectIsInfinite(v30))
    v29 = (id)objc_msgSend(v29, "imageByCroppingToRect:", v13, v15, v17, v19);
  return (id)objc_msgSend(v29, "_imageByApplyingGamma:", 0.5);
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSDictionary)inputTuningParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputTuningParameters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSNumber)inputScale
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSNumber)inputDraftMode
{
  return self->inputDraftMode;
}

- (void)setInputDraftMode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

@end

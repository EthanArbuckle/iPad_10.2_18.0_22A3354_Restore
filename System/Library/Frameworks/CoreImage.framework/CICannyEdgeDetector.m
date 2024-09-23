@implementation CICannyEdgeDetector

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[4];
  _QWORD v10[4];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[8];
  _QWORD v15[9];

  v15[8] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("CIAttributeFilterCategories");
  v13[0] = CFSTR("CICategoryStylize");
  v13[1] = CFSTR("CICategoryVideo");
  v13[2] = CFSTR("CICategoryStillImage");
  v13[3] = CFSTR("CICategoryHighDynamicRange");
  v13[4] = CFSTR("CICategoryBuiltIn");
  v15[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 5);
  v15[1] = CFSTR("17");
  v14[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v14[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v15[2] = CFSTR("14.0");
  v14[3] = CFSTR("inputGaussianSigma");
  v11[0] = CFSTR("CIAttributeType");
  v11[1] = CFSTR("CIAttributeMin");
  v12[0] = CFSTR("CIAttributeTypeScalar");
  v12[1] = &unk_1E2F19A40;
  v11[2] = CFSTR("CIAttributeSliderMin");
  v11[3] = CFSTR("CIAttributeSliderMax");
  v12[2] = &unk_1E2F19A40;
  v12[3] = &unk_1E2F19A70;
  v11[4] = CFSTR("CIAttributeDefault");
  v12[4] = &unk_1E2F19A80;
  v15[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 5);
  v14[4] = CFSTR("inputPerceptual");
  v9[0] = CFSTR("CIAttributeMin");
  v9[1] = CFSTR("CIAttributeMax");
  v10[0] = MEMORY[0x1E0C9AAA0];
  v10[1] = MEMORY[0x1E0C9AAB0];
  v9[2] = CFSTR("CIAttributeDefault");
  v9[3] = CFSTR("CIAttributeType");
  v10[2] = MEMORY[0x1E0C9AAA0];
  v10[3] = CFSTR("CIAttributeTypeBoolean");
  v15[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v14[5] = CFSTR("inputThresholdHigh");
  v7[0] = CFSTR("CIAttributeType");
  v7[1] = CFSTR("CIAttributeMin");
  v8[0] = CFSTR("CIAttributeTypeScalar");
  v8[1] = &unk_1E2F19A40;
  v7[2] = CFSTR("CIAttributeSliderMin");
  v7[3] = CFSTR("CIAttributeSliderMax");
  v8[2] = &unk_1E2F19A40;
  v8[3] = &unk_1E2F19A90;
  v7[4] = CFSTR("CIAttributeDefault");
  v8[4] = &unk_1E2F19AA0;
  v15[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v14[6] = CFSTR("inputThresholdLow");
  v5[0] = CFSTR("CIAttributeType");
  v5[1] = CFSTR("CIAttributeMin");
  v6[0] = CFSTR("CIAttributeTypeScalar");
  v6[1] = &unk_1E2F19A40;
  v5[2] = CFSTR("CIAttributeSliderMin");
  v5[3] = CFSTR("CIAttributeSliderMax");
  v6[2] = &unk_1E2F19A40;
  v6[3] = &unk_1E2F19AB0;
  v5[4] = CFSTR("CIAttributeDefault");
  v6[4] = &unk_1E2F19AC0;
  v15[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  v14[7] = CFSTR("inputHysteresisPasses");
  v3[0] = CFSTR("CIAttributeType");
  v3[1] = CFSTR("CIAttributeMin");
  v4[0] = CFSTR("CIAttributeTypeInteger");
  v4[1] = &unk_1E2F1B8A8;
  v3[2] = CFSTR("CIAttributeSliderMin");
  v3[3] = CFSTR("CIAttributeSliderMax");
  v4[2] = &unk_1E2F1B8A8;
  v4[3] = &unk_1E2F1B8C0;
  v3[4] = CFSTR("CIAttributeMax");
  v3[5] = CFSTR("CIAttributeDefault");
  v4[4] = &unk_1E2F1B8D8;
  v4[5] = &unk_1E2F1B8F0;
  v15[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 8);
}

- (id)outputImage
{
  CIImage *v3;
  float v4;
  CIImage *v5;
  CIKernel *v6;
  double *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  CIKernel *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  float v19;
  float v20;
  float v21;
  float v22;
  CIColorKernel *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  int v31;
  int v32;
  int v33;
  CIKernel *v34;
  CIKernel *v35;
  unsigned int v36;
  unsigned int v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CIColorKernel *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CIImage *v47;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[3];
  uint64_t v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x1E0C80C00];
  v3 = -[CIImage imageByClampingToExtent](self->inputImage, "imageByClampingToExtent");
  -[NSNumber floatValue](self->inputGaussianSigma, "floatValue");
  v5 = -[CIImage imageByApplyingGaussianBlurWithSigma:](v3, "imageByApplyingGaussianBlurWithSigma:", v4);
  if (-[NSNumber BOOLValue](self->inputPerceptual, "BOOLValue"))
    v5 = -[CIImage imageByApplyingFilter:](v5, "imageByApplyingFilter:", CFSTR("CILinearToSRGBToneCurve"));
  v6 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_sobel_m);
  v7 = (double *)MEMORY[0x1E0C9D5E0];
  v8 = *MEMORY[0x1E0C9D5E0];
  v9 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  v53[0] = v5;
  v12 = -[CIKernel applyWithExtent:roiCallback:arguments:](v6, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_59, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1), v8, v9, v10, v11);
  v13 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_maxGradOnly);
  v14 = *v7;
  v15 = v7[1];
  v16 = v7[2];
  v17 = v7[3];
  v52 = v12;
  v18 = -[CIKernel applyWithExtent:roiCallback:arguments:](v13, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_60, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1), v14, v15, v16, v17);
  -[NSNumber floatValue](self->inputThresholdHigh, "floatValue");
  v20 = fmaxf(v19, 0.0001);
  -[NSNumber floatValue](self->inputThresholdLow, "floatValue");
  v22 = fmaxf(v21, 0.0001);
  v23 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_cannyThreshold);
  v24 = *v7;
  v25 = v7[1];
  v26 = v7[2];
  v27 = v7[3];
  v51[0] = v18;
  *(float *)&v28 = v20;
  v51[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28);
  *(float *)&v29 = v22;
  v51[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v29);
  v30 = -[CIColorKernel applyWithExtent:arguments:](v23, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 3), v24, v25, v26, v27);
  v31 = -[NSNumber intValue](self->inputHysteresisPasses, "intValue");
  v32 = v31;
  if (v31 >= 20)
    v33 = 20;
  else
    v33 = v31;
  v34 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_cannyHysteresis);
  if (v22 < v20 && v32 >= 1)
  {
    v35 = v34;
    v36 = 0;
    v37 = v33 & ~(v33 >> 31);
    do
    {
      v38 = *v7;
      v39 = v7[1];
      v40 = v7[2];
      v41 = v7[3];
      v50 = v30;
      v30 = -[CIKernel applyWithExtent:roiCallback:arguments:](v35, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_62_0, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1), v38, v39, v40, v41);
      ++v36;
    }
    while (v37 > v36);
  }
  v42 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_cannyFinal);
  v43 = *v7;
  v44 = v7[1];
  v45 = v7[2];
  v46 = v7[3];
  v49 = v30;
  v47 = -[CIColorKernel applyWithExtent:arguments:](v42, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1), v43, v44, v45, v46);
  -[CIImage extent](self->inputImage, "extent");
  return -[CIImage imageByCroppingToRect:](v47, "imageByCroppingToRect:");
}

double __34__CICannyEdgeDetector_outputImage__block_invoke(double a1, double a2, double a3, double a4)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a1, -1.0, -1.0);
  return result;
}

double __34__CICannyEdgeDetector_outputImage__block_invoke_2(double a1, double a2, double a3, double a4)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a1, -1.0, -1.0);
  return result;
}

double __34__CICannyEdgeDetector_outputImage__block_invoke_3(double a1, double a2, double a3, double a4)
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

- (NSNumber)inputGaussianSigma
{
  return self->inputGaussianSigma;
}

- (void)setInputGaussianSigma:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputPerceptual
{
  return self->inputPerceptual;
}

- (void)setInputPerceptual:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputThresholdHigh
{
  return self->inputThresholdHigh;
}

- (void)setInputThresholdHigh:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSNumber)inputThresholdLow
{
  return self->inputThresholdLow;
}

- (void)setInputThresholdLow:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSNumber)inputHysteresisPasses
{
  return self->inputHysteresisPasses;
}

- (void)setInputHysteresisPasses:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

@end

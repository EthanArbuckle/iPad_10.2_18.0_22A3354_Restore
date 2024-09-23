@implementation CIFocalPlaneNative

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[6];
  _QWORD v6[6];
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[6];
  _QWORD v12[6];
  _QWORD v13[6];
  _QWORD v14[6];
  _QWORD v15[4];
  _QWORD v16[9];
  _QWORD v17[11];

  v17[9] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("CIAttributeFilterCategories");
  v15[0] = CFSTR("CICategoryColorAdjustment");
  v15[1] = CFSTR("CICategoryStillImage");
  v15[2] = CFSTR("CICategoryBuiltIn");
  v15[3] = CFSTR("CICategoryApplePrivate");
  v17[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
  v17[1] = CFSTR("12");
  v16[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v16[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v17[2] = CFSTR("10.14");
  v16[3] = CFSTR("inputAlphaThreshold");
  v13[0] = CFSTR("CIAttributeSliderMin");
  v13[1] = CFSTR("CIAttributeSliderMax");
  v14[0] = &unk_1E2F19C30;
  v14[1] = &unk_1E2F1B968;
  v13[2] = CFSTR("CIAttributeMin");
  v13[3] = CFSTR("CIAttributeMax");
  v14[2] = &unk_1E2F19C30;
  v14[3] = &unk_1E2F1B968;
  v13[4] = CFSTR("CIAttributeDefault");
  v13[5] = CFSTR("CIAttributeType");
  v14[4] = &unk_1E2F1B950;
  v14[5] = CFSTR("CIAttributeTypeScalar");
  v17[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
  v16[4] = CFSTR("inputAmplitude");
  v11[0] = CFSTR("CIAttributeSliderMin");
  v11[1] = CFSTR("CIAttributeSliderMax");
  v12[0] = &unk_1E2F19C30;
  v12[1] = &unk_1E2F1B968;
  v11[2] = CFSTR("CIAttributeMin");
  v11[3] = CFSTR("CIAttributeMax");
  v12[2] = &unk_1E2F19C30;
  v12[3] = &unk_1E2F1B968;
  v11[4] = CFSTR("CIAttributeDefault");
  v11[5] = CFSTR("CIAttributeType");
  v12[4] = &unk_1E2F1B950;
  v12[5] = CFSTR("CIAttributeTypeScalar");
  v17[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 6);
  v16[5] = CFSTR("inputExponent");
  v9[0] = CFSTR("CIAttributeSliderMin");
  v9[1] = CFSTR("CIAttributeSliderMax");
  v10[0] = &unk_1E2F19C30;
  v10[1] = &unk_1E2F1B968;
  v9[2] = CFSTR("CIAttributeMin");
  v9[3] = CFSTR("CIAttributeMax");
  v10[2] = &unk_1E2F19C30;
  v10[3] = &unk_1E2F1B968;
  v9[4] = CFSTR("CIAttributeDefault");
  v9[5] = CFSTR("CIAttributeType");
  v10[4] = &unk_1E2F1B968;
  v10[5] = CFSTR("CIAttributeTypeScalar");
  v17[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v16[6] = CFSTR("inputGamma");
  v7[0] = CFSTR("CIAttributeSliderMin");
  v7[1] = CFSTR("CIAttributeSliderMax");
  v8[0] = &unk_1E2F19C30;
  v8[1] = &unk_1E2F1B968;
  v7[2] = CFSTR("CIAttributeMin");
  v7[3] = CFSTR("CIAttributeMax");
  v8[2] = &unk_1E2F19C30;
  v8[3] = &unk_1E2F1B968;
  v7[4] = CFSTR("CIAttributeDefault");
  v7[5] = CFSTR("CIAttributeType");
  v8[4] = &unk_1E2F1B968;
  v8[5] = CFSTR("CIAttributeTypeScalar");
  v17[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v16[7] = CFSTR("inputMinFactor");
  v5[0] = CFSTR("CIAttributeSliderMin");
  v5[1] = CFSTR("CIAttributeSliderMax");
  v6[0] = &unk_1E2F19C30;
  v6[1] = &unk_1E2F19C40;
  v5[2] = CFSTR("CIAttributeMin");
  v5[3] = CFSTR("CIAttributeMax");
  v6[2] = &unk_1E2F19C30;
  v6[3] = &unk_1E2F19C40;
  v5[4] = CFSTR("CIAttributeDefault");
  v5[5] = CFSTR("CIAttributeType");
  v6[4] = &unk_1E2F1B950;
  v6[5] = CFSTR("CIAttributeTypeScalar");
  v17[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v16[8] = CFSTR("inputMaxFactor");
  v3[0] = CFSTR("CIAttributeSliderMin");
  v3[1] = CFSTR("CIAttributeSliderMax");
  v4[0] = &unk_1E2F19C30;
  v4[1] = &unk_1E2F19C40;
  v3[2] = CFSTR("CIAttributeMin");
  v3[3] = CFSTR("CIAttributeMax");
  v4[2] = &unk_1E2F19C30;
  v4[3] = &unk_1E2F19C40;
  v3[4] = CFSTR("CIAttributeDefault");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F1B968;
  v4[5] = CFSTR("CIAttributeTypeScalar");
  v17[8] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 9);
}

- (id)_focalPlanePreProcessorKernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_disparityRefinementPreprocessing);
}

- (id)_focalPlanePreProcessorKernelPow2
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_disparityRefinementPreprocessingPow2);
}

- (id)outputImage
{
  id result;
  float v4;
  double v5;
  float v6;
  double v7;
  float v8;
  double v9;
  float v10;
  CIVector *v11;
  float v12;
  double v13;
  float v14;
  CIVector *v15;
  CIImage *inputMatteImage;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  float v32;
  double v33;
  double v34;
  double v35;
  float v36;
  CIImage *v37;
  CIImage *v38;
  float v39;
  id v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGAffineTransform v46;
  _QWORD v47[6];
  CGRect v48;
  CGRect v49;

  v47[5] = *MEMORY[0x1E0C80C00];
  result = self->inputImage;
  if (!result || !self->inputLensModelCalculatorImage)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  if (self->inputMatteImage)
  {
    -[NSNumber floatValue](self->inputAmplitude, "floatValue");
    v5 = v4;
    -[NSNumber floatValue](self->inputExponent, "floatValue");
    v7 = v6;
    -[NSNumber floatValue](self->inputGamma, "floatValue");
    v9 = v8;
    -[NSNumber floatValue](self->inputMinFactor, "floatValue");
    v11 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v5, v7, v9, v10);
    -[NSNumber floatValue](self->inputMaxFactor, "floatValue");
    v13 = v12;
    -[NSNumber floatValue](self->inputAlphaThreshold, "floatValue");
    v15 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v13, v14, 0.0, 0.0);
    inputMatteImage = self->inputMatteImage;
    -[CIImage extent](inputMatteImage, "extent");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    -[CIImage extent](self->inputImage, "extent");
    v49.origin.x = v25;
    v49.origin.y = v26;
    v49.size.width = v27;
    v49.size.height = v28;
    v48.origin.x = v18;
    v48.origin.y = v20;
    v48.size.width = v22;
    v48.size.height = v24;
    if (!CGRectEqualToRect(v48, v49))
    {
      -[CIImage extent](self->inputImage, "extent");
      v30 = v29;
      -[CIImage extent](self->inputMatteImage, "extent");
      v32 = v30 / v31;
      -[CIImage extent](self->inputImage, "extent");
      v34 = v33;
      -[CIImage extent](self->inputMatteImage, "extent");
      v36 = v34 / v35;
      v37 = self->inputMatteImage;
      CGAffineTransformMakeScale(&v46, v32, v36);
      inputMatteImage = -[CIImage imageByApplyingTransform:highQualityDownsample:](v37, "imageByApplyingTransform:highQualityDownsample:", &v46, 0);
    }
    v38 = -[CIImage imageByClampingToExtent](self->inputLensModelCalculatorImage, "imageByClampingToExtent");
    -[NSNumber floatValue](self->inputExponent, "floatValue");
    if (vabdd_f64(2.0, v39) >= 0.00100000005)
      v40 = -[CIFocalPlaneNative _focalPlanePreProcessorKernel](self, "_focalPlanePreProcessorKernel");
    else
      v40 = -[CIFocalPlaneNative _focalPlanePreProcessorKernelPow2](self, "_focalPlanePreProcessorKernelPow2");
    v41 = v40;
    -[CIImage extent](self->inputImage, "extent");
    v47[0] = self->inputImage;
    v47[1] = inputMatteImage;
    v47[2] = v38;
    v47[3] = v11;
    v47[4] = v15;
    return (id)objc_msgSend(v41, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 5), v42, v43, v44, v45);
  }
  return result;
}

@end

@implementation CIEdgePreserveUpsampleFilter

+ (id)customAttributes
{
  objc_class *v2;
  objc_class *v3;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[6];
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("CIAttributeFilterCategories");
  v9[0] = CFSTR("CICategoryGeometryAdjustment");
  v9[1] = CFSTR("CICategoryVideo");
  v9[2] = CFSTR("CICategoryStillImage");
  v9[3] = CFSTR("CICategoryInterlaced");
  v9[4] = CFSTR("CICategoryNonSquarePixels");
  v9[5] = CFSTR("CICategoryBuiltIn");
  v11[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 6);
  v11[1] = CFSTR("10");
  v10[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v10[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v11[2] = CFSTR("10.12");
  v10[3] = CFSTR("inputSpatialSigma");
  v7[0] = CFSTR("CIAttributeClass");
  v2 = (objc_class *)objc_opt_class();
  v8[0] = NSStringFromClass(v2);
  v8[1] = &unk_1E2F199C0;
  v7[1] = CFSTR("CIAttributeDefault");
  v7[2] = CFSTR("CIAttributeMin");
  v8[2] = &unk_1E2F199D0;
  v8[3] = &unk_1E2F199E0;
  v7[3] = CFSTR("CIAttributeMax");
  v7[4] = CFSTR("CIAttributeType");
  v8[4] = CFSTR("CIAttributeTypeScalar");
  v11[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v10[4] = CFSTR("inputLumaSigma");
  v5[0] = CFSTR("CIAttributeClass");
  v3 = (objc_class *)objc_opt_class();
  v6[0] = NSStringFromClass(v3);
  v6[1] = &unk_1E2F199F0;
  v5[1] = CFSTR("CIAttributeDefault");
  v5[2] = CFSTR("CIAttributeMin");
  v6[2] = &unk_1E2F199D0;
  v6[3] = &unk_1E2F19A00;
  v5[3] = CFSTR("CIAttributeMax");
  v5[4] = CFSTR("CIAttributeType");
  v6[4] = CFSTR("CIAttributeTypeScalar");
  v11[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
}

- (id)_kernelJointUpsamp
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_jointBilateral);
}

- (id)_kernelJointUpsampRG
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_jointBilateralRG);
}

- (id)_kernelGuideCombine
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_guideCombine);
}

- (id)_kernelGuideCombine4
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_guideCombine4);
}

- (id)_kernelGuideMono
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_guideMono);
}

- (id)outputImage
{
  id result;
  double v4;
  float v5;
  double v6;
  float v7;
  double v8;
  float v9;
  double v10;
  float v11;
  unsigned int v12;
  unsigned int v13;
  CIImage *v14;
  uint64_t v15;
  float v16;
  float v17;
  float v18;
  float v19;
  CIVector *v20;
  CIImage *v21;
  id v22;
  double *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  id v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  id v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  uint64_t v45;
  CGAffineTransform v46;
  _QWORD v47[3];
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  CGRect v52;
  CGRect v53;

  v51[1] = *MEMORY[0x1E0C80C00];
  result = self->inputImage;
  if (result)
  {
    if (!self->inputSmallImage)
      return 0;
    objc_msgSend(result, "extent");
    if (CGRectIsInfinite(v52))
      return 0;
    -[CIImage extent](self->inputSmallImage, "extent");
    if (CGRectIsInfinite(v53))
    {
      return 0;
    }
    else
    {
      -[CIImage extent](self->inputSmallImage, "extent");
      v5 = v4;
      -[CIImage extent](self->inputSmallImage, "extent");
      v7 = v6;
      -[CIImage extent](self->inputImage, "extent");
      v9 = v8;
      -[CIImage extent](self->inputImage, "extent");
      v11 = v10;
      *(float *)&v12 = v9 / v5;
      *(float *)&v13 = v11 / v7;
      v14 = -[CIImage imageByClampingToExtent](self->inputSmallImage, "imageByClampingToExtent");
      CGAffineTransformMakeScale(&v46, (float)(v9 / v5), *(float *)&v13);
      v15 = -[CIImage imageByApplyingTransform:](v14, "imageByApplyingTransform:", &v46);
      -[NSNumber floatValue](self->inputSpatialSigma, "floatValue");
      v17 = fmaxf(v16, 0.0);
      -[NSNumber floatValue](self->inputLumaSigma, "floatValue");
      v19 = fmaxf(v18, 0.0);
      v20 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 1.0 / ((v19 + v19) * v19), 1.0 / ((v17 + v17) * v17), (float)(v9 / v5) * 0.6666667, *(float *)&v13 * 0.6666667);
      v21 = -[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](self->inputImage, "imageByApplyingFilter:withInputParameters:", CFSTR("CILinearToSRGBToneCurve"), 0), "imageByClampingToExtent");
      v22 = -[CIEdgePreserveUpsampleFilter _kernelGuideMono](self, "_kernelGuideMono");
      v23 = (double *)MEMORY[0x1E0C9D5E0];
      v24 = *MEMORY[0x1E0C9D5E0];
      v25 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
      v26 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
      v27 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
      v51[0] = v21;
      v28 = (void *)objc_msgSend(v22, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1), v24, v25, v26, v27);
      *(float *)&v29 = *(float *)&v12 * 0.4;
      v49[0] = CFSTR("inputSigmaX");
      v30 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v29);
      v49[1] = CFSTR("inputSigmaY");
      v50[0] = v30;
      *(float *)&v31 = *(float *)&v13 * 0.4;
      v50[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v31);
      v32 = objc_msgSend(v28, "imageByApplyingFilter:withInputParameters:", CFSTR("CIGaussianBlurXY"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2));
      v33 = -[CIEdgePreserveUpsampleFilter _kernelGuideCombine](self, "_kernelGuideCombine");
      v34 = *v23;
      v35 = v23[1];
      v36 = v23[2];
      v37 = v23[3];
      v48[0] = v28;
      v48[1] = v32;
      v38 = objc_msgSend(v33, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2), v34, v35, v36, v37);
      v39 = -[CIEdgePreserveUpsampleFilter _kernelJointUpsamp](self, "_kernelJointUpsamp");
      -[CIImage extent](self->inputImage, "extent");
      v47[0] = v15;
      v47[1] = v38;
      v47[2] = v20;
      v44 = (void *)objc_msgSend(v39, "applyWithExtent:roiCallback:arguments:", &v45, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 3, MEMORY[0x1E0C809B0], 3221225472, __43__CIEdgePreserveUpsampleFilter_outputImage__block_invoke, &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l, __PAIR64__(v13, v12)), v40, v41, v42, v43);
      -[CIImage extent](self->inputImage, "extent");
      return (id)objc_msgSend(v44, "imageByCroppingToRect:");
    }
  }
  return result;
}

double __43__CIEdgePreserveUpsampleFilter_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a2, *(float *)(a1 + 32) * -1.34, *(float *)(a1 + 36) * -1.34);
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

- (CIImage)inputSmallImage
{
  return self->inputSmallImage;
}

- (void)setInputSmallImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputSpatialSigma
{
  return self->inputSpatialSigma;
}

- (void)setInputSpatialSigma:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputLumaSigma
{
  return self->inputLumaSigma;
}

- (void)setInputLumaSigma:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

@end

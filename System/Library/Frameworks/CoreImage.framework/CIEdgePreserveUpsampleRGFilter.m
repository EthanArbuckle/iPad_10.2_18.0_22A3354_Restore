@implementation CIEdgePreserveUpsampleRGFilter

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
  _QWORD v47[2];
  _QWORD v48[3];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  CGRect v52;
  CGRect v53;

  v51[1] = *MEMORY[0x1E0C80C00];
  result = self->super.inputImage;
  if (result)
  {
    if (!self->super.inputSmallImage)
      return 0;
    objc_msgSend(result, "extent");
    if (CGRectIsInfinite(v52))
      return 0;
    -[CIImage extent](self->super.inputSmallImage, "extent");
    if (CGRectIsInfinite(v53))
    {
      return 0;
    }
    else
    {
      -[CIImage extent](self->super.inputSmallImage, "extent");
      v5 = v4;
      -[CIImage extent](self->super.inputSmallImage, "extent");
      v7 = v6;
      -[CIImage extent](self->super.inputImage, "extent");
      v9 = v8;
      -[CIImage extent](self->super.inputImage, "extent");
      v11 = v10;
      *(float *)&v12 = v9 / v5;
      *(float *)&v13 = v11 / v7;
      v14 = -[CIImage imageByClampingToExtent](self->super.inputSmallImage, "imageByClampingToExtent");
      CGAffineTransformMakeScale(&v46, (float)(v9 / v5), *(float *)&v13);
      v15 = -[CIImage imageByApplyingTransform:](v14, "imageByApplyingTransform:", &v46);
      -[NSNumber floatValue](self->super.inputSpatialSigma, "floatValue");
      v17 = fmaxf(v16, 0.0);
      -[NSNumber floatValue](self->super.inputLumaSigma, "floatValue");
      v19 = fmaxf(v18, 0.0);
      v20 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 1.0 / ((v19 + v19) * v19), 1.0 / ((v17 + v17) * v17), (float)(v9 / v5) * 0.6666667, *(float *)&v13 * 0.6666667);
      v21 = -[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](self->super.inputImage, "imageByApplyingFilter:withInputParameters:", CFSTR("CILinearToSRGBToneCurve"), 0), "imageByClampingToExtent");
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
      v33 = -[CIEdgePreserveUpsampleFilter _kernelGuideCombine4](self, "_kernelGuideCombine4");
      v34 = *v23;
      v35 = v23[1];
      v36 = v23[2];
      v37 = v23[3];
      v48[0] = v28;
      v48[1] = v32;
      v48[2] = v15;
      v38 = objc_msgSend(v33, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 3), v34, v35, v36, v37);
      v39 = -[CIEdgePreserveUpsampleFilter _kernelJointUpsampRG](self, "_kernelJointUpsampRG");
      v40 = *v23;
      v41 = v23[1];
      v42 = v23[2];
      v43 = v23[3];
      v47[0] = v38;
      v47[1] = v20;
      v44 = (void *)objc_msgSend(v39, "applyWithExtent:roiCallback:arguments:", &v45, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2, MEMORY[0x1E0C809B0], 3221225472, __45__CIEdgePreserveUpsampleRGFilter_outputImage__block_invoke, &__block_descriptor_40_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l, __PAIR64__(v13, v12)), v40, v41, v42, v43);
      -[CIImage extent](self->super.inputImage, "extent");
      return (id)objc_msgSend(v44, "imageByCroppingToRect:");
    }
  }
  return result;
}

double __45__CIEdgePreserveUpsampleRGFilter_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a2, *(float *)(a1 + 32) * -1.34, *(float *)(a1 + 36) * -1.34);
  return result;
}

@end

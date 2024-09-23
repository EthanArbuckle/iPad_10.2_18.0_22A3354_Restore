@implementation CIDisparityRefinementAntialiasV3

- (id)antialiasKernel
{
  if (-[CIDisparityRefinementAntialiasV3 antialiasKernel]::onceToken != -1)
    dispatch_once(&-[CIDisparityRefinementAntialiasV3 antialiasKernel]::onceToken, &__block_literal_global_193);
  return (id)-[CIDisparityRefinementAntialiasV3 antialiasKernel]::k;
}

id __51__CIDisparityRefinementAntialiasV3_antialiasKernel__block_invoke()
{
  id result;

  result = +[CIKernel SDOFV3MetalKernelNamed:](CIKernel, "SDOFV3MetalKernelNamed:", CFSTR("disparity_refinement_antialias"));
  -[CIDisparityRefinementAntialiasV3 antialiasKernel]::k = (uint64_t)result;
  return result;
}

- (id)outputImage
{
  CIImage *inputImage;
  CIImage *inputPreprocImage;
  CIImage *inputDisparityWeightImage;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  CIImage *v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  float32x2_t v17;
  float v23;
  CIVector *v24;
  float v25;
  CIImage *v26;
  CIImage *v27;
  CIImage *v28;
  float v29;
  CIVector *v30;
  id v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  void *v37;
  unsigned int v39;
  unsigned int v40;
  CGAffineTransform v41;
  const __CFString *v42;
  uint64_t v43;
  _QWORD v44[5];
  float64x2_t v45;
  float64_t v46;
  double v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  inputPreprocImage = self->inputPreprocImage;
  inputDisparityWeightImage = self->inputDisparityWeightImage;
  -[CIImage extent](inputPreprocImage, "extent");
  v7 = v6;
  -[CIImage extent](inputDisparityWeightImage, "extent");
  v9 = v7 / v8;
  -[CIImage extent](inputPreprocImage, "extent");
  v11 = v10;
  -[CIImage extent](inputDisparityWeightImage, "extent");
  CGAffineTransformMakeScale(&v41, v9, v11 / v12);
  v13 = -[CIImage imageByApplyingTransform:](inputDisparityWeightImage, "imageByApplyingTransform:", &v41);
  SDOFDisparityRefinementParameterValue(CFSTR("maxReconstructionWeight"), self->inputTuningParameters);
  LODWORD(v9) = v14;
  SDOFDisparityRefinementParameterValue(CFSTR("aaLumaSigma"), self->inputTuningParameters);
  v40 = v15;
  SDOFDisparityRefinementParameterValue(CFSTR("aaChromaSigma"), self->inputTuningParameters);
  v39 = v16;
  SDOFDisparityRefinementParameterValue(CFSTR("aaSegmentationSigma"), self->inputTuningParameters);
  v17 = vmul_f32((float32x2_t)__PAIR64__(v39, v40), (float32x2_t)__PAIR64__(v39, v40));
  __asm { FMOV            V2.2S, #-1.0 }
  v45 = vcvtq_f64_f32(vdiv_f32(_D2, vadd_f32(v17, v17)));
  v46 = v45.f64[1];
  v47 = (float)(-1.0 / (float)((float)(v23 * v23) + (float)(v23 * v23)));
  v24 = +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", &v45, 4);
  SDOFDisparityRefinementParameterValue(CFSTR("aaSpatialSigma"), self->inputTuningParameters);
  *(float *)&v11 = -1.0 / (float)((float)(v25 * v25) + (float)(v25 * v25));
  v26 = -[CIImage imageByClampingToExtent](inputImage, "imageByClampingToExtent");
  v27 = -[CIImage imageByClampingToExtent](inputPreprocImage, "imageByClampingToExtent");
  v28 = -[CIImage imageByClampingToExtent](v13, "imageByClampingToExtent");
  -[NSNumber floatValue](self->inputScale, "floatValue");
  v30 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", *(float *)&v9, *(float *)&v11, v29);
  v31 = -[CIDisparityRefinementAntialiasV3 antialiasKernel](self, "antialiasKernel");
  v32 = *MEMORY[0x1E0C9D5E0];
  v33 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v34 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v35 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  v44[0] = -[CIImage imageByClampingToExtent](v28, "imageByClampingToExtent");
  v44[1] = -[CIImage imageByClampingToExtent](v27, "imageByClampingToExtent");
  v44[2] = -[CIImage imageByClampingToExtent](v26, "imageByClampingToExtent");
  v44[3] = v24;
  v44[4] = v30;
  v36 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 5);
  v42 = CFSTR("kCIKernelOutputFormat");
  v43 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2053);
  v37 = (void *)objc_msgSend(v31, "applyWithExtent:roiCallback:arguments:options:", &__block_literal_global_204, v36, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1), v32, v33, v34, v35);
  -[CIImage extent](inputPreprocImage, "extent");
  return (id)objc_msgSend(v37, "imageByCroppingToRect:");
}

double __47__CIDisparityRefinementAntialiasV3_outputImage__block_invoke(double result, double a2, double a3, double a4, uint64_t a5, int a6)
{
  if ((a6 - 1) < 2 || a6)
    *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&result, -2.0, -2.0);
  return result;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (CIImage)inputPreprocImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputPreprocImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (CIImage)inputDisparityWeightImage
{
  return (CIImage *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputDisparityWeightImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSDictionary)inputTuningParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputTuningParameters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSNumber)inputScale
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

@end

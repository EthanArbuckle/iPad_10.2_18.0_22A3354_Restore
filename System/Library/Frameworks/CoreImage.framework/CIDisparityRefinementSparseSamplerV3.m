@implementation CIDisparityRefinementSparseSamplerV3

- (id)sampleKernel
{
  if (-[CIDisparityRefinementSparseSamplerV3 sampleKernel]::onceToken != -1)
    dispatch_once(&-[CIDisparityRefinementSparseSamplerV3 sampleKernel]::onceToken, &__block_literal_global_164);
  return (id)-[CIDisparityRefinementSparseSamplerV3 sampleKernel]::k;
}

id __52__CIDisparityRefinementSparseSamplerV3_sampleKernel__block_invoke()
{
  id result;

  result = +[CIKernel SDOFV3MetalKernelNamed:](CIKernel, "SDOFV3MetalKernelNamed:", CFSTR("disparity_refinement_sample"));
  -[CIDisparityRefinementSparseSamplerV3 sampleKernel]::k = (uint64_t)result;
  return result;
}

- (id)outputImage
{
  CIImage *inputImage;
  CIImage *inputPreprocImage;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;
  float v11;
  float v12;
  float v13;
  double v14;
  float v15;
  double v16;
  float v17;
  float v18;
  double v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  CIVector *v40;
  CIVector *v41;
  CIVector *v42;
  CIVector *v43;
  id v44;
  CIImage *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  uint64_t v54;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  double v61;
  double v62;
  double v63;
  CGAffineTransform v64;
  _QWORD v65[4];
  float v66;
  CGAffineTransform v67;
  const __CFString *v68;
  uint64_t v69;
  _QWORD v70[7];

  v70[6] = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  inputPreprocImage = self->inputPreprocImage;
  -[CIImage extent](inputImage, "extent");
  v6 = v5;
  v63 = v7;
  -[CIImage extent](inputPreprocImage, "extent");
  v61 = v8;
  v62 = v9;
  -[NSNumber floatValue](-[CIDisparityRefinementSparseSamplerV3 inputScale](self, "inputScale"), "floatValue");
  v11 = v10;
  SDOFDisparityRefinementParameterValue(CFSTR("radius"), self->inputTuningParameters);
  v13 = v11 * v12;
  -[CIImage extent](inputPreprocImage, "extent");
  v15 = v14;
  -[CIImage extent](inputImage, "extent");
  v17 = v16;
  v60 = (float)(v13 * v15) / v17;
  SDOFDisparityRefinementParameterValue(CFSTR("maxReconstructionWeight"), self->inputTuningParameters);
  v59 = v18;
  if (v11 >= 0.5)
    v19 = v11;
  else
    v19 = 0.5;
  SDOFDisparityRefinementParameterValue(CFSTR("nSamples"), self->inputTuningParameters);
  v21 = v19 * v20;
  v58 = ceilf(v21);
  SDOFDisparityRefinementParameterValue(CFSTR("disparitySigma"), self->inputTuningParameters);
  v57 = -1.0 / (float)((float)(v22 * v22) + (float)(v22 * v22));
  SDOFDisparityRefinementParameterValue(CFSTR("lumaSigma"), self->inputTuningParameters);
  v24 = v23;
  SDOFDisparityRefinementParameterValue(CFSTR("chromaSigma"), self->inputTuningParameters);
  v26 = v25;
  SDOFDisparityRefinementParameterValue(CFSTR("segmentationSigma"), self->inputTuningParameters);
  v27 = -1.0 / (float)((float)(v26 * v26) + (float)(v26 * v26));
  v29 = -1.0 / (float)((float)(v28 * v28) + (float)(v28 * v28));
  SDOFDisparityRefinementParameterValue(CFSTR("accumulatedWeightT0"), self->inputTuningParameters);
  v56 = v30;
  SDOFDisparityRefinementParameterValue(CFSTR("accumulatedWeightT1"), self->inputTuningParameters);
  v32 = v31;
  SDOFDisparityRefinementParameterValue(CFSTR("innerSamplingRadius"), self->inputTuningParameters);
  v34 = v11 * v33;
  SDOFDisparityRefinementParameterValue(CFSTR("outerSamplingRadius"), self->inputTuningParameters);
  v36 = v61 * v13 / v6;
  v37 = v36 * v36;
  v38 = v37 * (float)(v34 * v34);
  v39 = v37 * (float)((float)(v11 * v35) * (float)(v11 * v35));
  v40 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v60, v59, v58, v57);
  v41 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", (float)(-1.0 / (float)((float)(v24 * v24) + (float)(v24 * v24))), v27, v27, v29);
  v42 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v38, v39, v56, v32);
  v43 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v61, v62);
  v44 = -[CIDisparityRefinementSparseSamplerV3 sampleKernel](self, "sampleKernel");
  memset(&v67, 0, sizeof(v67));
  CGAffineTransformMakeScale(&v67, v61 / v6, v62 / v63);
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __51__CIDisparityRefinementSparseSamplerV3_outputImage__block_invoke;
  v65[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v66 = v60;
  v64 = v67;
  v45 = -[CIImage imageByApplyingTransform:](inputImage, "imageByApplyingTransform:", &v64);
  -[CIImage extent](inputPreprocImage, "extent");
  v47 = v46;
  v49 = v48;
  v51 = v50;
  v53 = v52;
  v70[0] = -[CIImage imageByClampingToExtent](inputPreprocImage, "imageByClampingToExtent");
  v70[1] = -[CIImage imageByClampingToExtent](v45, "imageByClampingToExtent");
  v70[2] = v40;
  v70[3] = v41;
  v70[4] = v42;
  v70[5] = v43;
  v54 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 6);
  v68 = CFSTR("kCIKernelOutputFormat");
  v69 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2053);
  return (id)objc_msgSend(v44, "applyWithExtent:roiCallback:arguments:options:", v65, v54, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1), v47, v49, v51, v53);
}

double __51__CIDisparityRefinementSparseSamplerV3_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a2, (float)-*(float *)(a1 + 32), (float)-*(float *)(a1 + 32));
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

- (NSDictionary)inputTuningParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputTuningParameters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSNumber)inputScale
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

@end

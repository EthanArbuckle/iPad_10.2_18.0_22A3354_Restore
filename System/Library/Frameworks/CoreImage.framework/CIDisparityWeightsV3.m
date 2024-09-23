@implementation CIDisparityWeightsV3

- (id)weightsXKernel
{
  if (-[CIDisparityWeightsV3 weightsXKernel]::onceToken != -1)
    dispatch_once(&-[CIDisparityWeightsV3 weightsXKernel]::onceToken, &__block_literal_global_124);
  return (id)-[CIDisparityWeightsV3 weightsXKernel]::k;
}

id __38__CIDisparityWeightsV3_weightsXKernel__block_invoke()
{
  id result;

  result = +[CIKernel SDOFV3MetalKernelNamed:](CIKernel, "SDOFV3MetalKernelNamed:", CFSTR("disparity_refinement_calcweightsX"));
  -[CIDisparityWeightsV3 weightsXKernel]::k = (uint64_t)result;
  return result;
}

- (id)weightsYKernel
{
  if (-[CIDisparityWeightsV3 weightsYKernel]::onceToken != -1)
    dispatch_once(&-[CIDisparityWeightsV3 weightsYKernel]::onceToken, &__block_literal_global_127);
  return (id)-[CIDisparityWeightsV3 weightsYKernel]::k;
}

id __38__CIDisparityWeightsV3_weightsYKernel__block_invoke()
{
  id result;

  result = +[CIKernel SDOFV3MetalKernelNamed:](CIKernel, "SDOFV3MetalKernelNamed:", CFSTR("disparity_refinement_calcweightsY"));
  -[CIDisparityWeightsV3 weightsYKernel]::k = (uint64_t)result;
  return result;
}

- (id)outputImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int v9;
  int v10;
  CIImage *v11;
  float v12;
  id v13;
  double *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  double v31;
  double v32;
  double v33;
  double v34;
  float v35;
  _QWORD v36[4];
  int v37;
  _QWORD v38[4];
  int v39;
  const __CFString *v40;
  uint64_t v41;
  _QWORD v42[5];
  const __CFString *v43;
  uint64_t v44;
  _QWORD v45[5];

  v45[3] = *MEMORY[0x1E0C80C00];
  -[CIImage extent](self->inputImage, "extent");
  v4 = v3;
  v31 = v5;
  v32 = v3;
  v6 = v5;
  v33 = v8;
  v34 = v7;
  SDOFDisparityRefinementParameterValue(CFSTR("radius"), self->inputTuningParameters);
  v10 = v9;
  v11 = -[CIImage imageByClampingToExtent](self->inputImage, "imageByClampingToExtent");
  SDOFDisparityRefinementParameterValue(CFSTR("weightScaling"), self->inputTuningParameters);
  v35 = -1.0 / (float)((float)(v12 * v12) + (float)(v12 * v12));
  v13 = -[CIDisparityWeightsV3 weightsXKernel](self, "weightsXKernel");
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __35__CIDisparityWeightsV3_outputImage__block_invoke;
  v38[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v39 = v10;
  v14 = (double *)MEMORY[0x1E0C9D5E0];
  v15 = *MEMORY[0x1E0C9D5E0];
  v16 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v17 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v18 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  v45[0] = v11;
  LODWORD(v19) = v10;
  v45[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
  v45[2] = -[CIDisparityWeightsV3 inputScale](self, "inputScale");
  v20 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3);
  v43 = CFSTR("kCIKernelOutputFormat");
  v44 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2054);
  v21 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "applyWithExtent:roiCallback:arguments:options:", v38, v20, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1), v15, v16, v17, v18), "imageByCroppingToRect:", v4, v6, v34, v33), "imageByClampingToExtent");
  v22 = -[CIDisparityWeightsV3 weightsYKernel](self, "weightsYKernel");
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __35__CIDisparityWeightsV3_outputImage__block_invoke_2;
  v36[3] = &__block_descriptor_36_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v37 = v10;
  v23 = *v14;
  v24 = v14[1];
  v25 = v14[2];
  v26 = v14[3];
  v42[0] = v11;
  v42[1] = v21;
  LODWORD(v27) = v10;
  v42[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27);
  v42[3] = -[CIDisparityWeightsV3 inputScale](self, "inputScale");
  *(float *)&v28 = v35;
  v42[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28);
  v29 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 5);
  v40 = CFSTR("kCIKernelOutputFormat");
  v41 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2054);
  return (id)objc_msgSend((id)objc_msgSend(v22, "applyWithExtent:roiCallback:arguments:options:", v36, v29, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1), v23, v24, v25, v26), "imageByCroppingToRect:", v32, v31, v34, v33);
}

double __35__CIDisparityWeightsV3_outputImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a2, (float)-*(float *)(a1 + 32), 0.0);
  return result;
}

double __35__CIDisparityWeightsV3_outputImage__block_invoke_2(uint64_t a1, int a2, double result, double a4, double a5, double a6)
{
  if (a2)
    *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&result, 0.0, (float)-*(float *)(a1 + 32));
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

@end

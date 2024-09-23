@implementation CILensModelCalculator

+ (id)customAttributes
{
  _QWORD v3[5];
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("CIAttributeFilterCategories");
  v3[0] = CFSTR("CICategoryColorAdjustment");
  v3[1] = CFSTR("CICategoryVideo");
  v3[2] = CFSTR("CICategoryStillImage");
  v3[3] = CFSTR("CICategoryBuiltIn");
  v3[4] = CFSTR("CICategoryApplePrivate");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  v5[1] = CFSTR("11");
  v4[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v4[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v5[2] = CFSTR("10.13");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (id)mtlKernel
{
  if (-[CILensModelCalculator mtlKernel]::onceToken != -1)
    dispatch_once(&-[CILensModelCalculator mtlKernel]::onceToken, &__block_literal_global_44);
  return (id)-[CILensModelCalculator mtlKernel]::k;
}

CIKernel *__34__CILensModelCalculator_mtlKernel__block_invoke()
{
  CIKernel *result;

  result = (CIKernel *)SDOFV2MetalLib();
  if (result)
  {
    result = +[CIKernel kernelWithFunctionName:fromMetalLibraryData:error:](CIKernel, "kernelWithFunctionName:fromMetalLibraryData:error:", CFSTR("slm_calcV2"), result, 0);
    -[CILensModelCalculator mtlKernel]::k = (uint64_t)result;
  }
  return result;
}

- (id)kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_ciLensModelCalculator);
}

- (id)cpuParams
{
  float v3;
  float v4;
  double v5;
  double v6;
  CIVector *inputOriginalSize;
  double v8;
  double v9;
  double v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;

  SDOFSimpleLensModelValue(CFSTR("zeroShiftPercentile"), self->inputTuningParameters);
  v4 = v3;
  -[CIVector X](self->inputOriginalSize, "X");
  v6 = v5;
  -[CIVector Y](self->inputOriginalSize, "Y");
  inputOriginalSize = self->inputOriginalSize;
  if (v6 <= v8)
    -[CIVector Y](inputOriginalSize, "Y");
  else
    -[CIVector X](inputOriginalSize, "X");
  v10 = v9;
  -[NSNumber floatValue](self->inputIntrinsicMatrixFocalLength, "floatValue");
  v12 = v11;
  -[NSNumber floatValue](self->inputSimulatedAperture, "floatValue");
  v14 = v13;
  SDOFSimpleLensModelValue(CFSTR("disparityScalingFactor"), self->inputTuningParameters);
  if (v15 == 0.0)
    v15 = 1.0;
  v16 = v10;
  v17 = v12 / v16;
  v18 = (float)(v17 * 36.0) / (v14 * 1000.0);
  v19 = v18 * 0.5 * v17;
  v20 = v15 * v19;
  SDOFRenderingValue(CFSTR("maxBlur"), self->inputTuningParameters);
  v22 = v20 / v21;
  SDOFSimpleLensModelValue(CFSTR("maxFGBlur"), self->inputTuningParameters);
  v24 = v23 / v19;
  SDOFSimpleLensModelValue(CFSTR("shiftDeadZone"), self->inputTuningParameters);
  return +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v4, v22, v24, (float)(1.0 / v25));
}

- (id)outputImage
{
  CIImage *inputImage;
  CGFloat v4;
  CGFloat v5;
  double x;
  double y;
  double width;
  double height;
  CIVector *v10;
  CIImage *v11;
  id v12;
  id v13;
  double *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  CIImage *v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  CIVector *inputOriginalSize;
  double v26;
  double v27;
  float v29;
  float v30;
  float v31;
  int v32;
  int v33;
  int v34;
  int v35;
  float v36;
  float v37;
  float v38;
  float v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  uint64_t v46;
  CIVector *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  uint64_t v52;
  CIImage *v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[5];
  _QWORD v57[8];
  _DWORD v58[14];
  _QWORD v59[8];
  CGAffineTransform v60;
  CGAffineTransform v61;
  _QWORD v62[2];
  _QWORD v63[3];
  _QWORD v64[3];
  _QWORD v65[5];
  const __CFString *v66;
  uint64_t v67;
  _QWORD v68[6];
  CGRect v69;
  CGRect v70;

  v68[4] = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  if (!inputImage)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  -[CIImage extent](inputImage, "extent");
  memset(&v61, 0, sizeof(v61));
  CGAffineTransformMakeScale(&v61, v4, v5);
  -[CIVector CGRectValue](self->inputFocusRect, "CGRectValue");
  v60 = v61;
  v70 = CGRectApplyAffineTransform(v69, &v60);
  x = v70.origin.x;
  y = v70.origin.y;
  width = v70.size.width;
  height = v70.size.height;
  v10 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  v11 = -[CIImage imageByClampingToExtent](self->inputMinMaxImage, "imageByClampingToExtent");
  v12 = -[CILensModelCalculator cpuParams](self, "cpuParams");
  v13 = -[CILensModelCalculator kernel](self, "kernel");
  v14 = (double *)MEMORY[0x1E0C9D5E0];
  v15 = *MEMORY[0x1E0C9D5E0];
  v16 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v17 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v18 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __36__CILensModelCalculator_outputImage__block_invoke;
  v59[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  *(double *)&v59[4] = x;
  *(double *)&v59[5] = y;
  *(double *)&v59[6] = width;
  *(double *)&v59[7] = height;
  v68[0] = self->inputImage;
  v68[1] = v10;
  v68[2] = v11;
  v68[3] = v12;
  v19 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 4);
  v66 = CFSTR("kCIKernelOutputFormat");
  v67 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2056);
  v20 = (CIImage *)objc_msgSend(v13, "applyWithExtent:roiCallback:arguments:options:", v59, v19, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1), v15, v16, v17, v18);
  v21 = -[CILensModelCalculator mtlKernel](self, "mtlKernel");
  if (v21)
  {
    v22 = v21;
    -[CIVector X](self->inputOriginalSize, "X");
    v24 = v23;
    -[CIVector Y](self->inputOriginalSize, "Y");
    inputOriginalSize = self->inputOriginalSize;
    if (v24 <= v26)
      -[CIVector Y](inputOriginalSize, "Y");
    else
      -[CIVector X](inputOriginalSize, "X");
    v29 = v27;
    -[NSNumber floatValue](self->inputIntrinsicMatrixFocalLength, "floatValue");
    v31 = v30 / v29;
    v32 = 0;
    v33 = 0;
    if ((unint64_t)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->inputTuningParameters, "objectForKeyedSubscript:", CFSTR("Version")), "unsignedIntegerValue") >= 2)
    {
      SDOFRenderingValue(CFSTR("minimumSimulatedAperture"), self->inputTuningParameters);
      v32 = v34;
      SDOFSimpleLensModelValue(CFSTR("maximumSimulatedAperture"), self->inputTuningParameters);
      v33 = v35;
    }
    v36 = x;
    v37 = y;
    *(float *)v58 = v36;
    *(float *)&v58[1] = v37;
    v38 = width;
    v39 = height;
    *(float *)&v58[2] = v38;
    *(float *)&v58[3] = v39;
    SDOFSimpleLensModelValue(CFSTR("zeroShiftPercentile"), self->inputTuningParameters);
    v58[4] = v40;
    *(float *)&v58[5] = v31 * 36.0;
    -[NSNumber floatValue](self->inputSimulatedAperture, "floatValue");
    v58[6] = v41;
    v58[7] = v32;
    v58[8] = v33;
    *(float *)&v58[9] = v31;
    SDOFSimpleLensModelValue(CFSTR("maxFGBlur"), self->inputTuningParameters);
    v58[10] = v42;
    SDOFRenderingValue(CFSTR("maxBlur"), self->inputTuningParameters);
    v58[11] = v43;
    SDOFSimpleLensModelValue(CFSTR("shiftDeadZone"), self->inputTuningParameters);
    v58[12] = v44;
    SDOFSimpleLensModelValue(CFSTR("disparityScalingFactor"), self->inputTuningParameters);
    v58[13] = v45;
    v46 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v58, 56);
    -[CIImage extent](self->inputImage, "extent");
    v47 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
    v48 = *v14;
    v49 = v14[1];
    v50 = v14[2];
    v51 = v14[3];
    v52 = MEMORY[0x1E0C809B0];
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __36__CILensModelCalculator_outputImage__block_invoke_77;
    v57[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
    *(double *)&v57[4] = x;
    *(double *)&v57[5] = y;
    *(double *)&v57[6] = width;
    *(double *)&v57[7] = height;
    v65[0] = v46;
    v65[1] = v12;
    v53 = self->inputImage;
    v65[2] = v11;
    v65[3] = v53;
    v65[4] = v47;
    v54 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 5);
    v63[0] = CFSTR("kCIKernelOutputFormat");
    v64[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2056);
    v64[1] = &unk_1E2F1DCC0;
    v63[1] = CFSTR("kCIKernelThreadgroupsPerGrid");
    v63[2] = CFSTR("kCIKernelThreadsPerThreadgroup");
    v64[2] = &unk_1E2F1DCA8;
    v55 = objc_msgSend(v22, "applyWithExtent:roiCallback:arguments:options:", v57, v54, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 3), v48, v49, v50, v51);
    if (v55)
    {
      v62[0] = v20;
      v62[1] = v55;
      v56[0] = v52;
      v56[1] = 3221225472;
      v56[2] = __36__CILensModelCalculator_outputImage__block_invoke_2;
      v56[3] = &unk_1E2EC4910;
      v56[4] = v55;
      v20 = +[CIImage imageWithArrayOfImages:selector:](CIImage, "imageWithArrayOfImages:selector:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2), v56);
    }
  }
  return -[CIImage imageByClampingToExtent](-[CIImage imageByInsertingIntermediate](-[CIImage imageByCroppingToRect:](v20, "imageByCroppingToRect:", 0.0, 0.0, 1.0, 1.0), "imageByInsertingIntermediate"), "imageByClampingToExtent");
}

double __36__CILensModelCalculator_outputImage__block_invoke(uint64_t a1, int a2)
{
  if (a2)
    return 0.0;
  else
    return *(double *)(a1 + 32);
}

double __36__CILensModelCalculator_outputImage__block_invoke_77(uint64_t a1, int a2)
{
  if (a2)
    return 0.0;
  else
    return *(double *)(a1 + 32);
}

uint64_t __36__CILensModelCalculator_outputImage__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("kContextInfoIsMetal")), "BOOLValue");
  if ((_DWORD)result)
    return *(_QWORD *)(a1 + 32) != 0;
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

- (CIImage)inputMinMaxImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputMinMaxImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (CIVector)inputOriginalSize
{
  return self->inputOriginalSize;
}

- (void)setInputOriginalSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (CIVector)inputFocusRect
{
  return self->inputFocusRect;
}

- (void)setInputFocusRect:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)inputSimulatedAperture
{
  return self->inputSimulatedAperture;
}

- (void)setInputSimulatedAperture:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)inputIntrinsicMatrixFocalLength
{
  return self->inputIntrinsicMatrixFocalLength;
}

- (void)setInputIntrinsicMatrixFocalLength:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSDictionary)inputTuningParameters
{
  return self->inputTuningParameters;
}

- (void)setInputTuningParameters:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

@end

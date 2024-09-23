@implementation CIPortraitBlurCombiner

- (id)_blendKernel:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t *v4;

  v3 = a3;
  if (-[CIPortraitBlurCombiner _blendKernel:]::onceToken != -1)
    dispatch_once(&-[CIPortraitBlurCombiner _blendKernel:]::onceToken, &__block_literal_global_382);
  v4 = &-[CIPortraitBlurCombiner _blendKernel:]::kWMatte;
  if (!v3)
    v4 = &-[CIPortraitBlurCombiner _blendKernel:]::k;
  return (id)*v4;
}

CIColorKernel *__39__CIPortraitBlurCombiner__blendKernel___block_invoke()
{
  CIColorKernel *result;
  CIColorKernel *v1;

  result = (CIColorKernel *)SDOFV2MetalLib();
  if (result)
  {
    v1 = result;
    -[CIPortraitBlurCombiner _blendKernel:]::k = +[CIKernel kernelWithFunctionName:fromMetalLibraryData:error:](CIColorKernel, "kernelWithFunctionName:fromMetalLibraryData:error:", CFSTR("_CIPortraitBlurBlendWithMaskFromAlphaM"), result, 0);
    result = +[CIKernel kernelWithFunctionName:fromMetalLibraryData:error:](CIColorKernel, "kernelWithFunctionName:fromMetalLibraryData:error:", CFSTR("_CIPortraitBlurBlendWithMaskFromAlphaWithMatte"), v1, 0);
    -[CIPortraitBlurCombiner _blendKernel:]::kWMatte = (uint64_t)result;
  }
  return result;
}

- (id)nonMetalKernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_CIPortraitBlurBlendWithMaskMatteFromAlpha);
}

- (id)nonMetalKernelYCC
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_CIPortraitBlurBlendWithMaskMatteFromAlphaYCC);
}

- (id)_ourBlendKernelMetal
{
  if (-[CIPortraitBlurCombiner _ourBlendKernelMetal]::onceToken != -1)
    dispatch_once(&-[CIPortraitBlurCombiner _ourBlendKernelMetal]::onceToken, &__block_literal_global_387);
  return (id)-[CIPortraitBlurCombiner _ourBlendKernelMetal]::k;
}

id __46__CIPortraitBlurCombiner__ourBlendKernelMetal__block_invoke()
{
  id result;

  result = +[CIColorKernel SDOFV2MetalKernelNamed:](CIColorKernel, "SDOFV2MetalKernelNamed:", CFSTR("_CIPortraitBlurBlendWithMaskFromAlphaM"));
  -[CIPortraitBlurCombiner _ourBlendKernelMetal]::k = (uint64_t)result;
  return result;
}

- (id)outputImage
{
  float v3;
  float v4;
  float v5;
  float v6;
  double v7;
  float v8;
  CIImage *inputMatteImage;
  double v10;
  double v11;
  CIImage *v12;
  float v13;
  double v14;
  float v15;
  double v16;
  float v17;
  CIVector *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  float v25;
  CIImage *inputBlurImage;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  float v32;
  double v33;
  double v34;
  double v35;
  float v36;
  float v37;
  float v38;
  _BOOL4 v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  double v46;
  float v47;
  double v48;
  float v49;
  CIVector *v50;
  id v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  uint64_t v60;
  void *v61;
  id v62;
  double v63;
  double v64;
  double v65;
  double v66;
  id v68;
  id v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  void *v79;
  CGAffineTransform v80;
  CGAffineTransform v81;
  CGAffineTransform v82;
  CGAffineTransform v83;
  _QWORD v84[3];
  _QWORD v85[3];
  _QWORD v86[3];
  const __CFString *v87;
  CIVector *v88;
  _QWORD v89[5];
  _QWORD v90[5];

  v90[4] = *MEMORY[0x1E0C80C00];
  SDOFRenderingValue(CFSTR("alphaGain"), self->inputTuningParameters);
  v4 = v3;
  SDOFRenderingValue(CFSTR("alphaEpsilon"), self->inputTuningParameters);
  v6 = v5;
  -[CIImage extent](self->inputBlurImage, "extent");
  v8 = v7;
  inputMatteImage = self->inputMatteImage;
  if (!inputMatteImage
    || (-[CIImage extent](inputMatteImage, "extent"), v10 <= 1.0)
    || (-[CIImage extent](self->inputMatteImage, "extent"), v11 == 0.0))
  {
    v12 = 0;
  }
  else
  {
    v12 = self->inputMatteImage;
  }
  SDOFRenderingValue(CFSTR("maxBlur"), self->inputTuningParameters);
  v14 = v13;
  SDOFRenderingValue(CFSTR("sharpRadius"), self->inputTuningParameters);
  v16 = v15;
  SDOFRenderingValue(CFSTR("softRadius"), self->inputTuningParameters);
  v18 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v14, v16, v17, v8);
  -[CIImage extent](self->inputImage, "extent");
  v20 = v19;
  -[CIImage extent](self->inputBlurImage, "extent");
  *(float *)&v16 = v20 / v21;
  -[CIImage extent](self->inputImage, "extent");
  v23 = v22;
  -[CIImage extent](self->inputBlurImage, "extent");
  v25 = v23 / v24;
  memset(&v83, 0, sizeof(v83));
  CGAffineTransformMakeScale(&v83, *(float *)&v16, v25);
  inputBlurImage = self->inputBlurImage;
  v82 = v83;
  v27 = -[CIImage imageByApplyingTransform:](inputBlurImage, "imageByApplyingTransform:", &v82);
  v28 = 0;
  if (v4 != 0.0 && v6 != 0.0 && v12)
  {
    -[CIImage extent](self->inputImage, "extent");
    v30 = v29;
    -[CIImage extent](v12, "extent");
    v32 = v30 / v31;
    -[CIImage extent](self->inputImage, "extent");
    v34 = v33;
    -[CIImage extent](v12, "extent");
    v36 = v34 / v35;
    memset(&v81, 0, sizeof(v81));
    CGAffineTransformMakeScale(&v81, v32, v36);
    v80 = v81;
    v28 = -[CIImage imageByApplyingTransform:](v12, "imageByApplyingTransform:", &v80);
  }
  SDOFRenderingValue(CFSTR("blendingQuarterResAlphaGain"), self->inputTuningParameters);
  v38 = v37;
  SDOFRenderingValue(CFSTR("blendingFullResAlphaGain"), self->inputTuningParameters);
  v39 = fabsf(v38) >= 0.001;
  if (fabsf(v40) >= 0.001)
    v39 = 1;
  if (!v28 || !v39)
  {
    v62 = -[CIPortraitBlurCombiner _ourBlendKernelMetal](self, "_ourBlendKernelMetal");
    -[CIImage extent](self->inputImage, "extent");
    v53 = v63;
    v55 = v64;
    v57 = v65;
    v59 = v66;
    v84[0] = self->inputImage;
    v84[1] = v27;
    v84[2] = v18;
    v60 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 3);
    v61 = v62;
    return (id)objc_msgSend(v61, "applyWithExtent:arguments:", v60, v53, v55, v57, v59);
  }
  SDOFRenderingValue(CFSTR("blendingQuarterResAlphaGain"), self->inputTuningParameters);
  v42 = v41;
  SDOFRenderingValue(CFSTR("blendingFullResAlphaGain"), self->inputTuningParameters);
  v44 = v43;
  SDOFRenderingValue(CFSTR("maxBlur"), self->inputTuningParameters);
  v46 = (float)(v45 * v8);
  SDOFRenderingValue(CFSTR("sharpRadius"), self->inputTuningParameters);
  v48 = v47;
  SDOFRenderingValue(CFSTR("softRadius"), self->inputTuningParameters);
  v50 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v46, v48, v49, v44);
  if (vabds_f32(v42, v44) < 0.001)
  {
    v51 = -[CIPortraitBlurCombiner nonMetalKernel](self, "nonMetalKernel");
    -[CIImage extent](self->inputImage, "extent");
    v53 = v52;
    v55 = v54;
    v57 = v56;
    v59 = v58;
    v90[0] = self->inputImage;
    v90[1] = v27;
    v90[2] = v28;
    v90[3] = v50;
    v60 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 4);
    v61 = v51;
    return (id)objc_msgSend(v61, "applyWithExtent:arguments:", v60, v53, v55, v57, v59);
  }
  v68 = +[CIImage imageYCC444:matrix:fullRange:colorSpace:](CIImage, "imageYCC444:matrix:fullRange:colorSpace:", self->inputImage, 709, 1, -[CIImage colorSpace](self->inputImage, "colorSpace"));
  v69 = -[CIPortraitBlurCombiner nonMetalKernelYCC](self, "nonMetalKernelYCC");
  -[CIImage extent](self->inputImage, "extent");
  v71 = v70;
  v73 = v72;
  v75 = v74;
  v77 = v76;
  v89[0] = v68;
  v89[1] = v27;
  v89[2] = v28;
  v89[3] = v50;
  *(float *)&v70 = v42;
  v89[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v70);
  v78 = (void *)objc_msgSend(v69, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 5), v71, v73, v75, v77);
  v87 = CFSTR("inputBiasVector");
  v88 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", 0.0, 0.501960814, 0.501960814);
  v79 = (void *)objc_msgSend(v78, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1));
  v85[0] = CFSTR("inputRVector");
  v86[0] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", 0.212599993, 0.715200007, 0.0722000003);
  v85[1] = CFSTR("inputGVector");
  v86[1] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", -0.114122704, -0.383916527, 0.498039216);
  v85[2] = CFSTR("inputBVector");
  v86[2] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", 0.498039216, -0.452372015, -0.0456672079);
  return (id)objc_msgSend(v79, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 3));
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (CIImage)inputBlurImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputBlurImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (CIImage)inputMatteImage
{
  return (CIImage *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputMatteImage:(id)a3
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

@end

@implementation CIPortraitAntialias

- (id)_kernel:(BOOL)a3 withAddedNoise:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  id *v6;
  uint64_t *v7;

  v4 = a4;
  v5 = a3;
  if (-[CIPortraitAntialias _kernel:withAddedNoise:]::onceToken != -1)
    dispatch_once(&-[CIPortraitAntialias _kernel:withAddedNoise:]::onceToken, &__block_literal_global_59);
  v6 = (id *)&-[CIPortraitAntialias _kernel:withAddedNoise:]::kH;
  v7 = &-[CIPortraitAntialias _kernel:withAddedNoise:]::kV;
  if (!v4)
    v7 = &-[CIPortraitAntialias _kernel:withAddedNoise:]::kVN;
  if (!v5)
    v6 = (id *)v7;
  return *v6;
}

CIKernel *__46__CIPortraitAntialias__kernel_withAddedNoise___block_invoke()
{
  CIKernel *result;
  CIKernel *v1;

  result = (CIKernel *)SDOFV2MetalLib();
  if (result)
  {
    v1 = result;
    -[CIPortraitAntialias _kernel:withAddedNoise:]::kH = +[CIKernel kernelWithFunctionName:fromMetalLibraryData:error:](CIKernel, "kernelWithFunctionName:fromMetalLibraryData:error:", CFSTR("_sparserendering_antialias_x"), result, 0);
    -[CIPortraitAntialias _kernel:withAddedNoise:]::kV = +[CIKernel kernelWithFunctionName:fromMetalLibraryData:error:](CIKernel, "kernelWithFunctionName:fromMetalLibraryData:error:", CFSTR("_sparserendering_antialias_y"), v1, 0);
    result = +[CIKernel kernelWithFunctionName:fromMetalLibraryData:error:](CIKernel, "kernelWithFunctionName:fromMetalLibraryData:error:", CFSTR("_sparserendering_antialias_y_no_noise"), v1, 0);
    -[CIPortraitAntialias _kernel:withAddedNoise:]::kVN = (uint64_t)result;
  }
  return result;
}

- (id)_noiseGeneratorKernel
{
  if (-[CIPortraitAntialias _noiseGeneratorKernel]::onceToken != -1)
    dispatch_once(&-[CIPortraitAntialias _noiseGeneratorKernel]::onceToken, &__block_literal_global_162_0);
  return (id)-[CIPortraitAntialias _noiseGeneratorKernel]::k;
}

CIColorKernel *__44__CIPortraitAntialias__noiseGeneratorKernel__block_invoke()
{
  CIColorKernel *result;

  result = (CIColorKernel *)SDOFV2MetalLib();
  if (result)
  {
    result = +[CIKernel kernelWithFunctionName:fromMetalLibraryData:error:](CIColorKernel, "kernelWithFunctionName:fromMetalLibraryData:error:", CFSTR("_noiseGenerator"), result, 0);
    -[CIPortraitAntialias _noiseGeneratorKernel]::k = (uint64_t)result;
  }
  return result;
}

- (id)noiseColorKernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_sparserendering_add_noise);
}

- (id)outputImage:(id)a3 horizontal:(BOOL)a4
{
  _BOOL8 v4;
  float v7;
  float v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  int v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  CIVector *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CIVector *v25;
  double v26;
  NSNumber *inputMaxBlurInPixels;
  uint64_t v28;
  NSNumber *inputScale;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  id v40;
  float v41;
  CIVector *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  void *v48;
  int v49;
  float v50;
  CIVector *v51;
  id v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  id v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  uint64_t v70;
  void *v71;
  CGAffineTransform v72;
  _QWORD v73[5];
  _QWORD v74[5];
  BOOL v75;
  uint64_t v76;
  float *v77;
  uint64_t v78;
  int v79;
  const __CFString *v80;
  uint64_t v81;
  _QWORD v82[3];
  const __CFString *v83;
  uint64_t v84;
  CIVector *v85;
  const __CFString *v86;
  uint64_t v87;
  _QWORD v88[2];
  const __CFString *v89;
  uint64_t v90;
  _QWORD v91[3];
  _QWORD v92[6];

  v92[4] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v4 = a4;
  -[NSNumber floatValue](-[CIPortraitAntialias inputScale](self, "inputScale"), "floatValue");
  v8 = v7;
  v9 = v7 == 1.0 || v4;
  v10 = -[CIPortraitAntialias _kernel:withAddedNoise:](self, "_kernel:withAddedNoise:", v4, (v7 == 1.0) & ~v4);
  if (!v10)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v11 = v10;
  v76 = 0;
  v77 = (float *)&v76;
  v78 = 0x2020000000;
  v79 = 0;
  -[NSNumber floatValue](self->inputAntiAliasRadius, "floatValue");
  v79 = v12;
  if (v8 < 1.0)
  {
    v13 = v8 * v77[6];
    if (v13 < 3.0)
      v13 = 3.0;
    v77[6] = v13;
  }
  -[NSNumber floatValue](self->inputMaxBlurInPixels, "floatValue");
  v15 = v14;
  v16 = v77[6];
  -[NSNumber floatValue](self->inputLumaNoiseModelCoeff, "floatValue");
  v18 = v17;
  -[NSNumber floatValue](self->inputLumaNoiseAmpl, "floatValue");
  v20 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v15, v16, v18, v19);
  -[CIVector Z](self->inputRect, "Z");
  v22 = v21;
  -[CIVector W](self->inputRect, "W");
  v23 = v8;
  v25 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v22, v24, v23);
  if (v4)
  {
    inputMaxBlurInPixels = self->inputMaxBlurInPixels;
    v92[0] = a3;
    v92[1] = inputMaxBlurInPixels;
    *(float *)&v26 = v77[6];
    v28 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
    inputScale = self->inputScale;
    v92[2] = v28;
    v92[3] = inputScale;
    v30 = v92;
    v31 = 4;
  }
  else
  {
    v91[0] = a3;
    v91[1] = v20;
    v30 = v91;
    v31 = 3;
    v91[2] = v25;
  }
  v33 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, v31);
  if (v9)
  {
    v34 = v33;
    v35 = *MEMORY[0x1E0C9D5E0];
    v36 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
    v37 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
    v38 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
    v74[0] = MEMORY[0x1E0C809B0];
    v74[1] = 3221225472;
    v74[2] = __46__CIPortraitAntialias_outputImage_horizontal___block_invoke;
    v74[3] = &unk_1E2EC4CC0;
    v75 = v4;
    v74[4] = &v76;
    v89 = CFSTR("kCIKernelOutputFormat");
    v90 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2056);
    v39 = objc_msgSend(v11, "applyWithExtent:roiCallback:arguments:options:", v74, v34, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1), v35, v36, v37, v38);
  }
  else
  {
    v40 = -[CIPortraitAntialias _kernel:withAddedNoise:](self, "_kernel:withAddedNoise:", 0, 0);
    -[NSNumber floatValue](self->inputMaxBlurInPixels, "floatValue");
    v42 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v41, v77[6], v23);
    v43 = *MEMORY[0x1E0C9D5E0];
    v44 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
    v45 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
    v46 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __46__CIPortraitAntialias_outputImage_horizontal___block_invoke_2;
    v73[3] = &unk_1E2EC3638;
    v73[4] = &v76;
    v88[0] = a3;
    v88[1] = v42;
    v47 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 2);
    v86 = CFSTR("kCIKernelOutputFormat");
    v87 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2056);
    v48 = (void *)objc_msgSend(v40, "applyWithExtent:roiCallback:arguments:options:", v73, v47, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1), v43, v44, v45, v46);
    -[NSNumber floatValue](self->inputLumaNoiseModelCoeff, "floatValue");
    LODWORD(v43) = v49;
    -[NSNumber floatValue](self->inputLumaNoiseAmpl, "floatValue");
    v51 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", *(float *)&v43, v50);
    v52 = -[CIPortraitAntialias _noiseGeneratorKernel](self, "_noiseGeneratorKernel");
    -[CIVector X](self->inputSensorSize, "X");
    v54 = v53;
    -[CIVector Y](self->inputSensorSize, "Y");
    v55 = v54 * 0.5;
    v57 = v56 * 0.5;
    v85 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v55, v56 * 0.5);
    v58 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
    v83 = CFSTR("kCIKernelOutputFormat");
    v84 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2053);
    v59 = (void *)objc_msgSend(v52, "applyWithExtent:arguments:options:", v58, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1), 0.0, 0.0, v55, v57);
    CGAffineTransformMakeScale(&v72, v23, v23);
    v60 = objc_msgSend(v59, "imageByApplyingTransform:highQualityDownsample:", &v72, 0);
    v61 = -[CIPortraitAntialias noiseColorKernel](self, "noiseColorKernel");
    objc_msgSend(v48, "extent");
    v63 = v62;
    v65 = v64;
    v67 = v66;
    v69 = v68;
    v82[0] = v48;
    v82[1] = v60;
    v82[2] = v51;
    v70 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 3);
    v80 = CFSTR("kCIKernelOutputFormat");
    v81 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2056);
    v39 = objc_msgSend(v61, "applyWithExtent:arguments:options:", v70, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1), v63, v65, v67, v69);
  }
  v71 = (void *)v39;
  _Block_object_dispose(&v76, 8);
  return v71;
}

double __46__CIPortraitAntialias_outputImage_horizontal___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  float v5;
  double v6;
  double v7;
  double result;

  v5 = -*(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v6 = v5;
  if (*(_BYTE *)(a1 + 40))
    v7 = v5;
  else
    v7 = 0.0;
  if (*(_BYTE *)(a1 + 40))
    v6 = 0.0;
  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a2, v7, v6);
  return result;
}

double __46__CIPortraitAntialias_outputImage_horizontal___block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double result;

  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a2, 0.0, (float)-*(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
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
  double v9;
  double v10;
  id v11;
  CGRect v13;

  -[CIImage extent](self->inputImage, "extent");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[CIPortraitAntialias outputImage:horizontal:](self, "outputImage:horizontal:", -[CIPortraitAntialias outputImage:horizontal:](self, "outputImage:horizontal:", -[CIImage imageByClampingToExtent](self->inputImage, "imageByClampingToExtent"), 1), 0);
  v13.origin.x = v4;
  v13.origin.y = v6;
  v13.size.width = v8;
  v13.size.height = v10;
  if (CGRectEqualToRect(*MEMORY[0x1E0C9D5E0], v13))
    return v11;
  else
    return (id)objc_msgSend(v11, "imageByCroppingToRect:", v4, v6, v8, v10);
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSNumber)inputMaxBlurInPixels
{
  return self->inputMaxBlurInPixels;
}

- (void)setInputMaxBlurInPixels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)inputAntiAliasRadius
{
  return self->inputAntiAliasRadius;
}

- (void)setInputAntiAliasRadius:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)inputLumaNoiseAmpl
{
  return self->inputLumaNoiseAmpl;
}

- (void)setInputLumaNoiseAmpl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)inputLumaNoiseModelCoeff
{
  return self->inputLumaNoiseModelCoeff;
}

- (void)setInputLumaNoiseModelCoeff:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (CIVector)inputRect
{
  return self->inputRect;
}

- (void)setInputRect:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (CIVector)inputSensorSize
{
  return self->inputSensorSize;
}

- (void)setInputSensorSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

@end

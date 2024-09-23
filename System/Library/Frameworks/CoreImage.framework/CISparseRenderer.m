@implementation CISparseRenderer

+ (id)customAttributes
{
  uint64_t v2;
  _QWORD v4[4];
  _QWORD v5[4];
  _QWORD v6[4];
  _QWORD v7[4];
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("inputScale");
  v6[0] = CFSTR("CIAttributeType");
  v6[1] = CFSTR("CIAttributeSliderMin");
  v7[0] = CFSTR("CIAttributeTypeScalar");
  v7[1] = &unk_1E2F1A850;
  v6[2] = CFSTR("CIAttributeSliderMax");
  v6[3] = CFSTR("CIAttributeDefault");
  v7[2] = &unk_1E2F1A810;
  v7[3] = &unk_1E2F1A810;
  v2 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  v8[1] = CFSTR("inputDraftMode");
  v9[0] = v2;
  v4[0] = CFSTR("CIAttributeType");
  v4[1] = CFSTR("CIAttributeSliderMin");
  v5[0] = CFSTR("CIAttributeTypeInteger");
  v5[1] = &unk_1E2F1BC98;
  v4[2] = CFSTR("CIAttributeSliderMax");
  v4[3] = CFSTR("CIAttributeDefault");
  v5[2] = &unk_1E2F1BCE0;
  v5[3] = &unk_1E2F1BC98;
  v9[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 4);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
}

- (id)_packageParams:(BOOL)a3 extent:(CGRect)a4 image:(id)a5 haveAlpha:(BOOL)a6
{
  float v8;
  float v9;
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
  BOOL v24;
  double v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  NSDictionary *inputTuningParameters;
  float v32;
  int v33;
  float v34;
  double v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  CIVector *v49;
  CIVector *v50;
  CIVector *v51;
  double v52;
  CIVector *v53;
  void *v54;
  void *v55;
  void *v56;
  id result;
  CIImage *inputMatteImage;
  float v59;
  float v60;
  float v61;
  double v62;
  float v63;
  double v64;
  float v65;
  float v66;
  float v67;
  CIVector *v68;
  float v69;
  CIVector *v70;
  double width;
  double height;
  _BOOL4 v73;
  _BOOL4 v74;
  _QWORD v75[8];
  _QWORD v76[7];
  _QWORD v77[8];

  v73 = a3;
  v74 = a6;
  width = a4.size.width;
  height = a4.size.height;
  v77[6] = *MEMORY[0x1E0C80C00];
  -[NSNumber floatValue](self->inputApertureScaling, "floatValue", a4.origin.x, a4.origin.y);
  v9 = v8;
  v10 = v8;
  SDOFRenderingValue(CFSTR("ringAmplitude"), self->inputTuningParameters);
  v69 = v11;
  SDOFRenderingValue(CFSTR("ringSharpness"), self->inputTuningParameters);
  v67 = v12;
  SDOFRenderingValue(CFSTR("highlightBoostGain"), self->inputTuningParameters);
  v66 = v13;
  SDOFRenderingValue(CFSTR("relativeWeightThreshold"), self->inputTuningParameters);
  v15 = v14;
  SDOFRenderingValue(CFSTR("maxBlur"), self->inputTuningParameters);
  v17 = 0.5 / (float)(v15 / v16);
  SDOFRenderingValue(CFSTR("relativeWeightThreshold"), self->inputTuningParameters);
  v19 = v17 * v18;
  SDOFRenderingValue(CFSTR("maxBlur"), self->inputTuningParameters);
  v65 = v19 / v20;
  SDOFRenderingValue(CFSTR("maxBlur"), self->inputTuningParameters);
  v22 = v21;
  SDOFRenderingValue(CFSTR("shapeObstructionCoeff"), self->inputTuningParameters);
  v24 = v10 * v23 <= 1.0;
  v25 = 1.0;
  if (v24)
  {
    SDOFRenderingValue(CFSTR("shapeObstructionCoeff"), self->inputTuningParameters);
    v25 = (float)(v9 * v26);
  }
  v64 = v25;
  SDOFRenderingValue(CFSTR("sharpRadius"), self->inputTuningParameters);
  v61 = v27;
  SDOFRenderingValue(CFSTR("basePixelWeight"), self->inputTuningParameters);
  v63 = v28;
  SDOFRenderingValue(CFSTR("alphaEpsilon"), self->inputTuningParameters);
  v62 = v29;
  v60 = 1.0 - v29;
  SDOFRenderingValue(CFSTR("alphaGain"), self->inputTuningParameters);
  v59 = v30;
  inputTuningParameters = self->inputTuningParameters;
  -[NSNumber floatValue](self->inputScale, "floatValue");
  v33 = nRingsFromTuningParameters(inputTuningParameters, v32, +[CIDepthBlurEffect getDraftMode:](CIDepthBlurEffect, "getDraftMode:", -[CISparseRenderer inputDraftMode](self, "inputDraftMode")), self->inputAperture);
  SDOFHighlightRecoveryValue(CFSTR("blurRadiusT0"), self->inputTuningParameters);
  v35 = v22;
  v36 = v10 * v34 / v22;
  SDOFHighlightRecoveryValue(CFSTR("blurRadiusT1"), self->inputTuningParameters);
  v38 = v10 * v37 / v35;
  v39 = 1.0 / (float)(v38 - v36);
  v40 = -(float)(v39 * v36);
  SDOFHighlightRecoveryValue(CFSTR("mode"), self->inputTuningParameters);
  v42 = v41;
  SDOFHighlightRecoveryValue(CFSTR("preFilterGain"), self->inputTuningParameters);
  v44 = v43;
  SDOFHighlightRecoveryValue(CFSTR("weightGain"), self->inputTuningParameters);
  v46 = v45;
  SDOFHighlightRecoveryValue(CFSTR("intensityGain"), self->inputTuningParameters);
  v48 = v47;
  v49 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v69, v67, v66, v17);
  v68 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v65, v35, v64, v61);
  v50 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v63, v62, v60, v59);
  v51 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", (double)v33, v39, v40, (double)(3 * v33 * v33));
  v52 = 0.0;
  if (v42 >= 0.0)
    v52 = 1.0;
  v70 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v52, v44, v46, v48);
  v53 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", width, height, (double)v74);
  v54 = (void *)MEMORY[0x1E0C99DE8];
  v77[0] = a5;
  v77[1] = v49;
  v77[2] = v68;
  v77[3] = v50;
  v77[4] = v51;
  v77[5] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", width, height);
  v55 = (void *)objc_msgSend(v54, "arrayWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 6));
  v56 = v55;
  if (v74)
    objc_msgSend(v55, "insertObject:atIndex:", self->inputMatteImage, 1);
  v76[0] = a5;
  v76[1] = v49;
  v76[2] = v68;
  v76[3] = v50;
  v76[4] = v51;
  v76[5] = v70;
  v76[6] = v53;
  result = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 7);
  if (v74)
  {
    inputMatteImage = self->inputMatteImage;
    v75[0] = a5;
    v75[1] = inputMatteImage;
    v75[2] = v49;
    v75[3] = v68;
    v75[4] = v50;
    v75[5] = v51;
    v75[6] = v70;
    v75[7] = v53;
    result = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 8);
  }
  if (v73)
    return v56;
  return result;
}

- (BOOL)_useD2XRenderer
{
  float v3;
  float v4;
  float v5;
  _BOOL4 v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  BOOL v15;
  BOOL result;

  SDOFRenderingValue(CFSTR("ringAmplitude"), self->inputTuningParameters);
  v4 = v3;
  SDOFRenderingValue(CFSTR("shapeObstructionCoeff"), self->inputTuningParameters);
  if (v5 <= 1.0)
  {
    SDOFRenderingValue(CFSTR("shapeObstructionCoeff"), self->inputTuningParameters);
    v6 = v7 == 0.0;
  }
  else
  {
    v6 = 0;
  }
  SDOFHighlightRecoveryValue(CFSTR("weightGain"), self->inputTuningParameters);
  v9 = v8;
  SDOFHighlightRecoveryValue(CFSTR("intensityGain"), self->inputTuningParameters);
  v11 = v10;
  SDOFRenderingValue(CFSTR("alphaGain"), self->inputTuningParameters);
  v13 = v12;
  SDOFRenderingValue(CFSTR("alphaEpsilon"), self->inputTuningParameters);
  v15 = v4 != 1.0 || !v6;
  if (v15 || v9 != 0.0 || v11 != 0.0)
    return 0;
  result = 1;
  if (self->inputMatteImage)
  {
    if (v13 != 0.0 && v14 != 1.0)
      return 0;
  }
  return result;
}

- (id)stepsLUTGenerator
{
  if (-[CISparseRenderer stepsLUTGenerator]::onceToken != -1)
    dispatch_once(&-[CISparseRenderer stepsLUTGenerator]::onceToken, &__block_literal_global_257);
  return (id)-[CISparseRenderer stepsLUTGenerator]::k;
}

CIColorKernel *__37__CISparseRenderer_stepsLUTGenerator__block_invoke()
{
  CIColorKernel *result;

  result = (CIColorKernel *)SDOFV2MetalLib();
  if (result)
  {
    result = +[CIKernel kernelWithFunctionName:fromMetalLibraryData:error:](CIColorKernel, "kernelWithFunctionName:fromMetalLibraryData:error:", CFSTR("_sparserendering_stepLUT"), result, 0);
    -[CISparseRenderer stepsLUTGenerator]::k = (uint64_t)result;
  }
  return result;
}

- (id)baseVecsLUTGenerator
{
  if (-[CISparseRenderer baseVecsLUTGenerator]::onceToken != -1)
    dispatch_once(&-[CISparseRenderer baseVecsLUTGenerator]::onceToken, &__block_literal_global_260);
  return (id)-[CISparseRenderer baseVecsLUTGenerator]::k;
}

CIColorKernel *__40__CISparseRenderer_baseVecsLUTGenerator__block_invoke()
{
  CIColorKernel *result;

  result = (CIColorKernel *)SDOFV2MetalLib();
  if (result)
  {
    result = +[CIKernel kernelWithFunctionName:fromMetalLibraryData:error:](CIColorKernel, "kernelWithFunctionName:fromMetalLibraryData:error:", CFSTR("_sparserendering_baseVecLUT"), result, 0);
    -[CISparseRenderer baseVecsLUTGenerator]::k = (uint64_t)result;
  }
  return result;
}

- (id)stepsLUT:(unsigned int)a3
{
  uint64_t v3;
  id v4;
  double v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = 3 * a3 * a3;
  v4 = -[CISparseRenderer stepsLUTGenerator](self, "stepsLUTGenerator");
  v5 = (double)v3;
  v10[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v3);
  v6 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2056, CFSTR("kCIKernelOutputFormat"));
  return (id)objc_msgSend(v4, "applyWithExtent:arguments:options:", v6, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1), 0.0, 0.0, v5, 1.0);
}

- (id)baseVecsLUT:(unsigned int)a3
{
  unsigned int v3;
  id v4;
  uint64_t v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = 3 * a3 * a3;
  v4 = -[CISparseRenderer baseVecsLUTGenerator](self, "baseVecsLUTGenerator");
  v7 = CFSTR("kCIKernelOutputFormat");
  v8[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2054);
  v5 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  return (id)objc_msgSend(v4, "applyWithExtent:arguments:options:", MEMORY[0x1E0C9AA60], v5, 0.0, 0.0, (double)v3, 1.0);
}

- (id)_lutKernel:(BOOL)a3 alpha:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  uint64_t *v6;
  uint64_t *v7;

  v4 = a4;
  v5 = a3;
  if (-[CISparseRenderer _lutKernel:alpha:]::onceToken != -1)
    dispatch_once(&-[CISparseRenderer _lutKernel:alpha:]::onceToken, &__block_literal_global_263);
  v6 = &-[CISparseRenderer _lutKernel:alpha:]::kD2WithAlpha;
  if (v5)
  {
    v7 = &-[CISparseRenderer _lutKernel:alpha:]::kD2NoAlpha;
  }
  else
  {
    v6 = &-[CISparseRenderer _lutKernel:alpha:]::kD3WithAlpha;
    v7 = &-[CISparseRenderer _lutKernel:alpha:]::kD3NoAlpha;
  }
  if (!v4)
    v6 = v7;
  return (id)*v6;
}

CIKernel *__37__CISparseRenderer__lutKernel_alpha___block_invoke()
{
  CIKernel *result;
  CIKernel *v1;

  result = (CIKernel *)SDOFV2MetalLib();
  if (result)
  {
    v1 = result;
    -[CISparseRenderer _lutKernel:alpha:]::kD2NoAlpha = +[CIKernel kernelWithFunctionName:fromMetalLibraryData:error:](CIKernel, "kernelWithFunctionName:fromMetalLibraryData:error:", CFSTR("_sparserendering_opt2x_sample_noAlphaLUT"), result, 0);
    -[CISparseRenderer _lutKernel:alpha:]::kD2WithAlpha = +[CIKernel kernelWithFunctionName:fromMetalLibraryData:error:](CIKernel, "kernelWithFunctionName:fromMetalLibraryData:error:", CFSTR("_sparserendering_opt2x_sample_withAlphaLUT"), v1, 0);
    -[CISparseRenderer _lutKernel:alpha:]::kD3NoAlpha = +[CIKernel kernelWithFunctionName:fromMetalLibraryData:error:](CIKernel, "kernelWithFunctionName:fromMetalLibraryData:error:", CFSTR("_sparserendering_sample_noAlphaLUT"), v1, 0);
    result = +[CIKernel kernelWithFunctionName:fromMetalLibraryData:error:](CIKernel, "kernelWithFunctionName:fromMetalLibraryData:error:", CFSTR("_sparserendering_sample_withAlphaLUT"), v1, 0);
    -[CISparseRenderer _lutKernel:alpha:]::kD3WithAlpha = (uint64_t)result;
  }
  return result;
}

- (id)_kernel:(BOOL)a3 alpha:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  uint64_t *v6;
  uint64_t *v7;

  v4 = a4;
  v5 = a3;
  if (-[CISparseRenderer _kernel:alpha:]::onceToken != -1)
    dispatch_once(&-[CISparseRenderer _kernel:alpha:]::onceToken, &__block_literal_global_272);
  v6 = &-[CISparseRenderer _kernel:alpha:]::kD2Alpha;
  if (v5)
  {
    v7 = &-[CISparseRenderer _kernel:alpha:]::kD2;
  }
  else
  {
    v6 = &-[CISparseRenderer _kernel:alpha:]::kD3Alpha;
    v7 = &-[CISparseRenderer _kernel:alpha:]::kD3;
  }
  if (!v4)
    v6 = v7;
  return (id)*v6;
}

CIKernel *__34__CISparseRenderer__kernel_alpha___block_invoke()
{
  CIKernel *result;
  CIKernel *v1;

  result = (CIKernel *)SDOFV2MetalLib();
  if (result)
  {
    v1 = result;
    -[CISparseRenderer _kernel:alpha:]::kD2 = +[CIKernel kernelWithFunctionName:fromMetalLibraryData:error:](CIKernel, "kernelWithFunctionName:fromMetalLibraryData:error:", CFSTR("_sparserendering_opt2x_sample"), result, 0);
    -[CISparseRenderer _kernel:alpha:]::kD2Alpha = +[CIKernel kernelWithFunctionName:fromMetalLibraryData:error:](CIKernel, "kernelWithFunctionName:fromMetalLibraryData:error:", CFSTR("_sparserendering_opt2x_sampleWithAlpha"), v1, 0);
    -[CISparseRenderer _kernel:alpha:]::kD3 = +[CIKernel kernelWithFunctionName:fromMetalLibraryData:error:](CIKernel, "kernelWithFunctionName:fromMetalLibraryData:error:", CFSTR("_sparserendering_opt_sample_h"), v1, 0);
    result = +[CIKernel kernelWithFunctionName:fromMetalLibraryData:error:](CIKernel, "kernelWithFunctionName:fromMetalLibraryData:error:", CFSTR("_sparserendering_sample_h"), v1, 0);
    -[CISparseRenderer _kernel:alpha:]::kD3Alpha = (uint64_t)result;
  }
  return result;
}

- (id)outputImage
{
  _BOOL8 v3;
  uint64_t v4;
  _QWORD *v5;
  float v6;
  BOOL v7;
  float v8;
  CIImage *inputMatteImage;
  double v10;
  double v11;
  NSDictionary *inputTuningParameters;
  float v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CIImage *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  int v37;
  int v38;
  BOOL v39;
  uint64_t v40;
  float v41;
  double v42;
  double v43;
  unint64_t v44;
  double v45;
  unint64_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[3];
  unint64_t v60;
  _QWORD v61[3];
  unint64_t v62;
  _QWORD v63[3];
  double v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  BOOL v72;
  const __CFString *v73;
  uint64_t v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v3 = -[CISparseRenderer _useD2XRenderer](self, "_useD2XRenderer");
  v4 = 96;
  SDOFRenderingValue(CFSTR("alphaEpsilon"), self->inputTuningParameters);
  v5 = &unk_19248D000;
  if (v6 == 1.0)
  {
    v7 = 0;
    v69 = 0;
    v70 = &v69;
    v71 = 0x2020000000;
    v72 = 0;
  }
  else
  {
    SDOFRenderingValue(CFSTR("alphaGain"), self->inputTuningParameters);
    v7 = 0;
    v69 = 0;
    v70 = &v69;
    v71 = 0x2020000000;
    v72 = 0;
    if (v8 != 0.0)
    {
      inputMatteImage = self->inputMatteImage;
      if (inputMatteImage && (-[CIImage extent](inputMatteImage, "extent"), v10 > 1.0))
      {
        -[CIImage extent](self->inputImage, "extent");
        v7 = v11 > 1.0;
      }
      else
      {
        v7 = 0;
      }
    }
  }
  v72 = v7;
  if (-[CISparseRenderer outputImage]::onceToken != -1)
    dispatch_once(&-[CISparseRenderer outputImage]::onceToken, &__block_literal_global_281);
  inputTuningParameters = self->inputTuningParameters;
  -[NSNumber floatValue](self->inputScale, "floatValue");
  v14 = nRingsFromTuningParameters(inputTuningParameters, v13, +[CIDepthBlurEffect getDraftMode:](CIDepthBlurEffect, "getDraftMode:", -[CISparseRenderer inputDraftMode](self, "inputDraftMode")), self->inputAperture);
  v15 = &bicubicScaleTransformFilter_onceToken;
  if (-[CISparseRenderer outputImage]::useLUTBasedImages)
  {
    v16 = v14;
    v17 = -[CISparseRenderer stepsLUT:](self, "stepsLUT:", v14);
    v18 = -[CISparseRenderer baseVecsLUT:](self, "baseVecsLUT:", v16);
    v19 = -[CISparseRenderer _lutKernel:alpha:](self, "_lutKernel:alpha:", v3, *((unsigned __int8 *)v70 + 24));
  }
  else
  {
    v19 = -[CISparseRenderer _kernel:alpha:](self, "_kernel:alpha:", v3, *((unsigned __int8 *)v70 + 24));
    v18 = 0;
    v17 = 0;
  }
  -[CIImage extent](self->inputImage, "extent");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v28 = -[CIImage imageByClampingToExtent](self->inputImage, "imageByClampingToExtent");
  v29 = -[CISparseRenderer _packageParams:extent:image:haveAlpha:](self, "_packageParams:extent:image:haveAlpha:", v3, v28, *((unsigned __int8 *)v70 + 24), v21, v23, v25, v27);
  v30 = v29;
  if (-[CISparseRenderer outputImage]::useLUTBasedImages)
  {
    v31 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v29, "count") + 2);
    objc_msgSend(v31, "addObject:", v17);
    objc_msgSend(v31, "addObject:", v18);
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
    if (v32)
    {
      v54 = v17;
      v55 = v18;
      v56 = v19;
      v57 = 96;
      v33 = 0;
      v34 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v66 != v34)
            objc_enumerationMutation(v30);
          v36 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i);
          if (v36)
          {
            objc_opt_class();
            v37 = objc_opt_isKindOfClass() & 1;
            if (v37)
              v38 = v33 + 1;
            else
              v38 = v33;
            if (v37 && (!*((_BYTE *)v70 + 24) ? (v39 = v33 == 1) : (v39 = 0), v39))
            {
              v33 = 2;
            }
            else
            {
              objc_msgSend(v31, "addObject:", v36, v54, v55, v56, v57);
              v33 = v38;
            }
          }
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
      }
      while (v32);
      v30 = v31;
      v19 = v56;
      v4 = v57;
      v5 = (_QWORD *)&unk_19248D000;
      v15 = &bicubicScaleTransformFilter_onceToken;
      v17 = v54;
      v18 = v55;
    }
    else
    {
      v30 = v31;
      v5 = &unk_19248D000;
    }
  }
  v63[0] = 0;
  v63[1] = v63;
  v40 = v5[461];
  v63[2] = v40;
  v64 = 0.0;
  SDOFRenderingValue(CFSTR("maxBlur"), *(void **)((char *)&self->super.super + v4));
  if (v25 <= v27)
    v42 = v27;
  else
    v42 = v25;
  v64 = v42 * v41;
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = v40;
  v62 = 0;
  if (v17)
  {
    objc_msgSend(v17, "extent");
    v44 = (unint64_t)v43;
  }
  else
  {
    v44 = 0;
  }
  v62 = v44;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = v40;
  v60 = 0;
  if (v18)
  {
    objc_msgSend(v18, "extent");
    v46 = (unint64_t)v45;
  }
  else
  {
    v46 = 0;
  }
  v60 = v46;
  v47 = *MEMORY[0x1E0C9D5E0];
  v48 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v50 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v49 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  v73 = CFSTR("kCIKernelOutputFormat");
  v74 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2056, v54, v55, v56, v57, MEMORY[0x1E0C809B0], 3221225472, __31__CISparseRenderer_outputImage__block_invoke_2, &unk_1E2EC4D90, v61, v59, &v69, v63);
  v51 = (void *)objc_msgSend(v19, "applyWithExtent:roiCallback:arguments:options:", &v58, v30, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1), v47, v48, v50, v49);
  v52 = v51;
  if (*((_BYTE *)v15 + 3832))
    v52 = (void *)objc_msgSend(v51, "imageByCroppingToRect:", v21, v23, v25, v27);
  _Block_object_dispose(v59, 8);
  _Block_object_dispose(v61, 8);
  _Block_object_dispose(v63, 8);
  _Block_object_dispose(&v69, 8);
  return v52;
}

uint64_t __31__CISparseRenderer_outputImage__block_invoke()
{
  char *v0;
  uint64_t result;

  v0 = getenv("CI_SDOF_LUT");
  if (v0)
    result = atoi(v0);
  else
    result = -[CISparseRenderer outputImage]::useLUTBasedImages;
  -[CISparseRenderer outputImage]::useLUTBasedImages = (_DWORD)result != 0;
  return result;
}

double __31__CISparseRenderer_outputImage__block_invoke_2(uint64_t a1, unsigned int a2, double a3, double a4, double a5, double a6)
{
  unsigned int v6;
  CGFloat v7;
  double result;

  if (-[CISparseRenderer outputImage]::useLUTBasedImages && a2 < 2)
    return 0.0;
  if (-[CISparseRenderer outputImage]::useLUTBasedImages)
    v6 = a2 - 2;
  else
    v6 = a2;
  if (v6 == 1 && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    return *MEMORY[0x1E0C9D648];
  v7 = -*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a3, v7, v7);
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

- (CIImage)inputMatteImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputMatteImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSDictionary)inputTuningParameters
{
  return self->inputTuningParameters;
}

- (void)setInputTuningParameters:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)inputApertureScaling
{
  return self->inputApertureScaling;
}

- (void)setInputApertureScaling:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)inputDraftMode
{
  return self->inputDraftMode;
}

- (void)setInputDraftMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)inputAperture
{
  return self->inputAperture;
}

- (void)setInputAperture:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

@end

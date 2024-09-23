@implementation CIFaceMaskCalculator

- (id)_kernel
{
  return +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_faceMaskCalculator);
}

- (id)metalKernel
{
  if (-[CIFaceMaskCalculator metalKernel]::onceToken != -1)
    dispatch_once(&-[CIFaceMaskCalculator metalKernel]::onceToken, &__block_literal_global_162);
  return (id)-[CIFaceMaskCalculator metalKernel]::kernel;
}

id __35__CIFaceMaskCalculator_metalKernel__block_invoke()
{
  id result;

  result = +[CIKernel SDOFV2MetalKernelNamed:](CIKernel, "SDOFV2MetalKernelNamed:", CFSTR("_FMCalculator"));
  -[CIFaceMaskCalculator metalKernel]::kernel = (uint64_t)result;
  return result;
}

- (id)outputImage_V4
{
  CIImage *inputImage;
  __int128 v4;
  double v5;
  double v6;
  double v7;
  float v8;
  int v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  CIVector *v15;
  int v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  CIVector *v22;
  float v23;
  CIVector *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  float v29;
  float v30;
  double v31;
  double v32;
  float v33;
  CIVector *v34;
  CIVector *inputFacesCenterX;
  CIVector *inputFacesCenterY;
  CIVector *inputFacesLeftEyeX;
  CIVector *inputFacesLeftEyeY;
  CIVector *inputFacesRightEyeX;
  CIVector *inputFacesRightEyeY;
  CIVector *inputFacesChinX;
  uint64_t v42;
  id v43;
  void *v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  __n128 (*v50)(uint64_t, uint64_t);
  uint64_t (*v51)();
  const char *v52;
  __int128 v53;
  __int128 v54;
  const __CFString *v55;
  uint64_t v56;
  _QWORD v57[15];
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v57[13] = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  if (!inputImage)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v47 = 0;
  v48 = &v47;
  v49 = 0x5012000000;
  v50 = __Block_byref_object_copy__7;
  v51 = __Block_byref_object_dispose__7;
  v52 = "";
  v4 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v53 = *MEMORY[0x1E0C9D628];
  v54 = v4;
  -[CIImage extent](inputImage, "extent");
  v6 = v5;
  -[CIImage extent](self->inputImage, "extent");
  *(float *)&v6 = v6;
  v8 = v7;
  v58.origin.x = addPoints(self->inputFacesLeftEyeX, self->inputFacesLeftEyeY, *(CGRect *)(v48 + 6), *(float *)&v6, v8);
  *(CGRect *)(v48 + 6) = v58;
  v59.origin.x = addPoints(self->inputFacesRightEyeX, self->inputFacesRightEyeY, v58, *(float *)&v6, v8);
  *(CGRect *)(v48 + 6) = v59;
  v60 = CGRectIntegral(v59);
  *(CGRect *)(v48 + 6) = CGRectInset(v60, -1.0, -1.0);
  -[NSNumber floatValue](self->inputMaxBlur, "floatValue");
  LODWORD(v6) = v9;
  -[NSNumber floatValue](self->inputFacesMaxBlurOnEyes, "floatValue");
  v11 = v10;
  -[NSNumber floatValue](self->inputFacesMaxBlurDistFromFocus, "floatValue");
  v13 = v12;
  -[NSNumber floatValue](self->inputFacesEyeToEyebrowRatio, "floatValue");
  v15 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", *(float *)&v6, v11, v13, v14);
  -[NSNumber floatValue](self->inputFacesLinearBlurGrowthM, "floatValue");
  LODWORD(v6) = v16;
  -[NSNumber floatValue](self->inputFacesLinearBlurGrowthC, "floatValue");
  v18 = v17;
  -[NSNumber floatValue](self->inputFacesDistToBlurScaling, "floatValue");
  v20 = v19;
  -[NSNumber floatValue](self->inputFacesCapMultip, "floatValue");
  v22 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", *(float *)&v6, v18, v20, v21);
  -[NSNumber floatValue](self->inputFacesGainMultip, "floatValue");
  v24 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v23, 1.0, 1.0, 0.5);
  -[CIImage extent](self->inputImage, "extent");
  v26 = v25;
  -[CIImage extent](self->inputImage, "extent");
  v28 = v27;
  -[NSNumber floatValue](self->inputApertureScaling, "floatValue");
  v30 = v29;
  -[CIImage extent](self->inputImage, "extent");
  v32 = v31;
  -[CIImage extent](self->inputImage, "extent");
  v33 = v26 / v28;
  v34 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v33, v30, v32);
  inputFacesCenterX = self->inputFacesCenterX;
  inputFacesCenterY = self->inputFacesCenterY;
  v57[0] = self->inputImage;
  v57[1] = inputFacesCenterX;
  inputFacesLeftEyeX = self->inputFacesLeftEyeX;
  inputFacesLeftEyeY = self->inputFacesLeftEyeY;
  v57[2] = inputFacesCenterY;
  v57[3] = inputFacesLeftEyeX;
  inputFacesRightEyeX = self->inputFacesRightEyeX;
  inputFacesRightEyeY = self->inputFacesRightEyeY;
  v57[4] = inputFacesLeftEyeY;
  v57[5] = inputFacesRightEyeX;
  inputFacesChinX = self->inputFacesChinX;
  v57[6] = inputFacesRightEyeY;
  v57[7] = inputFacesChinX;
  v57[8] = self->inputFacesChinY;
  v57[9] = v15;
  v57[10] = v22;
  v57[11] = v24;
  v57[12] = v34;
  v42 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 13);
  v43 = -[CIFaceMaskCalculator metalKernel](self, "metalKernel");
  v55 = CFSTR("kCIKernelOutputFormat");
  v56 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2056, MEMORY[0x1E0C809B0], 3221225472, __38__CIFaceMaskCalculator_outputImage_V4__block_invoke, &unk_1E2EC3638, &v47);
  v44 = (void *)objc_msgSend(v43, "applyWithExtent:roiCallback:arguments:options:", &v46, v42, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1), 0.0, 0.0, 5.0, 1.0);
  _Block_object_dispose(&v47, 8);
  return v44;
}

double __38__CIFaceMaskCalculator_outputImage_V4__block_invoke(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
}

- (id)outputImage
{
  CGSize v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  CIVector *v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  CIVector *v20;
  float v21;
  float v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  uint64_t i;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  _BOOL4 v43;
  CIVector *v44;
  CIVector *inputFacesLeftEyeX;
  CIVector *inputFacesCenterX;
  CIVector *inputFacesRightEyeX;
  CIVector *inputFacesChinX;
  uint64_t v49;
  id v50;
  void *v51;
  CIVector *v52;
  CIVector *v53;
  _QWORD v54[5];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  __n128 (*v58)(uint64_t, uint64_t);
  uint64_t (*v59)();
  const char *v60;
  CGPoint v61;
  CGSize v62;
  const __CFString *v63;
  uint64_t v64;
  _QWORD v65[14];
  _QWORD v66[6];
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;

  v66[4] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  if ((unint64_t)objc_msgSend((id)-[CIFaceMaskCalculator valueForKey:](self, "valueForKey:", CFSTR("__inputVersion")), "unsignedIntegerValue") >= 3)return -[CIFaceMaskCalculator outputImage_V4](self, "outputImage_V4");
  v55 = 0;
  v56 = &v55;
  v57 = 0x5012000000;
  v58 = __Block_byref_object_copy__7;
  v59 = __Block_byref_object_dispose__7;
  v60 = "";
  v4 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  v61 = (CGPoint)*MEMORY[0x1E0C9D628];
  v62 = v4;
  v70.origin = v61;
  v70.size = v4;
  v67.origin.x = addPoints(self->inputFacesLeftEyeX, self->inputFacesLeftEyeY, v70, 1.0, 1.0);
  *(CGRect *)(v56 + 6) = v67;
  v68.origin.x = addPoints(self->inputFacesRightEyeX, self->inputFacesRightEyeY, v67, 1.0, 1.0);
  *(CGRect *)(v56 + 6) = v68;
  v69 = CGRectIntegral(v68);
  *(CGRect *)(v56 + 6) = CGRectInset(v69, -1.0, -1.0);
  -[NSNumber floatValue](self->inputMaxBlur, "floatValue");
  v6 = v5;
  -[NSNumber floatValue](self->inputFacesCapMultip, "floatValue");
  v8 = v7;
  -[NSNumber floatValue](self->inputFacesMaxBlurOnEyes, "floatValue");
  v10 = v9;
  -[NSNumber floatValue](self->inputFacesMaxBlurDistFromFocus, "floatValue");
  v12 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v6, v8, v10, v11);
  -[NSNumber floatValue](self->inputFacesLinearBlurGrowthM, "floatValue");
  v14 = v13;
  -[NSNumber floatValue](self->inputFacesLinearBlurGrowthC, "floatValue");
  v16 = v15;
  -[NSNumber floatValue](self->inputFacesEyeToEyebrowRatio, "floatValue");
  v18 = v17;
  -[NSNumber floatValue](self->inputFacesDistToBlurScaling, "floatValue");
  v20 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v14, v16, v18, v19);
  -[NSNumber floatValue](self->inputFacesGainMultip, "floatValue");
  v22 = v21;
  -[CIImage extent](self->inputImage, "extent");
  v24 = v23;
  -[CIImage extent](self->inputImage, "extent");
  v26 = v25;
  -[CIImage extent](self->inputImage, "extent");
  v28 = v27;
  -[CIImage extent](self->inputImage, "extent");
  v29 = v24;
  v30 = v26;
  v53 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v22, (float)(v29 / v30), v28);
  SDOFFaceMaskValue((uint64_t)CFSTR("chinVectorSnapping"), self->inputTuningParameters);
  v32 = v31;
  -[NSNumber floatValue](self->inputApertureScaling, "floatValue");
  v52 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v32, v33, 0.0, 0.0);
  for (i = 0; i != 4; ++i)
  {
    -[CIVector valueAtIndex:](self->inputFacesLeftEyeX, "valueAtIndex:", i, v52);
    if (v35 == -1.0
      || (-[CIVector valueAtIndex:](self->inputFacesLeftEyeY, "valueAtIndex:", i), v36 == -1.0)
      || (-[CIVector valueAtIndex:](self->inputFacesRightEyeX, "valueAtIndex:", i), v37 == -1.0)
      || (-[CIVector valueAtIndex:](self->inputFacesRightEyeY, "valueAtIndex:", i), v38 == -1.0)
      || (-[CIVector valueAtIndex:](self->inputFacesCenterX, "valueAtIndex:", i), v39 == -1.0)
      || (-[CIVector valueAtIndex:](self->inputFacesCenterY, "valueAtIndex:", i), v40 == -1.0)
      || (-[CIVector valueAtIndex:](self->inputFacesChinX, "valueAtIndex:", i), v41 == -1.0))
    {
      v43 = 0;
    }
    else
    {
      -[CIVector valueAtIndex:](self->inputFacesChinY, "valueAtIndex:", i);
      v43 = v42 != -1.0;
    }
    *(double *)&v66[i] = (double)v43;
  }
  v44 = +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", v66, 4);
  inputFacesLeftEyeX = self->inputFacesLeftEyeX;
  v65[0] = self->inputImage;
  v65[1] = inputFacesLeftEyeX;
  inputFacesCenterX = self->inputFacesCenterX;
  v65[2] = self->inputFacesLeftEyeY;
  v65[3] = inputFacesCenterX;
  inputFacesRightEyeX = self->inputFacesRightEyeX;
  v65[4] = self->inputFacesCenterY;
  v65[5] = inputFacesRightEyeX;
  inputFacesChinX = self->inputFacesChinX;
  v65[6] = self->inputFacesRightEyeY;
  v65[7] = inputFacesChinX;
  v65[8] = self->inputFacesChinY;
  v65[9] = v12;
  v65[10] = v20;
  v65[11] = v53;
  v65[12] = v52;
  v65[13] = v44;
  v49 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 14);
  v50 = -[CIFaceMaskCalculator _kernel](self, "_kernel");
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __35__CIFaceMaskCalculator_outputImage__block_invoke;
  v54[3] = &unk_1E2EC3638;
  v54[4] = &v55;
  v63 = CFSTR("kCIKernelOutputFormat");
  v64 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2056);
  v51 = (void *)objc_msgSend(v50, "applyWithExtent:roiCallback:arguments:options:", v54, v49, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1), 0.0, 0.0, 5.0, 1.0);
  _Block_object_dispose(&v55, 8);
  return v51;
}

double __35__CIFaceMaskCalculator_outputImage__block_invoke(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (CIVector)inputFacesLeftEyeX
{
  return self->inputFacesLeftEyeX;
}

- (void)setInputFacesLeftEyeX:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CIVector)inputFacesLeftEyeY
{
  return self->inputFacesLeftEyeY;
}

- (void)setInputFacesLeftEyeY:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (CIVector)inputFacesRightEyeX
{
  return self->inputFacesRightEyeX;
}

- (void)setInputFacesRightEyeX:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (CIVector)inputFacesRightEyeY
{
  return self->inputFacesRightEyeY;
}

- (void)setInputFacesRightEyeY:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (CIVector)inputFacesCenterX
{
  return self->inputFacesCenterX;
}

- (void)setInputFacesCenterX:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (CIVector)inputFacesCenterY
{
  return self->inputFacesCenterY;
}

- (void)setInputFacesCenterY:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (CIVector)inputFacesChinX
{
  return self->inputFacesChinX;
}

- (void)setInputFacesChinX:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (CIVector)inputFacesChinY
{
  return self->inputFacesChinY;
}

- (void)setInputFacesChinY:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (NSNumber)inputMaxBlur
{
  return self->inputMaxBlur;
}

- (void)setInputMaxBlur:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSNumber)inputFacesCapMultip
{
  return self->inputFacesCapMultip;
}

- (void)setInputFacesCapMultip:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSNumber)inputFacesMaxBlurOnEyes
{
  return self->inputFacesMaxBlurOnEyes;
}

- (void)setInputFacesMaxBlurOnEyes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSNumber)inputFacesMaxBlurDistFromFocus
{
  return self->inputFacesMaxBlurDistFromFocus;
}

- (void)setInputFacesMaxBlurDistFromFocus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSNumber)inputFacesLinearBlurGrowthM
{
  return self->inputFacesLinearBlurGrowthM;
}

- (void)setInputFacesLinearBlurGrowthM:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSNumber)inputFacesLinearBlurGrowthC
{
  return self->inputFacesLinearBlurGrowthC;
}

- (void)setInputFacesLinearBlurGrowthC:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSNumber)inputFacesEyeToEyebrowRatio
{
  return self->inputFacesEyeToEyebrowRatio;
}

- (void)setInputFacesEyeToEyebrowRatio:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSNumber)inputFacesDistToBlurScaling
{
  return self->inputFacesDistToBlurScaling;
}

- (void)setInputFacesDistToBlurScaling:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSNumber)inputFacesGainMultip
{
  return self->inputFacesGainMultip;
}

- (void)setInputFacesGainMultip:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSNumber)inputApertureScaling
{
  return self->inputApertureScaling;
}

- (void)setInputApertureScaling:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSDictionary)inputTuningParameters
{
  return self->inputTuningParameters;
}

- (void)setInputTuningParameters:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 232);
}

@end

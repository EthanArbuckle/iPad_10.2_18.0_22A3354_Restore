@implementation CIModifyBlurmap

+ (id)customAttributes
{
  _QWORD v3[4];
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("CIAttributeFilterCategories");
  v3[0] = CFSTR("CICategoryColorAdjustment");
  v3[1] = CFSTR("CICategoryStillImage");
  v3[2] = CFSTR("CICategoryBuiltIn");
  v3[3] = CFSTR("CICategoryApplePrivate");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  v5[1] = CFSTR("13");
  v4[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v4[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v5[2] = CFSTR("10.15");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (id)outputImage
{
  CIImage *inputImage;
  CIImage *v4;
  uint64_t v5;
  uint64_t v6;
  CIVector *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CIImage *v16;
  CIImage *v17;
  float v19;
  float v20;
  BOOL v21;
  CIImage *v22;
  CIImage *inputHairAlpha;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  double v33;
  NSNumber *inputPersonDistance;
  NSNumber *inputPersonThreshold;
  CIVector *inputPersonAdditive;
  CIVector *inputPersonSubtractive;
  NSNumber *inputApertureScaling;
  NSNumber *inputPersonMaxBlur;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  uint64_t v45;
  float v46;
  double v47;
  NSNumber *inputHairDistance;
  NSNumber *inputHairThreshold;
  CIVector *inputHairAdditive;
  CIVector *inputHairSubtractive;
  uint64_t v52;
  NSNumber *inputHairMaxBlur;
  NSNumber *inputProtectBodyStrength;
  uint64_t v55;
  float v56;
  double v57;
  float v58;
  double v59;
  float v60;
  double v61;
  float v62;
  CIVector *v63;
  float v64;
  double v65;
  float v66;
  double v67;
  double v68;
  float v69;
  CIVector *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  CGFloat height;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CIVector *inputLeftEyeX;
  CIVector *inputLeftEyeY;
  CIVector *inputRightEyeX;
  CIVector *inputRightEyeY;
  CIVector *inputFaceMidPointX;
  CIVector *inputFaceMidPointY;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  float v93;
  double v94;
  float v95;
  double v96;
  float v97;
  double v98;
  float v99;
  float v100;
  double v101;
  float v102;
  double v103;
  float v104;
  double v105;
  float v106;
  CIVector *v107;
  float v108;
  double v109;
  float v110;
  double v111;
  float v112;
  double v113;
  float v114;
  CIVector *v115;
  NSNumber *inputRelativeApertureScalingStrength;
  uint64_t v117;
  void *v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  uint64_t v148;
  CIVector *v149;
  uint64_t v150;
  CIImage *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  CIImage *v155;
  _QWORD v156[8];
  _QWORD v157[8];
  CGAffineTransform v158;
  _QWORD v159[2];
  _QWORD v160[2];
  _QWORD v161[7];
  _QWORD v162[2];
  _QWORD v163[2];
  _QWORD v164[7];
  const __CFString *v165;
  uint64_t v166;
  _QWORD v167[9];
  _QWORD v168[6];
  _QWORD v169[6];
  _QWORD v170[3];
  _QWORD v171[3];
  _QWORD v172[4];
  _QWORD v173[4];
  _QWORD v174[3];
  _QWORD v175[3];
  const __CFString *v176;
  CIVector *v177;
  CGAffineTransform v178;
  __int128 v179;
  uint64_t v180;
  uint64_t v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;

  v181 = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  v4 = +[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor colorWithRed:green:blue:alpha:](CIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0));
  -[CIImage extent](inputImage, "extent");
  v5 = -[CIImage imageByCroppingToRect:](v4, "imageByCroppingToRect:");
  if (!inputImage)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v6 = v5;
  if (self->inputPersonAlpha)
  {
    v178 = *(CGAffineTransform *)byte_19248E8C8;
    v179 = unk_19248E8F8;
    v180 = 0x3FB0000000000000;
    v7 = +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", &v178, 9);
    -[CIImage extent](self->inputPersonAlpha, "extent");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = -[CIImage imageByClampingToExtent](self->inputPersonAlpha, "imageByClampingToExtent");
    v176 = CFSTR("inputWeights");
    v177 = v7;
    v17 = -[CIImage imageByCroppingToRect:](-[CIImage imageByApplyingFilter:withInputParameters:](v16, "imageByApplyingFilter:withInputParameters:", CFSTR("CIConvolution3X3"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v177, &v176, 1)), "imageByCroppingToRect:", v9, v11, v13, v15);
  }
  else
  {
    v17 = 0;
  }
  -[NSNumber floatValue](self->inputScale, "floatValue");
  v20 = v19;
  memset(&v178, 0, sizeof(v178));
  CGAffineTransformMakeScale(&v178, v19, v19);
  v21 = v20 == 1.0 || v17 == 0;
  v22 = v17;
  if (!v21)
  {
    v158 = v178;
    v22 = -[CIImage imageByApplyingTransform:](v17, "imageByApplyingTransform:", &v158);
  }
  inputHairAlpha = self->inputHairAlpha;
  if (v20 != 1.0 && inputHairAlpha)
  {
    v158 = v178;
    inputHairAlpha = -[CIImage imageByApplyingTransform:](inputHairAlpha, "imageByApplyingTransform:", &v158);
  }
  v24 = 0x1EE252000;
  v25 = v6;
  v26 = v6;
  if (v22)
  {
    -[NSNumber floatValue](self->inputPersonMaxBlur, "floatValue");
    v25 = v6;
    v26 = v6;
    if (v27 > 0.0)
    {
      -[NSNumber floatValue](self->inputPersonMaxBlur, "floatValue");
      v29 = v28;
      -[NSNumber floatValue](self->inputDistanceAdd, "floatValue");
      v31 = v29 * v30;
      -[NSNumber floatValue](self->inputApertureScaling, "floatValue");
      *(float *)&v33 = v31 * v32;
      inputPersonDistance = self->inputPersonDistance;
      v174[0] = CFSTR("inputDistance");
      v174[1] = CFSTR("inputThreshold");
      inputPersonThreshold = self->inputPersonThreshold;
      v175[0] = inputPersonDistance;
      v175[1] = inputPersonThreshold;
      v174[2] = CFSTR("inputScalingFactor");
      v175[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v33);
      v26 = -[CIImage imageByApplyingFilter:withInputParameters:](v22, "imageByApplyingFilter:withInputParameters:", CFSTR("CIBlurmapRefinementDistanceDelta"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v175, v174, 3));
      inputPersonAdditive = self->inputPersonAdditive;
      v172[0] = CFSTR("inputAddBlur");
      v172[1] = CFSTR("inputRemoveBlur");
      inputPersonSubtractive = self->inputPersonSubtractive;
      v173[0] = inputPersonAdditive;
      v173[1] = inputPersonSubtractive;
      inputApertureScaling = self->inputApertureScaling;
      v24 = 0x1EE252000uLL;
      v172[2] = CFSTR("inputApertureScaling");
      v172[3] = CFSTR("inputMaxBlur");
      inputPersonMaxBlur = self->inputPersonMaxBlur;
      v173[2] = inputApertureScaling;
      v173[3] = inputPersonMaxBlur;
      v25 = -[CIImage imageByApplyingFilter:withInputParameters:](v22, "imageByApplyingFilter:withInputParameters:", CFSTR("CIFusionDelta"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v173, v172, 4));
    }
  }
  v153 = v25;
  v154 = v26;
  if (inputHairAlpha && (-[NSNumber floatValue](self->inputHairMaxBlur, "floatValue"), v40 > 0.0))
  {
    -[NSNumber floatValue](self->inputHairMaxBlur, "floatValue");
    v42 = v41;
    -[NSNumber floatValue](self->inputDistanceAdd, "floatValue");
    v44 = v42 * v43;
    v45 = *(int *)(v24 + 1880);
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v45), "floatValue");
    *(float *)&v47 = v44 * v46;
    inputHairDistance = self->inputHairDistance;
    v170[0] = CFSTR("inputDistance");
    v170[1] = CFSTR("inputThreshold");
    inputHairThreshold = self->inputHairThreshold;
    v171[0] = inputHairDistance;
    v171[1] = inputHairThreshold;
    v170[2] = CFSTR("inputScalingFactor");
    v171[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v47);
    v152 = -[CIImage imageByApplyingFilter:withInputParameters:](inputHairAlpha, "imageByApplyingFilter:withInputParameters:", CFSTR("CIBlurmapRefinementDistanceDelta"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v171, v170, 3));
    if (v22)
    {
      inputHairAdditive = self->inputHairAdditive;
      v168[0] = CFSTR("inputSecondaryImage");
      v168[1] = CFSTR("inputAdditive");
      inputHairSubtractive = self->inputHairSubtractive;
      v169[0] = v22;
      v169[1] = inputHairAdditive;
      v52 = *(uint64_t *)((char *)&self->super.super.isa + v45);
      v168[2] = CFSTR("inputSubtractive");
      v168[3] = CFSTR("inputApertureScaling");
      inputHairMaxBlur = self->inputHairMaxBlur;
      v169[2] = inputHairSubtractive;
      v169[3] = v52;
      v168[4] = CFSTR("inputMaxBlur");
      v168[5] = CFSTR("inputProtectStrength");
      inputProtectBodyStrength = self->inputProtectBodyStrength;
      v169[4] = inputHairMaxBlur;
      v169[5] = inputProtectBodyStrength;
      v55 = -[CIImage imageByApplyingFilter:withInputParameters:](inputHairAlpha, "imageByApplyingFilter:withInputParameters:", CFSTR("CIFusionTwoImagesDelta"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v169, v168, 6));
    }
    else
    {
      v55 = v6;
    }
  }
  else
  {
    v55 = v6;
    v152 = v6;
  }
  if (outputImage_onceToken != -1)
    dispatch_once(&outputImage_onceToken, &__block_literal_global_2);
  if (!outputImage_calculatorKernel)
    -[CIModifyBlurmap outputImage].cold.1();
  if (!outputImage_modifyBlurmapKernel)
    -[CIModifyBlurmap outputImage].cold.2();
  if (!outputImage_combineAllDeltasKernel)
    -[CIModifyBlurmap outputImage].cold.3();
  v155 = inputImage;
  -[NSNumber floatValue](self->inputEyeProtectionOvalDimsDistanceScale, "floatValue");
  v57 = v56;
  -[NSNumber floatValue](self->inputEyeProtectionOvalDimsDistanceOffset, "floatValue");
  v59 = v58;
  -[NSNumber floatValue](self->inputEyeProtectionOvalDimsRadiusHorizontal, "floatValue");
  v61 = v60;
  -[NSNumber floatValue](self->inputEyeProtectionOvalDimsRadiusVertical, "floatValue");
  v63 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v57, v59, v61, v62);
  if (-[NSNumber intValue](self->inputEyeProtectionMaxFaces, "intValue") >= 5)
    -[CIModifyBlurmap outputImage].cold.4();
  v150 = v55;
  v151 = v17;
  -[NSNumber floatValue](self->inputEyeProtectionFaceWeightsSmoothStepMin, "floatValue");
  v65 = v64;
  -[NSNumber floatValue](self->inputEyeProtectionFaceWeightsSmoothStepMax, "floatValue");
  v67 = v66;
  v68 = (double)-[NSNumber intValue](self->inputEyeProtectionMaxFaces, "intValue");
  -[NSNumber floatValue](self->inputEyeProtectionSubtractiveMaxBlur, "floatValue");
  v70 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v65, v67, v68, v69);
  v71 = addPoints(self->inputLeftEyeX, self->inputLeftEyeY, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  v75 = addPoints(self->inputRightEyeX, self->inputRightEyeY, v71, v72, v73, v74);
  v182.origin.x = addPoints(self->inputFaceMidPointX, self->inputFaceMidPointY, v75, v76, v77, v78);
  v183 = CGRectIntegral(v182);
  v184 = CGRectInset(v183, -1.0, -1.0);
  height = v184.size.height;
  x = v184.origin.x;
  y = v184.origin.y;
  width = v184.size.width;
  inputLeftEyeX = self->inputLeftEyeX;
  inputLeftEyeY = self->inputLeftEyeY;
  v167[0] = v155;
  v167[1] = inputLeftEyeX;
  inputRightEyeX = self->inputRightEyeX;
  inputRightEyeY = self->inputRightEyeY;
  v167[2] = inputLeftEyeY;
  v167[3] = inputRightEyeX;
  inputFaceMidPointX = self->inputFaceMidPointX;
  inputFaceMidPointY = self->inputFaceMidPointY;
  v167[4] = inputRightEyeY;
  v167[5] = inputFaceMidPointX;
  v167[6] = inputFaceMidPointY;
  v167[7] = v63;
  v167[8] = v70;
  v89 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v167, 9);
  v90 = (void *)outputImage_calculatorKernel;
  v157[0] = MEMORY[0x1E0C809B0];
  v157[1] = 3221225472;
  v157[2] = __30__CIModifyBlurmap_outputImage__block_invoke_2;
  v157[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  *(CGFloat *)&v157[4] = x;
  *(CGFloat *)&v157[5] = y;
  *(CGFloat *)&v157[6] = width;
  *(CGFloat *)&v157[7] = height;
  v165 = CFSTR("kCIKernelOutputFormat");
  v166 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2056);
  v91 = (void *)objc_msgSend(v90, "applyWithExtent:roiCallback:arguments:options:", v157, v89, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v166, &v165, 1), 0.0, 0.0, 7.0, 1.0);
  if (!v91)
    -[CIModifyBlurmap outputImage].cold.5();
  v92 = (void *)objc_msgSend(v91, "_imageByRenderingToIntermediate");
  -[NSNumber floatValue](self->inputSmoothstepMin, "floatValue");
  v94 = v93;
  -[NSNumber floatValue](self->inputSmoothstepMax, "floatValue");
  v96 = v95;
  -[NSNumber floatValue](self->inputMaxBlur, "floatValue");
  v98 = v97;
  -[NSNumber floatValue](self->inputRelativeApertureScalingStrength, "floatValue");
  v149 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v94, v96, v98, v99);
  -[NSNumber floatValue](self->inputEyeProtectionPersonMaskSmoothStepMin, "floatValue");
  v101 = v100;
  -[NSNumber floatValue](self->inputEyeProtectionPersonMaskSmoothStepMax, "floatValue");
  v103 = v102;
  -[NSNumber floatValue](self->inputEyeProtectionPreventStrength, "floatValue");
  v105 = v104;
  -[NSNumber floatValue](self->inputRelativeApertureScalingStrength, "floatValue");
  v107 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v101, v103, v105, v106);
  -[NSNumber floatValue](self->inputEyeProtectionSubtractiveApertureScaling, "floatValue");
  v109 = v108;
  -[NSNumber floatValue](self->inputEyeProtectionSubtractiveMaxBlur, "floatValue");
  v111 = v110;
  -[NSNumber floatValue](self->inputEyeProtectionOvalFallOffSmoothStepMin, "floatValue");
  v113 = v112;
  -[NSNumber floatValue](self->inputEyeProtectionOvalFallOffSmoothStepMax, "floatValue");
  v115 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v109, v111, v113, v114);
  v164[0] = v150;
  v164[1] = v153;
  v164[2] = v152;
  v164[3] = v154;
  inputRelativeApertureScalingStrength = self->inputRelativeApertureScalingStrength;
  v164[4] = self->inputFaceMaskDeltaImage;
  v164[5] = inputRelativeApertureScalingStrength;
  v164[6] = self->inputApertureScaling;
  v117 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v164, 7);
  v118 = (void *)outputImage_combineAllDeltasKernel;
  -[CIImage extent](v155, "extent");
  v120 = v119;
  v122 = v121;
  v124 = v123;
  v126 = v125;
  v162[0] = CFSTR("kCIKernelOutputFormat");
  v127 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2053);
  v162[1] = CFSTR("kCIImageAlphaOne");
  v163[0] = v127;
  v163[1] = MEMORY[0x1E0C9AAB0];
  v128 = objc_msgSend(v118, "applyWithExtent:arguments:options:", v117, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v163, v162, 2), v120, v122, v124, v126);
  v161[0] = self->inputImage;
  v161[1] = v92;
  v129 = v6;
  if (v151)
    v129 = (uint64_t)v151;
  v161[2] = v128;
  v161[3] = v129;
  v161[4] = v149;
  v161[5] = v107;
  v161[6] = v115;
  v130 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v161, 7);
  objc_msgSend(v92, "extent");
  v132 = v131;
  v134 = v133;
  v136 = v135;
  v138 = v137;
  v139 = (void *)outputImage_modifyBlurmapKernel;
  -[CIImage extent](self->inputImage, "extent");
  v141 = v140;
  v143 = v142;
  v145 = v144;
  v147 = v146;
  v156[0] = MEMORY[0x1E0C809B0];
  v156[1] = 3221225472;
  v156[2] = __30__CIModifyBlurmap_outputImage__block_invoke_3;
  v156[3] = &__block_descriptor_64_e73__CGRect__CGPoint_dd__CGSize_dd__44__0i8_CGRect__CGPoint_dd__CGSize_dd__12l;
  v156[4] = v132;
  v156[5] = v134;
  v156[6] = v136;
  v156[7] = v138;
  v159[0] = CFSTR("kCIKernelOutputFormat");
  v148 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2053);
  v159[1] = CFSTR("kCIImageAlphaOne");
  v160[0] = v148;
  v160[1] = MEMORY[0x1E0C9AAB0];
  return (id)objc_msgSend(v139, "applyWithExtent:roiCallback:arguments:options:", v156, v130, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v160, v159, 2), v141, v143, v145, v147);
}

id __30__CIModifyBlurmap_outputImage__block_invoke()
{
  id result;

  outputImage_calculatorKernel = (uint64_t)+[CIKernel SDOFV2MetalKernelNamed:](CIKernel, "SDOFV2MetalKernelNamed:", CFSTR("_eyeProtectionFaceCalculator"));
  outputImage_modifyBlurmapKernel = (uint64_t)+[CIKernel SDOFV2MetalKernelNamed:](CIKernel, "SDOFV2MetalKernelNamed:", CFSTR("_modifyBlurmap"));
  result = +[CIColorKernel SDOFV2MetalKernelNamed:](CIColorKernel, "SDOFV2MetalKernelNamed:", CFSTR("_combineAllDeltas"));
  outputImage_combineAllDeltasKernel = (uint64_t)result;
  return result;
}

double __30__CIModifyBlurmap_outputImage__block_invoke_2(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

double __30__CIModifyBlurmap_outputImage__block_invoke_3(uint64_t a1, int a2)
{
  double result;

  if (a2 == 1)
    return *(double *)(a1 + 32);
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

- (CIImage)inputPersonAlpha
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputPersonAlpha:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (CIImage)inputHairAlpha
{
  return (CIImage *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputHairAlpha:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (CIImage)inputFaceMaskDeltaImage
{
  return (CIImage *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputFaceMaskDeltaImage:(id)a3
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

- (NSNumber)inputDistanceAdd
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setInputDistanceAdd:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSNumber)inputSmoothstepMin
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setInputSmoothstepMin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSNumber)inputSmoothstepMax
{
  return (NSNumber *)objc_getProperty(self, a2, 136, 1);
}

- (void)setInputSmoothstepMax:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSNumber)inputMaxBlur
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setInputMaxBlur:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSNumber)inputApertureScaling
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (void)setInputApertureScaling:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSNumber)inputRelativeApertureScalingStrength
{
  return (NSNumber *)objc_getProperty(self, a2, 160, 1);
}

- (void)setInputRelativeApertureScalingStrength:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSNumber)inputPersonDistance
{
  return (NSNumber *)objc_getProperty(self, a2, 168, 1);
}

- (void)setInputPersonDistance:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSNumber)inputPersonThreshold
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (void)setInputPersonThreshold:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (CIVector)inputPersonAdditive
{
  return (CIVector *)objc_getProperty(self, a2, 184, 1);
}

- (void)setInputPersonAdditive:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (CIVector)inputPersonSubtractive
{
  return (CIVector *)objc_getProperty(self, a2, 192, 1);
}

- (void)setInputPersonSubtractive:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSNumber)inputPersonMaxBlur
{
  return (NSNumber *)objc_getProperty(self, a2, 200, 1);
}

- (void)setInputPersonMaxBlur:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSNumber)inputHairDistance
{
  return (NSNumber *)objc_getProperty(self, a2, 208, 1);
}

- (void)setInputHairDistance:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSNumber)inputHairThreshold
{
  return (NSNumber *)objc_getProperty(self, a2, 216, 1);
}

- (void)setInputHairThreshold:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (CIVector)inputHairAdditive
{
  return (CIVector *)objc_getProperty(self, a2, 224, 1);
}

- (void)setInputHairAdditive:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (CIVector)inputHairSubtractive
{
  return (CIVector *)objc_getProperty(self, a2, 232, 1);
}

- (void)setInputHairSubtractive:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSNumber)inputHairMaxBlur
{
  return (NSNumber *)objc_getProperty(self, a2, 240, 1);
}

- (void)setInputHairMaxBlur:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSNumber)inputProtectBodyStrength
{
  return (NSNumber *)objc_getProperty(self, a2, 248, 1);
}

- (void)setInputProtectBodyStrength:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (CIVector)inputLeftEyeX
{
  return (CIVector *)objc_getProperty(self, a2, 256, 1);
}

- (void)setInputLeftEyeX:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (CIVector)inputLeftEyeY
{
  return (CIVector *)objc_getProperty(self, a2, 264, 1);
}

- (void)setInputLeftEyeY:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (CIVector)inputRightEyeX
{
  return (CIVector *)objc_getProperty(self, a2, 272, 1);
}

- (void)setInputRightEyeX:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (CIVector)inputRightEyeY
{
  return (CIVector *)objc_getProperty(self, a2, 280, 1);
}

- (void)setInputRightEyeY:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (CIVector)inputFaceMidPointX
{
  return (CIVector *)objc_getProperty(self, a2, 288, 1);
}

- (void)setInputFaceMidPointX:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (CIVector)inputFaceMidPointY
{
  return (CIVector *)objc_getProperty(self, a2, 296, 1);
}

- (void)setInputFaceMidPointY:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (NSNumber)inputEyeProtectionMaxFaces
{
  return (NSNumber *)objc_getProperty(self, a2, 304, 1);
}

- (void)setInputEyeProtectionMaxFaces:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (NSNumber)inputEyeProtectionFaceWeightsSmoothStepMin
{
  return (NSNumber *)objc_getProperty(self, a2, 312, 1);
}

- (void)setInputEyeProtectionFaceWeightsSmoothStepMin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (NSNumber)inputEyeProtectionFaceWeightsSmoothStepMax
{
  return (NSNumber *)objc_getProperty(self, a2, 320, 1);
}

- (void)setInputEyeProtectionFaceWeightsSmoothStepMax:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (NSNumber)inputEyeProtectionOvalDimsDistanceScale
{
  return (NSNumber *)objc_getProperty(self, a2, 328, 1);
}

- (void)setInputEyeProtectionOvalDimsDistanceScale:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

- (NSNumber)inputEyeProtectionOvalDimsDistanceOffset
{
  return (NSNumber *)objc_getProperty(self, a2, 336, 1);
}

- (void)setInputEyeProtectionOvalDimsDistanceOffset:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (NSNumber)inputEyeProtectionOvalDimsRadiusHorizontal
{
  return (NSNumber *)objc_getProperty(self, a2, 344, 1);
}

- (void)setInputEyeProtectionOvalDimsRadiusHorizontal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (NSNumber)inputEyeProtectionOvalDimsRadiusVertical
{
  return (NSNumber *)objc_getProperty(self, a2, 352, 1);
}

- (void)setInputEyeProtectionOvalDimsRadiusVertical:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (NSNumber)inputEyeProtectionOvalFallOffSmoothStepMin
{
  return (NSNumber *)objc_getProperty(self, a2, 360, 1);
}

- (void)setInputEyeProtectionOvalFallOffSmoothStepMin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (NSNumber)inputEyeProtectionOvalFallOffSmoothStepMax
{
  return (NSNumber *)objc_getProperty(self, a2, 368, 1);
}

- (void)setInputEyeProtectionOvalFallOffSmoothStepMax:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (NSNumber)inputEyeProtectionPersonMaskSmoothStepMin
{
  return (NSNumber *)objc_getProperty(self, a2, 376, 1);
}

- (void)setInputEyeProtectionPersonMaskSmoothStepMin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (NSNumber)inputEyeProtectionPersonMaskSmoothStepMax
{
  return (NSNumber *)objc_getProperty(self, a2, 384, 1);
}

- (void)setInputEyeProtectionPersonMaskSmoothStepMax:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (NSNumber)inputEyeProtectionPreventStrength
{
  return (NSNumber *)objc_getProperty(self, a2, 392, 1);
}

- (void)setInputEyeProtectionPreventStrength:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 392);
}

- (NSNumber)inputEyeProtectionSubtractiveMaxBlur
{
  return (NSNumber *)objc_getProperty(self, a2, 400, 1);
}

- (void)setInputEyeProtectionSubtractiveMaxBlur:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 400);
}

- (NSNumber)inputEyeProtectionSubtractiveApertureScaling
{
  return (NSNumber *)objc_getProperty(self, a2, 408, 1);
}

- (void)setInputEyeProtectionSubtractiveApertureScaling:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 408);
}

- (void)outputImage
{
  __assert_rtn("-[CIModifyBlurmap outputImage]", "CIBlurMapRefinement.m", 294, "eyeProtectionFaceCalculatorImage");
}

@end

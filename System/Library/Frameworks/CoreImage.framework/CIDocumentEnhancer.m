@implementation CIDocumentEnhancer

+ (id)customAttributes
{
  _QWORD v3[6];
  _QWORD v4[6];
  _QWORD v5[4];
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("CIAttributeFilterCategories");
  v5[0] = CFSTR("CICategoryColorEffect");
  v5[1] = CFSTR("CICategoryNonSquarePixels");
  v5[2] = CFSTR("CICategoryStillImage");
  v5[3] = CFSTR("CICategoryBuiltIn");
  v7[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v7[1] = CFSTR("13");
  v6[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v6[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v7[2] = CFSTR("10.15");
  v6[3] = CFSTR("inputAmount");
  v3[0] = CFSTR("CIAttributeMin");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = &unk_1E2F195B0;
  v4[1] = &unk_1E2F195B0;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeMax");
  v4[2] = &unk_1E2F195C0;
  v4[3] = &unk_1E2F195D0;
  v3[4] = CFSTR("CIAttributeDefault");
  v3[5] = CFSTR("CIAttributeType");
  v4[4] = &unk_1E2F195E0;
  v4[5] = CFSTR("CIAttributeTypeScalar");
  v7[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 6);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
}

- (id)outputImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSNumber *inputAmount;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  CIImage *inputImage;
  float v15;
  float v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  int v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  CIColorKernel *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CIImage *v47;
  CGFloat v48;
  CIColorKernel *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CIImage *v56;
  CIImage *v57;
  CIKernel *v58;
  CIImage *v59;
  CIKernel *v60;
  unsigned int v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  uint64_t v73;
  CIImage *v74;
  CIVector *v75;
  CIColorKernel *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  CIImage *v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  CIImage *v90;
  CIImage *v91;
  CIImage *v92;
  CIImage *v93;
  double v94;
  uint64_t v95;
  CIImage *v96;
  CIColorKernel *v97;
  CIImage *v98;
  CIColorKernel *v99;
  double v100;
  double v101;
  double v102;
  double v103;
  CIImage *v104;
  CIImage *v105;
  CIImage *v106;
  CIImage *v107;
  double v108;
  CGFloat v109;
  CGFloat v110;
  CIImage *v111;
  CIImage *v112;
  CIImage *v113;
  CIImage *v114;
  CIImage *v115;
  CIImage *v116;
  CIImage *v117;
  CIImage *v118;
  CIColorKernel *v119;
  double v120;
  CGFloat v121;
  double v122;
  CGFloat v123;
  double v124;
  CGFloat v125;
  double v126;
  CGFloat v127;
  CGFloat v128;
  CGFloat v129;
  CGFloat v130;
  CGFloat v131;
  CGFloat v132;
  CIColorKernel *v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  CIImage *v142;
  CIImage *v143;
  uint64_t v144;
  int v145;
  float v146;
  float v147;
  float v148;
  float v149;
  float v150;
  double v151;
  int v152;
  CIImage *v153;
  CIImage *v154;
  CGAffineTransform v155;
  CGAffineTransform v156;
  CGAffineTransform v157;
  CGAffineTransform v158;
  _QWORD v159[2];
  _QWORD v160[2];
  _QWORD v161[3];
  _QWORD v162[3];
  const __CFString *v163;
  void *v164;
  _QWORD v165[3];
  _QWORD v166[3];
  _QWORD v167[2];
  CGAffineTransform v168;
  _QWORD v169[3];
  _QWORD v170[3];
  _QWORD v171[4];
  const __CFString *v172;
  CIVector *v173;
  CGAffineTransform v174;
  const __CFString *v175;
  CIVector *v176;
  const __CFString *v177;
  CIVector *v178;
  CIImage *v179;
  const __CFString *v180;
  _QWORD v181[3];
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;
  CGRect v188;

  v181[1] = *MEMORY[0x1E0C80C00];
  -[CIImage extent](self->inputImage, "extent");
  inputAmount = self->inputAmount;
  if (!inputAmount)
    return self->inputImage;
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v11 = v6;
  -[NSNumber floatValue](inputAmount, "floatValue");
  if (v12 < 0.0001)
    return self->inputImage;
  v182.origin.x = v8;
  v182.origin.y = v9;
  v182.size.width = v10;
  v182.size.height = v11;
  if (CGRectIsNull(v182))
    return self->inputImage;
  v183.origin.x = v8;
  v183.origin.y = v9;
  v183.size.width = v10;
  v183.size.height = v11;
  if (CGRectIsInfinite(v183))
    return self->inputImage;
  inputImage = self->inputImage;
  CGAffineTransformMakeTranslation(&v158, -v8, -v9);
  v154 = -[CIImage imageByCroppingToRect:](-[CIImage imageByApplyingTransform:](inputImage, "imageByApplyingTransform:", &v158), "imageByCroppingToRect:", 0.0, 0.0, v10, v11);
  -[NSNumber floatValue](self->inputAmount, "floatValue");
  v16 = fmax(v15, 0.0001) * 0.8;
  -[CIImage extent](self->inputImage, "extent");
  v18 = v17;
  -[CIImage extent](self->inputImage, "extent");
  v20 = v19;
  -[CIImage extent](self->inputImage, "extent");
  if (v18 >= v20)
    v23 = v22;
  else
    v23 = v21;
  v24 = 512.0;
  if (v23 <= 512.0)
  {
    -[CIImage extent](self->inputImage, "extent");
    v26 = v25;
    -[CIImage extent](self->inputImage, "extent");
    v28 = v27;
    -[CIImage extent](self->inputImage, "extent");
    if (v26 >= v28)
      v24 = v29;
  }
  v30 = (int)v24;
  v31 = (double)(int)v24;
  v32 = floor(log2(v31) * 0.75);
  if (v32 <= 0.0)
    v32 = 0.0;
  LODWORD(v144) = (int)v32;
  v33 = (float)((float)v30 * 1.4142);
  if (v33 * 0.04 >= 1.0)
    v34 = v33 * 0.04;
  else
    v34 = 1.0;
  v35 = v33 * 0.004;
  if (v35 < 1.0)
    v35 = 1.0;
  v151 = v35;
  v36 = v16;
  if (v16 <= 1.0001)
  {
    if (v36 >= 0.9999)
    {
      v149 = 0.25;
      v147 = 3.0;
      v148 = 0.15;
      v37 = 0.054;
    }
    else
    {
      v38 = log2(v36 * 10000.0 + 1.0) / -13.2878566 + 1.0;
      v39 = v38 * 6.75 + 0.25;
      v149 = v39;
      v40 = v38 * 0.849999994 + 0.150000006;
      v147 = 3.0 - (float)(v38 * 3.0);
      v148 = v40;
      v37 = 0.054 - (float)(v38 * 0.054);
    }
  }
  else
  {
    v149 = 0.25 - (float)((float)(v16 + -1.0) * 0.25);
    v147 = (float)((float)((float)(v16 + -1.0) * 3.0) * 3.0) + 3.0;
    v148 = 0.15 - (float)((float)(v16 + -1.0) * 0.15);
    v37 = (float)(v16 + -1.0) * 0.945999999 + 0.0540000014;
  }
  *((float *)&v144 + 1) = v37;
  v41 = v34;
  v150 = v41;
  v42 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_CElumaToR, v144);
  -[CIImage extent](v154, "extent");
  v179 = v154;
  v47 = -[CIColorKernel applyWithExtent:arguments:](v42, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v179, 1), v43, v44, v45, v46);
  v177 = CFSTR("inputExtent");
  -[CIImage extent](v47, "extent");
  v178 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  v48 = COERCE_DOUBLE((uint64_t)-[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](v47, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaMinMaxRed"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v178, &v177, 1)), "imageByClampingToExtent"));
  v49 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_DEcomputeInversionMask);
  v50 = *MEMORY[0x1E0C9D5E0];
  v51 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
  v52 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
  v53 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
  *(_QWORD *)&v174.a = v154;
  v174.b = v48;
  LODWORD(v54) = 3.0;
  *(_QWORD *)&v174.c = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v54);
  LODWORD(v55) = 1000593162;
  *(_QWORD *)&v174.d = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v55);
  v56 = -[CIColorKernel applyWithExtent:arguments:](v49, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v174, 4), v50, v51, v52, v53);
  v175 = CFSTR("inputExtent");
  -[CIImage extent](v154, "extent");
  v176 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  v153 = -[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](v56, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaAverage"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v176, &v175, 1)), "imageByClampingToExtent");
  memset(&v174, 0, sizeof(v174));
  CGAffineTransformMakeScale(&v174, v31 / v10, v31 / v11);
  v157 = v174;
  v57 = -[CIImage imageByApplyingTransform:](v154, "imageByApplyingTransform:", &v157);
  v58 = +[CIKernel kernelWithInternalRepresentation:](CIKernel, "kernelWithInternalRepresentation:", &CI::_DEmax4);
  v59 = v57;
  if (v145 >= 1)
  {
    v60 = v58;
    v61 = v145 + 1;
    v59 = v57;
    do
    {
      -[CIImage extent](v59, "extent");
      v63 = v62;
      v65 = v64;
      v67 = ceil(v66 * 0.5);
      v69 = ceil(v68 * 0.5);
      *(_QWORD *)&v168.a = v59;
      -[CIImage extent](v59, "extent");
      v71 = v70;
      -[CIImage extent](v59, "extent");
      *(_QWORD *)&v168.b = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v71, v72);
      v59 = -[CIKernel applyWithExtent:roiCallback:arguments:](v60, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_20, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v168, 2), v63, v65, v67, v69);
      --v61;
    }
    while (v61 > 1);
  }
  v152 = (int)v151;
  v172 = CFSTR("inputExtent");
  -[CIImage extent](v59, "extent");
  v173 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  v73 = -[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](v59, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaAverage"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v173, &v172, 1)), "imageByClampingToExtent");
  -[CIImage extent](v57, "extent");
  v74 = resample(v59, v184);
  v75 = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v149, v147, v148, v146);
  v76 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_DEcreateForegroundMask);
  -[CIImage extent](v57, "extent");
  v171[0] = v57;
  v171[1] = v74;
  v171[2] = v73;
  v171[3] = v75;
  v81 = -[CIColorKernel applyWithExtent:arguments:](v76, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v171, 4), v77, v78, v79, v80);
  -[CIImage extent](v81, "extent");
  v83 = v82;
  v85 = v84;
  v87 = v86;
  v89 = v88;
  v90 = normalizedBlur(v81, 15.0);
  v91 = normalizedBlur(v81, 45.0);
  v92 = normalizedBlur(v81, 135.0);
  v93 = -[CIImage imageByCroppingToRect:](-[CIImage imageByCompositingOverImage:](v90, "imageByCompositingOverImage:", -[CIImage imageByCompositingOverImage:](v91, "imageByCompositingOverImage:", -[CIImage imageByCompositingOverImage:](v92, "imageByCompositingOverImage:", -[CIImage imageByCompositingOverImage:](normalizedBlur(v81, 200.0), "imageByCompositingOverImage:", +[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor whiteColor](CIColor, "whiteColor")))))), "imageByCroppingToRect:", v83, v85,
          v87,
          v89);
  *(float *)&v94 = v150;
  if (v150 > 0.0)
  {
    v170[0] = v57;
    v169[0] = CFSTR("inputSource");
    v169[1] = CFSTR("inputSigmaSpace");
    v95 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v94);
    v169[2] = CFSTR("inputSigmaRange");
    v170[1] = v95;
    v170[2] = &unk_1E2F1D928;
    v93 = -[CIImage imageByApplyingFilter:withInputParameters:](v93, "imageByApplyingFilter:withInputParameters:", CFSTR("CICheapBilateral"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v170, v169, 3));
  }
  CGAffineTransformMakeScale(&v168, v10 / v31, v11 / v31);
  v174 = v168;
  v156 = v168;
  v96 = -[CIImage imageByApplyingTransform:](v93, "imageByApplyingTransform:", &v156);
  v97 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_DEWash);
  v167[0] = v154;
  v167[1] = v96;
  v98 = -[CIColorKernel applyWithExtent:arguments:](v97, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v167, 2), 0.0, 0.0, v10, v11);
  v99 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_DE_compinv);
  -[CIImage extent](v96, "extent");
  *(_QWORD *)&v168.a = v96;
  v104 = -[CIColorKernel applyWithExtent:arguments:](v99, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v168, 1), v100, v101, v102, v103);
  v180 = CFSTR("inputExtent");
  -[CIImage extent](v96, "extent");
  v181[0] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  v105 = -[CIImage imageByClampingToExtent](-[CIImage imageByApplyingFilter:withInputParameters:](v104, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaAverage"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v181, &v180, 1)), "imageByClampingToExtent");
  v106 = self->inputImage;
  v165[0] = CFSTR("inputThreshold");
  v165[1] = CFSTR("inputSoftness");
  v166[0] = &unk_1E2F1D938;
  v166[1] = &unk_1E2F1D948;
  v165[2] = CFSTR("inputIntensity");
  v166[2] = &unk_1E2F1D958;
  v107 = -[CIImage imageByApplyingFilter:withInputParameters:](v106, "imageByApplyingFilter:withInputParameters:", CFSTR("CIDesaturateShadows"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v166, v165, 3));
  -[CIImage extent](v107, "extent");
  v109 = v108;
  -[CIImage extent](v107, "extent");
  CGAffineTransformMakeTranslation(&v155, v109, v110);
  v111 = -[CIImage imageByApplyingTransform:](v98, "imageByApplyingTransform:", &v155);
  -[CIImage extent](v107, "extent");
  v112 = conditionallyFilteredMaxThreshold(-[CIImage imageByCroppingToRect:](v111, "imageByCroppingToRect:"), v107, v105, 0.2);
  v163 = CFSTR("inputContrast");
  v164 = &unk_1E2F1D968;
  v113 = -[CIImage imageByApplyingFilter:withInputParameters:](v107, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorControls"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v164, &v163, 1));
  v161[0] = CFSTR("inputContrast");
  v161[1] = CFSTR("inputBrightness");
  v162[0] = &unk_1E2F1D978;
  v162[1] = &unk_1E2F1D988;
  v161[2] = CFSTR("inputSaturation");
  v162[2] = &unk_1E2F1D998;
  v114 = -[CIImage imageByApplyingFilter:withInputParameters:](v107, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorControls"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v162, v161, 3));
  v115 = conditionallyFilteredMaxThreshold(v112, v113, v105, 0.2);
  v116 = conditionallyFilteredMaxThreshold(v115, v114, v153, 0.18);
  v159[0] = CFSTR("inputThreshold");
  v159[1] = CFSTR("inputIntensity");
  v160[0] = &unk_1E2F1D938;
  v160[1] = &unk_1E2F1D958;
  v117 = -[CIImage imageByApplyingFilter:withInputParameters:](v116, "imageByApplyingFilter:withInputParameters:", CFSTR("CIDesaturateShadows"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v160, v159, 2));
  v118 = -[CIImage imageByApplyingGaussianBlurWithSigma:](v117, "imageByApplyingGaussianBlurWithSigma:", (double)v152);
  v119 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_DE_sub);
  -[CIImage extent](v117, "extent");
  v121 = v120;
  v123 = v122;
  v125 = v124;
  v127 = v126;
  -[CIImage extent](v118, "extent");
  v188.origin.x = v128;
  v188.origin.y = v129;
  v188.size.width = v130;
  v188.size.height = v131;
  v185.origin.x = v121;
  v185.origin.y = v123;
  v185.size.width = v125;
  v185.size.height = v127;
  v186 = CGRectUnion(v185, v188);
  *(_QWORD *)&v168.a = v117;
  *(_QWORD *)&v168.b = v118;
  v132 = COERCE_DOUBLE((uint64_t)-[CIColorKernel applyWithExtent:arguments:](v119, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v168, 2), v186.origin.x, v186.origin.y, v186.size.width, v186.size.height));
  v133 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_DE_scaleAdd);
  -[CIImage extent](v117, "extent");
  v135 = v134;
  v137 = v136;
  v139 = v138;
  v141 = v140;
  *(_QWORD *)&v168.a = v117;
  v168.b = v132;
  LODWORD(v134) = 1041865114;
  *(_QWORD *)&v168.c = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v134);
  v142 = -[CIImage imageByApplyingFilter:withInputParameters:](-[CIColorKernel applyWithExtent:arguments:](v133, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v168, 3), v135, v137, v139, v141), "imageByApplyingFilter:withInputParameters:", CFSTR("CIContrastEnhancer"), &unk_1E2F1D508);
  -[CIImage extent](v107, "extent");
  v143 = -[CIImage imageByCroppingToRect:](v142, "imageByCroppingToRect:");
  -[CIImage extent](v107, "extent");
  return resample(v143, v187);
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputAmount
{
  return self->inputAmount;
}

- (void)setInputAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

@end

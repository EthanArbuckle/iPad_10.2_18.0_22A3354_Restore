@implementation CISmartToneFilter

+ (id)customAttributes
{
  uint64_t v2;
  _QWORD v4[4];
  _QWORD v5[4];
  _QWORD v6[7];
  _QWORD v7[7];
  _QWORD v8[7];
  _QWORD v9[7];
  _QWORD v10[7];
  _QWORD v11[7];
  _QWORD v12[7];
  _QWORD v13[7];
  _QWORD v14[7];
  _QWORD v15[7];
  _QWORD v16[7];
  _QWORD v17[7];
  _QWORD v18[7];
  _QWORD v19[7];
  _QWORD v20[7];
  _QWORD v21[7];
  _QWORD v22[5];
  _QWORD v23[11];
  _QWORD v24[13];

  v24[11] = *MEMORY[0x1E0C80C00];
  v23[0] = CFSTR("CIAttributeFilterCategories");
  v22[0] = CFSTR("CICategoryStylize");
  v22[1] = CFSTR("CICategoryVideo");
  v22[2] = CFSTR("CICategoryStillImage");
  v22[3] = CFSTR("CICategoryBuiltIn");
  v22[4] = CFSTR("CICategoryApplePrivate");
  v24[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 5);
  v23[1] = CFSTR("inputExposure");
  v20[0] = CFSTR("CIAttributeMin");
  v20[1] = CFSTR("CIAttributeSliderMin");
  v21[0] = &unk_1E2F1ABF0;
  v21[1] = &unk_1E2F1AC00;
  v20[2] = CFSTR("CIAttributeSliderMax");
  v20[3] = CFSTR("CIAttributeMax");
  v21[2] = &unk_1E2F1AC10;
  v21[3] = &unk_1E2F1AC20;
  v20[4] = CFSTR("CIAttributeDefault");
  v20[5] = CFSTR("CIAttributeIdentity");
  v21[4] = &unk_1E2F1AC30;
  v21[5] = &unk_1E2F1AC30;
  v20[6] = CFSTR("CIAttributeType");
  v21[6] = CFSTR("CIAttributeTypeScalar");
  v24[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 7);
  v23[2] = CFSTR("inputContrast");
  v18[0] = CFSTR("CIAttributeMin");
  v18[1] = CFSTR("CIAttributeSliderMin");
  v19[0] = &unk_1E2F1ABF0;
  v19[1] = &unk_1E2F1AC00;
  v18[2] = CFSTR("CIAttributeSliderMax");
  v18[3] = CFSTR("CIAttributeMax");
  v19[2] = &unk_1E2F1AC10;
  v19[3] = &unk_1E2F1AC20;
  v18[4] = CFSTR("CIAttributeDefault");
  v18[5] = CFSTR("CIAttributeIdentity");
  v19[4] = &unk_1E2F1AC30;
  v19[5] = &unk_1E2F1AC30;
  v18[6] = CFSTR("CIAttributeType");
  v19[6] = CFSTR("CIAttributeTypeScalar");
  v24[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 7);
  v23[3] = CFSTR("inputBrightness");
  v16[0] = CFSTR("CIAttributeMin");
  v16[1] = CFSTR("CIAttributeSliderMin");
  v17[0] = &unk_1E2F1ABF0;
  v17[1] = &unk_1E2F1AC00;
  v16[2] = CFSTR("CIAttributeSliderMax");
  v16[3] = CFSTR("CIAttributeMax");
  v17[2] = &unk_1E2F1AC10;
  v17[3] = &unk_1E2F1AC20;
  v16[4] = CFSTR("CIAttributeDefault");
  v16[5] = CFSTR("CIAttributeIdentity");
  v17[4] = &unk_1E2F1AC30;
  v17[5] = &unk_1E2F1AC30;
  v16[6] = CFSTR("CIAttributeType");
  v17[6] = CFSTR("CIAttributeTypeScalar");
  v24[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 7);
  v23[4] = CFSTR("inputShadows");
  v14[0] = CFSTR("CIAttributeMin");
  v14[1] = CFSTR("CIAttributeSliderMin");
  v15[0] = &unk_1E2F1ABF0;
  v15[1] = &unk_1E2F1AC00;
  v14[2] = CFSTR("CIAttributeSliderMax");
  v14[3] = CFSTR("CIAttributeMax");
  v15[2] = &unk_1E2F1AC10;
  v15[3] = &unk_1E2F1AC20;
  v14[4] = CFSTR("CIAttributeDefault");
  v14[5] = CFSTR("CIAttributeIdentity");
  v15[4] = &unk_1E2F1AC30;
  v15[5] = &unk_1E2F1AC30;
  v14[6] = CFSTR("CIAttributeType");
  v15[6] = CFSTR("CIAttributeTypeScalar");
  v24[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 7);
  v23[5] = CFSTR("inputHighlights");
  v12[0] = CFSTR("CIAttributeMin");
  v12[1] = CFSTR("CIAttributeSliderMin");
  v13[0] = &unk_1E2F1ABF0;
  v13[1] = &unk_1E2F1AC00;
  v12[2] = CFSTR("CIAttributeSliderMax");
  v12[3] = CFSTR("CIAttributeMax");
  v13[2] = &unk_1E2F1AC10;
  v13[3] = &unk_1E2F1AC20;
  v12[4] = CFSTR("CIAttributeDefault");
  v12[5] = CFSTR("CIAttributeIdentity");
  v13[4] = &unk_1E2F1AC30;
  v13[5] = &unk_1E2F1AC30;
  v12[6] = CFSTR("CIAttributeType");
  v13[6] = CFSTR("CIAttributeTypeScalar");
  v24[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
  v23[6] = CFSTR("inputBlack");
  v10[0] = CFSTR("CIAttributeMin");
  v10[1] = CFSTR("CIAttributeSliderMin");
  v11[0] = &unk_1E2F1ABF0;
  v11[1] = &unk_1E2F1AC00;
  v10[2] = CFSTR("CIAttributeSliderMax");
  v10[3] = CFSTR("CIAttributeMax");
  v11[2] = &unk_1E2F1AC10;
  v11[3] = &unk_1E2F1AC20;
  v10[4] = CFSTR("CIAttributeDefault");
  v10[5] = CFSTR("CIAttributeIdentity");
  v11[4] = &unk_1E2F1AC30;
  v11[5] = &unk_1E2F1AC30;
  v10[6] = CFSTR("CIAttributeType");
  v11[6] = CFSTR("CIAttributeTypeScalar");
  v24[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 7);
  v23[7] = CFSTR("inputRawHighlights");
  v8[0] = CFSTR("CIAttributeMin");
  v8[1] = CFSTR("CIAttributeSliderMin");
  v9[0] = &unk_1E2F1AC30;
  v9[1] = &unk_1E2F1AC30;
  v8[2] = CFSTR("CIAttributeSliderMax");
  v8[3] = CFSTR("CIAttributeMax");
  v9[2] = &unk_1E2F1AC10;
  v9[3] = &unk_1E2F1AC10;
  v8[4] = CFSTR("CIAttributeDefault");
  v8[5] = CFSTR("CIAttributeIdentity");
  v9[4] = &unk_1E2F1AC30;
  v9[5] = &unk_1E2F1AC30;
  v8[6] = CFSTR("CIAttributeType");
  v9[6] = CFSTR("CIAttributeTypeScalar");
  v24[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 7);
  v23[8] = CFSTR("inputLocalLight");
  v6[0] = CFSTR("CIAttributeMin");
  v6[1] = CFSTR("CIAttributeSliderMin");
  v7[0] = &unk_1E2F1AC00;
  v7[1] = &unk_1E2F1AC00;
  v6[2] = CFSTR("CIAttributeSliderMax");
  v6[3] = CFSTR("CIAttributeMax");
  v7[2] = &unk_1E2F1AC10;
  v7[3] = &unk_1E2F1AC20;
  v6[4] = CFSTR("CIAttributeDefault");
  v6[5] = CFSTR("CIAttributeIdentity");
  v7[4] = &unk_1E2F1AC30;
  v7[5] = &unk_1E2F1AC30;
  v6[6] = CFSTR("CIAttributeType");
  v7[6] = CFSTR("CIAttributeTypeScalar");
  v24[8] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 7);
  v23[9] = CFSTR("inputUseCube");
  v4[0] = CFSTR("CIAttributeMin");
  v4[1] = CFSTR("CIAttributeMax");
  v5[0] = &unk_1E2F1BED8;
  v5[1] = &unk_1E2F1BEF0;
  v4[2] = CFSTR("CIAttributeDefault");
  v4[3] = CFSTR("CIAttributeType");
  v5[2] = &unk_1E2F1BED8;
  v5[3] = CFSTR("CIAttributeTypeInteger");
  v2 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 4);
  v23[10] = CFSTR("inputUseCubeColorSpace");
  v24[9] = v2;
  v24[10] = MEMORY[0x1E0C9AA70];
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 11);
}

- (BOOL)_isIdentity
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL result;

  -[NSNumber doubleValue](self->inputExposure, "doubleValue");
  v4 = v3;
  -[NSNumber doubleValue](self->inputContrast, "doubleValue");
  v6 = v5;
  -[NSNumber doubleValue](self->inputBrightness, "doubleValue");
  v8 = v7;
  -[NSNumber doubleValue](self->inputShadows, "doubleValue");
  v10 = v9;
  -[NSNumber doubleValue](self->inputHighlights, "doubleValue");
  v12 = v11;
  -[NSNumber doubleValue](self->inputBlack, "doubleValue");
  v14 = v13;
  -[NSNumber doubleValue](self->inputRawHighlights, "doubleValue");
  result = 0;
  if (fabs(v4) < 1.0e-10
    && fabs(v6) < 1.0e-10
    && fabs(v8) < 1.0e-10
    && fabs(v10) < 1.0e-10
    && fabs(v12) < 1.0e-10
    && fabs(v14) < 1.0e-10)
  {
    return fabs(v15) < 1.0e-10;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->_cubeImage = 0;
  self->_cubeData = 0;
  v3.receiver = self;
  v3.super_class = (Class)CISmartToneFilter;
  -[CIFilter dealloc](&v3, sel_dealloc);
}

- (id)_kernelBneg
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_smarttone_brightness_neg);
}

- (id)_kernelBpos
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_smarttone_brightness_pos);
}

- (id)_kernelC
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_smarttone_contrast);
}

- (id)_kernelH
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_smarttone_highlightcontrast);
}

- (id)_kernelRH
{
  return +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_rawHighlights);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  char v7;
  objc_super v8;

  v7 = objc_msgSend(a4, "isEqualToString:", CFSTR("inputImage"));

  self->_cubeImage = 0;
  if ((v7 & 1) == 0)
  {

    self->_cubeData = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)CISmartToneFilter;
  -[CISmartToneFilter setValue:forKey:](&v8, sel_setValue_forKey_, a3, a4);
}

- (id)outputImage
{
  CIImage *cubeImage;
  CIImage *inputImage;
  uint64_t v6;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float v22;
  float v23;
  float v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  id v32;
  CGColorSpace *v33;
  CGColorSpaceRef DeviceRGB;
  long double v35;
  double v36;
  double v37;
  CIImage *v38;
  id v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  _QWORD *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  long double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  CIImage *v62;
  double v63;
  id v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  CGColorSpace *v71;
  CIFilter *v72;
  id v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  CIImage *v82;
  id v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  float v92;
  float v93;
  float v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  _QWORD v104[5];
  _QWORD v105[5];
  _QWORD v106[2];
  _QWORD v107[3];
  _QWORD v108[2];
  _QWORD v109[3];
  _QWORD v110[3];
  _QWORD v111[2];
  _QWORD v112[2];
  _QWORD v113[5];
  _QWORD v114[5];
  _QWORD v115[5];
  _QWORD v116[5];
  void *v117;
  const __CFString *v118;
  _QWORD v119[3];

  v119[1] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage)
    return 0;
  if (!-[CISmartToneFilter _isIdentity](self, "_isIdentity"))
  {
    LODWORD(v6) = -[NSNumber intValue](-[CISmartToneFilter inputUseCube](self, "inputUseCube"), "intValue");
    if (CI_SMART_TONE_USE_CUBE(void)::didCheck != -1)
      dispatch_once(&CI_SMART_TONE_USE_CUBE(void)::didCheck, &__block_literal_global_66);
    if ((CI_SMART_TONE_USE_CUBE(void)::v & 0x80000000) == 0 && (v6 & 0x80000000) == 0)
      LODWORD(v6) = CI_SMART_TONE_USE_CUBE(void)::v;
    if ((int)v6 < 1)
    {
      -[NSNumber doubleValue](self->inputExposure, "doubleValue");
      v9 = 2.0;
      v10 = fmin(fmax(v8, -2.0), 2.0);
      -[NSNumber doubleValue](self->inputContrast, "doubleValue");
      v100 = v11;
      -[NSNumber doubleValue](self->inputBrightness, "doubleValue");
      v13 = fmax(v12, -2.0);
      -[NSNumber doubleValue](self->inputShadows, "doubleValue");
      v15 = v14;
      -[NSNumber doubleValue](self->inputHighlights, "doubleValue");
      v17 = v16;
      -[NSNumber doubleValue](self->inputBlack, "doubleValue");
      v19 = fmax(v18, -2.0);
      -[NSNumber doubleValue](self->inputRawHighlights, "doubleValue");
      v21 = fmax(v20, 0.0);
      inputImage = self->inputImage;
      v98 = fmin(v21, 2.0);
      v102 = v21;
      v103 = fabs(v98);
      if (v103 >= 1.0e-10)
      {
        v22 = fmin(v21, 0.8);
        v23 = 1.0 - v22;
        v24 = (1.0 - v23) * 0.333333343;
        v115[0] = CFSTR("inputRVector");
        v25 = (float)(v23 + v24);
        v26 = v24;
        v116[0] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v25, v26, v26, 0.0);
        v115[1] = CFSTR("inputGVector");
        v116[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v26, v25, v26, 0.0);
        v115[2] = CFSTR("inputBVector");
        v27 = v25;
        v9 = 2.0;
        v116[2] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v26, v26, v27, 0.0);
        v115[3] = CFSTR("inputAVector");
        v116[3] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 1.0);
        v115[4] = CFSTR("inputBiasVector");
        v116[4] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0);
        inputImage = -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, v115, 5));
      }
      v28 = fmax(v15, -2.0);
      v29 = fmin(v19, v9);
      v30 = fmin(v13, v9);
      if (fabs(v10) >= 1.0e-10 || fabs(v29) >= 1.0e-10)
      {
        v35 = 1.0 / (1.0 / exp2(v10 + v10) - v29 / 20.0);
        v113[0] = CFSTR("inputRVector");
        v114[0] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", (double)v35, 0.0, 0.0, 0.0);
        v113[1] = CFSTR("inputGVector");
        v114[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, (double)v35, 0.0, 0.0);
        v113[2] = CFSTR("inputBVector");
        v114[2] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, (double)v35, 0.0);
        v113[3] = CFSTR("inputAVector");
        v114[3] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 1.0);
        v113[4] = CFSTR("inputBiasVector");
        v9 = 2.0;
        v114[4] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", (double)-(v29 / 20.0 * v35), (double)-(v29 / 20.0 * v35), (double)-(v29 / 20.0 * v35), 0.0);
        inputImage = -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, v113, 5));
      }
      v36 = fmax(v17, -2.0);
      v37 = fmin(v28, v9);
      if (fabs(v30) >= 1.0e-10)
      {
        v38 = -[CIImage imageByUnpremultiplyingAlpha](inputImage, "imageByUnpremultiplyingAlpha");
        if (v30 >= 0.0)
        {
          v39 = -[CISmartToneFilter _kernelBpos](self, "_kernelBpos");
          -[CIImage extent](v38, "extent");
          v41 = v49;
          v43 = v50;
          v45 = v51;
          v47 = v52;
          v111[0] = v38;
          v111[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v30 * 2.0 + 1.0);
          v48 = v111;
        }
        else
        {
          v39 = -[CISmartToneFilter _kernelBneg](self, "_kernelBneg");
          -[CIImage extent](v38, "extent");
          v41 = v40;
          v43 = v42;
          v45 = v44;
          v47 = v46;
          v112[0] = v38;
          v112[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v30 * -1.5 + 1.0);
          v48 = v112;
        }
        inputImage = (CIImage *)objc_msgSend((id)objc_msgSend(v39, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2), v41, v43, v45, v47), "imageByPremultiplyingAlpha");
        v9 = 2.0;
      }
      v53 = fmax(v100, -2.0);
      v54 = fmin(v36, v9);
      if (fabs(v37) >= 1.0e-10)
      {
        v109[0] = CFSTR("inputShadowAmount");
        v110[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v37);
        v110[1] = &unk_1E2F1AC10;
        v109[1] = CFSTR("inputHighlightAmount");
        v109[2] = CFSTR("inputRadius");
        v110[2] = &unk_1E2F1AC30;
        inputImage = -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", CFSTR("CIHighlightShadowAdjust"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, v109, 3));
      }
      v55 = fmin(v53, v9);
      v56 = fabs(v54);
      if (v56 >= 1.0e-10)
      {
        v57 = exp(v54 * v54 / -0.75);
        v58 = v57 * -0.45 + 1.45;
        v59 = v57 * 0.45 + 0.55;
        if (v54 <= 0.0)
          v60 = v59;
        else
          v60 = v58;
        v61 = (v56 + -0.6) * 2.0 + 0.2;
        if (v56 < 0.6)
          v61 = 0.2;
        v101 = v61;
        v62 = -[CIImage imageByUnpremultiplyingAlpha](inputImage, "imageByUnpremultiplyingAlpha");
        v63 = v103;
        if (v103 >= 1.0e-10)
        {
          if (v60 < v98)
            v60 = v98;
          v64 = -[CISmartToneFilter _kernelRH](self, "_kernelRH");
          -[CIImage extent](v62, "extent");
          v99 = v65;
          v97 = v66;
          v68 = v67;
          v70 = v69;
          v108[0] = v62;
          v108[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v60);
          v62 = (CIImage *)objc_msgSend(v64, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v108, 2), v99, v97, v68, v70);
          if (v54 <= 0.0)
          {
            v63 = exp(v54 * (v54 * -0.4245) / 0.75);
            v60 = v63 * 0.45 + 0.55;
          }
          else
          {
            v63 = exp(v54 * (v54 * -0.4225) / 0.75);
            v60 = v63 * -0.45 + 1.45;
          }
        }
        v73 = -[CISmartToneFilter _kernelH](self, "_kernelH", v63);
        -[CIImage extent](v62, "extent");
        v75 = v74;
        v77 = v76;
        v79 = v78;
        v81 = v80;
        v107[0] = v62;
        v107[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v60);
        v107[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v101);
        inputImage = (CIImage *)objc_msgSend((id)objc_msgSend(v73, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 3), v75, v77, v79, v81), "imageByPremultiplyingAlpha");
      }
      if (fabs(v55) >= 1.0e-10)
      {
        v82 = -[CIImage imageByUnpremultiplyingAlpha](inputImage, "imageByUnpremultiplyingAlpha");
        v83 = -[CISmartToneFilter _kernelC](self, "_kernelC");
        -[CIImage extent](v82, "extent");
        v85 = v84;
        v87 = v86;
        v89 = v88;
        v91 = v90;
        v106[0] = v82;
        v106[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v55 * 3.4);
        inputImage = (CIImage *)objc_msgSend((id)objc_msgSend(v83, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 2), v85, v87, v89, v91), "imageByPremultiplyingAlpha");
      }
      if (v103 >= 1.0e-10)
      {
        v92 = fmin(v102, 0.8);
        v93 = 1.0 / (1.0 - v92);
        v94 = (1.0 - v93) * 0.333333343;
        v104[0] = CFSTR("inputRVector");
        v95 = (float)(v93 + v94);
        v96 = v94;
        v105[0] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v95, v96, v96, 0.0);
        v104[1] = CFSTR("inputGVector");
        v105[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v96, v95, v96, 0.0);
        v104[2] = CFSTR("inputBVector");
        v105[2] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", v96, v96, v95, 0.0);
        v104[3] = CFSTR("inputAVector");
        v105[3] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 1.0);
        v104[4] = CFSTR("inputBiasVector");
        v105[4] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0);
        return -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v105, v104, 5));
      }
    }
    else
    {
      if (v6 > 0x20 || (_DWORD)v6 == 1)
        v6 = 32;
      else
        v6 = v6;
      cubeImage = self->_cubeImage;
      if (cubeImage)
        return cubeImage;
      if (!self->_cubeData)
      {
        v31 = (void *)-[CISmartToneFilter copy](self, "copy");
        objc_msgSend(v31, "setValue:forKey:", &unk_1E2F1BF08, CFSTR("inputUseCube"));
        v118 = CFSTR("working_format");
        v119[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2056);
        v32 = +[CIContext _cachedContext:options:](CIContext, "_cachedContext:options:", CFSTR("CISmartToneFilter-cubeContext"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v119, &v118, 1));
        v117 = v31;
        self->_cubeData = (NSData *)(id)objc_msgSend(v32, "createColorCubeDataForFilters:dimension:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v117, 1), v6);

      }
      v33 = -[CISmartToneFilter inputUseCubeColorSpace](self, "inputUseCubeColorSpace");
      if (v33)
        DeviceRGB = CGColorSpaceRetain(v33);
      else
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v71 = DeviceRGB;
      v72 = +[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", CFSTR("CIColorCubeWithColorSpace"), CFSTR("inputImage"), self->inputImage, CFSTR("inputCubeData"), self->_cubeData, CFSTR("inputColorSpace"), DeviceRGB, CFSTR("inputCubeDimension"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6), 0);
      CGColorSpaceRelease(v71);
      inputImage = -[CIFilter outputImage](v72, "outputImage");
      self->_cubeImage = inputImage;
    }
    return inputImage;
  }
  cubeImage = self->inputImage;
  return cubeImage;
}

- (CIImage)inputImage
{
  return self->inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSNumber)inputExposure
{
  return self->inputExposure;
}

- (void)setInputExposure:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSNumber)inputContrast
{
  return self->inputContrast;
}

- (void)setInputContrast:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSNumber)inputBrightness
{
  return self->inputBrightness;
}

- (void)setInputBrightness:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSNumber)inputShadows
{
  return self->inputShadows;
}

- (void)setInputShadows:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSNumber)inputHighlights
{
  return self->inputHighlights;
}

- (void)setInputHighlights:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (NSNumber)inputBlack
{
  return self->inputBlack;
}

- (void)setInputBlack:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (NSNumber)inputRawHighlights
{
  return self->inputRawHighlights;
}

- (void)setInputRawHighlights:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (NSNumber)inputLocalLight
{
  return self->inputLocalLight;
}

- (void)setInputLocalLight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (NSData)inputLightMap
{
  return self->_inputLightMap;
}

- (void)setInputLightMap:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (NSNumber)inputUseCube
{
  return self->inputUseCube;
}

- (void)setInputUseCube:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (id)inputUseCubeColorSpace
{
  return self->inputUseCubeColorSpace;
}

- (void)setInputUseCubeColorSpace:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

@end

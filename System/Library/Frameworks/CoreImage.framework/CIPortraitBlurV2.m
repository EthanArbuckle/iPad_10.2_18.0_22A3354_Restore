@implementation CIPortraitBlurV2

+ (id)customAttributes
{
  _QWORD v3[4];
  _QWORD v4[4];
  const __CFString *v5;
  const __CFString *v6;
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[5];
  _QWORD v12[7];
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("CIAttributeFilterCategories");
  v11[0] = CFSTR("CICategoryColorAdjustment");
  v11[1] = CFSTR("CICategoryVideo");
  v11[2] = CFSTR("CICategoryStillImage");
  v11[3] = CFSTR("CICategoryBuiltIn");
  v11[4] = CFSTR("CICategoryApplePrivate");
  v13[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 5);
  v13[1] = CFSTR("12");
  v12[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v12[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v13[2] = CFSTR("10.14");
  v12[3] = CFSTR("inputLumaNoiseScale");
  v9[0] = CFSTR("CIAttributeSliderMin");
  v9[1] = CFSTR("CIAttributeSliderMax");
  v10[0] = &unk_1E2F1A840;
  v10[1] = &unk_1E2F1A860;
  v9[2] = CFSTR("CIAttributeMin");
  v9[3] = CFSTR("CIAttributeMax");
  v10[2] = &unk_1E2F1A840;
  v10[3] = &unk_1E2F1A860;
  v9[4] = CFSTR("CIAttributeDefault");
  v9[5] = CFSTR("CIAttributeType");
  v10[4] = &unk_1E2F1A870;
  v10[5] = CFSTR("CIAttributeTypeScalar");
  v13[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v12[4] = CFSTR("inputAperture");
  v7[0] = CFSTR("CIAttributeSliderMin");
  v7[1] = CFSTR("CIAttributeSliderMax");
  v8[0] = &unk_1E2F1A810;
  v8[1] = &unk_1E2F1A880;
  v7[2] = CFSTR("CIAttributeMin");
  v7[3] = CFSTR("CIAttributeMax");
  v8[2] = &unk_1E2F1A840;
  v8[3] = &unk_1E2F1A880;
  v7[4] = CFSTR("CIAttributeDefault");
  v7[5] = CFSTR("CIAttributeType");
  v8[4] = &unk_1E2F1A840;
  v8[5] = CFSTR("CIAttributeTypeScalar");
  v13[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v12[5] = CFSTR("inputShape");
  v5 = CFSTR("CIAttributeClass");
  v6 = CFSTR("NSString");
  v13[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1);
  v12[6] = CFSTR("inputDraftMode");
  v3[0] = CFSTR("CIAttributeType");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = CFSTR("CIAttributeTypeInteger");
  v4[1] = &unk_1E2F1BC98;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F1BCE0;
  v4[3] = &unk_1E2F1BC98;
  v13[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
}

- (id)sensorSize
{
  double v3;
  id v4;
  double v5;
  double v6;

  if (-[NSDictionary objectForKeyedSubscript:](self->inputTuningParameters, "objectForKeyedSubscript:", CFSTR("SensorWidth")))
  {
    v3 = (double)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->inputTuningParameters, "objectForKeyedSubscript:", CFSTR("SensorWidth")), "integerValue");
  }
  else
  {
    v3 = 4032.0;
  }
  v4 = -[NSDictionary objectForKeyedSubscript:](self->inputTuningParameters, "objectForKeyedSubscript:", CFSTR("SensorHeight"));
  v5 = 3024.0;
  if (v4)
    v5 = (double)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->inputTuningParameters, "objectForKeyedSubscript:", CFSTR("SensorHeight")), "integerValue");
  v6 = 4032.0;
  if (v3 != 4224.0)
    v6 = v3;
  if (v5 == 3168.0)
    v5 = 3024.0;
  return +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v6, v5);
}

- (double)effectiveScale
{
  id v3;
  double v4;
  double v5;
  double v6;

  v3 = -[CIPortraitBlurV2 sensorSize](self, "sensorSize");
  -[CIImage extent](self->inputBlurmapImage, "extent");
  v5 = v4;
  objc_msgSend(v3, "X");
  *(float *)&v6 = v5 / (v6 * 0.5);
  return *(float *)&v6;
}

- (id)outputImage
{
  CIImage *inputImage;
  CIImage *inputBlurmapImage;
  float v5;
  float v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  double v14;
  double v15;
  double v16;
  float v17;
  double v18;
  double v19;
  double v20;
  CIImage *v21;
  CIImage *v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  float v32;
  float v33;
  float v34;
  double v35;
  float v36;
  float v37;
  double v38;
  uint64_t v39;
  NSDictionary *inputTuningParameters;
  CIImage *v41;
  float v42;
  float v43;
  uint64_t v44;
  NSDictionary *v45;
  double v46;
  double v47;
  CIImage *inputMatteImage;
  uint64_t v49;
  NSDictionary *v50;
  uint64_t v51;
  NSNumber *inputAperture;
  CIFilter *v53;
  CIFilter *v54;
  CIImage *v55;
  float v56;
  float v57;
  int v58;
  int v59;
  int v60;
  int v61;
  float v62;
  double v63;
  float v64;
  void *v65;
  double v66;
  void *v67;
  double v68;
  uint64_t v69;
  CIImage *v70;
  CIFilter *v71;
  CIFilter *v72;
  CIImage *v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  CGAffineTransform v80;
  CGAffineTransform v81;
  CGAffineTransform v82;
  CGAffineTransform v83;
  _QWORD v84[3];
  _QWORD v85[3];
  _QWORD v86[7];
  _QWORD v87[7];
  _QWORD v88[6];
  _QWORD v89[6];
  _QWORD v90[3];
  _QWORD v91[3];
  _QWORD v92[4];
  _QWORD v93[4];
  _QWORD v94[2];
  _QWORD v95[4];
  CGRect v96;
  CGRect v97;

  v95[2] = *MEMORY[0x1E0C80C00];
  inputImage = self->inputImage;
  inputBlurmapImage = self->inputBlurmapImage;
  -[NSNumber floatValue](self->inputScale, "floatValue");
  v6 = v5;
  -[CIImage extent](self->inputBlurmapImage, "extent");
  v8 = v7;
  -[CIImage extent](self->inputImage, "extent");
  if (vabdd_f64(v8, v9) > 0.001)
  {
    -[CIImage extent](self->inputBlurmapImage, "extent");
    v11 = v10;
    -[CIImage extent](self->inputImage, "extent");
    v13 = v11 / v12;
    -[CIImage extent](self->inputBlurmapImage, "extent");
    v15 = v14;
    -[CIImage extent](self->inputImage, "extent");
    v17 = v15 / v16;
    -[CIImage extent](self->inputImage, "extent");
    v19 = v18;
    -[CIImage extent](self->inputBlurmapImage, "extent");
    if (v19 <= v20)
    {
      v21 = self->inputBlurmapImage;
      CGAffineTransformMakeScale(&v82, 1.0 / v13, 1.0 / v17);
      inputBlurmapImage = -[CIImage imageByApplyingTransform:](v21, "imageByApplyingTransform:", &v82);
    }
    else
    {
      CGAffineTransformMakeScale(&v83, v13, v17);
      inputImage = -[CIImage imageByApplyingTransform:](inputImage, "imageByApplyingTransform:", &v83);
    }
  }
  v94[0] = CFSTR("inputBlurmapImage");
  v94[1] = CFSTR("inputUseMetal");
  v95[0] = inputBlurmapImage;
  v95[1] = &unk_1E2F1BCF8;
  v22 = -[CIImage imageByApplyingFilter:withInputParameters:](inputImage, "imageByApplyingFilter:withInputParameters:", CFSTR("CIPortraitBlurPreProcess"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, v94, 2));
  v23 = +[CIDepthBlurEffect getDraftMode:](CIDepthBlurEffect, "getDraftMode:", -[CIPortraitBlurV2 inputDraftMode](self, "inputDraftMode"));
  -[CIImage extent](v22, "extent");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  -[NSNumber floatValue](self->inputAperture, "floatValue");
  v33 = v32;
  SDOFSimpleLensModelValue(CFSTR("defaultSimulatedAperture"), self->inputTuningParameters);
  v35 = 1.0;
  if (v33 > 0.0 && v34 > 0.0)
    v35 = v34 / v33;
  SDOFRenderingValue(CFSTR("maxBlur"), self->inputTuningParameters);
  v37 = v36;
  if (v29 <= v31)
    v38 = v31;
  else
    v38 = v29;
  v79 = v38;
  v92[0] = CFSTR("inputScale");
  *(float *)&v38 = v6;
  v93[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v38);
  v92[1] = CFSTR("inputApertureScaling");
  v93[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v35);
  v92[2] = CFSTR("inputDraftMode");
  v39 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v23);
  v92[3] = CFSTR("inputTuningParameters");
  inputTuningParameters = self->inputTuningParameters;
  v93[2] = v39;
  v93[3] = inputTuningParameters;
  v41 = -[CIImage imageByApplyingFilter:withInputParameters:](v22, "imageByApplyingFilter:withInputParameters:", CFSTR("CIHighlightRecovery"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, v92, 4));
  SDOFRenderingValue(CFSTR("preFilterRadius"), self->inputTuningParameters);
  if (v42 > 0.0)
  {
    SDOFRenderingValue(CFSTR("preFilterBlurStrength"), self->inputTuningParameters);
    if (v43 > 0.0 && (_DWORD)v23 != 1)
    {
      v90[0] = CFSTR("inputApertureScaling");
      v44 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v35);
      v45 = self->inputTuningParameters;
      v91[0] = v44;
      v91[1] = v45;
      v90[1] = CFSTR("inputTuningParameters");
      v90[2] = CFSTR("inputScale");
      *(float *)&v46 = v6;
      v91[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v46);
      v41 = -[CIImage imageByApplyingFilter:withInputParameters:](v41, "imageByApplyingFilter:withInputParameters:", CFSTR("CISparseRendererPreFiltering"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v90, 3));
    }
  }
  SDOFRenderingValue(CFSTR("alphaEpsilon"), self->inputTuningParameters);
  if (*(float *)&v47 == 1.0
    || (SDOFRenderingValue(CFSTR("alphaGain"), self->inputTuningParameters), *(float *)&v47 == 0.0)
    || (v74 = self->inputMatteImage) == 0
    || (-[CIImage extent](v74, "extent"), v75 <= 1.0)
    || (-[CIImage extent](self->inputImage, "extent"), v76 <= 1.0))
  {
    inputMatteImage = 0;
  }
  else
  {
    inputMatteImage = self->inputMatteImage;
    -[CIImage extent](inputMatteImage, "extent");
    v97.origin.x = v25;
    v97.origin.y = v27;
    v97.size.width = v29;
    v97.size.height = v31;
    if (!CGRectEqualToRect(v96, v97))
    {
      -[CIImage extent](inputMatteImage, "extent");
      memset(&v81, 0, sizeof(v81));
      CGAffineTransformMakeScale(&v81, v29 / v77, v31 / v78);
      v80 = v81;
      inputMatteImage = -[CIImage imageByApplyingTransform:](inputMatteImage, "imageByApplyingTransform:", &v80);
    }
  }
  v89[0] = v41;
  v88[0] = CFSTR("inputImage");
  v88[1] = CFSTR("inputScale");
  *(float *)&v47 = v6;
  v89[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v47);
  v88[2] = CFSTR("inputApertureScaling");
  v49 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v35);
  v50 = self->inputTuningParameters;
  v89[2] = v49;
  v89[3] = v50;
  v88[3] = CFSTR("inputTuningParameters");
  v88[4] = CFSTR("inputDraftMode");
  v51 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v23);
  v88[5] = CFSTR("inputAperture");
  inputAperture = self->inputAperture;
  v89[4] = v51;
  v89[5] = inputAperture;
  v53 = +[CIFilter filterWithName:withInputParameters:](CIFilter, "filterWithName:withInputParameters:", CFSTR("CISparseRenderer"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, v88, 6));
  v54 = v53;
  if (inputMatteImage)
    -[CIFilter setValue:forKey:](v53, "setValue:forKey:", inputMatteImage, CFSTR("inputMatteImage"));
  v55 = -[CIFilter outputImage](v54, "outputImage");
  SDOFRenderingValue(CFSTR("antiAliasBlurStrength"), self->inputTuningParameters);
  v57 = v56;
  -[NSNumber floatValue](self->inputLumaNoiseScale, "floatValue");
  v59 = v58;
  v60 = nRingsFromTuningParameters(self->inputTuningParameters, v6, v23, self->inputAperture);
  if ((_DWORD)v23 != 1)
  {
    v61 = v60;
    v62 = v79 * v37;
    -[CIPortraitBlurV2 effectiveScale](self, "effectiveScale");
    v64 = v63;
    v86[0] = CFSTR("inputMaxBlurInPixels");
    *(float *)&v63 = (float)(v57 * v62) / (float)v61;
    v87[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v63);
    v86[1] = CFSTR("inputAntiAliasRadius");
    v65 = (void *)MEMORY[0x1E0CB37E8];
    SDOFRenderingValue(CFSTR("antiAliasRadius"), self->inputTuningParameters);
    v87[1] = objc_msgSend(v65, "numberWithFloat:");
    v86[2] = CFSTR("inputLumaNoiseAmpl");
    LODWORD(v66) = v59;
    v87[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v66);
    v86[3] = CFSTR("inputLumaNoiseModelCoeff");
    v67 = (void *)MEMORY[0x1E0CB37E8];
    SDOFRenderingValue(CFSTR("lumaNoiseModelCoeff"), self->inputTuningParameters);
    v87[3] = objc_msgSend(v67, "numberWithFloat:");
    v86[4] = CFSTR("inputScale");
    *(float *)&v68 = v64;
    v87[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v68);
    v86[5] = CFSTR("inputRect");
    v87[5] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v25, v27, v29, v31);
    v86[6] = CFSTR("inputSensorSize");
    v87[6] = -[CIPortraitBlurV2 sensorSize](self, "sensorSize");
    v55 = -[CIImage imageByApplyingFilter:withInputParameters:](v55, "imageByApplyingFilter:withInputParameters:", CFSTR("CIPortraitAntialias"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, v86, 7));
  }
  v69 = -[CIImage imageByCroppingToRect:](v55, "imageByCroppingToRect:", v25, v27, v29, v31);
  v70 = self->inputImage;
  v84[0] = CFSTR("inputImage");
  v84[1] = CFSTR("inputBlurImage");
  v85[0] = v70;
  v85[1] = v69;
  v84[2] = CFSTR("inputTuningParameters");
  v85[2] = self->inputTuningParameters;
  v71 = +[CIFilter filterWithName:withInputParameters:](CIFilter, "filterWithName:withInputParameters:", CFSTR("CIPortraitBlurCombiner"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 3));
  v72 = v71;
  if (inputMatteImage)
    -[CIFilter setValue:forKey:](v71, "setValue:forKey:", inputMatteImage, CFSTR("inputMatteImage"));
  return -[CIFilter outputImage](v72, "outputImage");
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
  return (CIImage *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputMatteImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (CIImage)inputBlurmapImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputBlurmapImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSNumber)inputLumaNoiseScale
{
  return self->inputLumaNoiseScale;
}

- (void)setInputLumaNoiseScale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)inputAperture
{
  return self->inputAperture;
}

- (void)setInputAperture:(id)a3
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

- (NSString)inputShape
{
  return self->inputShape;
}

- (void)setInputShape:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (NSNumber)inputDraftMode
{
  return self->inputDraftMode;
}

- (void)setInputDraftMode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

@end

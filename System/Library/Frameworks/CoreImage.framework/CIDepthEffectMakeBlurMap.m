@implementation CIDepthEffectMakeBlurMap

+ (id)customAttributes
{
  _QWORD v3[4];
  _QWORD v4[4];
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  _QWORD v9[4];
  _QWORD v10[4];
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[6];
  _QWORD v14[6];
  _QWORD v15[6];
  _QWORD v16[6];
  _QWORD v17[6];
  _QWORD v18[6];
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD v21[6];
  _QWORD v22[6];
  _QWORD v23[5];
  _QWORD v24[13];
  _QWORD v25[15];

  v25[13] = *MEMORY[0x1E0C80C00];
  v24[0] = CFSTR("CIAttributeFilterCategories");
  v23[0] = CFSTR("CICategoryColorAdjustment");
  v23[1] = CFSTR("CICategoryVideo");
  v23[2] = CFSTR("CICategoryStillImage");
  v23[3] = CFSTR("CICategoryBuiltIn");
  v23[4] = CFSTR("CICategoryApplePrivate");
  v25[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 5);
  v25[1] = CFSTR("11");
  v24[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v24[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v25[2] = CFSTR("10.13");
  v24[3] = CFSTR("inputAperture");
  v21[0] = CFSTR("CIAttributeSliderMin");
  v21[1] = CFSTR("CIAttributeSliderMax");
  v22[0] = &unk_1E2F1B260;
  v22[1] = &unk_1E2F1B270;
  v21[2] = CFSTR("CIAttributeMin");
  v21[3] = CFSTR("CIAttributeMax");
  v22[2] = &unk_1E2F1B250;
  v22[3] = &unk_1E2F1B270;
  v21[4] = CFSTR("CIAttributeDefault");
  v21[5] = CFSTR("CIAttributeType");
  v22[4] = &unk_1E2F1B250;
  v22[5] = CFSTR("CIAttributeTypeScalar");
  v25[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 6);
  v24[4] = CFSTR("inputLeftEyePosition");
  v19[0] = CFSTR("CIAttributeSliderMin");
  v19[1] = CFSTR("CIAttributeSliderMax");
  v20[0] = &unk_1E2F1B250;
  v20[1] = &unk_1E2F1B260;
  v19[2] = CFSTR("CIAttributeMin");
  v19[3] = CFSTR("CIAttributeMax");
  v20[2] = &unk_1E2F1B250;
  v20[3] = &unk_1E2F1B260;
  v19[4] = CFSTR("CIAttributeDefault");
  v19[5] = CFSTR("CIAttributeType");
  v20[4] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", -1.0, -1.0);
  v20[5] = CFSTR("CIAttributeTypePosition");
  v25[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
  v24[5] = CFSTR("inputRightEyePosition");
  v17[0] = CFSTR("CIAttributeSliderMin");
  v17[1] = CFSTR("CIAttributeSliderMax");
  v18[0] = &unk_1E2F1B250;
  v18[1] = &unk_1E2F1B260;
  v17[2] = CFSTR("CIAttributeMin");
  v17[3] = CFSTR("CIAttributeMax");
  v18[2] = &unk_1E2F1B250;
  v18[3] = &unk_1E2F1B260;
  v17[4] = CFSTR("CIAttributeDefault");
  v17[5] = CFSTR("CIAttributeType");
  v18[4] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", -1.0, -1.0);
  v18[5] = CFSTR("CIAttributeTypePosition");
  v25[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 6);
  v24[6] = CFSTR("inputChinPosition");
  v15[0] = CFSTR("CIAttributeSliderMin");
  v15[1] = CFSTR("CIAttributeSliderMax");
  v16[0] = &unk_1E2F1B250;
  v16[1] = &unk_1E2F1B260;
  v15[2] = CFSTR("CIAttributeMin");
  v15[3] = CFSTR("CIAttributeMax");
  v16[2] = &unk_1E2F1B250;
  v16[3] = &unk_1E2F1B260;
  v15[4] = CFSTR("CIAttributeDefault");
  v15[5] = CFSTR("CIAttributeType");
  v16[4] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", -1.0, -1.0);
  v16[5] = CFSTR("CIAttributeTypePosition");
  v25[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 6);
  v24[7] = CFSTR("inputFaceMidPoint");
  v13[0] = CFSTR("CIAttributeSliderMin");
  v13[1] = CFSTR("CIAttributeSliderMax");
  v14[0] = &unk_1E2F1B250;
  v14[1] = &unk_1E2F1B260;
  v13[2] = CFSTR("CIAttributeMin");
  v13[3] = CFSTR("CIAttributeMax");
  v14[2] = &unk_1E2F1B250;
  v14[3] = &unk_1E2F1B260;
  v13[4] = CFSTR("CIAttributeDefault");
  v13[5] = CFSTR("CIAttributeType");
  v14[4] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", -1.0, -1.0);
  v14[5] = CFSTR("CIAttributeTypePosition");
  v25[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
  v24[8] = CFSTR("inputFocusRect");
  v12[0] = CFSTR("CIAttributeTypeRectangle");
  v11[0] = CFSTR("CIAttributeType");
  v11[1] = CFSTR("CIAttributeDefault");
  v12[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.45, 0.45, 0.1, 0.1);
  v11[2] = CFSTR("CIAttributeIdentity");
  v12[2] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", *MEMORY[0x1E0C9D5E0], *(double *)(MEMORY[0x1E0C9D5E0] + 8), *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
  v25[8] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v24[9] = CFSTR("inputScale");
  v9[0] = CFSTR("CIAttributeType");
  v9[1] = CFSTR("CIAttributeSliderMin");
  v10[0] = CFSTR("CIAttributeTypeScalar");
  v10[1] = &unk_1E2F1B280;
  v9[2] = CFSTR("CIAttributeSliderMax");
  v9[3] = CFSTR("CIAttributeDefault");
  v10[2] = &unk_1E2F1B260;
  v10[3] = &unk_1E2F1B260;
  v25[9] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v24[10] = CFSTR("inputCalibrationData");
  v7 = CFSTR("CIAttributeClass");
  v8 = CFSTR("AVCameraCalibrationData");
  v25[10] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v24[11] = CFSTR("inputAuxDataMetadata");
  v5 = CFSTR("CIAttributeClass");
  v6 = CFSTR("CGImageMetadataRef");
  v25[11] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1);
  v24[12] = CFSTR("inputDraftMode");
  v3[0] = CFSTR("CIAttributeType");
  v3[1] = CFSTR("CIAttributeSliderMin");
  v4[0] = CFSTR("CIAttributeTypeInteger");
  v4[1] = &unk_1E2F1BFB0;
  v3[2] = CFSTR("CIAttributeSliderMax");
  v3[3] = CFSTR("CIAttributeDefault");
  v4[2] = &unk_1E2F1BFC8;
  v4[3] = &unk_1E2F1BFB0;
  v25[12] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 13);
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  objc_super v7;

  if ((objc_msgSend(a4, "isEqualToString:", CFSTR("inputOriginalSize")) & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)CIDepthEffectMakeBlurMap;
    -[CIFilter setValue:forUndefinedKey:](&v7, sel_setValue_forUndefinedKey_, a3, a4);
  }
}

- (id)calibrationData
{
  AVDepthData *v3;
  const char *v4;

  if (self->inputCalibrationData)
    return self->inputCalibrationData;
  v3 = -[CIImage depthData](self->inputShiftmapImage, "depthData");
  return AVFDepthCameraCalibrationData(v3, v4);
}

- (CGSize)originalShiftMapSize
{
  id v3;
  double v4;
  double v5;
  AVDepthData *v7;
  const char *v8;
  void *v9;
  BOOL v10;
  CGSize result;

  v3 = -[CIDepthEffectMakeBlurMap calibrationData](self, "calibrationData");
  if (!v3)
    goto LABEL_10;
  v4 = AVCameraCalibrationDataIntrinsicMatrixReferenceDimensions(v3);
  if (v4 == 4224.0 && v5 == 3024.0)
  {
    v4 = 4032.0;
    v5 = 3024.0;
    goto LABEL_18;
  }
  if (v4 == *MEMORY[0x1E0C9D820] && v5 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
LABEL_10:
    v7 = -[CIImage depthData](self->inputShiftmapImage, "depthData");
    if (!v7
      || (v9 = AVFDepthCameraCalibrationData(v7, v8)) == 0
      || ((v4 = AVCameraCalibrationDataIntrinsicMatrixReferenceDimensions(v9), v4 == *MEMORY[0x1E0C9D820])
        ? (v10 = v5 == *(double *)(MEMORY[0x1E0C9D820] + 8))
        : (v10 = 0),
          v10))
    {
      v5 = 3024.0;
      v4 = 4032.0;
    }
  }
LABEL_18:
  result.height = v5;
  result.width = v4;
  return result;
}

- (float)intrinsicMatrixFocalLength
{
  id v2;
  double v3;

  v2 = -[CIDepthEffectMakeBlurMap calibrationData](self, "calibrationData");
  if (v2)
    v3 = AVCameraCalibrationDataIntrinsicMatrix(v2);
  else
    LODWORD(v3) = 1171144704;
  return *(float *)&v3;
}

- (id)upsampledShiftMap:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  double v12;
  float v13;
  void *v15;
  double v16;
  double v17;
  _QWORD v19[4];
  _QWORD v20[5];
  CGRect v21;

  v20[4] = *MEMORY[0x1E0C80C00];
  -[CIDepthEffectMakeBlurMap originalShiftMapSize](self, "originalShiftMapSize");
  v5 = v4;
  v7 = v6;
  objc_msgSend(a3, "extent");
  v8 = v5 * 0.5;
  v9 = v7 * 0.5;
  v11 = v8 / v10;
  v13 = v9 / v12;
  if (v11 > 1.0 || v13 > 1.0)
  {
    v15 = (void *)objc_msgSend(a3, "imageByClampingToExtent");
    v19[0] = CFSTR("inputScale");
    *(float *)&v16 = v13;
    v20[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
    v19[1] = CFSTR("inputAspectRatio");
    *(float *)&v17 = v11 / v13;
    v20[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
    v20[2] = &unk_1E2F1B250;
    v19[2] = CFSTR("inputB");
    v19[3] = CFSTR("inputC");
    v20[3] = &unk_1E2F1B290;
    a3 = (id)objc_msgSend(v15, "imageByApplyingFilter:withInputParameters:", CFSTR("CIBicubicScaleTransform"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4));
  }
  objc_msgSend(a3, "extent");
  if (CGRectIsInfinite(v21))
    return (id)objc_msgSend(a3, "imageByCroppingToRect:", 0.0, 0.0, v8, v9);
  return a3;
}

- (id)lensModelParams:(id)a3
{
  uint64_t v5;
  CIVector *v6;
  CIVector *inputFocusRect;
  int v8;
  int v9;
  double v10;
  double v11;
  uint64_t v12;
  NSDictionary *tuningParameters;
  NSDictionary *v14;
  _QWORD v16[6];
  _QWORD v17[6];
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v18 = CFSTR("inputExtent");
  objc_msgSend(a3, "extent");
  v19[0] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  v5 = objc_msgSend(a3, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaMinMaxRed"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1));
  -[CIDepthEffectMakeBlurMap originalShiftMapSize](self, "originalShiftMapSize");
  v6 = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:");
  inputFocusRect = self->inputFocusRect;
  -[CIDepthEffectMakeBlurMap intrinsicMatrixFocalLength](self, "intrinsicMatrixFocalLength");
  v9 = v8;
  v16[0] = CFSTR("inputMinMaxImage");
  v16[1] = CFSTR("inputOriginalSize");
  v17[0] = v5;
  v17[1] = v6;
  v17[2] = inputFocusRect;
  v16[2] = CFSTR("inputFocusRect");
  v16[3] = CFSTR("inputSimulatedAperture");
  *(float *)&v10 = self->simulatedAperture;
  v17[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  v16[4] = CFSTR("inputIntrinsicMatrixFocalLength");
  LODWORD(v11) = v9;
  v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  tuningParameters = self->tuningParameters;
  v16[5] = CFSTR("inputTuningParameters");
  if (tuningParameters)
    v14 = tuningParameters;
  else
    v14 = (NSDictionary *)MEMORY[0x1E0C9AA70];
  v17[4] = v12;
  v17[5] = v14;
  return (id)objc_msgSend(a3, "imageByApplyingFilter:withInputParameters:", CFSTR("CILensModelCalculator"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 6));
}

- (id)lensModelApply:(id)a3 shiftMap:(id)a4
{
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("inputLensModelParams");
  v7[0] = objc_msgSend(a3, "imageByClampingToExtent");
  return (id)objc_msgSend(a4, "imageByApplyingFilter:withInputParameters:", CFSTR("CILensModelApply"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1));
}

- (BOOL)needToRunFaceMask
{
  unint64_t v3;
  BOOL v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v11[0] = -[CIDepthEffectMakeBlurMap inputLeftEyePosition](self, "inputLeftEyePosition");
  v11[1] = -[CIDepthEffectMakeBlurMap inputRightEyePosition](self, "inputRightEyePosition");
  v11[2] = -[CIDepthEffectMakeBlurMap inputFaceMidPoint](self, "inputFaceMidPoint");
  v3 = 0;
  v11[3] = -[CIDepthEffectMakeBlurMap inputChinPosition](self, "inputChinPosition");
  v4 = 1;
  while (1)
  {
    v5 = (void *)v11[v3];
    v6 = objc_msgSend(v5, "count");
    if (v6)
      break;
LABEL_6:
    v4 = v3++ < 3;
    if (v3 == 4)
      return 0;
  }
  v7 = v6;
  v8 = 0;
  while (1)
  {
    objc_msgSend(v5, "valueAtIndex:", v8);
    if (fabs(v9 + 1.0) > 0.01)
      return v4;
    if (v7 == ++v8)
      goto LABEL_6;
  }
}

- (id)faceMaskParams:(id)a3 useNormalizedCoords:(BOOL)a4
{
  float simulatedAperture;
  double v8;
  float v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSDictionary *tuningParameters;
  NSDictionary *v32;
  uint64_t v33;
  _QWORD v35[20];
  _QWORD v36[21];

  v36[20] = *MEMORY[0x1E0C80C00];
  SDOFSimpleLensModelValue(CFSTR("defaultSimulatedAperture"), self->tuningParameters);
  simulatedAperture = self->simulatedAperture;
  v8 = 1.0;
  v10 = v9 <= 0.0;
  v11 = v9 / simulatedAperture;
  if (v10)
    v11 = 1.0;
  if (simulatedAperture > 0.0)
    v12 = v11;
  else
    v12 = 1.0;
  v13 = 1.0;
  if (!a4)
  {
    objc_msgSend(a3, "extent", v11);
    v8 = v14;
    objc_msgSend(a3, "extent");
    v13 = v15;
  }
  v16 = -[NSDictionary objectForKeyedSubscript:](self->tuningParameters, "objectForKeyedSubscript:", CFSTR("Version"), v11);
  v17 = (void *)MEMORY[0x1E0CB37E8];
  if (v16)
    v18 = objc_msgSend(v16, "unsignedIntegerValue");
  else
    v18 = 1;
  v19 = (void *)objc_msgSend(v17, "numberWithUnsignedInteger:", v18);
  v35[0] = CFSTR("inputFacesLeftEyeX");
  v36[0] = transformNormalizedMetalToCI(self->inputLeftEyePosition, 0, v8);
  v35[1] = CFSTR("inputFacesLeftEyeY");
  v36[1] = transformNormalizedMetalToCI(self->inputLeftEyePosition, 1u, v13);
  v35[2] = CFSTR("inputFacesCenterX");
  v36[2] = transformNormalizedMetalToCI(self->inputFaceMidPoint, 0, v8);
  v35[3] = CFSTR("inputFacesCenterY");
  v36[3] = transformNormalizedMetalToCI(self->inputFaceMidPoint, 1u, v13);
  v35[4] = CFSTR("inputFacesRightEyeX");
  v36[4] = transformNormalizedMetalToCI(self->inputRightEyePosition, 0, v8);
  v35[5] = CFSTR("inputFacesRightEyeY");
  v36[5] = transformNormalizedMetalToCI(self->inputRightEyePosition, 1u, v13);
  v35[6] = CFSTR("inputFacesChinX");
  v36[6] = transformNormalizedMetalToCI(self->inputChinPosition, 0, v8);
  v35[7] = CFSTR("inputFacesChinY");
  v36[7] = transformNormalizedMetalToCI(self->inputChinPosition, 1u, v13);
  v35[8] = CFSTR("inputMaxBlur");
  v20 = (void *)MEMORY[0x1E0CB37E8];
  SDOFRenderingValue(CFSTR("maxBlur"), self->tuningParameters);
  v36[8] = objc_msgSend(v20, "numberWithFloat:");
  v35[9] = CFSTR("inputFacesMaxBlurOnEyes");
  v21 = (void *)MEMORY[0x1E0CB37E8];
  SDOFFaceMaskValue((uint64_t)CFSTR("maxBlurOnEyes"), self->tuningParameters);
  v36[9] = objc_msgSend(v21, "numberWithFloat:");
  v35[10] = CFSTR("inputFacesMaxBlurDistFromFocus");
  v22 = (void *)MEMORY[0x1E0CB37E8];
  SDOFFaceMaskValue((uint64_t)CFSTR("maxBlurDistFromFocus"), self->tuningParameters);
  v36[10] = objc_msgSend(v22, "numberWithFloat:");
  v35[11] = CFSTR("inputFacesEyeToEyebrowRatio");
  v23 = (void *)MEMORY[0x1E0CB37E8];
  SDOFFaceMaskValue((uint64_t)CFSTR("eyeToEyebrowRatio"), self->tuningParameters);
  v36[11] = objc_msgSend(v23, "numberWithFloat:");
  v35[12] = CFSTR("inputFacesLinearBlurGrowthM");
  v24 = (void *)MEMORY[0x1E0CB37E8];
  SDOFFaceMaskValue((uint64_t)CFSTR("linearBlurGrowthM"), self->tuningParameters);
  v36[12] = objc_msgSend(v24, "numberWithFloat:");
  v35[13] = CFSTR("inputFacesLinearBlurGrowthC");
  v25 = (void *)MEMORY[0x1E0CB37E8];
  SDOFFaceMaskValue((uint64_t)CFSTR("linearBlurGrowthC"), self->tuningParameters);
  v36[13] = objc_msgSend(v25, "numberWithFloat:");
  v35[14] = CFSTR("inputFacesDistToBlurScaling");
  v26 = (void *)MEMORY[0x1E0CB37E8];
  SDOFFaceMaskValue((uint64_t)CFSTR("distToBlurScaling"), self->tuningParameters);
  v36[14] = objc_msgSend(v26, "numberWithFloat:");
  v35[15] = CFSTR("inputFacesCapMultip");
  v27 = (void *)MEMORY[0x1E0CB37E8];
  SDOFFaceMaskValue((uint64_t)CFSTR("capMultip"), self->tuningParameters);
  v36[15] = objc_msgSend(v27, "numberWithFloat:");
  v35[16] = CFSTR("inputFacesGainMultip");
  v28 = (void *)MEMORY[0x1E0CB37E8];
  SDOFFaceMaskValue((uint64_t)CFSTR("gainMultip"), self->tuningParameters);
  v36[16] = objc_msgSend(v28, "numberWithFloat:");
  v35[17] = CFSTR("inputApertureScaling");
  v29 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
  v30 = &unk_1E2F1BFE0;
  if (v19)
    v30 = v19;
  v36[17] = v29;
  v36[18] = v30;
  tuningParameters = self->tuningParameters;
  v35[18] = CFSTR("__inputVersion");
  v35[19] = CFSTR("inputTuningParameters");
  if (tuningParameters)
    v32 = tuningParameters;
  else
    v32 = (NSDictionary *)MEMORY[0x1E0C9AA70];
  v36[19] = v32;
  v33 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 20);
  if (objc_msgSend(v19, "integerValue") < 3)
    return (id)objc_msgSend(a3, "imageByApplyingFilter:withInputParameters:", CFSTR("CIFaceMaskCalculator"), v33);
  else
    return (id)objc_msgSend(a3, "metalImageByApplyingFilter:withInputParameters:", CFSTR("CIFaceMaskCalculator"), v33);
}

- (id)faceMaskApply:(id)a3 blurMap:(id)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  CIVector *v11;
  NSDictionary *tuningParameters;
  _QWORD v14[6];
  _QWORD v15[7];

  v15[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "extent");
  v8 = v7;
  objc_msgSend(a4, "extent");
  v10 = v9;
  v15[0] = a3;
  v14[0] = CFSTR("inputParameterImage");
  v14[1] = CFSTR("inputFacesCenterX");
  v15[1] = transformNormalizedMetalToCI(self->inputFaceMidPoint, 0, v8);
  v14[2] = CFSTR("inputFacesCenterY");
  v15[2] = transformNormalizedMetalToCI(self->inputFaceMidPoint, 1u, v10);
  v14[3] = CFSTR("inputFacesChinX");
  v15[3] = transformNormalizedMetalToCI(self->inputChinPosition, 0, v8);
  v14[4] = CFSTR("inputFacesChinY");
  v11 = transformNormalizedMetalToCI(self->inputChinPosition, 1u, v10);
  v14[5] = CFSTR("inputTuningParameters");
  tuningParameters = self->tuningParameters;
  if (!tuningParameters)
    tuningParameters = (NSDictionary *)MEMORY[0x1E0C9AA70];
  v15[4] = v11;
  v15[5] = tuningParameters;
  return (id)objc_msgSend(a4, "imageByApplyingFilter:withInputParameters:", CFSTR("CIFaceMaskApply"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 6));
}

- (id)faceMaskDelta:(id)a3 extent:(CGRect)a4 parameters:(id)a5 distanceToAdd:(float *)a6
{
  uint64_t v9;
  NSDictionary *tuningParameters;
  uint64_t v11;
  int v12;
  _QWORD v14[21];
  _QWORD v15[22];

  v15[21] = *MEMORY[0x1E0C80C00];
  v15[0] = a3;
  v14[0] = CFSTR("inputParameterImage");
  v14[1] = CFSTR("inputImageSize");
  v15[1] = +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", a4.size.width, a4.size.height);
  v14[2] = CFSTR("inputFacesCenterX");
  v15[2] = transformNormalizedMetalToCI(self->inputFaceMidPoint, 0, 1.0);
  v14[3] = CFSTR("inputFacesCenterY");
  v15[3] = transformNormalizedMetalToCI(self->inputFaceMidPoint, 1u, 1.0);
  v14[4] = CFSTR("inputFacesChinX");
  v15[4] = transformNormalizedMetalToCI(self->inputChinPosition, 0, 1.0);
  v14[5] = CFSTR("inputFacesChinY");
  v15[5] = transformNormalizedMetalToCI(self->inputChinPosition, 1u, 1.0);
  v14[6] = CFSTR("inputFacesLeftEyeX");
  v15[6] = transformNormalizedMetalToCI(self->inputLeftEyePosition, 0, 1.0);
  v14[7] = CFSTR("inputFacesLeftEyeY");
  v15[7] = transformNormalizedMetalToCI(self->inputLeftEyePosition, 1u, 1.0);
  v14[8] = CFSTR("inputFacesRightEyeX");
  v15[8] = transformNormalizedMetalToCI(self->inputRightEyePosition, 0, 1.0);
  v14[9] = CFSTR("inputFacesRightEyeY");
  v15[9] = transformNormalizedMetalToCI(self->inputRightEyePosition, 1u, 1.0);
  v14[10] = CFSTR("inputDistanceAdd");
  v15[10] = objc_msgSend(a5, "objectForKeyedSubscript:");
  v14[11] = CFSTR("inputAdditiveMaxBlur");
  v15[11] = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("inputFaceMaskAdditiveMaxBlur"));
  v14[12] = CFSTR("inputSubtractiveMaxBlur");
  v15[12] = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("inputFaceMaskSubtractiveMaxBlur"));
  v14[13] = CFSTR("inputApertureScaling");
  v15[13] = objc_msgSend(a5, "objectForKeyedSubscript:");
  v14[14] = CFSTR("inputMaxBlur");
  v15[14] = objc_msgSend(a5, "objectForKeyedSubscript:");
  v14[15] = CFSTR("inputSubjectDistanceMinimumFocusDistance");
  v15[15] = objc_msgSend(a5, "objectForKeyedSubscript:");
  v14[16] = CFSTR("inputSubjectDistanceMaximumFocusDistance");
  v15[16] = objc_msgSend(a5, "objectForKeyedSubscript:");
  v14[17] = CFSTR("inputSubjectDistanceScalingFactor");
  v15[17] = objc_msgSend(a5, "objectForKeyedSubscript:");
  v14[18] = CFSTR("inputSubjectDistanceOffset");
  v9 = objc_msgSend(a5, "objectForKeyedSubscript:");
  tuningParameters = self->tuningParameters;
  if (!tuningParameters)
    tuningParameters = (NSDictionary *)MEMORY[0x1E0C9AA70];
  v15[18] = v9;
  v15[19] = tuningParameters;
  v14[19] = CFSTR("inputTuningParameters");
  v14[20] = CFSTR("inputFocusRect");
  v15[20] = self->inputFocusRect;
  v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 21);
  -[CIFilter distanceToAdd](+[CIFilter filterWithName:withInputParameters:](CIFilter, "filterWithName:withInputParameters:", CFSTR("CIFaceMaskDelta"), v11), "distanceToAdd");
  *(_DWORD *)a6 = v12;
  return (id)objc_msgSend(+[CIFilter metalFilterWithName:withInputParameters:](CIFilter, "metalFilterWithName:withInputParameters:", CFSTR("CIFaceMaskDelta"), v11), "outputImage");
}

- (id)smoothShiftMapV2:(id)a3
{
  id v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = -[CIDepthEffectMakeBlurMap upsampledShiftMap:](self, "upsampledShiftMap:", a3);
  SDOFDisparitySmoothingParameterValue(CFSTR("nIterations"), self->tuningParameters);
  v6 = CFSTR("inputNumIterations");
  v7[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
  return (id)objc_msgSend(v4, "imageByApplyingFilter:withInputParameters:", CFSTR("CIDisparitySmoothing"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1));
}

- (id)blurMapV2:(id)a3
{
  id v4;
  id v5;

  v4 = -[CIDepthEffectMakeBlurMap smoothShiftMapV2:](self, "smoothShiftMapV2:", a3);
  v5 = -[CIDepthEffectMakeBlurMap lensModelApply:shiftMap:](self, "lensModelApply:shiftMap:", -[CIDepthEffectMakeBlurMap lensModelParams:](self, "lensModelParams:", v4), v4);
  if (-[CIDepthEffectMakeBlurMap needToRunFaceMask](self, "needToRunFaceMask"))
    return -[CIDepthEffectMakeBlurMap faceMaskApply:blurMap:](self, "faceMaskApply:blurMap:", -[CIDepthEffectMakeBlurMap faceMaskParams:useNormalizedCoords:](self, "faceMaskParams:useNormalizedCoords:", v5, 0), v5);
  else
    return v5;
}

- (id)refineShiftMapV3WithMainImage:(id)a3 shiftmap:(id)a4 lensModel:(id)a5
{
  double v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CIImage *inputMatteImage;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  NSDictionary *tuningParameters;
  id v26;
  void *v27;
  CIImage *v28;
  CIVector *inputFocusRect;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  NSObject *v38;
  uint64_t v39;
  CIImage *v40;
  double v41;
  double v42;
  double v43;
  _QWORD v44[4];
  _QWORD v45[4];
  _QWORD v46[6];
  _QWORD v47[6];
  _QWORD v48[8];
  _QWORD v49[8];
  _QWORD v50[9];
  _QWORD v51[10];

  v51[9] = *MEMORY[0x1E0C80C00];
  SDOFDisparityRefinementParameterValue(CFSTR("Version"), self->tuningParameters);
  v10 = *(float *)&v9;
  if (!(_DWORD)v10)
    goto LABEL_10;
  if (v10 >= 5)
  {
    v11 = ci_logger_api();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CIDepthEffectMakeBlurMap refineShiftMapV3WithMainImage:shiftmap:lensModel:].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);
  }
  if (self->inputMatteImage)
  {
    if (-[CIDepthEffectMakeBlurMap refineShiftMapV3WithMainImage:shiftmap:lensModel:]::onceToken != -1)
      dispatch_once(&-[CIDepthEffectMakeBlurMap refineShiftMapV3WithMainImage:shiftmap:lensModel:]::onceToken, &__block_literal_global_381);
    inputMatteImage = self->inputMatteImage;
    if (-[CIDepthEffectMakeBlurMap refineShiftMapV3WithMainImage:shiftmap:lensModel:]::useNativeFocalPlane)
    {
      v48[0] = CFSTR("inputMatteImage");
      v48[1] = CFSTR("inputLensModelCalculatorImage");
      v49[0] = inputMatteImage;
      v49[1] = a5;
      v48[2] = CFSTR("inputAlphaThreshold");
      LODWORD(v9) = 1063675494;
      v49[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
      v48[3] = CFSTR("inputAmplitude");
      LODWORD(v19) = 1067030938;
      v49[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
      v48[4] = CFSTR("inputExponent");
      LODWORD(v20) = 2.0;
      v49[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
      v48[5] = CFSTR("inputGamma");
      LODWORD(v21) = 1053609165;
      v49[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
      v48[6] = CFSTR("inputMinFactor");
      LODWORD(v22) = 1036831949;
      v49[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
      v48[7] = CFSTR("inputMaxFactor");
      LODWORD(v23) = 1.0;
      v49[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
      v24 = objc_msgSend(a4, "imageByApplyingFilter:withInputParameters:", CFSTR("CIFocalPlaneNative"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 8));
    }
    else
    {
      v50[0] = CFSTR("inputMatteImage");
      v50[1] = CFSTR("inputFocusRect");
      inputFocusRect = self->inputFocusRect;
      v51[0] = inputMatteImage;
      v51[1] = inputFocusRect;
      v50[2] = CFSTR("inputZeroShiftPercentile");
      LODWORD(v9) = 0.75;
      v51[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
      v50[3] = CFSTR("inputAlphaThreshold");
      LODWORD(v31) = 1063675494;
      v51[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v31);
      v50[4] = CFSTR("inputAmplitude");
      LODWORD(v32) = 1067030938;
      v51[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32);
      v50[5] = CFSTR("inputExponent");
      LODWORD(v33) = 2.0;
      v51[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v33);
      v50[6] = CFSTR("inputGamma");
      LODWORD(v34) = 1053609165;
      v51[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34);
      v50[7] = CFSTR("inputMinFactor");
      LODWORD(v35) = 1036831949;
      v51[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v35);
      v50[8] = CFSTR("inputMaxFactor");
      LODWORD(v36) = 1.0;
      v51[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v36);
      v24 = objc_msgSend(a4, "metalImageByApplyingFilter:withInputParameters:", CFSTR("CIFocalPlane"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 9));
    }
    v37 = (id)v24;
    if (!v24)
    {
      v38 = ci_logger_api();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        -[CIDepthEffectMakeBlurMap refineShiftMapV3WithMainImage:shiftmap:lensModel:].cold.1();
      v37 = a4;
    }
    v39 = 0x32u >> (+[CIDepthBlurEffect getDraftMode:](CIDepthBlurEffect, "getDraftMode:", -[CIDepthEffectMakeBlurMap inputDraftMode](self, "inputDraftMode")) == 1);
    v46[0] = CFSTR("inputMainImage");
    v46[1] = CFSTR("inputPredicateImage");
    v40 = self->inputMatteImage;
    v47[0] = a3;
    v47[1] = v40;
    v46[2] = CFSTR("inputRadius");
    LODWORD(v41) = 2.0;
    v47[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v41);
    v46[3] = CFSTR("inputSubsampling");
    LODWORD(v42) = 8.0;
    v47[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v42);
    v46[4] = CFSTR("inputEPS");
    LODWORD(v43) = 953267991;
    v47[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v43);
    v46[5] = CFSTR("inputNumIterations");
    v47[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v39);
    return (id)objc_msgSend(v37, "metalImageByApplyingFilter:withInputParameters:", CFSTR("CIMattingSolver"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 6));
  }
  else
  {
LABEL_10:
    v44[0] = CFSTR("inputScale");
    v44[1] = CFSTR("inputMainImage");
    v45[0] = self->inputScale;
    v45[1] = a3;
    v44[2] = CFSTR("inputImage");
    v44[3] = CFSTR("inputTuningParameters");
    tuningParameters = self->tuningParameters;
    if (!tuningParameters)
      tuningParameters = (NSDictionary *)MEMORY[0x1E0C9AA70];
    v45[2] = a4;
    v45[3] = tuningParameters;
    v26 = +[CIFilter metalFilterWithName:withInputParameters:](CIFilter, "metalFilterWithName:withInputParameters:", CFSTR("CIDisparityRefinementV3"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 4));
    v27 = v26;
    v28 = self->inputMatteImage;
    if (v28)
      objc_msgSend(v26, "setValue:forKey:", v28, CFSTR("inputMatteImage"));
    return (id)objc_msgSend(v27, "outputImage");
  }
}

uint64_t __77__CIDepthEffectMakeBlurMap_refineShiftMapV3WithMainImage_shiftmap_lensModel___block_invoke()
{
  char *v0;
  uint64_t result;

  v0 = getenv("CI_NATIVE_FOCAL_PLANE");
  if (v0)
    result = atoi(v0);
  else
    result = -[CIDepthEffectMakeBlurMap refineShiftMapV3WithMainImage:shiftmap:lensModel:]::useNativeFocalPlane;
  -[CIDepthEffectMakeBlurMap refineShiftMapV3WithMainImage:shiftmap:lensModel:]::useNativeFocalPlane = (_DWORD)result != 0;
  return result;
}

- (id)blurMapV3:(id)a3 shiftmap:(id)a4 alphaImage:(id)a5
{
  id v9;
  id v10;
  float v11;
  double v12;
  float v13;
  double v14;
  float v15;
  CIVector *v16;
  float v17;
  double v18;
  float v19;
  double v20;
  float v21;
  CIVector *v22;
  float v23;
  float v24;
  float simulatedAperture;
  double v26;
  NSDictionary *tuningParameters;
  _QWORD v29[5];
  _QWORD v30[6];

  v30[5] = *MEMORY[0x1E0C80C00];
  v9 = -[CIDepthEffectMakeBlurMap lensModelParams:](self, "lensModelParams:", a4);
  v10 = -[CIDepthEffectMakeBlurMap lensModelApply:shiftMap:](self, "lensModelApply:shiftMap:", v9, -[CIDepthEffectMakeBlurMap refineShiftMapV3WithMainImage:shiftmap:lensModel:](self, "refineShiftMapV3WithMainImage:shiftmap:lensModel:", a3, a4, v9));
  if (-[CIDepthEffectMakeBlurMap needToRunFaceMask](self, "needToRunFaceMask"))
    v10 = -[CIDepthEffectMakeBlurMap faceMaskApply:blurMap:](self, "faceMaskApply:blurMap:", -[CIDepthEffectMakeBlurMap faceMaskParams:useNormalizedCoords:](self, "faceMaskParams:useNormalizedCoords:", v10, 0), v10);
  if (-[CIDepthEffectMakeBlurMap blurMapV3:shiftmap:alphaImage:]::onceToken == -1)
  {
    if (!a5)
      return v10;
  }
  else
  {
    dispatch_once(&-[CIDepthEffectMakeBlurMap blurMapV3:shiftmap:alphaImage:]::onceToken, &__block_literal_global_419);
    if (!a5)
      return v10;
  }
  if (!-[CIDepthEffectMakeBlurMap blurMapV3:shiftmap:alphaImage:]::disableSegmentationFusion)
  {
    SDOFFusionValue(CFSTR("additiveLowerAlpha"), self->tuningParameters);
    v12 = v11;
    SDOFFusionValue(CFSTR("additiveUpperAlpha"), self->tuningParameters);
    v14 = v13;
    SDOFFusionValue(CFSTR("additiveMaxBlur"), self->tuningParameters);
    v16 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v12, v14, v15);
    SDOFFusionValue(CFSTR("subtractiveLowerAlpha"), self->tuningParameters);
    v18 = v17;
    SDOFFusionValue(CFSTR("subtractiveUpperAlpha"), self->tuningParameters);
    v20 = v19;
    SDOFFusionValue(CFSTR("subtractiveMaxBlur"), self->tuningParameters);
    v22 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v18, v20, v21);
    SDOFSimpleLensModelValue(CFSTR("defaultSimulatedAperture"), self->tuningParameters);
    v24 = v23;
    simulatedAperture = self->simulatedAperture;
    v26 = 1.0;
    if (simulatedAperture > 0.0 && v24 > 0.0)
      v26 = v24 / simulatedAperture;
    v29[0] = CFSTR("inputMatteImage");
    v29[1] = CFSTR("inputTuningParameters");
    tuningParameters = self->tuningParameters;
    v30[0] = a5;
    v30[1] = tuningParameters;
    v29[2] = CFSTR("inputAddBlur");
    v29[3] = CFSTR("inputRemoveBlur");
    v30[2] = v16;
    v30[3] = v22;
    v29[4] = CFSTR("inputApertureScaling");
    v30[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26);
    return (id)objc_msgSend(v10, "imageByApplyingFilter:withInputParameters:", CFSTR("CISegmentationFusion"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 5));
  }
  return v10;
}

uint64_t __58__CIDepthEffectMakeBlurMap_blurMapV3_shiftmap_alphaImage___block_invoke()
{
  char *v0;
  uint64_t result;

  v0 = getenv("CI_DISABLE_SEGMENTATION_FUSION");
  if (v0)
    result = atoi(v0);
  else
    result = -[CIDepthEffectMakeBlurMap blurMapV3:shiftmap:alphaImage:]::disableSegmentationFusion;
  -[CIDepthEffectMakeBlurMap blurMapV3:shiftmap:alphaImage:]::disableSegmentationFusion = (_DWORD)result != 0;
  return result;
}

- (id)blurMapV4:(id)a3 shiftmap:(id)a4 alphaImage:(id)a5 hairImage:(id)a6
{
  id v11;
  id v12;
  float v13;
  float simulatedAperture;
  float v15;
  double v16;
  float v17;
  double v18;
  float v19;
  float v20;
  double v21;
  float v22;
  double v23;
  float v24;
  CIVector *v25;
  float v26;
  double v27;
  float v28;
  double v29;
  float v30;
  CIVector *v31;
  float v32;
  double v33;
  float v34;
  double v35;
  float v36;
  CIVector *v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  float v45;
  float v46;
  int v47;
  int v48;
  int v49;
  float v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  float v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  float v75;
  float v76;
  float v77;
  float v78;
  id v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  int v92;
  double v93;
  double v94;
  CIVector *inputLeftEyePosition;
  CIVector *inputChinPosition;
  double v97;
  double v98;
  double v99;
  double v100;
  uint64_t v101;
  void *v102;
  void *v103;
  uint64_t v104;
  id v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  NSNumber *inputScale;
  double v112;
  CGFloat v113;
  double v114;
  CGFloat v115;
  double v116;
  CGFloat v117;
  double v118;
  CGFloat v119;
  CGFloat v120;
  CGFloat v121;
  CGFloat v122;
  CGFloat v123;
  void *v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  void *v149;
  void *v150;
  int v152;
  int v153;
  int v154;
  void *v155;
  int v156;
  int v157;
  int v158;
  float v159;
  int v160;
  int v161;
  int v162;
  int v163;
  int v164;
  int v165;
  int v166;
  unsigned int v167;
  int v168;
  int v169;
  int v170;
  int v171;
  int v172;
  int v173;
  int v174;
  int v175;
  int v176;
  int v177;
  int v178;
  id v179;
  float v180;
  int v181;
  int v182;
  id v183;
  int v184;
  int v185;
  CIVector *v186;
  double v187;
  int v188;
  _QWORD v189[40];
  _QWORD v190[40];
  _QWORD v191[27];
  _QWORD v192[27];
  _QWORD v193[3];
  _QWORD v194[5];
  CGRect v195;
  CGRect v196;

  v194[3] = *MEMORY[0x1E0C80C00];
  v11 = -[CIDepthEffectMakeBlurMap lensModelParams:](self, "lensModelParams:", a4);
  v193[0] = CFSTR("inputRVector");
  v194[0] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.349999994, 0.0, 0.0, 0.0);
  v193[1] = CFSTR("inputGVector");
  v194[1] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.349999994, 0.0, 0.0);
  v193[2] = CFSTR("inputBVector");
  v194[2] = +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.349999994, 0.0);
  v12 = -[CIDepthEffectMakeBlurMap lensModelApply:shiftMap:](self, "lensModelApply:shiftMap:", v11, -[CIDepthEffectMakeBlurMap refineShiftMapV3WithMainImage:shiftmap:lensModel:](self, "refineShiftMapV3WithMainImage:shiftmap:lensModel:", objc_msgSend(a3, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v194, v193, 3)), a4, v11));
  SDOFSimpleLensModelValue(CFSTR("defaultSimulatedAperture"), self->tuningParameters);
  simulatedAperture = self->simulatedAperture;
  v187 = 1.0;
  if (simulatedAperture > 0.0 && v13 > 0.0)
    v187 = v13 / simulatedAperture;
  if (-[CIDepthEffectMakeBlurMap needToRunFaceMask](self, "needToRunFaceMask"))
  {
    v183 = a6;
    v179 = -[CIDepthEffectMakeBlurMap faceMaskParams:useNormalizedCoords:](self, "faceMaskParams:useNormalizedCoords:", v12, 1);
    SDOFFusionValue(CFSTR("additiveLowerAlpha"), self->tuningParameters);
    v16 = v15;
    SDOFFusionValue(CFSTR("additiveUpperAlpha"), self->tuningParameters);
    v18 = v17;
    SDOFFusionValue(CFSTR("additiveMaxBlur"), self->tuningParameters);
    v186 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v16, v18, v19);
    SDOFFusionValue(CFSTR("subtractiveLowerAlpha"), self->tuningParameters);
    v21 = v20;
    SDOFFusionValue(CFSTR("subtractiveUpperAlpha"), self->tuningParameters);
    v23 = v22;
    SDOFFusionValue(CFSTR("subtractiveMaxBlur"), self->tuningParameters);
    v25 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v21, v23, v24);
    SDOFBlurMapRefinementValue(CFSTR("hairAdditiveLowerAlpha"), self->tuningParameters);
    v27 = v26;
    SDOFBlurMapRefinementValue(CFSTR("hairAdditiveUpperAlpha"), self->tuningParameters);
    v29 = v28;
    SDOFBlurMapRefinementValue(CFSTR("hairAdditiveMaxBlur"), self->tuningParameters);
    v31 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v27, v29, v30);
    SDOFBlurMapRefinementValue(CFSTR("hairSubtractiveLowerAlpha"), self->tuningParameters);
    v33 = v32;
    SDOFBlurMapRefinementValue(CFSTR("hairSubtractiveUpperAlpha"), self->tuningParameters);
    v35 = v34;
    SDOFBlurMapRefinementValue(CFSTR("hairSubtractiveMaxBlur"), self->tuningParameters);
    v37 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v33, v35, v36);
    SDOFBlurMapRefinementValue(CFSTR("faceMaskAdditiveMaxBlur"), self->tuningParameters);
    v181 = v38;
    SDOFBlurMapRefinementValue(CFSTR("faceMaskSubtractiveMaxBlur"), self->tuningParameters);
    v182 = v39;
    SDOFBlurMapRefinementValue(CFSTR("smoothstepMin"), self->tuningParameters);
    v41 = v40;
    SDOFBlurMapRefinementValue(CFSTR("smoothstepMax"), self->tuningParameters);
    v43 = v42;
    SDOFBlurMapRefinementValue(CFSTR("maxBlur"), self->tuningParameters);
    LODWORD(v33) = v44;
    SDOFBlurMapRefinementValue(CFSTR("personDistance"), self->tuningParameters);
    v46 = v45;
    SDOFBlurMapRefinementValue(CFSTR("personThreshold"), self->tuningParameters);
    v48 = v47;
    SDOFBlurMapRefinementValue(CFSTR("personMaxBlur"), self->tuningParameters);
    v185 = v49;
    SDOFBlurMapRefinementValue(CFSTR("hairDistance"), self->tuningParameters);
    v180 = v50;
    SDOFBlurMapRefinementValue(CFSTR("hairThreshold"), self->tuningParameters);
    v184 = v51;
    SDOFBlurMapRefinementValue(CFSTR("hairMaxBlur"), self->tuningParameters);
    v153 = v52;
    SDOFBlurMapRefinementValue(CFSTR("minimumFocusDistance"), self->tuningParameters);
    v157 = v53;
    SDOFBlurMapRefinementValue(CFSTR("maximumFocusDistance"), self->tuningParameters);
    v158 = v54;
    SDOFBlurMapRefinementValue(CFSTR("protectBodyStrength"), self->tuningParameters);
    LODWORD(v35) = v55;
    SDOFBlurMapRefinementValue(CFSTR("distanceAdd"), self->tuningParameters);
    v152 = v56;
    SDOFBlurMapRefinementValue(CFSTR("relativeApertureScalingStrength"), self->tuningParameters);
    v58 = v57;
    SDOFBlurMapRefinementValue(CFSTR("subjectDistanceScalingFactor"), self->tuningParameters);
    v154 = v59;
    SDOFBlurMapRefinementValue(CFSTR("subjectDistanceOffset"), self->tuningParameters);
    v156 = v60;
    SDOFBlurMapRefinementValue(CFSTR("eyeProtectionMaxFaces"), self->tuningParameters);
    v167 = (int)v61;
    SDOFBlurMapRefinementValue(CFSTR("eyeProtectionFaceWeightsSmoothStepMin"), self->tuningParameters);
    v168 = v62;
    SDOFBlurMapRefinementValue(CFSTR("eyeProtectionFaceWeightsSmoothStepMax"), self->tuningParameters);
    v169 = v63;
    SDOFBlurMapRefinementValue(CFSTR("eyeProtectionOvalDimsDistanceScale"), self->tuningParameters);
    v170 = v64;
    SDOFBlurMapRefinementValue(CFSTR("eyeProtectionOvalDimsDistanceOffset"), self->tuningParameters);
    v171 = v65;
    SDOFBlurMapRefinementValue(CFSTR("eyeProtectionOvalDimsRadiusHorizontal"), self->tuningParameters);
    v172 = v66;
    SDOFBlurMapRefinementValue(CFSTR("eyeProtectionOvalDimsRadiusVertical"), self->tuningParameters);
    v173 = v67;
    SDOFBlurMapRefinementValue(CFSTR("eyeProtectionOvalFallOffSmoothStepMin"), self->tuningParameters);
    v174 = v68;
    SDOFBlurMapRefinementValue(CFSTR("eyeProtectionOvalFallOffSmoothStepMax"), self->tuningParameters);
    v175 = v69;
    SDOFBlurMapRefinementValue(CFSTR("eyeProtectionPersonMaskSmoothStepMin"), self->tuningParameters);
    v176 = v70;
    SDOFBlurMapRefinementValue(CFSTR("eyeProtectionPersonMaskSmoothStepMax"), self->tuningParameters);
    v177 = v71;
    SDOFBlurMapRefinementValue(CFSTR("eyeProtectionPreventStrength"), self->tuningParameters);
    v178 = v72;
    SDOFBlurMapRefinementValue(CFSTR("eyeProtectionSubtractiveMaxBlur"), self->tuningParameters);
    v165 = v73;
    SDOFBlurMapRefinementValue(CFSTR("eyeProtectionSubtractiveApertureScaling"), self->tuningParameters);
    v166 = v74;
    -[NSNumber floatValue](self->inputScale, "floatValue");
    v76 = v46 * v75;
    -[NSNumber floatValue](self->inputScale, "floatValue");
    v78 = v180 * v77;
    v79 = a5;
    v80 = (void *)MEMORY[0x1E0C99E08];
    v191[0] = CFSTR("inputApertureScaling");
    v192[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v187);
    v191[1] = CFSTR("inputFaceMaskAdditiveMaxBlur");
    LODWORD(v81) = v181;
    v192[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v81);
    v191[2] = CFSTR("inputFaceMaskSubtractiveMaxBlur");
    LODWORD(v82) = v182;
    v192[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v82);
    v191[3] = CFSTR("inputSmoothstepMin");
    v163 = v41;
    LODWORD(v83) = v41;
    v192[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v83);
    v191[4] = CFSTR("inputSmoothstepMax");
    v162 = v43;
    LODWORD(v84) = v43;
    v192[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v84);
    v191[5] = CFSTR("inputMaxBlur");
    v161 = LODWORD(v33);
    LODWORD(v85) = LODWORD(v33);
    v192[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v85);
    v191[6] = CFSTR("inputRelativeApertureScalingStrength");
    v160 = v58;
    LODWORD(v86) = v58;
    v192[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v86);
    v191[7] = CFSTR("inputPersonDistance");
    v159 = v76;
    *(float *)&v87 = v76;
    v192[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v87);
    v191[8] = CFSTR("inputPersonThreshold");
    v164 = v48;
    LODWORD(v88) = v48;
    v192[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v88);
    v191[9] = CFSTR("inputPersonAdditive");
    v192[9] = v186;
    v191[10] = CFSTR("inputPersonSubtractive");
    v192[10] = v25;
    v191[11] = CFSTR("inputPersonMaxBlur");
    LODWORD(v89) = v185;
    v192[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v89);
    v191[12] = CFSTR("inputHairDistance");
    *(float *)&v90 = v78;
    v192[12] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v90);
    v191[13] = CFSTR("inputHairThreshold");
    LODWORD(v91) = v184;
    v192[13] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v91);
    v191[14] = CFSTR("inputHairAdditive");
    v192[14] = v31;
    v191[15] = CFSTR("inputHairSubtractive");
    v192[15] = v37;
    v191[16] = CFSTR("inputHairMaxBlur");
    v192[16] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
    v191[17] = CFSTR("inputProtectBodyStrength");
    v92 = LODWORD(v35);
    LODWORD(v93) = LODWORD(v35);
    v192[17] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v93);
    v191[18] = CFSTR("inputDistanceAdd");
    LODWORD(v94) = v152;
    v192[18] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v94);
    inputLeftEyePosition = self->inputLeftEyePosition;
    v191[19] = CFSTR("inputLeftEyePosition");
    v192[19] = inputLeftEyePosition;
    v191[20] = CFSTR("inputRightEyePosition");
    v192[20] = self->inputRightEyePosition;
    v191[21] = CFSTR("inputFaceMidPoint");
    v192[21] = self->inputFaceMidPoint;
    inputChinPosition = self->inputChinPosition;
    v191[22] = CFSTR("inputChinPosition");
    v192[22] = inputChinPosition;
    v191[23] = CFSTR("inputSubjectDistanceMinimumFocusDistance");
    LODWORD(v97) = v157;
    v192[23] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v97);
    v191[24] = CFSTR("inputSubjectDistanceMaximumFocusDistance");
    LODWORD(v98) = v158;
    v192[24] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v98);
    v191[25] = CFSTR("inputSubjectDistanceScalingFactor");
    LODWORD(v99) = v154;
    v192[25] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v99);
    v191[26] = CFSTR("inputSubjectDistanceOffset");
    LODWORD(v100) = v156;
    v192[26] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v100);
    v101 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v192, v191, 27);
    v102 = v80;
    v103 = v79;
    v104 = objc_msgSend(v102, "dictionaryWithDictionary:", v101);
    v188 = 0;
    objc_msgSend(v12, "extent");
    v105 = -[CIDepthEffectMakeBlurMap faceMaskDelta:extent:parameters:distanceToAdd:](self, "faceMaskDelta:extent:parameters:distanceToAdd:", v179, v104, &v188);
    objc_msgSend(v12, "extent");
    v107 = v106;
    objc_msgSend(v12, "extent");
    v110 = v109;
    inputScale = self->inputScale;
    v155 = v103;
    if (v103)
    {
      objc_msgSend(v12, "extent");
      v113 = v112;
      v115 = v114;
      v117 = v116;
      v119 = v118;
      objc_msgSend(v103, "extent");
      v196.origin.x = v120;
      v196.origin.y = v121;
      v196.size.width = v122;
      v196.size.height = v123;
      v195.origin.x = v113;
      v195.origin.y = v115;
      v195.size.width = v117;
      v195.size.height = v119;
      if (CGRectEqualToRect(v195, v196))
        inputScale = (NSNumber *)&unk_1E2F1BFF8;
    }
    v124 = (void *)MEMORY[0x1E0C99E08];
    v189[0] = CFSTR("inputImage");
    v189[1] = CFSTR("inputScale");
    v190[0] = v12;
    v190[1] = inputScale;
    v189[2] = CFSTR("inputDistanceAdd");
    LODWORD(v108) = v188;
    v190[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v108);
    v190[3] = v105;
    v189[3] = CFSTR("inputFaceMaskDeltaImage");
    v189[4] = CFSTR("inputApertureScaling");
    v190[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v187);
    v189[5] = CFSTR("inputRelativeApertureScalingStrength");
    LODWORD(v125) = v160;
    v190[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v125);
    v189[6] = CFSTR("inputSmoothstepMin");
    LODWORD(v126) = v163;
    v190[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v126);
    v189[7] = CFSTR("inputSmoothstepMax");
    LODWORD(v127) = v162;
    v190[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v127);
    v189[8] = CFSTR("inputMaxBlur");
    LODWORD(v128) = v161;
    v190[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v128);
    v189[9] = CFSTR("inputPersonDistance");
    *(float *)&v129 = v159;
    v190[9] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v129);
    v189[10] = CFSTR("inputPersonThreshold");
    LODWORD(v130) = v164;
    v190[10] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v130);
    v190[11] = v186;
    v189[11] = CFSTR("inputPersonAdditive");
    v189[12] = CFSTR("inputPersonSubtractive");
    v190[12] = v25;
    v189[13] = CFSTR("inputPersonMaxBlur");
    LODWORD(v131) = v185;
    v190[13] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v131);
    v189[14] = CFSTR("inputHairDistance");
    *(float *)&v132 = v78;
    v190[14] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v132);
    v189[15] = CFSTR("inputHairThreshold");
    LODWORD(v133) = v184;
    v190[15] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v133);
    v190[16] = v31;
    v189[16] = CFSTR("inputHairAdditive");
    v189[17] = CFSTR("inputHairSubtractive");
    v190[17] = v37;
    v189[18] = CFSTR("inputHairMaxBlur");
    LODWORD(v134) = v153;
    v190[18] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v134);
    v189[19] = CFSTR("inputProtectBodyStrength");
    LODWORD(v135) = v92;
    v190[19] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v135);
    v189[20] = CFSTR("inputLeftEyeX");
    v190[20] = transformNormalizedMetalToCI(self->inputLeftEyePosition, 0, v107);
    v189[21] = CFSTR("inputLeftEyeY");
    v190[21] = transformNormalizedMetalToCI(self->inputLeftEyePosition, 1u, v110);
    v189[22] = CFSTR("inputRightEyeX");
    v190[22] = transformNormalizedMetalToCI(self->inputRightEyePosition, 0, v107);
    v189[23] = CFSTR("inputRightEyeY");
    v190[23] = transformNormalizedMetalToCI(self->inputRightEyePosition, 1u, v110);
    v189[24] = CFSTR("inputFaceMidPointX");
    v190[24] = transformNormalizedMetalToCI(self->inputFaceMidPoint, 0, v107);
    v189[25] = CFSTR("inputFaceMidPointY");
    v190[25] = transformNormalizedMetalToCI(self->inputFaceMidPoint, 1u, v110);
    v189[26] = CFSTR("inputEyeProtectionMaxFaces");
    v190[26] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v167);
    v189[27] = CFSTR("inputEyeProtectionFaceWeightsSmoothStepMin");
    LODWORD(v136) = v168;
    v190[27] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v136);
    v189[28] = CFSTR("inputEyeProtectionFaceWeightsSmoothStepMax");
    LODWORD(v137) = v169;
    v190[28] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v137);
    v189[29] = CFSTR("inputEyeProtectionOvalDimsDistanceScale");
    LODWORD(v138) = v170;
    v190[29] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v138);
    v189[30] = CFSTR("inputEyeProtectionOvalDimsDistanceOffset");
    LODWORD(v139) = v171;
    v190[30] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v139);
    v189[31] = CFSTR("inputEyeProtectionOvalDimsRadiusHorizontal");
    LODWORD(v140) = v172;
    v190[31] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v140);
    v189[32] = CFSTR("inputEyeProtectionOvalDimsRadiusVertical");
    LODWORD(v141) = v173;
    v190[32] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v141);
    v189[33] = CFSTR("inputEyeProtectionOvalFallOffSmoothStepMin");
    LODWORD(v142) = v174;
    v190[33] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v142);
    v189[34] = CFSTR("inputEyeProtectionOvalFallOffSmoothStepMax");
    LODWORD(v143) = v175;
    v190[34] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v143);
    v189[35] = CFSTR("inputEyeProtectionPersonMaskSmoothStepMin");
    LODWORD(v144) = v176;
    v190[35] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v144);
    v189[36] = CFSTR("inputEyeProtectionPersonMaskSmoothStepMax");
    LODWORD(v145) = v177;
    v190[36] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v145);
    v189[37] = CFSTR("inputEyeProtectionPreventStrength");
    LODWORD(v146) = v178;
    v190[37] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v146);
    v189[38] = CFSTR("inputEyeProtectionSubtractiveMaxBlur");
    LODWORD(v147) = v165;
    v190[38] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v147);
    v189[39] = CFSTR("inputEyeProtectionSubtractiveApertureScaling");
    LODWORD(v148) = v166;
    v190[39] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v148);
    v149 = (void *)objc_msgSend(v124, "dictionaryWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v190, v189, 40));
    v150 = v149;
    if (v155)
      objc_msgSend(v149, "setObject:forKeyedSubscript:", v155, CFSTR("inputPersonAlpha"));
    if (v183)
      objc_msgSend(v150, "setObject:forKeyedSubscript:", v183, CFSTR("inputHairAlpha"));
    return (id)objc_msgSend(v12, "metalImageByApplyingFilter:withInputParameters:", CFSTR("CIModifyBlurmap"), v150);
  }
  return v12;
}

- (id)unifiedRenderingOutputImage:(CGImageMetadata *)a3
{
  CFTypeID TypeID;
  CIImage *inputImage;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CIVector **p_inputFaceMidPoint;
  size_t v16;
  CIVector **p_inputChinPosition;
  size_t v18;
  CIVector **p_inputLeftEyePosition;
  unint64_t v20;
  CIVector **p_inputRightEyePosition;
  uint64_t v22;
  unint64_t v23;
  CIVector **v24;
  unint64_t v25;
  unint64_t v26;
  CIVector **v27;
  unint64_t v28;
  unint64_t v29;
  id *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  float64x2_t *v35;
  float64x2_t *v36;
  float64x2_t *v37;
  float64x2_t *v38;
  double v39;
  float64x2_t v40;
  float64_t v41;
  double v42;
  float64x2_t v43;
  float64_t v44;
  double v45;
  float64x2_t v46;
  float64_t v47;
  double v48;
  float64x2_t v49;
  float64_t v50;
  CIDepthEffectMakeBlurMap *v51;
  int v52;
  int v53;
  unint64_t v54;
  void *v55;
  double *v56;
  double *v57;
  double *v58;
  double *v59;
  uint64_t v60;
  objc_class *v61;
  void *v62;
  uint64_t v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  CIImage *inputShiftmapImage;
  CIImage *inputMatteImage;
  CIImage *inputHairImage;
  CIImage *inputGlassesImage;
  CIImage *inputGainMap;
  NSString *inputCaptureFolderMiscPath;
  CIImage *v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  objc_class *v82;
  id v83;
  void *v84;
  objc_class *v85;
  void *v86;
  void *v87;
  unint64_t v88;
  CIImage *v89;
  CIDepthEffectMakeBlurMap *v90;
  id RenderingParametersFromCGImageMetadata;
  uint64_t v92;
  float64_t v93;
  float64_t v94;
  float64_t v95;
  float64_t v96;
  uint64_t v97;
  uint64_t v98;
  Class (*v99)(uint64_t);
  void *v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  void (*v105)(uint64_t, uint64_t);
  void (*v106)(uint64_t);
  uint64_t v107;
  char v108;
  uint64_t v109;
  char v110;
  uint64_t v111;
  char v112;
  uint64_t v113;
  char v114;
  uint64_t v115;
  _QWORD v116[4];
  _QWORD v117[6];

  v117[4] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  TypeID = CGImageMetadataGetTypeID();
  if (TypeID != CFGetTypeID(a3))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  inputImage = self->inputImage;
  RenderingParametersFromCGImageMetadata = getRenderingParametersFromCGImageMetadata(a3);
  if (!RenderingParametersFromCGImageMetadata)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v89 = inputImage;
  -[CIVector CGRectValue](self->inputFocusRect, "CGRectValue");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  p_inputFaceMidPoint = &self->inputFaceMidPoint;
  v16 = -[CIVector count](self->inputFaceMidPoint, "count");
  p_inputChinPosition = &self->inputChinPosition;
  v18 = -[CIVector count](self->inputChinPosition, "count");
  p_inputLeftEyePosition = &self->inputLeftEyePosition;
  v20 = -[CIVector count](self->inputLeftEyePosition, "count");
  p_inputRightEyePosition = &self->inputRightEyePosition;
  if (v20 >= -[CIVector count](self->inputRightEyePosition, "count"))
    v22 = 144;
  else
    v22 = 136;
  v90 = self;
  v23 = objc_msgSend(*(id *)((char *)&self->super.super.isa + v22), "count");
  v24 = &self->inputChinPosition;
  if (v18 >= v23)
  {
    v25 = -[CIVector count](*p_inputLeftEyePosition, "count");
    if (v25 >= -[CIVector count](*p_inputRightEyePosition, "count"))
      v24 = &self->inputRightEyePosition;
    else
      v24 = &self->inputLeftEyePosition;
  }
  v26 = -[CIVector count](*v24, "count");
  v27 = &self->inputFaceMidPoint;
  if (v16 >= v26)
  {
    v28 = -[CIVector count](*p_inputChinPosition, "count");
    v29 = -[CIVector count](*p_inputLeftEyePosition, "count");
    v30 = (id *)(v29 >= -[CIVector count](*p_inputRightEyePosition, "count")
               ? &self->inputRightEyePosition
               : &self->inputLeftEyePosition);
    v31 = objc_msgSend(*v30, "count");
    v27 = &self->inputChinPosition;
    if (v28 >= v31)
    {
      v32 = -[CIVector count](*p_inputLeftEyePosition, "count");
      if (v32 >= -[CIVector count](*p_inputRightEyePosition, "count"))
        v27 = &self->inputRightEyePosition;
      else
        v27 = &self->inputLeftEyePosition;
    }
  }
  v33 = -[CIVector count](*v27, "count") >> 1;
  if (v33 >= 4)
    v33 = 4;
  if (v33)
  {
    v34 = 0;
    v88 = v33;
    v92 = 2 * v33;
    v35 = (float64x2_t *)&v114;
    v36 = (float64x2_t *)&v112;
    v37 = (float64x2_t *)&v110;
    v38 = (float64x2_t *)&v108;
    do
    {
      -[CIVector valueAtIndex:](*p_inputFaceMidPoint, "valueAtIndex:", v34);
      v93 = v39;
      -[CIVector valueAtIndex:](*p_inputFaceMidPoint, "valueAtIndex:", v34 + 1);
      v40.f64[0] = v93;
      v40.f64[1] = v41;
      *v35++ = vcvtq_f64_f32(vcvt_f32_f64(v40));
      -[CIVector valueAtIndex:](*p_inputLeftEyePosition, "valueAtIndex:", v34);
      v94 = v42;
      -[CIVector valueAtIndex:](*p_inputLeftEyePosition, "valueAtIndex:", v34 + 1);
      v43.f64[0] = v94;
      v43.f64[1] = v44;
      *v36++ = vcvtq_f64_f32(vcvt_f32_f64(v43));
      -[CIVector valueAtIndex:](*p_inputRightEyePosition, "valueAtIndex:", v34);
      v95 = v45;
      -[CIVector valueAtIndex:](*p_inputRightEyePosition, "valueAtIndex:", v34 + 1);
      v46.f64[0] = v95;
      v46.f64[1] = v47;
      *v37++ = vcvtq_f64_f32(vcvt_f32_f64(v46));
      -[CIVector valueAtIndex:](*p_inputChinPosition, "valueAtIndex:", v34);
      v96 = v48;
      -[CIVector valueAtIndex:](*p_inputChinPosition, "valueAtIndex:", v34 + 1);
      v49.f64[0] = v96;
      v49.f64[1] = v50;
      *v38++ = vcvtq_f64_f32(vcvt_f32_f64(v49));
      v34 += 2;
    }
    while (v92 != v34);
    v51 = v90;
    -[CIDepthEffectMakeBlurMap intrinsicMatrixFocalLength](v90, "intrinsicMatrixFocalLength");
    v53 = v52;
    v54 = v88;
    v55 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v88);
    v56 = (double *)&v115;
    v57 = (double *)&v109;
    v58 = (double *)&v113;
    v59 = (double *)&v111;
    do
    {
      v116[0] = CFSTR("centerPos");
      v117[0] = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", *(v56 - 1), *v56);
      v116[1] = CFSTR("leftEyeCenterPos");
      v117[1] = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", *(v58 - 1), *v58);
      v116[2] = CFSTR("rightEyeCenterPos");
      v117[2] = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", *(v59 - 1), *v59);
      v116[3] = CFSTR("chinCenterPos");
      v117[3] = +[CIVector vectorWithCGPoint:](CIVector, "vectorWithCGPoint:", *(v57 - 1), *v57);
      v60 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v117, v116, 4);
      if (CCPBundleEnvar(void)::onceToken != -1)
        dispatch_once(&CCPBundleEnvar(void)::onceToken, &__block_literal_global_876);
      v61 = (objc_class *)objc_msgSend((id)CCPBundleEnvar(void)::b, "classNamed:", CFSTR("CCFacePoints"));
      if (!v61)
      {
        v102 = 0;
        v103 = &v102;
        v104 = 0x3052000000;
        v105 = __Block_byref_object_copy__20;
        v106 = __Block_byref_object_dispose__20;
        v61 = (objc_class *)getCCFacePointsClass(void)::softClass;
        v107 = getCCFacePointsClass(void)::softClass;
        if (!getCCFacePointsClass(void)::softClass)
        {
          v97 = MEMORY[0x1E0C809B0];
          v98 = 3221225472;
          v99 = ___ZL20getCCFacePointsClassv_block_invoke;
          v100 = &unk_1E2EC2EB8;
          v101 = &v102;
          ___ZL20getCCFacePointsClassv_block_invoke((uint64_t)&v97);
          v61 = (objc_class *)v103[5];
        }
        _Block_object_dispose(&v102, 8);
      }
      v62 = (void *)objc_msgSend([v61 alloc], "initWithDictionary:", v60);
      if (!v62)
        break;
      objc_msgSend(v55, "addObject:", v62);

      v56 += 2;
      v57 += 2;
      v58 += 2;
      v59 += 2;
      --v54;
    }
    while (v54);
    v64 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v55);
  }
  else
  {
    v51 = self;
    -[CIDepthEffectMakeBlurMap intrinsicMatrixFocalLength](self, "intrinsicMatrixFocalLength");
    v53 = v65;
    v64 = MEMORY[0x1E0C9AA60];
  }
  -[NSNumber floatValue](v51->inputAperture, "floatValue");
  v67 = v66;
  -[NSNumber floatValue](v51->inputScale, "floatValue");
  v69 = v68;
  inputShiftmapImage = v51->inputShiftmapImage;
  inputMatteImage = v51->inputMatteImage;
  inputHairImage = v51->inputHairImage;
  inputGlassesImage = v51->inputGlassesImage;
  inputGainMap = v51->inputGainMap;
  inputCaptureFolderMiscPath = v51->inputCaptureFolderMiscPath;
  v76 = +[CIImage emptyImage](CIImage, "emptyImage");
  v77 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v77, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA70], CFSTR("options"));
  objc_msgSend(v77, "setObject:forKeyedSubscript:", RenderingParametersFromCGImageMetadata, CFSTR("metadata"));
  LODWORD(v78) = v67;
  objc_msgSend(v77, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v78), CFSTR("simulatedAperture"));
  LODWORD(v79) = v53;
  objc_msgSend(v77, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v79), CFSTR("focalLengthInPixels"));
  LODWORD(v80) = 1022739087;
  objc_msgSend(v77, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v80), CFSTR("maxBlur"));
  LODWORD(v81) = v69;
  objc_msgSend(v77, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v81), CFSTR("inputScale"));
  objc_msgSend(v77, "setObject:forKeyedSubscript:", +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v8, v10, v12, v14), CFSTR("focusWindow"));
  objc_msgSend(v77, "setObject:forKeyedSubscript:", v64, CFSTR("facePoints"));
  objc_msgSend(v77, "setObject:forKeyedSubscript:", v89, CFSTR("inputImage"));
  objc_msgSend(v77, "setObject:forKeyedSubscript:", 0, CFSTR("inputImageLuma"));
  objc_msgSend(v77, "setObject:forKeyedSubscript:", 0, CFSTR("inputImageChroma"));
  objc_msgSend(v77, "setObject:forKeyedSubscript:", inputShiftmapImage, CFSTR("inputShiftMap"));
  objc_msgSend(v77, "setObject:forKeyedSubscript:", inputMatteImage, CFSTR("inputSegmentation"));
  objc_msgSend(v77, "setObject:forKeyedSubscript:", inputHairImage, CFSTR("inputHair"));
  objc_msgSend(v77, "setObject:forKeyedSubscript:", inputGlassesImage, CFSTR("inputGlasses"));
  objc_msgSend(v77, "setObject:forKeyedSubscript:", inputGainMap, CFSTR("inputGainMap"));
  if (inputCaptureFolderMiscPath)
    objc_msgSend(v77, "setObject:forKeyedSubscript:", inputCaptureFolderMiscPath, CFSTR("captureFolderMiscPath"));
  if (CCPBundleEnvar(void)::onceToken != -1)
    dispatch_once(&CCPBundleEnvar(void)::onceToken, &__block_literal_global_876);
  v82 = (objc_class *)objc_msgSend((id)CCPBundleEnvar(void)::b, "classNamed:", CFSTR("CCMakeBlurMapArgs"));
  if (!v82)
  {
    v102 = 0;
    v103 = &v102;
    v104 = 0x3052000000;
    v105 = __Block_byref_object_copy__20;
    v106 = __Block_byref_object_dispose__20;
    v82 = (objc_class *)getCCMakeBlurMapArgsClass(void)::softClass;
    v107 = getCCMakeBlurMapArgsClass(void)::softClass;
    if (!getCCMakeBlurMapArgsClass(void)::softClass)
    {
      v97 = MEMORY[0x1E0C809B0];
      v98 = 3221225472;
      v99 = ___ZL25getCCMakeBlurMapArgsClassv_block_invoke;
      v100 = &unk_1E2EC2EB8;
      v101 = &v102;
      ___ZL25getCCMakeBlurMapArgsClassv_block_invoke((uint64_t)&v97);
      v82 = (objc_class *)v103[5];
    }
    _Block_object_dispose(&v102, 8);
  }
  v83 = [v82 alloc];
  v84 = (void *)objc_msgSend(v83, "initWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v77));
  if (v84)
  {
    if (CCPBundleEnvar(void)::onceToken != -1)
      dispatch_once(&CCPBundleEnvar(void)::onceToken, &__block_literal_global_876);
    v85 = (objc_class *)objc_msgSend((id)CCPBundleEnvar(void)::b, "classNamed:", CFSTR("CCMakeBlurMap"));
    if (!v85)
    {
      v102 = 0;
      v103 = &v102;
      v104 = 0x3052000000;
      v105 = __Block_byref_object_copy__20;
      v106 = __Block_byref_object_dispose__20;
      v85 = (objc_class *)getCCMakeBlurMapClass(void)::softClass;
      v107 = getCCMakeBlurMapClass(void)::softClass;
      if (!getCCMakeBlurMapClass(void)::softClass)
      {
        v97 = MEMORY[0x1E0C809B0];
        v98 = 3221225472;
        v99 = ___ZL21getCCMakeBlurMapClassv_block_invoke;
        v100 = &unk_1E2EC2EB8;
        v101 = &v102;
        ___ZL21getCCMakeBlurMapClassv_block_invoke((uint64_t)&v97);
        v85 = (objc_class *)v103[5];
      }
      _Block_object_dispose(&v102, 8);
    }
    v86 = (void *)objc_msgSend([v85 alloc], "initWithMetalQueue:", 0);
    v87 = v86;
    if (v86)
    {
      v76 = (CIImage *)objc_msgSend(v86, "imageUsingArgs:", v84);

    }
  }

  if (!v76)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  return v76;
}

- (id)outputImage
{
  const CGImageMetadata *v3;
  NSDictionary *inputAuxDataMetadata;
  CIImage *inputShiftmapImage;
  NSDictionary *v7;
  CFTypeID TypeID;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  float v14;
  CIImage *v15;
  CIImage *v16;
  uint64_t v17;
  id v18;
  int v19;
  void *v20;
  NSDictionary *tuningParameters;
  NSNumber *inputScale;
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  if (!self->inputImage || !self->inputShiftmapImage)
    return 0;
  v3 = (const CGImageMetadata *)metadataFromValue(self->inputAuxDataMetadata);
  if (v3
    || (inputShiftmapImage = self->inputShiftmapImage) != 0
    && -[CIImage properties](self->inputShiftmapImage, "properties")
    && (v7 = -[CIImage properties](inputShiftmapImage, "properties"),
        (v3 = -[NSDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6D0])) != 0))
  {
    inputAuxDataMetadata = (NSDictionary *)tuningParametersFromMetaData(v3);
  }
  else
  {
    inputAuxDataMetadata = (NSDictionary *)tuningParametersFromImage(self->inputShiftmapImage);
    v3 = 0;
  }
  if (!inputAuxDataMetadata)
    inputAuxDataMetadata = (NSDictionary *)MEMORY[0x1E0C9AA70];
  self->tuningParameters = inputAuxDataMetadata;
  if (self->inputAuxDataMetadata)
  {
    TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(self->inputAuxDataMetadata))
    {
      inputAuxDataMetadata = (NSDictionary *)self->inputAuxDataMetadata;
      self->tuningParameters = inputAuxDataMetadata;
    }
    else
    {
      inputAuxDataMetadata = self->tuningParameters;
    }
  }
  v9 = -[NSDictionary objectForKeyedSubscript:](inputAuxDataMetadata, "objectForKeyedSubscript:", CFSTR("Version"));
  v10 = (void *)MEMORY[0x1E0CB37E8];
  if (v9)
    v11 = objc_msgSend(v9, "unsignedIntegerValue");
  else
    v11 = 1;
  v12 = (void *)objc_msgSend(v10, "numberWithUnsignedInteger:", v11);
  v13 = objc_msgSend(v12, "intValue");
  if (v13 >= +[CIFilter minSDOFRenderingVersionSupported](CIFilter, "minSDOFRenderingVersionSupported"))
  {
    v19 = objc_msgSend(v12, "intValue");
    if (v19 <= +[CIFilter maxSDOFRenderingVersionSupported](CIFilter, "maxSDOFRenderingVersionSupported"))
      return -[CIDepthEffectMakeBlurMap unifiedRenderingOutputImage:](self, "unifiedRenderingOutputImage:", v3);
    return self->inputShiftmapImage;
  }
  getSimulatedAperture(self->inputShiftmapImage, v3, self->inputAperture, self->tuningParameters);
  self->simulatedAperture = v14;
  v15 = -[CIImage imageByColorMatchingWorkingSpaceToColorSpace:](self->inputImage, "imageByColorMatchingWorkingSpaceToColorSpace:", linearP3ColorSpace());
  if (!v12 || (v16 = v15, v17 = objc_msgSend(v12, "integerValue"), v17 == 1))
  {
    v18 = -[CIDepthEffectMakeBlurMap blurMapV2:](self, "blurMapV2:", self->inputShiftmapImage);
    goto LABEL_30;
  }
  if (v17 == 2)
  {
    v18 = -[CIDepthEffectMakeBlurMap blurMapV3:shiftmap:alphaImage:](self, "blurMapV3:shiftmap:alphaImage:", v16, self->inputShiftmapImage, self->inputMatteImage);
    goto LABEL_30;
  }
  if (v17 != 3)
    return self->inputShiftmapImage;
  v18 = -[CIDepthEffectMakeBlurMap blurMapV4:shiftmap:alphaImage:hairImage:](self, "blurMapV4:shiftmap:alphaImage:hairImage:", v16, self->inputShiftmapImage, self->inputMatteImage, self->inputHairImage);
LABEL_30:
  v20 = v18;
  tuningParameters = self->tuningParameters;
  v23[0] = CFSTR("inputTuningParameters");
  v23[1] = CFSTR("inputScale");
  inputScale = self->inputScale;
  v24[0] = tuningParameters;
  v24[1] = inputScale;
  v23[2] = CFSTR("inputDraftMode");
  v24[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", +[CIDepthBlurEffect getDraftMode:](CIDepthBlurEffect, "getDraftMode:", -[CIDepthEffectMakeBlurMap inputDraftMode](self, "inputDraftMode")));
  return (id)objc_msgSend((id)objc_msgSend(v20, "imageByApplyingFilter:withInputParameters:", CFSTR("CIBlurmapSmoothing"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3)), "_imageByRenderingToIntermediate");
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (CIImage)inputShiftmapImage
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputShiftmapImage:(id)a3
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

- (CIImage)inputHairImage
{
  return (CIImage *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputHairImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (CIImage)inputGlassesImage
{
  return (CIImage *)objc_getProperty(self, a2, 112, 1);
}

- (void)setInputGlassesImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (CIImage)inputGainMap
{
  return (CIImage *)objc_getProperty(self, a2, 120, 1);
}

- (void)setInputGainMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSNumber)inputAperture
{
  return self->inputAperture;
}

- (void)setInputAperture:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (CIVector)inputLeftEyePosition
{
  return (CIVector *)objc_getProperty(self, a2, 136, 1);
}

- (void)setInputLeftEyePosition:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (CIVector)inputRightEyePosition
{
  return (CIVector *)objc_getProperty(self, a2, 144, 1);
}

- (void)setInputRightEyePosition:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (CIVector)inputChinPosition
{
  return (CIVector *)objc_getProperty(self, a2, 152, 1);
}

- (void)setInputChinPosition:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (CIVector)inputFaceMidPoint
{
  return (CIVector *)objc_getProperty(self, a2, 160, 1);
}

- (void)setInputFaceMidPoint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (CIVector)inputFocusRect
{
  return self->inputFocusRect;
}

- (void)setInputFocusRect:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (NSNumber)inputScale
{
  return self->inputScale;
}

- (void)setInputScale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (id)inputAuxDataMetadata
{
  return self->inputAuxDataMetadata;
}

- (void)setInputAuxDataMetadata:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (AVCameraCalibrationData)inputCalibrationData
{
  return self->inputCalibrationData;
}

- (void)setInputCalibrationData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 184);
}

- (NSNumber)inputDraftMode
{
  return self->inputDraftMode;
}

- (void)setInputDraftMode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

- (NSString)inputCaptureFolderMiscPath
{
  return self->inputCaptureFolderMiscPath;
}

- (void)setInputCaptureFolderMiscPath:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 224);
}

- (void)refineShiftMapV3WithMainImage:shiftmap:lensModel:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_9(&dword_1921E4000, v0, v1, "Unable to run CIFocalPlane", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)refineShiftMapV3WithMainImage:(uint64_t)a3 shiftmap:(uint64_t)a4 lensModel:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_3(&dword_1921E4000, a2, a3, "Unsupported disparity refinement configuration = %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_10();
}

@end

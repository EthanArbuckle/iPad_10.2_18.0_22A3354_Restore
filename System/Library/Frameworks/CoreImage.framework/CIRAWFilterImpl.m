@implementation CIRAWFilterImpl

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  objc_super v6;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("outputImage")))
    return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("inputBoostShadowAmount"), CFSTR("inputBaselineExposure"), CFSTR("inputBias"), CFSTR("inputEnableNoiseTracking"), CFSTR("inputNoiseReductionAmount"), CFSTR("inputLuminanceNoiseReductionAmount"), CFSTR("inputColorNoiseReductionAmount"), CFSTR("inputNoiseReductionSharpnessAmount"), CFSTR("inputNoiseReductionContrastAmount"), CFSTR("inputNoiseReductionDetailAmount"), CFSTR("inputEnableVendorLensCorrection"), CFSTR("inputEnableSharpening"), CFSTR("inputBoost"), CFSTR("inputNeutralChromaticityX"), CFSTR("inputNeutralChromaticityY"), CFSTR("inputNeutralLocation"), CFSTR("inputScaleFactor"),
                 CFSTR("inputDraftMode"),
                 CFSTR("inputIgnoreOrientation"),
                 CFSTR("inputImageOrientation"),
                 CFSTR("inputDecoderVersion"),
                 CFSTR("inputEV"),
                 CFSTR("inputDisableGamutMap"),
                 CFSTR("inputLinearSpaceFilter"),
                 CFSTR("inputMoireAmount"),
                 CFSTR("inputReturnDemosaiced"),
                 CFSTR("inputEnableEDRMode"),
                 CFSTR("inputLocalToneMapAmount"),
                 0);
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("outputNativeSize")))
    return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("inputDecoderVersion"));
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CIRAWFilterImpl;
  return objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingValueForKey_, a3);
}

+ (id)filterWithImageData:(id)a3 options:(id)a4
{
  id result;
  id v7;
  id v8;

  result = CGImageSourceCreateWithData((CFDataRef)a3, (CFDictionaryRef)a4);
  if (result)
  {
    v7 = result;
    v8 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithImageSource:options:", result, a4);
    CFRelease(v7);
    return v8;
  }
  return result;
}

+ (id)filterWithImageURL:(id)a3 options:(id)a4
{
  uint64_t v7;
  uint64_t TypeWithExtension;
  id result;
  id v10;
  id v11;

  if (objc_msgSend(a3, "isFileURL"))
  {
    v7 = *MEMORY[0x1E0CBD2A8];
    if (!objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD2A8]))
    {
      objc_msgSend((id)objc_msgSend(a3, "path"), "pathExtension");
      TypeWithExtension = CGImageSourceGetTypeWithExtension();
      a4 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a4);
      objc_msgSend(a4, "setObject:forKeyedSubscript:", TypeWithExtension, v7);
    }
  }
  result = CGImageSourceCreateWithURL((CFURLRef)a3, (CFDictionaryRef)a4);
  if (result)
  {
    v10 = result;
    v11 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithImageSource:options:", result, a4);
    CFRelease(v10);
    return v11;
  }
  return result;
}

+ (id)filterWithCVPixelBuffer:(__CVBuffer *)a3 properties:(id)a4 options:(id)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCVPixelBuffer:properties:options:", a3, a4, a5);
}

+ (id)supportedRawCameraModels
{
  CFArrayRef v2;
  uint64_t (*v3)(uint64_t);
  const void *v4;

  v2 = CGImageSourceCopyTypeIdentifiers();
  if (v2)
    CFRelease(v2);
  v3 = (uint64_t (*)(uint64_t))dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CreateListOfSupportedCamerasAndVersions");
  if (v3)
  {
    v4 = (const void *)v3(1);
    v3 = (id)CFMakeCollectable(v4);
  }
  return (id)objc_msgSend((id)objc_msgSend(v3, "allKeys"), "sortedArrayUsingSelector:", sel_compare_);
}

- (CIRAWFilterImpl)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CIRAWFilterImpl;
  return -[CIRAWFilterImpl init](&v3, sel_init);
}

- (void)dealloc
{
  CGImageSource *inputImageSource;
  objc_super v4;

  inputImageSource = self->_inputImageSource;
  if (inputImageSource)
  {
    CFRelease(inputImageSource);
    self->_inputImageSource = 0;
  }

  self->_inputImageAndProperties = 0;
  self->_baseImageProperties = 0;

  self->_rawDictionary = 0;
  self->_rawReconstructionDefaultsDictionary = 0;

  self->_supportedSushiModes = 0;
  self->_supportedDecoderVersions = 0;

  self->_filters = 0;
  self->_typeIdentifierHint = 0;

  self->_inputImage = 0;
  self->_defaultOrientation = 0;

  self->inputNeutralChromaticityX = 0;
  self->inputNeutralChromaticityY = 0;

  self->inputNeutralTemperature = 0;
  self->inputNeutralTint = 0;

  self->inputNeutralLocation = 0;
  self->inputEV = 0;

  self->inputBoost = 0;
  self->inputDraftMode = 0;

  self->inputScaleFactor = 0;
  self->inputIgnoreOrientation = 0;

  self->inputImageOrientation = 0;
  self->inputEnableSharpening = 0;

  self->inputEnableNoiseTracking = 0;
  self->inputNoiseReductionAmount = 0;

  self->inputEnableVendorLensCorrection = 0;
  self->inputLuminanceNoiseReductionAmount = 0;

  self->inputColorNoiseReductionAmount = 0;
  self->inputNoiseReductionSharpnessAmount = 0;

  self->inputNoiseReductionContrastAmount = 0;
  self->inputNoiseReductionDetailAmount = 0;

  self->inputMoireAmount = 0;
  self->inputDecoderVersion = 0;

  self->inputBoostShadowAmount = 0;
  self->inputBias = 0;

  self->inputLinearSpaceFilter = 0;
  self->inputBaselineExposure = 0;

  self->inputHueMagMR = 0;
  self->inputHueMagRY = 0;

  self->inputHueMagYG = 0;
  self->inputHueMagGC = 0;

  self->inputHueMagCB = 0;
  self->inputHueMagBM = 0;

  self->inputDisableGamutMap = 0;
  self->inputEnableEDRMode = 0;

  self->inputLocalToneMapAmount = 0;
  self->inputReturnDemosaiced = 0;
  self->_calledDealloc = 1;
  v4.receiver = self;
  v4.super_class = (Class)CIRAWFilterImpl;
  -[CIFilter dealloc](&v4, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  CGImageSource *inputImageSource;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (char *)objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setDefaults");
  *((_QWORD *)v4 + 10) = self->_inputImageSource;
  inputImageSource = self->_inputImageSource;
  if (inputImageSource)
    CFRetain(inputImageSource);
  v4[121] = 0;
  v4[120] = self->_isRawSource;
  *(CGSize *)(v4 + 104) = self->_nativeSize;
  *((_QWORD *)v4 + 11) = -[NSArray copy](self->_inputImageAndProperties, "copy");
  *((_QWORD *)v4 + 17) = -[NSDictionary copy](self->_baseImageProperties, "copy");
  *((_QWORD *)v4 + 18) = (id)dictionaryDeepCopy(self->_rawDictionary);
  *((_QWORD *)v4 + 19) = (id)dictionaryDeepCopy(self->_rawReconstructionDefaultsDictionary);
  *((_QWORD *)v4 + 20) = -[NSArray copy](self->_supportedSushiModes, "copy");
  *((_QWORD *)v4 + 21) = -[NSArray copy](self->_supportedDecoderVersions, "copy");
  *((_QWORD *)v4 + 23) = -[NSObject copy](self->_typeIdentifierHint, "copy");
  *((_QWORD *)v4 + 24) = -[NSNumber copy](self->_defaultOrientation, "copy");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)objc_msgSend((id)objc_opt_class(), "optionKeys", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        v12 = -[CIRAWFilterImpl valueForKey:](self, "valueForKey:", v11);
        if (v12)
          objc_msgSend(v4, "setValue:forKey:", v12, v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  return v4;
}

- (void)setDefaults
{
  uint64_t v3;
  uint64_t v4;

  -[CIRAWFilterImpl setInputLuminanceNoiseReductionAmount:](self, "setInputLuminanceNoiseReductionAmount:", -[CIRAWFilterImpl defaultInputLuminanceNoiseReductionAmount](self, "defaultInputLuminanceNoiseReductionAmount"));
  -[CIRAWFilterImpl setInputColorNoiseReductionAmount:](self, "setInputColorNoiseReductionAmount:", -[CIRAWFilterImpl defaultInputColorNoiseReductionAmount](self, "defaultInputColorNoiseReductionAmount"));
  -[CIRAWFilterImpl setInputNoiseReductionContrastAmount:](self, "setInputNoiseReductionContrastAmount:", -[CIRAWFilterImpl defaultInputNoiseReductionContrastAmount](self, "defaultInputNoiseReductionContrastAmount"));
  -[CIRAWFilterImpl setInputNoiseReductionDetailAmount:](self, "setInputNoiseReductionDetailAmount:", -[CIRAWFilterImpl defaultInputNoiseReductionDetailAmount](self, "defaultInputNoiseReductionDetailAmount"));
  -[CIRAWFilterImpl setInputNoiseReductionSharpnessAmount:](self, "setInputNoiseReductionSharpnessAmount:", -[CIRAWFilterImpl defaultInputNoiseReductionSharpnessAmount](self, "defaultInputNoiseReductionSharpnessAmount"));
  -[CIRAWFilterImpl setInputMoireAmount:](self, "setInputMoireAmount:", -[CIRAWFilterImpl defaultInputMoireAmount](self, "defaultInputMoireAmount"));
  -[CIRAWFilterImpl setInputEnableVendorLensCorrection:](self, "setInputEnableVendorLensCorrection:", -[CIRAWFilterImpl defaultInputEnableVendorLensCorrection](self, "defaultInputEnableVendorLensCorrection"));
  v3 = MEMORY[0x1E0C9AAA0];
  -[CIRAWFilterImpl setInputIgnoreOrientation:](self, "setInputIgnoreOrientation:", MEMORY[0x1E0C9AAA0]);
  v4 = MEMORY[0x1E0C9AAB0];
  -[CIRAWFilterImpl setInputEnableNoiseTracking:](self, "setInputEnableNoiseTracking:", MEMORY[0x1E0C9AAB0]);
  -[CIRAWFilterImpl setInputNoiseReductionAmount:](self, "setInputNoiseReductionAmount:", &unk_1E2F1A890);
  -[CIRAWFilterImpl setInputEnableSharpening:](self, "setInputEnableSharpening:", v4);
  -[CIRAWFilterImpl setInputDraftMode:](self, "setInputDraftMode:", v3);
  -[CIRAWFilterImpl setInputScaleFactor:](self, "setInputScaleFactor:", &unk_1E2F1A8A0);
  -[CIRAWFilterImpl setInputBoost:](self, "setInputBoost:", &unk_1E2F1A8A0);
  -[CIRAWFilterImpl setInputBoostShadowAmount:](self, "setInputBoostShadowAmount:", -[CIRAWFilterImpl defaultBoostShadowAmount](self, "defaultBoostShadowAmount"));
  -[CIRAWFilterImpl setInputImageOrientation:](self, "setInputImageOrientation:", -[CIRAWFilterImpl defaultImageOrientation](self, "defaultImageOrientation"));
  -[CIRAWFilterImpl setInputDecoderVersion:](self, "setInputDecoderVersion:", -[CIRAWFilterImpl defaultDecoderVersion](self, "defaultDecoderVersion"));
  -[CIRAWFilterImpl setInputEV:](self, "setInputEV:", &unk_1E2F1A890);
  -[CIRAWFilterImpl setInputBaselineExposure:](self, "setInputBaselineExposure:", -[CIRAWFilterImpl defaultInputBaselineExposureAmount](self, "defaultInputBaselineExposureAmount"));
  -[CIRAWFilterImpl setInputBias:](self, "setInputBias:", -[CIRAWFilterImpl defaultInputBiasAmount](self, "defaultInputBiasAmount"));
  -[CIRAWFilterImpl setInputHueMagMR:](self, "setInputHueMagMR:", -[CIRAWFilterImpl defaultInputHueMagMRAmount](self, "defaultInputHueMagMRAmount"));
  -[CIRAWFilterImpl setInputHueMagRY:](self, "setInputHueMagRY:", -[CIRAWFilterImpl defaultInputHueMagRYAmount](self, "defaultInputHueMagRYAmount"));
  -[CIRAWFilterImpl setInputHueMagYG:](self, "setInputHueMagYG:", -[CIRAWFilterImpl defaultInputHueMagYGAmount](self, "defaultInputHueMagYGAmount"));
  -[CIRAWFilterImpl setInputHueMagGC:](self, "setInputHueMagGC:", -[CIRAWFilterImpl defaultInputHueMagGCAmount](self, "defaultInputHueMagGCAmount"));
  -[CIRAWFilterImpl setInputHueMagCB:](self, "setInputHueMagCB:", -[CIRAWFilterImpl defaultInputHueMagCBAmount](self, "defaultInputHueMagCBAmount"));
  -[CIRAWFilterImpl setInputHueMagBM:](self, "setInputHueMagBM:", -[CIRAWFilterImpl defaultInputHueMagBMAmount](self, "defaultInputHueMagBMAmount"));
  -[CIRAWFilterImpl setInputDisableGamutMap:](self, "setInputDisableGamutMap:", v3);
  -[CIRAWFilterImpl setInputNeutralTemperature:](self, "setInputNeutralTemperature:", -[CIRAWFilterImpl defaultNeutralTemperature](self, "defaultNeutralTemperature"));
  -[CIRAWFilterImpl setInputNeutralTint:](self, "setInputNeutralTint:", -[CIRAWFilterImpl defaultNeutralTint](self, "defaultNeutralTint"));
  -[CIRAWFilterImpl setInputNeutralChromaticityX:](self, "setInputNeutralChromaticityX:", -[CIRAWFilterImpl defaultNeutralChromaticityX](self, "defaultNeutralChromaticityX"));
  -[CIRAWFilterImpl setInputNeutralChromaticityY:](self, "setInputNeutralChromaticityY:", -[CIRAWFilterImpl defaultNeutralChromaticityY](self, "defaultNeutralChromaticityY"));
  -[CIRAWFilterImpl setInputEnableEDRMode:](self, "setInputEnableEDRMode:", -[CIRAWFilterImpl defaultInputEnableEDRMode](self, "defaultInputEnableEDRMode"));
  -[CIRAWFilterImpl setInputLocalToneMapAmount:](self, "setInputLocalToneMapAmount:", -[CIRAWFilterImpl defaultInputLocalToneMapAmount](self, "defaultInputLocalToneMapAmount"));
  -[CIRAWFilterImpl setInputReturnDemosaiced:](self, "setInputReturnDemosaiced:", -[CIRAWFilterImpl defaultInputReturnDemosaiced](self, "defaultInputReturnDemosaiced"));
}

+ (id)customAttributes
{
  uint64_t v2;
  _QWORD v4[5];
  _QWORD v5[5];
  _QWORD v6[3];
  _QWORD v7[3];
  _QWORD v8[3];
  _QWORD v9[3];
  _QWORD v10[3];
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[7];
  _QWORD v31[7];
  _QWORD v32[2];
  _QWORD v33[2];
  const __CFString *v34;
  const __CFString *v35;
  _QWORD v36[6];
  _QWORD v37[6];
  _QWORD v38[4];
  _QWORD v39[4];
  _QWORD v40[6];
  _QWORD v41[6];
  _QWORD v42[3];
  _QWORD v43[3];
  _QWORD v44[6];
  _QWORD v45[6];
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[6];
  _QWORD v49[6];
  _QWORD v50[6];
  _QWORD v51[6];
  _QWORD v52[3];
  _QWORD v53[3];
  _QWORD v54[3];
  _QWORD v55[3];
  _QWORD v56[4];
  _QWORD v57[4];
  _QWORD v58[3];
  _QWORD v59[3];
  _QWORD v60[3];
  _QWORD v61[3];
  _QWORD v62[3];
  _QWORD v63[3];
  _QWORD v64[5];
  _QWORD v65[5];
  _QWORD v66[5];
  _QWORD v67[5];
  _QWORD v68[5];
  _QWORD v69[5];
  _QWORD v70[5];
  _QWORD v71[5];
  _QWORD v72[5];
  _QWORD v73[5];
  _QWORD v74[5];
  _QWORD v75[5];
  _QWORD v76[36];
  _QWORD v77[38];

  v77[36] = *MEMORY[0x1E0C80C00];
  v76[0] = CFSTR("inputLuminanceNoiseReductionAmount");
  v74[0] = CFSTR("CIAttributeClass");
  v74[1] = CFSTR("CIAttributeDefault");
  v75[0] = CFSTR("NSNumber");
  v75[1] = &unk_1E2F1A890;
  v74[2] = CFSTR("CIAttributeMin");
  v74[3] = CFSTR("CIAttributeMax");
  v75[2] = &unk_1E2F1A890;
  v75[3] = &unk_1E2F1A8A0;
  v74[4] = CFSTR("CIAttributeType");
  v75[4] = CFSTR("CIAttributeTypeScalar");
  v77[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 5);
  v76[1] = CFSTR("inputColorNoiseReductionAmount");
  v72[0] = CFSTR("CIAttributeClass");
  v72[1] = CFSTR("CIAttributeDefault");
  v73[0] = CFSTR("NSNumber");
  v73[1] = &unk_1E2F1A890;
  v72[2] = CFSTR("CIAttributeMin");
  v72[3] = CFSTR("CIAttributeMax");
  v73[2] = &unk_1E2F1A890;
  v73[3] = &unk_1E2F1A8A0;
  v72[4] = CFSTR("CIAttributeType");
  v73[4] = CFSTR("CIAttributeTypeScalar");
  v77[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 5);
  v76[2] = CFSTR("inputMoireAmount");
  v70[0] = CFSTR("CIAttributeClass");
  v70[1] = CFSTR("CIAttributeDefault");
  v71[0] = CFSTR("NSNumber");
  v71[1] = &unk_1E2F1A890;
  v70[2] = CFSTR("CIAttributeMin");
  v70[3] = CFSTR("CIAttributeMax");
  v71[2] = &unk_1E2F1A890;
  v71[3] = &unk_1E2F1A8A0;
  v70[4] = CFSTR("CIAttributeType");
  v71[4] = CFSTR("CIAttributeTypeScalar");
  v77[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 5);
  v76[3] = CFSTR("inputNoiseReductionContrastAmount");
  v68[0] = CFSTR("CIAttributeClass");
  v68[1] = CFSTR("CIAttributeDefault");
  v69[0] = CFSTR("NSNumber");
  v69[1] = &unk_1E2F1A890;
  v68[2] = CFSTR("CIAttributeMin");
  v68[3] = CFSTR("CIAttributeMax");
  v69[2] = &unk_1E2F1A890;
  v69[3] = &unk_1E2F1A8A0;
  v68[4] = CFSTR("CIAttributeType");
  v69[4] = CFSTR("CIAttributeTypeScalar");
  v77[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 5);
  v76[4] = CFSTR("inputNoiseReductionDetailAmount");
  v66[0] = CFSTR("CIAttributeClass");
  v66[1] = CFSTR("CIAttributeDefault");
  v67[0] = CFSTR("NSNumber");
  v67[1] = &unk_1E2F1A890;
  v66[2] = CFSTR("CIAttributeMin");
  v66[3] = CFSTR("CIAttributeMax");
  v67[2] = &unk_1E2F1A890;
  v67[3] = &unk_1E2F1A8A0;
  v66[4] = CFSTR("CIAttributeType");
  v67[4] = CFSTR("CIAttributeTypeScalar");
  v77[4] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 5);
  v76[5] = CFSTR("inputNoiseReductionSharpnessAmount");
  v64[0] = CFSTR("CIAttributeClass");
  v64[1] = CFSTR("CIAttributeDefault");
  v65[0] = CFSTR("NSNumber");
  v65[1] = &unk_1E2F1A890;
  v64[2] = CFSTR("CIAttributeMin");
  v64[3] = CFSTR("CIAttributeMax");
  v65[2] = &unk_1E2F1A890;
  v65[3] = &unk_1E2F1A8A0;
  v64[4] = CFSTR("CIAttributeType");
  v65[4] = CFSTR("CIAttributeTypeScalar");
  v77[5] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 5);
  v76[6] = CFSTR("inputEnableVendorLensCorrection");
  v62[0] = CFSTR("CIAttributeClass");
  v62[1] = CFSTR("CIAttributeDefault");
  v63[0] = CFSTR("NSNumber");
  v63[1] = MEMORY[0x1E0C9AAB0];
  v62[2] = CFSTR("CIAttributeType");
  v63[2] = CFSTR("CIAttributeTypeBoolean");
  v77[6] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 3);
  v76[7] = CFSTR("inputIgnoreOrientation");
  v60[0] = CFSTR("CIAttributeClass");
  v60[1] = CFSTR("CIAttributeDefault");
  v61[0] = CFSTR("NSNumber");
  v61[1] = MEMORY[0x1E0C9AAA0];
  v60[2] = CFSTR("CIAttributeType");
  v61[2] = CFSTR("CIAttributeTypeBoolean");
  v77[7] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 3);
  v76[8] = CFSTR("inputEnableNoiseTracking");
  v58[0] = CFSTR("CIAttributeClass");
  v58[1] = CFSTR("CIAttributeDefault");
  v59[0] = CFSTR("NSNumber");
  v59[1] = MEMORY[0x1E0C9AAB0];
  v58[2] = CFSTR("CIAttributeType");
  v59[2] = CFSTR("CIAttributeTypeBoolean");
  v77[8] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 3);
  v76[9] = CFSTR("inputNoiseReductionAmount");
  v56[0] = CFSTR("CIAttributeClass");
  v56[1] = CFSTR("CIAttributeMin");
  v57[0] = CFSTR("NSNumber");
  v57[1] = &unk_1E2F1A890;
  v56[2] = CFSTR("CIAttributeMax");
  v56[3] = CFSTR("CIAttributeType");
  v57[2] = &unk_1E2F1A8A0;
  v57[3] = CFSTR("CIAttributeTypeScalar");
  v77[9] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 4);
  v76[10] = CFSTR("inputEnableSharpening");
  v54[0] = CFSTR("CIAttributeClass");
  v54[1] = CFSTR("CIAttributeDefault");
  v55[0] = CFSTR("NSNumber");
  v55[1] = MEMORY[0x1E0C9AAB0];
  v54[2] = CFSTR("CIAttributeType");
  v55[2] = CFSTR("CIAttributeTypeBoolean");
  v77[10] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 3);
  v76[11] = CFSTR("inputDraftMode");
  v52[0] = CFSTR("CIAttributeClass");
  v52[1] = CFSTR("CIAttributeDefault");
  v53[0] = CFSTR("NSNumber");
  v53[1] = MEMORY[0x1E0C9AAA0];
  v52[2] = CFSTR("CIAttributeType");
  v53[2] = CFSTR("CIAttributeTypeBoolean");
  v77[11] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 3);
  v76[12] = CFSTR("inputScaleFactor");
  v50[0] = CFSTR("CIAttributeClass");
  v50[1] = CFSTR("CIAttributeDefault");
  v51[0] = CFSTR("NSNumber");
  v51[1] = &unk_1E2F1A8A0;
  v50[2] = CFSTR("CIAttributeMin");
  v50[3] = CFSTR("CIAttributeMax");
  v51[2] = &unk_1E2F1A890;
  v51[3] = &unk_1E2F1A8A0;
  v50[4] = CFSTR("CIAttributeIdentity");
  v50[5] = CFSTR("CIAttributeType");
  v51[4] = &unk_1E2F1A8A0;
  v51[5] = CFSTR("CIAttributeTypeScalar");
  v77[12] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 6);
  v76[13] = CFSTR("inputBoost");
  v48[0] = CFSTR("CIAttributeClass");
  v48[1] = CFSTR("CIAttributeDefault");
  v49[0] = CFSTR("NSNumber");
  v49[1] = &unk_1E2F1A8A0;
  v48[2] = CFSTR("CIAttributeMin");
  v48[3] = CFSTR("CIAttributeMax");
  v49[2] = &unk_1E2F1A890;
  v49[3] = &unk_1E2F1A8A0;
  v48[4] = CFSTR("CIAttributeIdentity");
  v48[5] = CFSTR("CIAttributeType");
  v49[4] = &unk_1E2F1A890;
  v49[5] = CFSTR("CIAttributeTypeScalar");
  v77[13] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 6);
  v76[14] = CFSTR("inputBoostShadowAmount");
  v46[0] = CFSTR("CIAttributeClass");
  v46[1] = CFSTR("CIAttributeDefault");
  v47[0] = CFSTR("NSNumber");
  v47[1] = &unk_1E2F1A890;
  v46[2] = CFSTR("CIAttributeMin");
  v46[3] = CFSTR("CIAttributeMax");
  v47[2] = &unk_1E2F1A890;
  v47[3] = &unk_1E2F1A8B0;
  v46[4] = CFSTR("CIAttributeType");
  v47[4] = CFSTR("CIAttributeTypeScalar");
  v77[14] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 5);
  v76[15] = CFSTR("inputImageOrientation");
  v44[0] = CFSTR("CIAttributeClass");
  v44[1] = CFSTR("CIAttributeDefault");
  v45[0] = CFSTR("NSNumber");
  v45[1] = &unk_1E2F1BD10;
  v44[2] = CFSTR("CIAttributeMin");
  v44[3] = CFSTR("CIAttributeMax");
  v45[2] = &unk_1E2F1BD10;
  v45[3] = &unk_1E2F1BD28;
  v44[4] = CFSTR("CIAttributeIdentity");
  v44[5] = CFSTR("CIAttributeType");
  v45[4] = &unk_1E2F1BD10;
  v45[5] = CFSTR("CIAttributeTypeInteger");
  v77[15] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 6);
  v76[16] = CFSTR("inputDecoderVersion");
  v42[0] = CFSTR("CIAttributeClass");
  v42[1] = CFSTR("CIAttributeDefault");
  v43[0] = CFSTR("NSString");
  v43[1] = &unk_1E2F1BD40;
  v42[2] = *MEMORY[0x1E0CBD208];
  v43[2] = &unk_1E2F1DCF0;
  v77[16] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 3);
  v76[17] = CFSTR("inputEV");
  v40[0] = CFSTR("CIAttributeClass");
  v40[1] = CFSTR("CIAttributeDefault");
  v41[0] = CFSTR("NSNumber");
  v41[1] = &unk_1E2F1A890;
  v40[2] = CFSTR("CIAttributeSliderMin");
  v40[3] = CFSTR("CIAttributeSliderMax");
  v41[2] = &unk_1E2F1A8C0;
  v41[3] = &unk_1E2F1A8D0;
  v40[4] = CFSTR("CIAttributeIdentity");
  v40[5] = CFSTR("CIAttributeType");
  v41[4] = &unk_1E2F1A890;
  v41[5] = CFSTR("CIAttributeTypeScalar");
  v77[17] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 6);
  v76[18] = CFSTR("inputBaselineExposure");
  v38[0] = CFSTR("CIAttributeClass");
  v38[1] = CFSTR("CIAttributeDefault");
  v39[0] = CFSTR("NSNumber");
  v39[1] = &unk_1E2F1A890;
  v38[2] = CFSTR("CIAttributeIdentity");
  v38[3] = CFSTR("CIAttributeType");
  v39[2] = &unk_1E2F1A890;
  v39[3] = CFSTR("CIAttributeTypeScalar");
  v77[18] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 4);
  v76[19] = CFSTR("inputBias");
  v36[0] = CFSTR("CIAttributeClass");
  v36[1] = CFSTR("CIAttributeDefault");
  v37[0] = CFSTR("NSNumber");
  v37[1] = &unk_1E2F1A890;
  v36[2] = CFSTR("CIAttributeMin");
  v36[3] = CFSTR("CIAttributeMax");
  v37[2] = &unk_1E2F1A8C0;
  v37[3] = &unk_1E2F1A8E0;
  v36[4] = CFSTR("CIAttributeIdentity");
  v36[5] = CFSTR("CIAttributeType");
  v37[4] = &unk_1E2F1A890;
  v37[5] = CFSTR("CIAttributeTypeScalar");
  v77[19] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 6);
  v76[20] = CFSTR("inputLinearSpaceFilter");
  v34 = CFSTR("CIAttributeClass");
  v35 = CFSTR("CIFilter");
  v77[20] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
  v76[21] = CFSTR("inputNeutralLocation");
  v32[0] = CFSTR("CIAttributeClass");
  v32[1] = CFSTR("CIAttributeType");
  v33[0] = CFSTR("CIVector");
  v33[1] = CFSTR("CIAttributeTypePosition");
  v77[21] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
  v76[22] = CFSTR("inputNeutralTemperature");
  v30[0] = CFSTR("CIAttributeClass");
  v30[1] = CFSTR("CIAttributeDefault");
  v31[0] = CFSTR("NSNumber");
  v31[1] = &unk_1E2F1BDE8;
  v30[2] = CFSTR("CIAttributeMin");
  v30[3] = CFSTR("CIAttributeSliderMin");
  v31[2] = &unk_1E2F1BE00;
  v31[3] = &unk_1E2F1BDE8;
  v30[4] = CFSTR("CIAttributeSliderMax");
  v30[5] = CFSTR("CIAttributeMax");
  v31[4] = &unk_1E2F1A8F0;
  v31[5] = &unk_1E2F1A900;
  v30[6] = CFSTR("CIAttributeType");
  v31[6] = CFSTR("CIAttributeTypeScalar");
  v77[22] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 7);
  v76[23] = CFSTR("inputNeutralTint");
  v28[0] = CFSTR("CIAttributeClass");
  v28[1] = CFSTR("CIAttributeDefault");
  v29[0] = CFSTR("NSNumber");
  v29[1] = &unk_1E2F1BD58;
  v28[2] = CFSTR("CIAttributeMin");
  v28[3] = CFSTR("CIAttributeMax");
  v29[2] = &unk_1E2F1A910;
  v29[3] = &unk_1E2F1A920;
  v28[4] = CFSTR("CIAttributeType");
  v29[4] = CFSTR("CIAttributeTypeScalar");
  v77[23] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 5);
  v76[24] = CFSTR("inputNeutralChromaticityX");
  v26[0] = CFSTR("CIAttributeClass");
  v26[1] = CFSTR("CIAttributeDefault");
  v27[0] = CFSTR("NSNumber");
  v27[1] = &unk_1E2F1A930;
  v26[2] = CFSTR("CIAttributeType");
  v27[2] = CFSTR("CIAttributeTypeScalar");
  v77[24] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
  v76[25] = CFSTR("inputNeutralChromaticityY");
  v24[0] = CFSTR("CIAttributeClass");
  v24[1] = CFSTR("CIAttributeDefault");
  v25[0] = CFSTR("NSNumber");
  v25[1] = &unk_1E2F1A930;
  v24[2] = CFSTR("CIAttributeType");
  v25[2] = CFSTR("CIAttributeTypeScalar");
  v77[25] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v76[26] = CFSTR("inputDisableGamutMap");
  v22[0] = CFSTR("CIAttributeClass");
  v22[1] = CFSTR("CIAttributeDefault");
  v23[0] = CFSTR("NSNumber");
  v2 = MEMORY[0x1E0C9AAA0];
  v23[1] = MEMORY[0x1E0C9AAA0];
  v22[2] = CFSTR("CIAttributeType");
  v23[2] = CFSTR("CIAttributeTypeBoolean");
  v77[26] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v76[27] = CFSTR("inputHueMagMR");
  v20[0] = CFSTR("CIAttributeClass");
  v20[1] = CFSTR("CIAttributeDefault");
  v21[0] = CFSTR("NSNumber");
  v21[1] = &unk_1E2F1A890;
  v20[2] = CFSTR("CIAttributeType");
  v21[2] = CFSTR("CIAttributeTypeScalar");
  v77[27] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v76[28] = CFSTR("inputHueMagRY");
  v18[0] = CFSTR("CIAttributeClass");
  v18[1] = CFSTR("CIAttributeDefault");
  v19[0] = CFSTR("NSNumber");
  v19[1] = &unk_1E2F1A890;
  v18[2] = CFSTR("CIAttributeType");
  v19[2] = CFSTR("CIAttributeTypeScalar");
  v77[28] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v76[29] = CFSTR("inputHueMagYG");
  v16[0] = CFSTR("CIAttributeClass");
  v16[1] = CFSTR("CIAttributeDefault");
  v17[0] = CFSTR("NSNumber");
  v17[1] = &unk_1E2F1A890;
  v16[2] = CFSTR("CIAttributeType");
  v17[2] = CFSTR("CIAttributeTypeScalar");
  v77[29] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v76[30] = CFSTR("inputHueMagGC");
  v14[0] = CFSTR("CIAttributeClass");
  v14[1] = CFSTR("CIAttributeDefault");
  v15[0] = CFSTR("NSNumber");
  v15[1] = &unk_1E2F1A890;
  v14[2] = CFSTR("CIAttributeType");
  v15[2] = CFSTR("CIAttributeTypeScalar");
  v77[30] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v76[31] = CFSTR("inputHueMagCB");
  v12[0] = CFSTR("CIAttributeClass");
  v12[1] = CFSTR("CIAttributeDefault");
  v13[0] = CFSTR("NSNumber");
  v13[1] = &unk_1E2F1A890;
  v12[2] = CFSTR("CIAttributeType");
  v13[2] = CFSTR("CIAttributeTypeScalar");
  v77[31] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v76[32] = CFSTR("inputHueMagBM");
  v10[0] = CFSTR("CIAttributeClass");
  v10[1] = CFSTR("CIAttributeDefault");
  v11[0] = CFSTR("NSNumber");
  v11[1] = &unk_1E2F1A890;
  v10[2] = CFSTR("CIAttributeType");
  v11[2] = CFSTR("CIAttributeTypeScalar");
  v77[32] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v76[33] = CFSTR("inputReturnDemosaiced");
  v8[0] = CFSTR("CIAttributeClass");
  v8[1] = CFSTR("CIAttributeDefault");
  v9[0] = CFSTR("NSNumber");
  v9[1] = v2;
  v8[2] = CFSTR("CIAttributeType");
  v9[2] = CFSTR("CIAttributeTypeBoolean");
  v77[33] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v76[34] = CFSTR("inputEnableEDRMode");
  v6[0] = CFSTR("CIAttributeClass");
  v6[1] = CFSTR("CIAttributeDefault");
  v7[0] = CFSTR("NSNumber");
  v7[1] = MEMORY[0x1E0C9AAB0];
  v7[2] = CFSTR("CIAttributeTypeScalar");
  v6[2] = CFSTR("CIAttributeType");
  v77[34] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v76[35] = CFSTR("inputLocalToneMapAmount");
  v4[0] = CFSTR("CIAttributeClass");
  v4[1] = CFSTR("CIAttributeDefault");
  v5[0] = CFSTR("NSNumber");
  v5[1] = &unk_1E2F1A8A0;
  v4[2] = CFSTR("CIAttributeMin");
  v4[3] = CFSTR("CIAttributeMax");
  v5[2] = &unk_1E2F1A890;
  v5[3] = &unk_1E2F1A8A0;
  v4[4] = CFSTR("CIAttributeType");
  v5[4] = CFSTR("CIAttributeTypeScalar");
  v77[35] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 5);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 36);
}

- (id)outputKeys
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CIRAWFilterImpl;
  return -[NSArray arrayByAddingObject:](-[CIFilter outputKeys](&v3, sel_outputKeys), "arrayByAddingObject:", CFSTR("outputNativeSize"));
}

- (BOOL)isRawSource
{
  return self->_isRawSource;
}

+ (id)applyMatrix:(const double *)a3 toCIImage:(id)a4
{
  CIFilter *v6;

  v6 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIColorMatrix"));
  -[CIFilter setDefaults](v6, "setDefaults");
  -[CIFilter setValue:forKey:](v6, "setValue:forKey:", +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", *a3, a3[1], a3[2], 0.0), CFSTR("inputRVector"));
  -[CIFilter setValue:forKey:](v6, "setValue:forKey:", +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", a3[3], a3[4], a3[5], 0.0), CFSTR("inputGVector"));
  -[CIFilter setValue:forKey:](v6, "setValue:forKey:", +[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", a3[6], a3[7], a3[8], 0.0), CFSTR("inputBVector"));
  -[CIFilter setValue:forKey:](v6, "setValue:forKey:", a4, CFSTR("inputImage"));
  return (id)-[CIFilter valueForKey:](v6, "valueForKey:", CFSTR("outputImage"));
}

+ (id)optionKeys
{
  _QWORD v3[37];

  v3[36] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("inputNeutralTemperature");
  v3[1] = CFSTR("inputNeutralTint");
  v3[2] = CFSTR("inputNeutralChromaticityX");
  v3[3] = CFSTR("inputNeutralChromaticityY");
  v3[4] = CFSTR("inputBoost");
  v3[5] = CFSTR("inputDraftMode");
  v3[6] = CFSTR("inputScaleFactor");
  v3[7] = CFSTR("inputIgnoreOrientation");
  v3[8] = CFSTR("inputImageOrientation");
  v3[9] = CFSTR("inputDecoderVersion");
  v3[10] = CFSTR("inputEnableNoiseTracking");
  v3[11] = CFSTR("inputEnableSharpening");
  v3[12] = CFSTR("inputEnableVendorLensCorrection");
  v3[13] = CFSTR("inputNoiseReductionAmount");
  v3[14] = CFSTR("inputLuminanceNoiseReductionAmount");
  v3[15] = CFSTR("inputColorNoiseReductionAmount");
  v3[16] = CFSTR("inputNoiseReductionSharpnessAmount");
  v3[17] = CFSTR("inputNoiseReductionContrastAmount");
  v3[18] = CFSTR("inputNoiseReductionDetailAmount");
  v3[19] = CFSTR("inputBoostShadowAmount");
  v3[20] = CFSTR("inputBias");
  v3[21] = CFSTR("inputBaselineExposure");
  v3[22] = CFSTR("inputDisableGamutMap");
  v3[23] = CFSTR("inputLinearSpaceFilter");
  v3[24] = CFSTR("inputMoireAmount");
  v3[25] = CFSTR("inputEV");
  v3[26] = CFSTR("inputRequestedSushiMode");
  v3[27] = CFSTR("inputHueMagMR");
  v3[28] = CFSTR("inputHueMagRY");
  v3[29] = CFSTR("inputHueMagYG");
  v3[30] = CFSTR("inputHueMagGC");
  v3[31] = CFSTR("inputHueMagCB");
  v3[32] = CFSTR("inputHueMagBM");
  v3[33] = CFSTR("inputReturnDemosaiced");
  v3[34] = CFSTR("inputEnableEDRMode");
  v3[35] = CFSTR("inputLocalToneMapAmount");
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 36);
}

+ (id)matteOptionNameFromOptions:(id)a3
{
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = CFSTR("kCIImageAuxiliaryPortraitEffectsMatte");
  v5 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("kCIImageAuxiliaryPortraitEffectsMatte"));
  if ((objc_msgSend(v5, "isEqual:", MEMORY[0x1E0C9AAB0]) & 1) == 0)
  {
    v4 = CFSTR("kCIImageAuxiliarySemanticSegmentationSkinMatte");
    v6 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("kCIImageAuxiliarySemanticSegmentationSkinMatte"));
    if ((objc_msgSend(v6, "isEqual:", MEMORY[0x1E0C9AAB0]) & 1) == 0)
    {
      v4 = CFSTR("kCIImageAuxiliarySemanticSegmentationHairMatte");
      v7 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("kCIImageAuxiliarySemanticSegmentationHairMatte"));
      if ((objc_msgSend(v7, "isEqual:", MEMORY[0x1E0C9AAB0]) & 1) == 0)
      {
        v4 = CFSTR("kCIImageAuxiliarySemanticSegmentationTeethMatte");
        v8 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("kCIImageAuxiliarySemanticSegmentationTeethMatte"));
        if ((objc_msgSend(v8, "isEqual:", MEMORY[0x1E0C9AAB0]) & 1) == 0)
        {
          v4 = CFSTR("kCIImageAuxiliarySemanticSegmentationGlassesMatte");
          v9 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("kCIImageAuxiliarySemanticSegmentationGlassesMatte"));
          if ((objc_msgSend(v9, "isEqual:", MEMORY[0x1E0C9AAB0]) & 1) == 0)
          {
            v4 = CFSTR("kCIImageAuxiliarySemanticSegmentationSkyMatte");
            v10 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("kCIImageAuxiliarySemanticSegmentationSkyMatte"));
            if ((objc_msgSend(v10, "isEqual:", MEMORY[0x1E0C9AAB0]) & 1) == 0)
            {
              v4 = CFSTR("kCIImageAuxiliaryHDRGainMap");
              v11 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("kCIImageAuxiliaryHDRGainMap"));
              if (!objc_msgSend(v11, "isEqual:", MEMORY[0x1E0C9AAB0]))
                return 0;
            }
          }
        }
      }
    }
  }
  return (id)v4;
}

- (CIRAWFilterImpl)initWithCVPixelBuffer:(__CVBuffer *)a3 properties:(id)a4 options:(id)a5
{
  char *v8;
  CFArrayRef v9;
  uint64_t (*v10)(__CVBuffer *, id);
  const void *v11;
  void *v12;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v33.receiver = self;
  v33.super_class = (Class)CIRAWFilterImpl;
  v8 = -[CIRAWFilterImpl init](&v33, sel_init);
  if (v8)
  {
    if (!a3 || !a4)
      goto LABEL_12;
    v9 = CGImageSourceCopyTypeIdentifiers();
    if (v9)
      CFRelease(v9);
    v10 = (uint64_t (*)(__CVBuffer *, id))dlsym((void *)0xFFFFFFFFFFFFFFFELL, "RCCreateCIImageFromBufferAndProperties");
    if (v10
      && (v11 = (const void *)v10(a3, a4),
          v12 = (id)CFMakeCollectable(v11),
          objc_msgSend(v12, "count") == 2))
    {
      *((_QWORD *)v8 + 11) = v12;
      __asm { FMOV            V0.2D, #-1.0 }
      *(_OWORD *)(v8 + 104) = _Q0;
      v8[120] = 1;
      v18 = (void *)objc_msgSend(a4, "valueForKey:", *MEMORY[0x1E0CBCFF0]);
      v19 = (void *)MEMORY[0x1E0CB37E8];
      if ((int)objc_msgSend(v18, "intValue") <= 8 && (int)objc_msgSend(v18, "intValue") < 1)
      {
        v20 = 1;
      }
      else if ((int)objc_msgSend(v18, "intValue") <= 8)
      {
        v20 = objc_msgSend(v18, "intValue");
      }
      else
      {
        v20 = 8;
      }
      *((_QWORD *)v8 + 24) = (id)objc_msgSend(v19, "numberWithInt:", v20);
      *((_QWORD *)v8 + 17) = a4;
      *((_QWORD *)v8 + 23) = (id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD2A8]);
      objc_msgSend(v8, "setDefaults");
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v22 = (void *)objc_msgSend((id)objc_opt_class(), "optionKeys", 0);
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v30 != v25)
              objc_enumerationMutation(v22);
            v27 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
            v28 = objc_msgSend(a5, "objectForKeyedSubscript:", v27);
            if (v28)
              objc_msgSend(v8, "setValue:forKey:", v28, v27);
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        }
        while (v24);
      }
      *((_QWORD *)v8 + 16) = objc_msgSend((id)objc_opt_class(), "matteOptionNameFromOptions:", a5);
    }
    else
    {
LABEL_12:

      return 0;
    }
  }
  return (CIRAWFilterImpl *)v8;
}

- (CIRAWFilterImpl)initWithImageSource:(CGImageSource *)a3 options:(id)a4
{
  char *v6;
  CIRAWFilterImpl *v7;
  const __CFString *Type;
  BOOL v14;
  CFDictionaryRef v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  uint64_t v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)CIRAWFilterImpl;
  v6 = -[CIRAWFilterImpl init](&v32, sel_init);
  v7 = (CIRAWFilterImpl *)v6;
  if (v6)
  {
    if (a3)
    {
      __asm { FMOV            V0.2D, #-1.0 }
      *(_OWORD *)(v6 + 104) = _Q0;
      *((_QWORD *)v6 + 10) = a3;
      CFRetain(a3);
      Type = CGImageSourceGetType(v7->_inputImageSource);
      if (Type)
        v14 = CFStringHasSuffix(Type, CFSTR("raw-image")) != 0;
      else
        v14 = 0;
      v7->_isRawSource = v14;
      v15 = CGImageSourceCopyPropertiesAtIndex(v7->_inputImageSource, 0, (CFDictionaryRef)&unk_1E2F1D5F8);
      v16 = (id)CFMakeCollectable(v15);
      v17 = (void *)objc_msgSend(v16, "valueForKey:", *MEMORY[0x1E0CBCFF0]);
      v18 = (void *)MEMORY[0x1E0CB37E8];
      if ((int)objc_msgSend(v17, "intValue") <= 8 && (int)objc_msgSend(v17, "intValue") < 1)
      {
        v19 = 1;
      }
      else if ((int)objc_msgSend(v17, "intValue") <= 8)
      {
        v19 = objc_msgSend(v17, "intValue");
      }
      else
      {
        v19 = 8;
      }
      v7->_defaultOrientation = (NSNumber *)(id)objc_msgSend(v18, "numberWithInt:", v19);
      v7->_baseImageProperties = (NSDictionary *)v16;
      v7->_typeIdentifierHint = (id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD2A8]);
      -[CIRAWFilterImpl setDefaults](v7, "setDefaults");
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v20 = (void *)objc_msgSend((id)objc_opt_class(), "optionKeys", 0);
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v29 != v23)
              objc_enumerationMutation(v20);
            v25 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
            v26 = objc_msgSend(a4, "objectForKeyedSubscript:", v25);
            if (v26)
              -[CIRAWFilterImpl setValue:forKey:](v7, "setValue:forKey:", v26, v25);
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v22);
      }
      v7->_matteOption = (NSString *)objc_msgSend((id)objc_opt_class(), "matteOptionNameFromOptions:", a4);
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (NSNumber)sushiMode
{
  id v3;
  void *v4;

  v3 = -[NSDictionary objectForKeyedSubscript:](-[CIRAWFilterImpl rawReconstructionDefaultsDictionary](self, "rawReconstructionDefaultsDictionary"), "objectForKeyedSubscript:", CFSTR("kCGImageSourceSupportedSushiLevels"));
  v4 = v3;
  if (self->inputRequestedSushiMode && objc_msgSend(v3, "containsObject:"))
    return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[NSString intValue](self->inputRequestedSushiMode, "intValue"));
  if (!v4)
    return 0;
  if ((objc_msgSend(v4, "containsObject:", CFSTR("3")) & 1) != 0)
    return (NSNumber *)&unk_1E2F1BD88;
  if (objc_msgSend(v4, "containsObject:", CFSTR("2")))
    return (NSNumber *)&unk_1E2F1BD70;
  return (NSNumber *)&unk_1E2F1BD10;
}

- (NSDictionary)rawReconstructionDefaultsDictionary
{
  NSString *inputDecoderVersion;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  NSArray *inputImageAndProperties;
  id v11;
  uint64_t v12;
  CFDictionaryRef v13;
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  if (!self->_baseImageProperties)
    return (NSDictionary *)MEMORY[0x1E0C9AA70];
  if (self->_isRawSource && !self->_rawReconstructionDefaultsDictionary)
  {
    if (self->_inputImageSource)
    {
      inputDecoderVersion = self->inputDecoderVersion;
      if (inputDecoderVersion)
      {
        v5 = *MEMORY[0x1E0CBD258];
        v16[0] = *MEMORY[0x1E0CBD200];
        v16[1] = v5;
        v17[0] = MEMORY[0x1E0C9AAB0];
        v17[1] = MEMORY[0x1E0C9AAB0];
        v16[2] = *MEMORY[0x1E0CBD270];
        v16[3] = CFSTR("kCGImageSourceShouldUseRawDataForFullSize");
        v17[2] = inputDecoderVersion;
        v17[3] = MEMORY[0x1E0C9AAB0];
        v6 = (void *)MEMORY[0x1E0C99D80];
        v7 = v17;
        v8 = v16;
        v9 = 4;
      }
      else
      {
        v12 = *MEMORY[0x1E0CBD258];
        v14[0] = *MEMORY[0x1E0CBD200];
        v14[1] = v12;
        v15[0] = MEMORY[0x1E0C9AAB0];
        v15[1] = MEMORY[0x1E0C9AAB0];
        v14[2] = CFSTR("kCGImageSourceShouldUseRawDataForFullSize");
        v15[2] = MEMORY[0x1E0C9AAB0];
        v6 = (void *)MEMORY[0x1E0C99D80];
        v7 = v15;
        v8 = v14;
        v9 = 3;
      }
      v13 = CGImageSourceCopyPropertiesAtIndex(self->_inputImageSource, 0, (CFDictionaryRef)objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v7, v8, v9));
      self->_rawReconstructionDefaultsDictionary = (NSDictionary *)(id)-[__CFDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD210]);
      if (v13)
        CFRelease(v13);
    }
    else
    {
      inputImageAndProperties = self->_inputImageAndProperties;
      if (inputImageAndProperties)
      {
        v11 = -[NSArray objectAtIndexedSubscript:](inputImageAndProperties, "objectAtIndexedSubscript:", 1);
        self->_rawReconstructionDefaultsDictionary = (NSDictionary *)(id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD210]);
      }
    }
  }
  return self->_rawReconstructionDefaultsDictionary;
}

- (NSDictionary)rawDictionary
{
  _BOOL4 isRawSource;
  NSDictionary *result;
  CGImageSource *inputImageSource;
  CFDictionaryRef v7;
  void *v8;
  void *v9;

  if (!self->_baseImageProperties)
    return (NSDictionary *)MEMORY[0x1E0C9AA70];
  isRawSource = self->_isRawSource;
  result = self->_rawDictionary;
  if (isRawSource && result == 0)
  {
    inputImageSource = self->_inputImageSource;
    if (inputImageSource)
    {
      v7 = CGImageSourceCopyPropertiesAtIndex(inputImageSource, 0, (CFDictionaryRef)-[CIRAWFilterImpl rawOptions](self, "rawOptions"));
      v8 = (void *)objc_msgSend((id)(id)CFMakeCollectable(v7), "objectForKeyedSubscript:", CFSTR("{Raw}"));
      v9 = (void *)dictionaryDeepCopy(v8);
    }
    else
    {
      result = (NSDictionary *)self->_inputImageAndProperties;
      if (!result)
        return result;
      v9 = (void *)objc_msgSend((id)-[NSDictionary objectAtIndexedSubscript:](result, "objectAtIndexedSubscript:", 1), "objectForKeyedSubscript:", CFSTR("{Raw}"));
    }
    result = v9;
    self->_rawDictionary = result;
  }
  return result;
}

- (int)rawMajorVersion
{
  double v2;

  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[CIRAWFilterImpl rawDictionary](self, "rawDictionary"), "objectForKeyedSubscript:", CFSTR("version")), "doubleValue");
  return vcvtmd_s64_f64(v2);
}

- (NSArray)filters
{
  NSArray *result;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  objc_class *v13;
  NSString *v14;
  double v15;
  void *v16;
  NSNumber *inputMoireAmount;
  void *v18;
  const __CFString *v19;
  id v20;
  void *v21;
  const __CFString *v22;
  float v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  float v44;
  float v45;
  double v46;
  double v47;
  uint64_t v48;
  void *v49;
  const __CFString *v50;
  objc_class *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  float v56;
  float v57;
  float v58;
  double v59;
  uint64_t v60;
  CIFilter *v61;
  CIFilter *v62;
  CIFilter *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  result = self->_filters;
  if (!result)
  {
    v4 = -[NSDictionary objectForKeyedSubscript:](-[CIRAWFilterImpl rawDictionary](self, "rawDictionary"), "objectForKeyedSubscript:", CFSTR("filters"));
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
    if (!v6)
    {
      v62 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIExposureAdjust"));
      -[CIFilter setValue:forKey:](v62, "setValue:forKey:", self->inputEV, CFSTR("inputEV"));
      objc_msgSend(v5, "addObject:", v62);
      goto LABEL_56;
    }
    v7 = v6;
    v69 = 0;
    v68 = 0;
    v8 = *(_QWORD *)v74;
    v9 = CFSTR("inputExposure");
LABEL_4:
    v10 = 0;
    while (1)
    {
      v11 = v9;
      if (*(_QWORD *)v74 != v8)
        objc_enumerationMutation(v4);
      v12 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v10);
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      if (-[NSString isEqualToString:](v14, "isEqualToString:", CFSTR("RAWDemosaicFilter")))
        goto LABEL_19;
      if (-[NSString isEqualToString:](v14, "isEqualToString:", CFSTR("RAWGamutMap")))
      {
        if (-[NSNumber BOOLValue](self->inputDisableGamutMap, "BOOLValue"))
          goto LABEL_19;
        -[NSNumber floatValue](self->inputEnableEDRMode, "floatValue");
        *(float *)&v15 = fminf(fmaxf(*(float *)&v15, 0.0), 2.0);
        if (*(float *)&v15 > 0.0)
        {
          *(float *)&v15 = (float)(*(float *)&v15 * 2.0) + 1.0;
          objc_msgSend(v12, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15), CFSTR("inputGamutMapMax"));
        }
      }
      v16 = (void *)objc_msgSend(v12, "copy");
      objc_msgSend(v5, "addObject:", v16);

      if (objc_msgSend((id)objc_msgSend(v16, "inputKeys"), "containsObject:", CFSTR("inputDraftMode")))
        objc_msgSend(v16, "setValue:forKey:", self->inputDraftMode, CFSTR("inputDraftMode"));
      if (-[NSString isEqualToString:](v14, "isEqualToString:", CFSTR("RAWReduceNoise")))
      {
        objc_msgSend(v16, "setValue:forKey:", self->inputLuminanceNoiseReductionAmount, CFSTR("inputLNRAmount"));
        objc_msgSend(v16, "setValue:forKey:", self->inputColorNoiseReductionAmount, CFSTR("inputCNRAmount"));
        objc_msgSend(v16, "setValue:forKey:", self->inputNoiseReductionSharpnessAmount, CFSTR("inputSharpenAmount"));
        objc_msgSend(v16, "setValue:forKey:", self->inputNoiseReductionContrastAmount, CFSTR("inputContrastAmount"));
        objc_msgSend(v16, "setValue:forKey:", self->inputNoiseReductionDetailAmount, CFSTR("inputDetailAmount"));
        inputMoireAmount = self->inputMoireAmount;
        v18 = v16;
        v19 = CFSTR("inputMoireAmount");
        goto LABEL_18;
      }
      if (-[NSString isEqualToString:](v14, "isEqualToString:", CFSTR("RAWRadialLensCorrection")))
      {
        inputMoireAmount = self->inputEnableVendorLensCorrection;
        v18 = v16;
        v19 = CFSTR("inputLDCExecuteFlags");
        goto LABEL_18;
      }
      if (-[NSString isEqualToString:](v14, "isEqualToString:", CFSTR("RAWConvert")))
        break;
      if (-[NSString isEqualToString:](v14, "isEqualToString:", CFSTR("RAWAdjustTempTint")))
      {
        v20 = -[CIRAWFilterImpl whitePoint](self, "whitePoint");
        v21 = v16;
        v22 = CFSTR("inputWhitePoint");
        goto LABEL_26;
      }
      if (-[NSString isEqualToString:](v14, "isEqualToString:", CFSTR("RAWAdjustExposureAndBias")))
      {
        v9 = v11;
        objc_msgSend(v16, "setValue:forKey:", self->inputEV, v11);
        objc_msgSend(v16, "setValue:forKey:", -[CIRAWFilterImpl inputBaselineExposure](self, "inputBaselineExposure"), CFSTR("inputBaselineExposure"));
        objc_msgSend(v16, "setValue:forKey:", -[CIRAWFilterImpl inputBias](self, "inputBias"), CFSTR("inputBias"));
        objc_msgSend(-[CIRAWFilterImpl defaultInputLocalToneMapAmount](self, "defaultInputLocalToneMapAmount"), "floatValue");
        if (v23 > 0.0)
        {
          objc_msgSend(v16, "setValue:forKey:", &unk_1E2F1BD58, v11);
          v68 = 0;
          goto LABEL_20;
        }
        goto LABEL_29;
      }
      if (-[NSString isEqualToString:](v14, "isEqualToString:", CFSTR("RAWHueMagnet")))
      {
        v24 = (void *)MEMORY[0x1E0CB37E8];
        -[NSNumber doubleValue](self->inputBoost, "doubleValue");
        v26 = v25;
        -[NSNumber doubleValue](self->inputHueMagMR, "doubleValue");
        objc_msgSend(v16, "setValue:forKey:", objc_msgSend(v24, "numberWithDouble:", v26 * v27), CFSTR("inputHueMagMR"));
        v64 = (void *)MEMORY[0x1E0CB37E8];
        -[NSNumber doubleValue](self->inputBoost, "doubleValue");
        v29 = v28;
        -[NSNumber doubleValue](self->inputHueMagRY, "doubleValue");
        objc_msgSend(v16, "setValue:forKey:", objc_msgSend(v64, "numberWithDouble:", v29 * v30), CFSTR("inputHueMagRY"));
        v65 = (void *)MEMORY[0x1E0CB37E8];
        -[NSNumber doubleValue](self->inputBoost, "doubleValue");
        v32 = v31;
        -[NSNumber doubleValue](self->inputHueMagYG, "doubleValue");
        objc_msgSend(v16, "setValue:forKey:", objc_msgSend(v65, "numberWithDouble:", v32 * v33), CFSTR("inputHueMagYG"));
        v66 = (void *)MEMORY[0x1E0CB37E8];
        -[NSNumber doubleValue](self->inputBoost, "doubleValue");
        v35 = v34;
        -[NSNumber doubleValue](self->inputHueMagGC, "doubleValue");
        objc_msgSend(v16, "setValue:forKey:", objc_msgSend(v66, "numberWithDouble:", v35 * v36), CFSTR("inputHueMagGC"));
        v67 = (void *)MEMORY[0x1E0CB37E8];
        -[NSNumber doubleValue](self->inputBoost, "doubleValue");
        v38 = v37;
        -[NSNumber doubleValue](self->inputHueMagCB, "doubleValue");
        objc_msgSend(v16, "setValue:forKey:", objc_msgSend(v67, "numberWithDouble:", v38 * v39), CFSTR("inputHueMagCB"));
        v40 = (void *)MEMORY[0x1E0CB37E8];
        -[NSNumber doubleValue](self->inputBoost, "doubleValue");
        v42 = v41;
        -[NSNumber doubleValue](self->inputHueMagBM, "doubleValue");
        inputMoireAmount = (NSNumber *)objc_msgSend(v40, "numberWithDouble:", v42 * v43);
        v18 = v16;
        v19 = CFSTR("inputHueMagBM");
        goto LABEL_18;
      }
      if (!-[NSString isEqualToString:](v14, "isEqualToString:", CFSTR("RAWAdjustColorTRC")))
      {
        if (-[NSString isEqualToString:](v14, "isEqualToString:", CFSTR("RAWAdjustColors")))
        {
          inputMoireAmount = self->inputBoost;
          v18 = v16;
          v19 = CFSTR("inputBoostAmount");
          goto LABEL_18;
        }
        if (-[NSString isEqualToString:](v14, "isEqualToString:", CFSTR("RAWTemperatureAdjust")))
        {
          v9 = v11;
          objc_msgSend(v16, "setValue:forKey:", self->inputEV, v11);
          objc_msgSend(v16, "setValue:forKey:", -[CIRAWFilterImpl whitePoint](self, "whitePoint"), CFSTR("inputWhitePoint"));
          v69 = 1;
LABEL_29:
          v68 = 1;
          goto LABEL_20;
        }
        if (self->inputLinearSpaceFilter
          && (v51 = (objc_class *)objc_opt_class(),
              -[NSString isEqualToString:](NSStringFromClass(v51), "isEqualToString:", CFSTR("RAWLinearSpacePlaceholder"))))
        {
          objc_msgSend(v5, "addObject:", self->inputLinearSpaceFilter);
        }
        else if (-[NSString isEqualToString:](v14, "isEqualToString:", CFSTR("RAWProfileGainTableMap")))
        {
          -[NSNumber floatValue](self->inputEnableEDRMode, "floatValue");
          v57 = fminf(fmaxf(v56, 0.0), 2.0);
          -[NSNumber floatValue](self->inputLocalToneMapAmount, "floatValue");
          v59 = (v57 * -0.2 + 1.0) * v58;
          *(float *)&v59 = v59;
          inputMoireAmount = (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v59);
          v18 = v16;
          v19 = CFSTR("inputStrength");
LABEL_18:
          objc_msgSend(v18, "setValue:forKey:", inputMoireAmount, v19);
        }
LABEL_19:
        v9 = v11;
        goto LABEL_20;
      }
      objc_msgSend(v16, "setValue:forKey:", self->inputBoost, CFSTR("inputBoostAmount"));
      objc_msgSend(v16, "setValue:forKey:", self->inputBoostShadowAmount, CFSTR("inputBoostShadowAmount"));
      -[NSNumber floatValue](self->inputEnableEDRMode, "floatValue");
      v45 = fminf(fmaxf(v44, 0.0), 2.0);
      if (v45 <= 0.0)
        goto LABEL_19;
      v46 = v45;
      if (!objc_msgSend(v16, "valueForKey:", CFSTR("inputReferencePoints")))
      {
        objc_msgSend((id)objc_msgSend(v16, "valueForKey:", CFSTR("inputTRCy3")), "doubleValue");
        v53 = v52;
        objc_msgSend((id)objc_msgSend(v16, "valueForKey:", CFSTR("inputTRCs3")), "doubleValue");
        v55 = (v46 * 0.25 + 1.0 - (v53 + v54 * 0.2)) / 0.3;
        objc_msgSend(v16, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v46 * 0.25 + 1.0), CFSTR("inputTRCy4"));
        v9 = v11;
        v48 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v55);
        v49 = v16;
        v50 = CFSTR("inputTRCs4");
        goto LABEL_46;
      }
      v9 = v11;
      if (objc_msgSend((id)objc_msgSend(v16, "inputKeys"), "containsObject:", CFSTR("inputBoostHDRAmount")))
      {
        v47 = v46 * 0.75 + 1.0;
        *(float *)&v47 = v47;
        v48 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v47);
        v49 = v16;
        v50 = CFSTR("inputBoostHDRAmount");
LABEL_46:
        objc_msgSend(v49, "setValue:forKey:", v48, v50);
      }
LABEL_20:
      if (v7 == ++v10)
      {
        v60 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
        v7 = v60;
        if (!v60)
        {
          if ((v68 & v69 & 1) != 0)
            goto LABEL_57;
          if ((v68 & 1) == 0)
          {
            v61 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIExposureAdjust"));
            -[CIFilter setValue:forKey:](v61, "setValue:forKey:", self->inputEV, CFSTR("inputEV"));
            objc_msgSend(v5, "addObject:", v61);
          }
          if ((v69 & 1) != 0)
          {
LABEL_57:
            result = v5;
            self->_filters = result;
            return result;
          }
LABEL_56:
          v63 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIColorMatrix"));
          -[CIFilter setDefaults](v63, "setDefaults");
          v71 = 0;
          v72 = 0;
          v70 = 0;
          -[CIRAWFilterImpl getWhitePointVectorsR:g:b:](self, "getWhitePointVectorsR:g:b:", &v72, &v71, &v70);
          -[CIFilter setValue:forKey:](v63, "setValue:forKey:", v72, CFSTR("inputRVector"));
          -[CIFilter setValue:forKey:](v63, "setValue:forKey:", v71, CFSTR("inputGVector"));
          -[CIFilter setValue:forKey:](v63, "setValue:forKey:", v70, CFSTR("inputBVector"));
          objc_msgSend(v5, "addObject:", v63);
          goto LABEL_57;
        }
        goto LABEL_4;
      }
    }
    v20 = -[CIRAWFilterImpl whitePointArray](self, "whitePointArray");
    v21 = v16;
    v22 = CFSTR("inputNeutral");
LABEL_26:
    objc_msgSend(v21, "setValue:forKey:", v20, v22);
    v69 = 1;
    goto LABEL_19;
  }
  return result;
}

- (int)subsampling
{
  int result;
  float v4;
  float v5;
  _BOOL4 v6;
  float v7;

  if (-[NSNumber intValue](-[CIRAWFilterImpl sushiMode](self, "sushiMode"), "intValue") == 3)
    return 0;
  -[NSNumber floatValue](self->inputScaleFactor, "floatValue");
  v5 = v4;
  v6 = -[NSNumber BOOLValue](self->inputDraftMode, "BOOLValue");
  result = 0;
  if (v6)
  {
    v7 = 1.0 / v5;
    if ((float)(1.0 / v5) >= 0.5)
    {
      if (v7 >= 8.0)
        return 3;
      if (v7 >= 4.0)
        return 2;
      return v7 >= 2.0;
    }
  }
  return result;
}

- (void)invalidateFilters
{

  self->_rawDictionary = 0;
  self->_filters = 0;
}

- (void)invalidateInputImage
{
  -[CIRAWFilterImpl invalidateFilters](self, "invalidateFilters");

  self->_inputImage = 0;
}

- (id)rawOptions
{
  return -[CIRAWFilterImpl rawOptionsWithSubsampling:](self, "rawOptionsWithSubsampling:", 1);
}

- (id)rawOptionsWithSubsampling:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  NSString *inputDecoderVersion;
  NSNumber *inputEnableSharpening;
  NSNumber *inputEnableNoiseTracking;
  NSNumber *inputNoiseReductionAmount;
  NSNumber *inputLuminanceNoiseReductionAmount;
  NSNumber *inputColorNoiseReductionAmount;
  NSNumber *inputNoiseReductionSharpnessAmount;
  NSNumber *inputNoiseReductionContrastAmount;
  NSNumber *inputNoiseReductionDetailAmount;
  NSNumber *inputMoireAmount;
  NSNumber *inputEnableVendorLensCorrection;
  NSNumber *inputEnableEDRMode;
  void *v19;
  uint64_t v20;
  NSNumber *v21;
  NSObject *typeIdentifierHint;
  int v23;
  void *v24;

  v3 = a3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = v5;
  inputDecoderVersion = self->inputDecoderVersion;
  if (inputDecoderVersion)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", inputDecoderVersion, *MEMORY[0x1E0CBD270]);
  inputEnableSharpening = self->inputEnableSharpening;
  if (inputEnableSharpening)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", inputEnableSharpening, *MEMORY[0x1E0CBD228]);
  inputEnableNoiseTracking = self->inputEnableNoiseTracking;
  if (inputEnableNoiseTracking)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", inputEnableNoiseTracking, *MEMORY[0x1E0CBD1F0]);
  inputNoiseReductionAmount = self->inputNoiseReductionAmount;
  if (inputNoiseReductionAmount)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", inputNoiseReductionAmount, CFSTR("kCGImageSourceNoiseReductionAmount"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", self->inputNoiseReductionAmount, CFSTR("kCGImageSourceLuminanceNoiseReductionAmount"));
  }
  inputLuminanceNoiseReductionAmount = self->inputLuminanceNoiseReductionAmount;
  if (inputLuminanceNoiseReductionAmount)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", inputLuminanceNoiseReductionAmount, CFSTR("kCGImageSourceLuminanceNoiseReductionAmount"));
  inputColorNoiseReductionAmount = self->inputColorNoiseReductionAmount;
  if (inputColorNoiseReductionAmount)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", inputColorNoiseReductionAmount, CFSTR("kCGImageSourceColorNoiseReductionAmount"));
  inputNoiseReductionSharpnessAmount = self->inputNoiseReductionSharpnessAmount;
  if (inputNoiseReductionSharpnessAmount)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", inputNoiseReductionSharpnessAmount, CFSTR("kCGImageSourceNoiseReductionSharpnessAmount"));
  inputNoiseReductionContrastAmount = self->inputNoiseReductionContrastAmount;
  if (inputNoiseReductionContrastAmount)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", inputNoiseReductionContrastAmount, CFSTR("kCGImageSourceNoiseReductionContrastAmount"));
  inputNoiseReductionDetailAmount = self->inputNoiseReductionDetailAmount;
  if (inputNoiseReductionDetailAmount)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", inputNoiseReductionDetailAmount, CFSTR("kCGImageSourceNoiseReductionDetailAmount"));
  inputMoireAmount = self->inputMoireAmount;
  if (inputMoireAmount)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", inputMoireAmount, CFSTR("kCGImageSourceChromaBlurMoireAmount"));
  inputEnableVendorLensCorrection = self->inputEnableVendorLensCorrection;
  if (inputEnableVendorLensCorrection)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", inputEnableVendorLensCorrection, CFSTR("kCGImageSourceDisableVendorLensDistortionCorrection"));
  inputEnableEDRMode = self->inputEnableEDRMode;
  if (inputEnableEDRMode)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", inputEnableEDRMode, CFSTR("kCGImageSourceUseEDRMode"));
  v19 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v20 = *MEMORY[0x1E0CBD200];
  objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CBD200]);
  if (-[CIRAWFilterImpl sushiMode](self, "sushiMode"))
  {
    v21 = -[CIRAWFilterImpl sushiMode](self, "sushiMode");
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0CBD258]);
  }
  objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("kCGImageSourceShouldUseRawDataForFullSize"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CBD210]);
  objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CBD240]);
  objc_msgSend(v19, "setObject:forKeyedSubscript:", &unk_1E2F1BD10, v20);
  typeIdentifierHint = self->_typeIdentifierHint;
  if (typeIdentifierHint)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", typeIdentifierHint, *MEMORY[0x1E0CBD2A8]);
  if (v3 && -[NSNumber intValue](-[CIRAWFilterImpl sushiMode](self, "sushiMode"), "intValue") <= 2)
  {
    v23 = -[CIRAWFilterImpl subsampling](self, "subsampling");
    if (v23 < 1)
      v24 = &unk_1E2F1BD10;
    else
      v24 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (1 << v23));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0CBD290]);
  }
  if (self->inputDecoderVersion)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v19, "setObject:forKeyedSubscript:", self->inputDecoderVersion, *MEMORY[0x1E0CBD270]);
  }
  return v19;
}

- (void)setTempTintAtPoint:(CGPoint)a3
{
  double y;
  double x;
  id v6;
  float v7;
  float v8;
  double v9;
  float v10;
  float v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  float32x2_t v26;
  float v27;
  float v28;
  NSArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  float v33;
  uint64_t i;
  void *v35;
  objc_class *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  float32x2_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  vImage_Buffer dest;
  vImage_Buffer src;
  _QWORD v49[3];
  _BYTE v50[128];
  float32x2_t v51;
  float v52;
  uint64_t v53;

  y = a3.y;
  x = a3.x;
  v53 = *MEMORY[0x1E0C80C00];
  v6 = -[CIRAWFilterImpl transformedImageIgnoringOrientation:andIgnoringScaleFactor:](self, "transformedImageIgnoringOrientation:andIgnoringScaleFactor:", 0, 0);
  v7 = x;
  v8 = roundf(v7);
  v9 = v8;
  v10 = y;
  v11 = roundf(v10);
  v12 = v11;
  objc_msgSend(v6, "extent");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v6, "extent");
  v52 = 0.0;
  v51 = 0;
  if (v8 >= 9.0 && v11 >= 9.0 && v17 + -9.0 >= v9 && v18 + -9.0 >= v12)
  {
    v22 = malloc_type_malloc(0x288uLL, 0x1000040BDFB0063uLL);
    v23 = (char *)malloc_type_malloc(0x510uLL, 0x100004052888210uLL);
    v24 = v23;
    if (v23 && v22)
    {
      objc_msgSend(+[CIContext _singletonContext](CIContext, "_singletonContext"), "render:toBitmap:rowBytes:bounds:format:colorSpace:", v6, v22, 72, 2056, objc_msgSend(v6, "colorSpace"), v14 + v9 + -4.0, v16 + v12 + -4.0, 9.0, 9.0);
      *(_OWORD *)&src.height = xmmword_192496DC0;
      src.rowBytes = 72;
      dest.data = v24;
      *(_OWORD *)&dest.height = xmmword_192496DC0;
      dest.rowBytes = 144;
      src.data = v22;
      vImageConvert_Planar16FtoPlanarF(&src, &dest, 0);
      v25 = 0;
      v26 = 0;
      v27 = 0.0;
      do
      {
        v26 = vadd_f32(*(float32x2_t *)&v24[v25], v26);
        v27 = *(float *)&v24[v25 + 8] + v27;
        v25 += 16;
      }
      while (v25 != 1296);
      free(v22);
      free(v24);
      v42 = vdiv_f32(v26, (float32x2_t)vdup_n_s32(0x42A20000u));
      v51 = v42;
      v28 = v27 / 81.0;
      v52 = v28;
      if ((int)objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](self, "valueForKey:", CFSTR("inputDecoderVersion")), "intValue") < 2)
      {
        src.data = 0;
        dest.data = 0;
        CI_GenericRGBLinear_to_TempTint((float *)&v51, (double *)&src, (double *)&dest);
        -[CIRAWFilterImpl setInputNeutralTemperature:](self, "setInputNeutralTemperature:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&src.data));
        -[CIRAWFilterImpl setInputNeutralTint:](self, "setInputNeutralTint:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&dest.data));
      }
      else
      {
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v29 = -[CIRAWFilterImpl filters](self, "filters");
        v30 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v44;
          v33 = v28 / v42.f32[1];
          while (2)
          {
            for (i = 0; i != v31; ++i)
            {
              if (*(_QWORD *)v44 != v32)
                objc_enumerationMutation(v29);
              v35 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
              v36 = (objc_class *)objc_opt_class();
              if (-[NSString isEqualToString:](NSStringFromClass(v36), "isEqualToString:", CFSTR("RAWConvert")))
              {
                v37 = (void *)objc_msgSend(v35, "copy");
                *(float *)&v38 = v42.f32[0] / v42.f32[1];
                v49[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v38);
                *(float *)&v39 = v42.f32[1] / v42.f32[1];
                v49[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v39);
                *(float *)&v40 = v33;
                v49[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v40);
                objc_msgSend(v37, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 3), CFSTR("inputNeutral"));
                v41 = (void *)objc_msgSend(v37, "performSelector:", NSSelectorFromString(CFSTR("inputNeutralXY")));
                -[CIRAWFilterImpl setInputNeutralChromaticityX:](self, "setInputNeutralChromaticityX:", objc_msgSend(v41, "objectAtIndexedSubscript:", 0));
                -[CIRAWFilterImpl setInputNeutralChromaticityY:](self, "setInputNeutralChromaticityY:", objc_msgSend(v41, "objectAtIndexedSubscript:", 1));

                return;
              }
            }
            v31 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
            if (v31)
              continue;
            break;
          }
        }
      }
    }
    else
    {
      if (v22)
        free(v22);
      if (v24)
        free(v24);
    }
  }
}

- (CGSize)nativeSize
{
  CGSize *p_nativeSize;
  CFDictionaryRef v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  NSArray *inputImageAndProperties;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  double width;
  double height;
  CGSize result;

  p_nativeSize = &self->_nativeSize;
  if (self->_nativeSize.width < 0.0)
  {
    if (self->_inputImageSource)
    {
      v3 = CGImageSourceCopyPropertiesAtIndex(self->_inputImageSource, 0, (CFDictionaryRef)-[CIRAWFilterImpl rawOptionsWithSubsampling:](self, "rawOptionsWithSubsampling:", 0));
      v4 = (void *)-[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("PixelWidth"));
      v5 = (void *)-[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("PixelHeight"));
      v6 = (void *)objc_msgSend((id)-[__CFDictionary valueForKeyPath:](v3, "valueForKeyPath:", CFSTR("{Raw}.filters")), "objectAtIndexedSubscript:", 0);
      v7 = (objc_class *)objc_opt_class();
      if (-[NSString isEqualToString:](NSStringFromClass(v7), "isEqualToString:", CFSTR("RAWDemosaicFilter")))
      {
        v8 = (void *)objc_msgSend(v6, "valueForKey:", CFSTR("inputCropRect"));
        if (v8)
        {
          v9 = v8;
          v10 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v8, "Z");
          v4 = (void *)objc_msgSend(v10, "numberWithDouble:");
          v11 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v9, "W");
          v5 = (void *)objc_msgSend(v11, "numberWithDouble:");
        }
      }
      if (v4)
        v12 = v5 == 0;
      else
        v12 = 1;
      if (!v12)
      {
        objc_msgSend(v4, "doubleValue");
        v14 = v13;
        objc_msgSend(v5, "doubleValue");
        p_nativeSize->width = v14;
        p_nativeSize->height = v15;
      }
      if (v3)
        CFRelease(v3);
    }
    else
    {
      inputImageAndProperties = self->_inputImageAndProperties;
      if (inputImageAndProperties)
      {
        v17 = -[NSArray objectAtIndexedSubscript:](inputImageAndProperties, "objectAtIndexedSubscript:", 1);
        v18 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("PixelWidth"));
        v19 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("PixelHeight"));
        if (!v18)
          v18 = (void *)objc_msgSend(v17, "valueForKeyPath:", CFSTR("{Exif}.PixelXDimension"));
        if (!v19)
          v19 = (void *)objc_msgSend(v17, "valueForKeyPath:", CFSTR("{Exif}.PixelYDimension"));
        v20 = (void *)objc_msgSend((id)objc_msgSend(v17, "valueForKeyPath:", CFSTR("{Raw}.filters")), "objectAtIndexedSubscript:", 0);
        v21 = (objc_class *)objc_opt_class();
        if (-[NSString isEqualToString:](NSStringFromClass(v21), "isEqualToString:", CFSTR("RAWDemosaicFilter")))
        {
          v22 = (void *)objc_msgSend(v20, "valueForKey:", CFSTR("inputCropRect"));
          if (v22)
          {
            v23 = v22;
            v24 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v22, "Z");
            v18 = (void *)objc_msgSend(v24, "numberWithDouble:");
            v25 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v23, "W");
            v19 = (void *)objc_msgSend(v25, "numberWithDouble:");
          }
        }
        if (v18)
          v26 = v19 == 0;
        else
          v26 = 1;
        if (!v26)
        {
          objc_msgSend(v18, "doubleValue");
          v28 = v27;
          objc_msgSend(v19, "doubleValue");
          p_nativeSize->width = v28;
          p_nativeSize->height = v29;
        }
      }
    }
  }
  width = p_nativeSize->width;
  height = p_nativeSize->height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGAffineTransform)getScaleTransform:(SEL)a3
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  char v15;
  CGAffineTransform v17;

  -[CIRAWFilterImpl nativeSize](self, "nativeSize");
  v8 = v7;
  v10 = v9;
  objc_msgSend(a4, "extent");
  v12 = v11;
  -[NSNumber doubleValue](self->inputScaleFactor, "doubleValue");
  v14 = v13;
  v15 = -[CIRAWFilterImpl subsampling](self, "subsampling");
  memset(&v17, 0, sizeof(v17));
  CGAffineTransformMakeScale(&v17, v14 * (double)(1 << v15), v14 * (double)(1 << v15));
  return CGAffineTransformMakeScale(retstr, (v10 * v17.c + v17.a * v8) / v12, (v10 * v17.c + v17.a * v8) / v12);
}

- (CGAffineTransform)getOrientationTransform:(SEL)a3
{
  double v7;
  double v8;
  double v9;
  double v10;
  NSNumber *inputIgnoreOrientation;
  CGAffineTransform *result;
  uint64_t v13;
  __int128 v14;
  float v15;
  float v16;
  int v17;
  __int128 *v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[11];
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  double v32;
  __int128 v33;
  __int128 v34;
  double v35;
  double v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  double v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "extent");
  v8 = v7;
  objc_msgSend(a4, "extent");
  v10 = v9;
  inputIgnoreOrientation = self->inputIgnoreOrientation;
  if (inputIgnoreOrientation
    && (result = (CGAffineTransform *)-[NSNumber BOOLValue](inputIgnoreOrientation, "BOOLValue"), (_DWORD)result))
  {
    v13 = MEMORY[0x1E0C9BAA8];
    v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v14;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v13 + 32);
  }
  else
  {
    v15 = v8;
    v16 = v10;
    result = (CGAffineTransform *)-[NSNumber intValue](self->inputImageOrientation, "intValue");
    v21[0] = 0x3FF0000000000000;
    v21[1] = 0;
    v21[2] = 0;
    v21[3] = 0x3FF0000000000000;
    v21[4] = 0;
    v21[5] = 0;
    v21[6] = 0xBFF0000000000000;
    v21[7] = 0;
    v21[8] = 0;
    v21[9] = 0x3FF0000000000000;
    *(double *)&v21[10] = v15;
    v22 = xmmword_1924948E0;
    v23 = 0;
    v24 = 0;
    v25 = 0xBFF0000000000000;
    v26 = v15;
    v27 = v16;
    v29 = 0;
    v30 = 0;
    v28 = 0x3FF0000000000000;
    v31 = xmmword_192493540;
    v32 = v16;
    v33 = xmmword_1924948E0;
    v34 = xmmword_192493540;
    v35 = v16;
    v36 = v15;
    v37 = xmmword_1924948E0;
    v39 = 0;
    v40 = 0;
    v38 = 0x3FF0000000000000;
    v41 = v15;
    v42 = xmmword_1924948F0;
    v45 = 0u;
    v44 = 0u;
    v43 = 0x3FF0000000000000;
    v46 = 0x3FF0000000000000;
    v47 = xmmword_192493540;
    v48 = v16;
    v49 = 0;
    if (((_DWORD)result - 9) >= 0xFFFFFFF8)
      v17 = (_DWORD)result - 1;
    else
      v17 = 0;
    v18 = (__int128 *)&v21[6 * v17];
    v19 = v18[2];
    v20 = *v18;
    *(_OWORD *)&retstr->c = v18[1];
    *(_OWORD *)&retstr->tx = v19;
    *(_OWORD *)&retstr->a = v20;
  }
  return result;
}

- (id)transformedImageIgnoringOrientation:(BOOL)a3 andIgnoringScaleFactor:(BOOL)a4
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  objc_class *v24;
  NSString *v25;
  BOOL v26;
  CIRAWFilterImpl *v27;
  __int128 v28;
  __int128 v29;
  BOOL v31;
  NSArray *obj;
  _OWORD v33[3];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (self->_isRawSource && !-[NSArray count](self->_supportedDecoderVersions, "count"))
    return 0;
  v31 = a3;
  v7 = -[CIRAWFilterImpl inputImage](self, "inputImage");
  v45 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  if (a4)
  {
    v8 = *MEMORY[0x1E0C9BAA8];
    v9 = *(double *)(MEMORY[0x1E0C9BAA8] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9BAA8] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9BAA8] + 24);
  }
  else
  {
    -[CIRAWFilterImpl getScaleTransform:](self, "getScaleTransform:", v7);
    v9 = *((double *)&v42 + 1);
    v8 = *(double *)&v42;
    v11 = *((double *)&v43 + 1);
    v10 = *(double *)&v43;
    v45 = v44;
  }
  v40 = 0u;
  v41 = 0u;
  v12 = fmax(fabs(v8), fmax(fabs(v9), fmax(fabs(v10), fabs(v11))));
  v38 = 0u;
  v39 = 0u;
  v13 = -[CIRAWFilterImpl filters](self, "filters");
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v39 != v17)
          objc_enumerationMutation(v13);
        v16 |= objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "isEqualToString:", CFSTR("RAWCropFilter"));
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v15);
    if (v16 & 1 | (v12 > 1.0))
      goto LABEL_15;
  }
  else if (v12 > 1.0)
  {
    goto LABEL_15;
  }
  *(double *)&v42 = v8;
  *((double *)&v42 + 1) = v9;
  *(double *)&v43 = v10;
  *((double *)&v43 + 1) = v11;
  v44 = v45;
  v7 = (id)scaleImageWithQuality(v7, &v42);
LABEL_15:
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = -[CIRAWFilterImpl filters](self, "filters");
  v19 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v35 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        v24 = (objc_class *)objc_opt_class();
        v25 = NSStringFromClass(v24);
        if (-[NSString isEqualToString:](v25, "isEqualToString:", CFSTR("CIAffineTransform"))
          || -[NSString isEqualToString:](v25, "isEqualToString:", CFSTR("CILanczosScaleTransform"))
          || -[NSString isEqualToString:](v25, "isEqualToString:", CFSTR("RAWCropFilter")))
        {
          objc_msgSend(v23, "setValue:forKey:", v7, CFSTR("inputImage"));
          v7 = (id)objc_msgSend(v23, "outputImage");
        }
        if (-[NSString isEqualToString:](v25, "isEqualToString:", CFSTR("RAWCropFilter")))
          v26 = v12 <= 1.0;
        else
          v26 = 0;
        if (v26)
        {
          *(double *)&v42 = v8;
          *((double *)&v42 + 1) = v9;
          *(double *)&v43 = v10;
          *((double *)&v43 + 1) = v11;
          v44 = v45;
          v7 = (id)scaleImageWithQuality(v7, &v42);
        }
        objc_msgSend(v23, "setValue:forKey:", 0, CFSTR("inputImage"));
      }
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    }
    while (v20);
  }
  if (v12 <= 1.0)
  {
    v27 = self;
  }
  else
  {
    v27 = self;
    if (self)
    {
      -[CIRAWFilterImpl getScaleTransform:](self, "getScaleTransform:", v7);
      v28 = v42;
      v29 = v43;
    }
    else
    {
      v28 = 0uLL;
      v43 = 0u;
      v44 = 0u;
      v42 = 0u;
      v29 = 0uLL;
    }
    v45 = v44;
    v42 = v28;
    v43 = v29;
    v7 = (id)scaleImageWithQuality(v7, &v42);
  }
  if (!v31)
  {
    v43 = 0u;
    v44 = 0u;
    v42 = 0u;
    if (v27)
      -[CIRAWFilterImpl getOrientationTransform:](v27, "getOrientationTransform:", v7);
    v33[0] = v42;
    v33[1] = v43;
    v33[2] = v44;
    return (id)objc_msgSend(v7, "imageByApplyingTransform:", v33);
  }
  return v7;
}

- (id)outputImage
{
  CGImageSource *inputImageSource;
  id v5;
  int v7;
  double v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  void *v21;
  int v22;
  CFStringRef *v23;
  CGColorSpaceRef v24;
  CGColorSpaceRef v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  NSNumber *inputIgnoreOrientation;
  NSNumber *defaultOrientation;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  CIRAWFilterImpl *v42;
  _OWORD v43[3];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  NSString *matteOption;
  _QWORD v61[3];

  v61[1] = *MEMORY[0x1E0C80C00];
  if (self->_matteOption)
  {
    inputImageSource = self->_inputImageSource;
    matteOption = self->_matteOption;
    v61[0] = MEMORY[0x1E0C9AAB0];
    return +[CIImage imageWithCGImageSource:index:options:](CIImage, "imageWithCGImageSource:index:options:", inputImageSource, 0, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, &matteOption, 1));
  }
  if (self->_isRawSource && !-[NSArray count](self->_supportedDecoderVersions, "count"))
    return 0;
  v5 = -[CIRAWFilterImpl inputImage](self, "inputImage");
  v7 = objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](self, "valueForKey:", CFSTR("inputReturnDemosaiced")), "BOOLValue");
  v56 = 0u;
  v57 = 0u;
  v55 = 0u;
  -[CIRAWFilterImpl getScaleTransform:](self, "getScaleTransform:", v5);
  v8 = fmax(fabs(*(double *)&v55), fmax(fabs(*((double *)&v55 + 1)), fmax(fabs(*(double *)&v56), fabs(*((double *)&v56 + 1)))));
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v9 = -[CIRAWFilterImpl filters](self, "filters");
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v52;
LABEL_9:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v52 != v12)
        objc_enumerationMutation(v9);
      if ((objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "isEqualToString:", CFSTR("RAWCropFilter")) & 1) != 0)break;
      if (v11 == ++v13)
      {
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
        if (v11)
          goto LABEL_9;
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:
    if (v8 <= 1.0)
    {
      v48 = v55;
      v49 = v56;
      v50 = v57;
      v5 = (id)scaleImageWithQuality(v5, &v48);
    }
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = self;
  v14 = -[CIRAWFilterImpl filters](self, "filters");
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
  if (!v15)
  {
LABEL_33:
    if (v8 > 1.0)
    {
      -[CIRAWFilterImpl getScaleTransform:](v42, "getScaleTransform:", v5);
      v56 = v49;
      v57 = v50;
      v55 = v48;
      v5 = (id)scaleImageWithQuality(v5, &v48);
    }
    v49 = 0u;
    v50 = 0u;
    v48 = 0u;
    -[CIRAWFilterImpl getOrientationTransform:](v42, "getOrientationTransform:", v5);
    v43[0] = v48;
    v43[1] = v49;
    v43[2] = v50;
    v21 = (void *)objc_msgSend(v5, "imageByApplyingTransform:", v43);
    v22 = -[NSString intValue](v42->inputDecoderVersion, "intValue");
    v23 = (CFStringRef *)MEMORY[0x1E0C9D908];
    if (v22 <= 6)
      v23 = (CFStringRef *)MEMORY[0x1E0C9D8F8];
    v24 = CGColorSpaceCreateWithName(*v23);
    if (v24)
    {
      v25 = v24;
      v21 = (void *)objc_msgSend(v21, "imageByTaggingWithColorSpace:", v24);
      CFRelease(v25);
    }
    v26 = (id)-[NSDictionary mutableCopy](v42->_baseImageProperties, "mutableCopy");
    v27 = *MEMORY[0x1E0CBD090];
    v28 = (id)objc_msgSend((id)objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD090]), "mutableCopy");
    v29 = *MEMORY[0x1E0CBCB50];
    v30 = (id)objc_msgSend((id)objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCB50]), "mutableCopy");
    if (v28)
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v28, v27);
    if (v30)
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v30, v29);
    inputIgnoreOrientation = v42->inputIgnoreOrientation;
    if (inputIgnoreOrientation && -[NSNumber BOOLValue](inputIgnoreOrientation, "BOOLValue"))
      defaultOrientation = v42->_defaultOrientation;
    else
      defaultOrientation = (NSNumber *)&unk_1E2F1BD10;
    v33 = *MEMORY[0x1E0CBCFF0];
    if (objc_msgSend(v26, "valueForKey:", *MEMORY[0x1E0CBCFF0]))
      objc_msgSend(v26, "setValue:forKey:", defaultOrientation, v33);
    if (objc_msgSend(v28, "objectForKeyedSubscript:", v33))
      objc_msgSend(v28, "setValue:forKey:", defaultOrientation, v33);
    objc_msgSend(v21, "extent");
    v35 = v34;
    v37 = v36;
    v38 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v34);
    objc_msgSend(v26, "setValue:forKey:", v38, *MEMORY[0x1E0CBD048]);
    v39 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v37);
    objc_msgSend(v26, "setValue:forKey:", v39, *MEMORY[0x1E0CBD040]);
    v40 = *MEMORY[0x1E0CBCC28];
    if (objc_msgSend(v30, "valueForKey:", *MEMORY[0x1E0CBCC28]))
      objc_msgSend(v30, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v35), v40);
    v41 = *MEMORY[0x1E0CBCC30];
    if (objc_msgSend(v30, "valueForKey:", *MEMORY[0x1E0CBCC30]))
      objc_msgSend(v30, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v37), v41);
    return (id)objc_msgSend(v21, "imageBySettingProperties:", v26);
  }
  v16 = v15;
  v17 = *(_QWORD *)v45;
LABEL_19:
  v18 = 0;
  while (1)
  {
    if (*(_QWORD *)v45 != v17)
      objc_enumerationMutation(v14);
    v19 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v18);
    if (objc_msgSend((id)objc_msgSend(v19, "inputKeys"), "containsObject:", CFSTR("inputScaleFactor")))
      objc_msgSend(v19, "setValue:forKey:", -[CIRAWFilterImpl valueForKey:](v42, "valueForKey:", CFSTR("inputScaleFactor")), CFSTR("inputScaleFactor"));
    objc_msgSend(v19, "setValue:forKey:", v5, CFSTR("inputImage"));
    v5 = (id)objc_msgSend(v19, "outputImage");
    if (objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "isEqualToString:", CFSTR("RAWCropFilter")))v20 = v8 <= 1.0;
    else
      v20 = 0;
    if (v20)
    {
      v48 = v55;
      v49 = v56;
      v50 = v57;
      v5 = (id)scaleImageWithQuality(v5, &v48);
    }
    objc_msgSend(v19, "setValue:forKey:", 0, CFSTR("inputImage"));
    if ((objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "isEqualToString:", CFSTR("RAWReduceNoise")) & v7 & 1) != 0)return v5;
    if (v16 == ++v18)
    {
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
      if (v16)
        goto LABEL_19;
      goto LABEL_33;
    }
  }
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  objc_super v6;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("inputNeutralChromaticityX")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("inputNeutralChromaticityY")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("inputNeutralTemperature")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("inputNeutralTint")) & 1) != 0)
  {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CIRAWFilterImpl;
  return objc_msgSendSuper2(&v6, sel_automaticallyNotifiesObserversForKey_, a3);
}

- (id)RAWFiltersValueForKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = -[NSDictionary objectForKeyedSubscript:](-[CIRAWFilterImpl rawDictionary](self, "rawDictionary"), "objectForKeyedSubscript:", CFSTR("filters"));
  v5 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  if ((unint64_t)objc_msgSend(v5, "count") <= 2)
  {
    if (!objc_msgSend(v5, "count"))
      return v4;
    v6 = (void *)objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v4);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v6, "isEqual:", objc_msgSend((id)objc_opt_class(), "description")))
            v9 = v12;
        }
        v8 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }
    if (objc_msgSend(v5, "count") == 1)
      return v9;
    v13 = objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    if (objc_msgSend((id)objc_msgSend(v9, "inputKeys"), "containsObject:", v13))
      return (id)objc_msgSend(v9, "valueForKey:", v13);
  }
  return 0;
}

- (id)inputImage
{
  id result;
  CGImageSource *inputImageSource;
  CGImageRef ImageAtIndex;
  CGImage *v6;
  id v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  objc_class *v12;

  result = self->_inputImage;
  if (result)
    return result;
  inputImageSource = self->_inputImageSource;
  if (inputImageSource)
  {
    ImageAtIndex = CGImageSourceCreateImageAtIndex(inputImageSource, 0, (CFDictionaryRef)-[CIRAWFilterImpl rawOptions](self, "rawOptions"));
    if (ImageAtIndex)
    {
      v6 = ImageAtIndex;
      v7 = -[NSDictionary objectForKeyedSubscript:](-[CIRAWFilterImpl rawDictionary](self, "rawDictionary"), "objectForKeyedSubscript:", CFSTR("filters"));
      v8 = (void *)objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      if (objc_msgSend(v7, "count")
        && (v9 = (objc_class *)objc_opt_class(),
            -[NSString isEqualToString:](NSStringFromClass(v9), "isEqualToString:", CFSTR("RAWDemosaicFilter"))))
      {
        objc_msgSend(v8, "setValue:forKey:", -[CIImage imageBySettingProperties:](+[CIImage imageWithCGImage:](CIImage, "imageWithCGImage:", v6), "imageBySettingProperties:", self->_baseImageProperties), CFSTR("inputImage"));
        if (objc_msgSend((id)objc_msgSend(v8, "inputKeys"), "containsObject:", CFSTR("inputDraftMode")))
          objc_msgSend(v8, "setValue:forKey:", self->inputDraftMode, CFSTR("inputDraftMode"));
        if (objc_msgSend((id)objc_msgSend(v8, "inputKeys"), "containsObject:", CFSTR("inputScaleFactor")))
          objc_msgSend(v8, "setValue:forKey:", self->inputScaleFactor, CFSTR("inputScaleFactor"));
        self->_inputImage = (CIImage *)(id)objc_msgSend(v8, "outputImage");
        objc_msgSend(v8, "setValue:forKey:", 0, CFSTR("inputImage"));
      }
      else
      {
        self->_inputImage = -[CIImage imageBySettingProperties:](+[CIImage imageWithCGImage:](CIImage, "imageWithCGImage:", v6), "imageBySettingProperties:", self->_baseImageProperties);
      }
      CGImageRelease(v6);
      result = self->_inputImage;
      if (!result)
        -[CIRAWFilterImpl(CustomAccessors) inputImage].cold.2();
      return result;
    }
LABEL_21:
    result = +[CIImage emptyImage](CIImage, "emptyImage");
    self->_inputImage = (CIImage *)result;
    return result;
  }
  if (!self->_inputImageAndProperties)
    goto LABEL_21;
  v10 = -[NSDictionary objectForKeyedSubscript:](-[CIRAWFilterImpl rawDictionary](self, "rawDictionary"), "objectForKeyedSubscript:", CFSTR("filters"));
  v11 = (void *)objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  if (!objc_msgSend(v10, "count")
    || (v12 = (objc_class *)objc_opt_class(),
        !-[NSString isEqualToString:](NSStringFromClass(v12), "isEqualToString:", CFSTR("RAWDemosaicFilter"))))
  {
    result = (id)objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_inputImageAndProperties, "objectAtIndexedSubscript:", 0), "imageBySettingProperties:", self->_baseImageProperties);
    self->_inputImage = (CIImage *)result;
    if (result)
      return result;
LABEL_26:
    -[CIRAWFilterImpl(CustomAccessors) inputImage].cold.1();
  }
  objc_msgSend(v11, "setValue:forKey:", objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_inputImageAndProperties, "objectAtIndexedSubscript:", 0), "imageBySettingProperties:", self->_baseImageProperties), CFSTR("inputImage"));
  if (objc_msgSend((id)objc_msgSend(v11, "inputKeys"), "containsObject:", CFSTR("inputDraftMode")))
    objc_msgSend(v11, "setValue:forKey:", self->inputDraftMode, CFSTR("inputDraftMode"));
  if (objc_msgSend((id)objc_msgSend(v11, "inputKeys"), "containsObject:", CFSTR("inputScaleFactor")))
    objc_msgSend(v11, "setValue:forKey:", self->inputScaleFactor, CFSTR("inputScaleFactor"));
  self->_inputImage = (CIImage *)(id)objc_msgSend(v11, "outputImage");
  objc_msgSend(v11, "setValue:forKey:", 0, CFSTR("inputImage"));
  result = self->_inputImage;
  if (!result)
    goto LABEL_26;
  return result;
}

- (id)defaultImageOrientation
{
  void *v3;
  uint64_t v4;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  if (-[NSNumber BOOLValue](self->inputIgnoreOrientation, "BOOLValue")
    || -[NSNumber intValue](self->_defaultOrientation, "intValue") <= 8
    && -[NSNumber intValue](self->_defaultOrientation, "intValue") < 1)
  {
    v4 = 1;
  }
  else if (-[NSNumber intValue](self->_defaultOrientation, "intValue") <= 8)
  {
    v4 = -[NSNumber intValue](self->_defaultOrientation, "intValue");
  }
  else
  {
    v4 = 8;
  }
  return (id)objc_msgSend(v3, "numberWithInt:", v4);
}

- (id)inputNeutralLocation
{
  return objc_alloc_init(CIVector);
}

- (void)setInputNeutralLocation:(id)a3
{
  double v5;
  double v6;
  double v7;

  if (!self->_calledDealloc)
  {
    objc_msgSend(a3, "X");
    v6 = v5;
    objc_msgSend(a3, "Y");
    -[CIRAWFilterImpl setTempTintAtPoint:](self, "setTempTintAtPoint:", v6, v7);
  }
}

- (void)setInputScaleFactor:(id)a3
{
  NSNumber *inputScaleFactor;
  int v6;
  double v7;
  NSNumber *v8;

  if (!self->_calledDealloc)
  {
    inputScaleFactor = self->inputScaleFactor;
    if (a3)
    {
      if (inputScaleFactor)
      {
        if ((objc_msgSend(a3, "isEqualToValue:", inputScaleFactor) & 1) != 0)
          return;
        inputScaleFactor = self->inputScaleFactor;
      }
      v6 = -[CIRAWFilterImpl subsampling](self, "subsampling");
      objc_msgSend(a3, "doubleValue");
      v8 = (NSNumber *)(id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fmax(fmin(v7, 1.0), 0.0));
    }
    else
    {
      v6 = -[CIRAWFilterImpl subsampling](self, "subsampling");
      v8 = 0;
    }
    self->inputScaleFactor = v8;

    if (-[CIRAWFilterImpl subsampling](self, "subsampling") != v6 || !self->_inputImage)
      -[CIRAWFilterImpl invalidateInputImage](self, "invalidateInputImage");
  }
}

- (void)setInputDraftMode:(id)a3
{
  int v5;
  NSNumber *inputDraftMode;
  int v7;

  if (!self->_calledDealloc)
  {
    v5 = -[NSNumber BOOLValue](self->inputDraftMode, "BOOLValue");
    if (v5 != objc_msgSend(a3, "BOOLValue"))
    {
      inputDraftMode = self->inputDraftMode;
      v7 = -[CIRAWFilterImpl subsampling](self, "subsampling");
      self->inputDraftMode = (NSNumber *)a3;

      if (-[CIRAWFilterImpl subsampling](self, "subsampling") != v7 || !self->_inputImage)
        -[CIRAWFilterImpl invalidateInputImage](self, "invalidateInputImage");
    }
  }
}

- (void)setInputEnableSharpening:(id)a3
{
  int v5;
  NSNumber *inputEnableSharpening;

  v5 = -[NSNumber BOOLValue](self->inputEnableSharpening, "BOOLValue");
  if (v5 != objc_msgSend(a3, "BOOLValue"))
  {
    inputEnableSharpening = self->inputEnableSharpening;
    self->inputEnableSharpening = (NSNumber *)a3;

    -[CIRAWFilterImpl invalidateInputImage](self, "invalidateInputImage");
  }
}

- (void)setInputEnableNoiseTracking:(id)a3
{
  int v5;
  NSNumber *inputEnableNoiseTracking;

  v5 = -[NSNumber BOOLValue](self->inputEnableNoiseTracking, "BOOLValue");
  if (v5 != objc_msgSend(a3, "BOOLValue"))
  {
    inputEnableNoiseTracking = self->inputEnableNoiseTracking;
    self->inputEnableNoiseTracking = (NSNumber *)a3;

    -[CIRAWFilterImpl invalidateInputImage](self, "invalidateInputImage");
  }
}

- (void)setInputNoiseReductionAmount:(id)a3
{
  NSNumber *inputNoiseReductionAmount;

  inputNoiseReductionAmount = self->inputNoiseReductionAmount;
  if (inputNoiseReductionAmount != a3)
  {
    if (a3)
    {
      if (-[NSNumber isEqualToNumber:](self->inputNoiseReductionAmount, "isEqualToNumber:", a3))
        return;
      inputNoiseReductionAmount = self->inputNoiseReductionAmount;
    }
    self->inputNoiseReductionAmount = (NSNumber *)a3;

    -[CIRAWFilterImpl invalidateInputImage](self, "invalidateInputImage");
  }
}

- (void)setInputEnableVendorLensCorrection:(id)a3
{
  NSNumber *inputEnableVendorLensCorrection;

  inputEnableVendorLensCorrection = self->inputEnableVendorLensCorrection;
  if (inputEnableVendorLensCorrection != a3)
  {
    if (a3)
    {
      if (-[NSNumber isEqualToNumber:](self->inputEnableVendorLensCorrection, "isEqualToNumber:", a3))
        return;
      inputEnableVendorLensCorrection = self->inputEnableVendorLensCorrection;
    }
    self->inputEnableVendorLensCorrection = (NSNumber *)objc_msgSend(a3, "copy");

    if (-[NSNumber intValue](-[CIRAWFilterImpl sushiMode](self, "sushiMode"), "intValue") < 2)
      -[CIRAWFilterImpl invalidateInputImage](self, "invalidateInputImage");
    else
      -[CIRAWFilterImpl invalidateFilters](self, "invalidateFilters");
  }
}

- (void)setInputLuminanceNoiseReductionAmount:(id)a3
{
  NSNumber *inputLuminanceNoiseReductionAmount;

  inputLuminanceNoiseReductionAmount = self->inputLuminanceNoiseReductionAmount;
  if (inputLuminanceNoiseReductionAmount != a3)
  {
    if (a3)
    {
      if (-[NSNumber isEqualToNumber:](self->inputLuminanceNoiseReductionAmount, "isEqualToNumber:", a3))
        return;
      inputLuminanceNoiseReductionAmount = self->inputLuminanceNoiseReductionAmount;
    }
    self->inputLuminanceNoiseReductionAmount = (NSNumber *)objc_msgSend(a3, "copy");

    if (-[NSNumber intValue](-[CIRAWFilterImpl sushiMode](self, "sushiMode"), "intValue") < 2)
      -[CIRAWFilterImpl invalidateInputImage](self, "invalidateInputImage");
    else
      -[CIRAWFilterImpl invalidateFilters](self, "invalidateFilters");
  }
}

- (void)setInputColorNoiseReductionAmount:(id)a3
{
  NSNumber *inputColorNoiseReductionAmount;

  inputColorNoiseReductionAmount = self->inputColorNoiseReductionAmount;
  if (inputColorNoiseReductionAmount != a3)
  {
    if (a3)
    {
      if (-[NSNumber isEqualToNumber:](self->inputColorNoiseReductionAmount, "isEqualToNumber:", a3))
        return;
      inputColorNoiseReductionAmount = self->inputColorNoiseReductionAmount;
    }
    self->inputColorNoiseReductionAmount = (NSNumber *)objc_msgSend(a3, "copy");

    if (-[NSNumber intValue](-[CIRAWFilterImpl sushiMode](self, "sushiMode"), "intValue") < 2)
      -[CIRAWFilterImpl invalidateInputImage](self, "invalidateInputImage");
    else
      -[CIRAWFilterImpl invalidateFilters](self, "invalidateFilters");
  }
}

- (void)setInputNoiseReductionSharpnessAmount:(id)a3
{
  NSNumber *inputNoiseReductionSharpnessAmount;

  inputNoiseReductionSharpnessAmount = self->inputNoiseReductionSharpnessAmount;
  if (inputNoiseReductionSharpnessAmount != a3)
  {
    if (a3)
    {
      if (-[NSNumber isEqualToNumber:](self->inputNoiseReductionSharpnessAmount, "isEqualToNumber:", a3))
        return;
      inputNoiseReductionSharpnessAmount = self->inputNoiseReductionSharpnessAmount;
    }
    self->inputNoiseReductionSharpnessAmount = (NSNumber *)objc_msgSend(a3, "copy");

    if (-[NSNumber intValue](-[CIRAWFilterImpl sushiMode](self, "sushiMode"), "intValue") < 2)
      -[CIRAWFilterImpl invalidateInputImage](self, "invalidateInputImage");
    else
      -[CIRAWFilterImpl invalidateFilters](self, "invalidateFilters");
  }
}

- (void)setInputNoiseReductionContrastAmount:(id)a3
{
  NSNumber *inputNoiseReductionContrastAmount;

  inputNoiseReductionContrastAmount = self->inputNoiseReductionContrastAmount;
  if (inputNoiseReductionContrastAmount != a3)
  {
    if (a3)
    {
      if (-[NSNumber isEqualToNumber:](self->inputNoiseReductionContrastAmount, "isEqualToNumber:", a3))
        return;
      inputNoiseReductionContrastAmount = self->inputNoiseReductionContrastAmount;
    }
    self->inputNoiseReductionContrastAmount = (NSNumber *)objc_msgSend(a3, "copy");

    if (-[NSNumber intValue](-[CIRAWFilterImpl sushiMode](self, "sushiMode"), "intValue") < 2)
      -[CIRAWFilterImpl invalidateInputImage](self, "invalidateInputImage");
    else
      -[CIRAWFilterImpl invalidateFilters](self, "invalidateFilters");
  }
}

- (void)setInputNoiseReductionDetailAmount:(id)a3
{
  NSNumber *inputNoiseReductionDetailAmount;

  inputNoiseReductionDetailAmount = self->inputNoiseReductionDetailAmount;
  if (inputNoiseReductionDetailAmount != a3)
  {
    if (a3)
    {
      if (-[NSNumber isEqualToNumber:](self->inputNoiseReductionDetailAmount, "isEqualToNumber:", a3))
        return;
      inputNoiseReductionDetailAmount = self->inputNoiseReductionDetailAmount;
    }
    self->inputNoiseReductionDetailAmount = (NSNumber *)objc_msgSend(a3, "copy");

    if (-[NSNumber intValue](-[CIRAWFilterImpl sushiMode](self, "sushiMode"), "intValue") < 2)
      -[CIRAWFilterImpl invalidateInputImage](self, "invalidateInputImage");
    else
      -[CIRAWFilterImpl invalidateFilters](self, "invalidateFilters");
  }
}

- (void)setInputMoireAmount:(id)a3
{
  NSNumber *inputMoireAmount;

  inputMoireAmount = self->inputMoireAmount;
  if (inputMoireAmount != a3)
  {
    if (a3)
    {
      if (-[NSNumber isEqualToNumber:](self->inputMoireAmount, "isEqualToNumber:", a3))
        return;
      inputMoireAmount = self->inputMoireAmount;
    }
    self->inputMoireAmount = (NSNumber *)objc_msgSend(a3, "copy");

    if (-[NSNumber intValue](-[CIRAWFilterImpl sushiMode](self, "sushiMode"), "intValue") < 2)
      -[CIRAWFilterImpl invalidateInputImage](self, "invalidateInputImage");
    else
      -[CIRAWFilterImpl invalidateFilters](self, "invalidateFilters");
  }
}

- (void)setInputEV:(id)a3
{
  NSNumber *inputEV;

  inputEV = self->inputEV;
  if (inputEV != a3)
  {
    if (a3)
    {
      if (-[NSNumber isEqualToNumber:](self->inputEV, "isEqualToNumber:", a3))
        return;
      inputEV = self->inputEV;
    }
    self->inputEV = (NSNumber *)objc_msgSend(a3, "copy");

    -[CIRAWFilterImpl invalidateFilters](self, "invalidateFilters");
  }
}

- (void)setInputBoost:(id)a3
{
  NSNumber *inputBoost;

  inputBoost = self->inputBoost;
  if (inputBoost != a3)
  {
    if (a3)
    {
      if (-[NSNumber isEqualToNumber:](self->inputBoost, "isEqualToNumber:", a3))
        return;
      inputBoost = self->inputBoost;
    }
    self->inputBoost = (NSNumber *)objc_msgSend(a3, "copy");

    -[CIRAWFilterImpl invalidateFilters](self, "invalidateFilters");
  }
}

- (void)setInputDecoderVersion:(id)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  NSString *inputDecoderVersion;
  NSObject *v9;

  v5 = (void *)objc_opt_class();
  if (objc_msgSend(v5, "isSubclassOfClass:", objc_opt_class()))
    a3 = (id)objc_msgSend(a3, "stringValue");
  if (a3)
  {
    v6 = (void *)objc_opt_class();
    if ((objc_msgSend(v6, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
    {
      v7 = ci_logger_api();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CIRAWFilterImpl(CustomAccessors) setInputDecoderVersion:].cold.2(v7);
    }
  }
  if (-[NSArray containsObject:](self->_supportedDecoderVersions, "containsObject:", a3))
  {
    if (self->inputDecoderVersion != a3 && (objc_msgSend(a3, "isEqualToString:") & 1) == 0)
    {
      inputDecoderVersion = self->inputDecoderVersion;
      self->inputDecoderVersion = (NSString *)objc_msgSend(a3, "copy");

      self->_rawDictionary = 0;
      self->_rawReconstructionDefaultsDictionary = 0;
      -[CIRAWFilterImpl invalidateInputImage](self, "invalidateInputImage");
    }
  }
  else if (self->_isRawSource)
  {
    if (-[NSArray count](self->_supportedDecoderVersions, "count"))
    {
      v9 = ci_logger_api();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[CIRAWFilterImpl(CustomAccessors) setInputDecoderVersion:].cold.1((uint64_t)a3, (uint64_t)self, v9);
    }
  }
}

- (void)setInputImageOrientation:(id)a3
{
  int v5;
  NSNumber *inputImageOrientation;

  v5 = objc_msgSend(a3, "intValue");
  if (v5 != -[NSNumber intValue](self->inputImageOrientation, "intValue"))
  {
    inputImageOrientation = self->inputImageOrientation;
    self->inputImageOrientation = (NSNumber *)objc_msgSend(a3, "copy");

  }
}

- (void)setInputIgnoreOrientation:(id)a3
{
  int v5;
  NSNumber *inputIgnoreOrientation;

  v5 = objc_msgSend(a3, "BOOLValue");
  if (v5 != -[NSNumber BOOLValue](self->inputIgnoreOrientation, "BOOLValue"))
  {
    inputIgnoreOrientation = self->inputIgnoreOrientation;
    self->inputIgnoreOrientation = (NSNumber *)objc_msgSend(a3, "copy");

    -[CIRAWFilterImpl setInputImageOrientation:](self, "setInputImageOrientation:", -[CIRAWFilterImpl defaultImageOrientation](self, "defaultImageOrientation"));
  }
}

- (void)setInputReturnDemosaiced:(id)a3
{
  int v5;
  NSNumber *inputReturnDemosaiced;

  v5 = objc_msgSend(a3, "intValue");
  if (v5 != -[NSNumber intValue](self->inputReturnDemosaiced, "intValue"))
  {
    inputReturnDemosaiced = self->inputReturnDemosaiced;
    self->inputReturnDemosaiced = (NSNumber *)objc_msgSend(a3, "copy");

  }
}

- (id)defaultInputReturnDemosaiced
{
  id result;

  result = self->inputReturnDemosaiced;
  if (!result)
  {
    -[CIRAWFilterImpl setInputReturnDemosaiced:](self, "setInputReturnDemosaiced:", -[NSDictionary valueForKey:](-[CIRAWFilterImpl rawReconstructionDefaultsDictionary](self, "rawReconstructionDefaultsDictionary"), "valueForKey:", CFSTR("kCGImageSourceReturnDemosaiced")));
    return self->inputReturnDemosaiced;
  }
  return result;
}

- (void)setInputEnableEDRMode:(id)a3
{
  NSNumber *inputEnableEDRMode;

  inputEnableEDRMode = self->inputEnableEDRMode;
  if (inputEnableEDRMode != a3)
  {
    if (a3)
    {
      if (-[NSNumber isEqualToNumber:](self->inputEnableEDRMode, "isEqualToNumber:", a3))
        return;
      inputEnableEDRMode = self->inputEnableEDRMode;
    }
    self->inputEnableEDRMode = (NSNumber *)a3;

    -[CIRAWFilterImpl invalidateInputImage](self, "invalidateInputImage");
  }
}

- (id)defaultInputLocalToneMapAmount
{
  return -[CIRAWFilterImpl RAWFiltersValueForKeyPath:](self, "RAWFiltersValueForKeyPath:", CFSTR("RAWProfileGainTableMap.inputStrength"));
}

- (void)setInputLocalToneMapAmount:(id)a3
{
  NSNumber *inputLocalToneMapAmount;

  inputLocalToneMapAmount = self->inputLocalToneMapAmount;
  if (inputLocalToneMapAmount != a3)
  {
    if (a3)
    {
      if (-[NSNumber isEqualToNumber:](self->inputLocalToneMapAmount, "isEqualToNumber:", a3))
        return;
      inputLocalToneMapAmount = self->inputLocalToneMapAmount;
    }
    self->inputLocalToneMapAmount = (NSNumber *)a3;

    -[CIRAWFilterImpl invalidateInputImage](self, "invalidateInputImage");
  }
}

- (id)defaultInputLuminanceNoiseReductionAmount
{
  id result;

  result = self->inputLuminanceNoiseReductionAmount;
  if (!result)
  {
    -[CIRAWFilterImpl setInputLuminanceNoiseReductionAmount:](self, "setInputLuminanceNoiseReductionAmount:", -[NSDictionary valueForKey:](-[CIRAWFilterImpl rawReconstructionDefaultsDictionary](self, "rawReconstructionDefaultsDictionary"), "valueForKey:", CFSTR("kCGImageSourceLuminanceNoiseReductionAmount")));
    return self->inputLuminanceNoiseReductionAmount;
  }
  return result;
}

- (id)defaultInputColorNoiseReductionAmount
{
  id result;

  result = self->inputColorNoiseReductionAmount;
  if (!result)
  {
    -[CIRAWFilterImpl setInputColorNoiseReductionAmount:](self, "setInputColorNoiseReductionAmount:", -[NSDictionary valueForKey:](-[CIRAWFilterImpl rawReconstructionDefaultsDictionary](self, "rawReconstructionDefaultsDictionary"), "valueForKey:", CFSTR("kCGImageSourceColorNoiseReductionAmount")));
    return self->inputColorNoiseReductionAmount;
  }
  return result;
}

- (id)defaultInputNoiseReductionContrastAmount
{
  id result;

  result = self->inputNoiseReductionContrastAmount;
  if (!result)
  {
    -[CIRAWFilterImpl setInputNoiseReductionContrastAmount:](self, "setInputNoiseReductionContrastAmount:", -[NSDictionary valueForKey:](-[CIRAWFilterImpl rawReconstructionDefaultsDictionary](self, "rawReconstructionDefaultsDictionary"), "valueForKey:", CFSTR("kCGImageSourceNoiseReductionContrastAmount")));
    return self->inputNoiseReductionContrastAmount;
  }
  return result;
}

- (id)defaultInputNoiseReductionDetailAmount
{
  id result;

  result = self->inputNoiseReductionDetailAmount;
  if (!result)
  {
    -[CIRAWFilterImpl setInputNoiseReductionDetailAmount:](self, "setInputNoiseReductionDetailAmount:", -[NSDictionary valueForKey:](-[CIRAWFilterImpl rawReconstructionDefaultsDictionary](self, "rawReconstructionDefaultsDictionary"), "valueForKey:", CFSTR("kCGImageSourceNoiseReductionDetailAmount")));
    return self->inputNoiseReductionDetailAmount;
  }
  return result;
}

- (id)defaultInputNoiseReductionSharpnessAmount
{
  id result;

  result = self->inputNoiseReductionSharpnessAmount;
  if (!result)
  {
    -[CIRAWFilterImpl setInputNoiseReductionSharpnessAmount:](self, "setInputNoiseReductionSharpnessAmount:", -[NSDictionary valueForKey:](-[CIRAWFilterImpl rawReconstructionDefaultsDictionary](self, "rawReconstructionDefaultsDictionary"), "valueForKey:", CFSTR("kCGImageSourceNoiseReductionSharpnessAmount")));
    return self->inputNoiseReductionSharpnessAmount;
  }
  return result;
}

- (id)defaultInputMoireAmount
{
  id result;

  result = self->inputMoireAmount;
  if (!result)
  {
    -[CIRAWFilterImpl setInputMoireAmount:](self, "setInputMoireAmount:", -[NSDictionary valueForKey:](-[CIRAWFilterImpl rawReconstructionDefaultsDictionary](self, "rawReconstructionDefaultsDictionary"), "valueForKey:", CFSTR("kCGImageSourceChromaBlurMoireAmount")));
    return self->inputMoireAmount;
  }
  return result;
}

- (id)defaultInputEnableVendorLensCorrection
{
  int v3;
  int v4;
  BOOL v5;
  void *v6;

  if (!self->inputEnableVendorLensCorrection)
  {
    v3 = objc_msgSend(-[NSDictionary valueForKey:](-[CIRAWFilterImpl rawReconstructionDefaultsDictionary](self, "rawReconstructionDefaultsDictionary"), "valueForKey:", CFSTR("kCGImageSourceDisableVendorLensDistortionCorrection")), "intValue");
    v4 = objc_msgSend(-[NSDictionary valueForKey:](-[CIRAWFilterImpl rawReconstructionDefaultsDictionary](self, "rawReconstructionDefaultsDictionary"), "valueForKey:", CFSTR("kCGImageSourceVendorLensCorrectionFeatures")), "intValue") & 4;
    if (v3)
      v5 = 1;
    else
      v5 = v4 == 0;
    if (v5)
      v6 = &unk_1E2F1BD58;
    else
      v6 = &unk_1E2F1BD10;
    -[CIRAWFilterImpl setInputEnableVendorLensCorrection:](self, "setInputEnableVendorLensCorrection:", v6);
  }
  return self->inputEnableVendorLensCorrection;
}

- (id)defaultDecoderVersion
{
  id v2;
  void *v3;

  v2 = -[CIRAWFilterImpl supportedDecoderVersions](self, "supportedDecoderVersions");
  if (v2 && (v3 = v2, objc_msgSend(v2, "count")))
    return (id)objc_msgSend(v3, "lastObject");
  else
    return 0;
}

- (id)defaultInputEnableEDRMode
{
  id result;

  result = self->inputEnableEDRMode;
  if (!result)
  {
    -[CIRAWFilterImpl setInputEnableEDRMode:](self, "setInputEnableEDRMode:", -[NSDictionary valueForKey:](-[CIRAWFilterImpl rawReconstructionDefaultsDictionary](self, "rawReconstructionDefaultsDictionary"), "valueForKey:", CFSTR("kCGImageSourceUseEDRMode")));
    return self->inputEnableEDRMode;
  }
  return result;
}

- (id)supportedSushiModes
{
  id result;
  CGImageSource *inputImageSource;
  CFDictionaryRef v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  result = self->_supportedSushiModes;
  if (!result)
  {
    inputImageSource = self->_inputImageSource;
    if (inputImageSource)
    {
      v5 = CGImageSourceCopyPropertiesAtIndex(inputImageSource, 0, (CFDictionaryRef)-[CIRAWFilterImpl rawOptions](self, "rawOptions"));
      v6 = (void *)-[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD210]);
      v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v8 = (void *)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kCGImageSourceSupportedSushiLevels"));
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v26 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        }
        while (v10);
      }
      result = (id)objc_msgSend(v7, "copy");
      self->_supportedSushiModes = (NSArray *)result;
      if (v5)
      {
        CFRelease(v5);
        return self->_supportedSushiModes;
      }
    }
    else
    {
      result = self->_inputImageAndProperties;
      if (result)
      {
        v13 = (void *)objc_msgSend(result, "objectAtIndexedSubscript:", 1);
        v14 = (void *)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD210]);
        v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v16 = (void *)objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kCGImageSourceSupportedSushiLevels"), 0);
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v22;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v22 != v19)
                objc_enumerationMutation(v16);
              objc_msgSend(v15, "addObject:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j));
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v18);
        }
        result = (id)objc_msgSend(v15, "copy");
        self->_supportedSushiModes = (NSArray *)result;
      }
    }
  }
  return result;
}

- (id)supportedDecoderVersions
{
  id result;
  CGImageSource *inputImageSource;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  float v13;
  float v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  float v24;
  float v25;
  CFDictionaryRef cf;
  CIRAWFilterImpl *v27;
  CIRAWFilterImpl *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!self->_baseImageProperties)
    return (id)MEMORY[0x1E0C9AA60];
  result = self->_supportedDecoderVersions;
  if (!result)
  {
    inputImageSource = self->_inputImageSource;
    if (inputImageSource)
    {
      v27 = self;
      cf = CGImageSourceCopyPropertiesAtIndex(inputImageSource, 0, (CFDictionaryRef)-[CIRAWFilterImpl rawOptions](self, "rawOptions"));
      v5 = (void *)-[__CFDictionary objectForKeyedSubscript:](cf, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD210]);
      v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v7 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD208]);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v34 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v12, "floatValue");
              if (v13 >= 1.0)
              {
                objc_msgSend(v12, "floatValue");
                if (v14 < 9.0)
                  objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v12));
              }
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        }
        while (v9);
      }
      result = (id)objc_msgSend(v6, "copy");
      v27->_supportedDecoderVersions = (NSArray *)result;
      if (cf)
      {
        CFRelease(cf);
        return v27->_supportedDecoderVersions;
      }
    }
    else
    {
      result = self->_inputImageAndProperties;
      if (result)
      {
        v28 = self;
        v15 = (void *)objc_msgSend(result, "objectAtIndexedSubscript:", 1);
        v16 = (void *)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD210]);
        v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v18 = (void *)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD208]);
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v30;
          do
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v30 != v21)
                objc_enumerationMutation(v18);
              v23 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v23, "floatValue");
                if (v24 >= 1.0)
                {
                  objc_msgSend(v23, "floatValue");
                  if (v25 < 9.0)
                    objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v23));
                }
              }
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          }
          while (v20);
        }
        result = (id)objc_msgSend(v17, "copy");
        v28->_supportedDecoderVersions = (NSArray *)result;
      }
    }
  }
  return result;
}

- (void)setInputBias:(id)a3
{
  NSNumber *inputBias;

  inputBias = self->inputBias;
  if (inputBias != a3)
  {
    if (a3)
    {
      if (-[NSNumber isEqualToNumber:](self->inputBias, "isEqualToNumber:", a3))
        return;
      inputBias = self->inputBias;
    }
    self->inputBias = (NSNumber *)objc_msgSend(a3, "copy");

    -[CIRAWFilterImpl invalidateFilters](self, "invalidateFilters");
  }
}

- (id)defaultInputBiasAmount
{
  return -[CIRAWFilterImpl RAWFiltersValueForKeyPath:](self, "RAWFiltersValueForKeyPath:", CFSTR("RAWAdjustExposureAndBias.inputBias"));
}

- (id)inputBias
{
  return self->inputBias;
}

- (void)setInputBaselineExposure:(id)a3
{
  NSNumber *inputBaselineExposure;

  inputBaselineExposure = self->inputBaselineExposure;
  if (inputBaselineExposure != a3)
  {
    if (a3)
    {
      if (-[NSNumber isEqualToNumber:](self->inputBaselineExposure, "isEqualToNumber:", a3))
        return;
      inputBaselineExposure = self->inputBaselineExposure;
    }
    self->inputBaselineExposure = (NSNumber *)objc_msgSend(a3, "copy");

    -[CIRAWFilterImpl invalidateFilters](self, "invalidateFilters");
  }
}

- (id)defaultInputBaselineExposureAmount
{
  return -[CIRAWFilterImpl RAWFiltersValueForKeyPath:](self, "RAWFiltersValueForKeyPath:", CFSTR("RAWAdjustExposureAndBias.inputBaselineExposure"));
}

- (id)inputBaselineExposure
{
  return self->inputBaselineExposure;
}

- (void)setInputHueMagMR:(id)a3
{
  NSNumber *inputHueMagMR;

  inputHueMagMR = self->inputHueMagMR;
  if (inputHueMagMR != a3)
  {
    if (a3)
    {
      if (-[NSNumber isEqualToNumber:](self->inputHueMagMR, "isEqualToNumber:", a3))
        return;
      inputHueMagMR = self->inputHueMagMR;
    }
    self->inputHueMagMR = (NSNumber *)objc_msgSend(a3, "copy");

    -[CIRAWFilterImpl invalidateFilters](self, "invalidateFilters");
  }
}

- (id)defaultInputHueMagMRAmount
{
  return -[CIRAWFilterImpl RAWFiltersValueForKeyPath:](self, "RAWFiltersValueForKeyPath:", CFSTR("RAWHueMagnet.inputHueMagMR"));
}

- (id)inputHueMagMR
{
  return self->inputHueMagMR;
}

- (void)setInputHueMagRY:(id)a3
{
  NSNumber *inputHueMagRY;

  inputHueMagRY = self->inputHueMagRY;
  if (inputHueMagRY != a3)
  {
    if (a3)
    {
      if (-[NSNumber isEqualToNumber:](self->inputHueMagRY, "isEqualToNumber:", a3))
        return;
      inputHueMagRY = self->inputHueMagRY;
    }
    self->inputHueMagRY = (NSNumber *)objc_msgSend(a3, "copy");

    -[CIRAWFilterImpl invalidateFilters](self, "invalidateFilters");
  }
}

- (id)defaultInputHueMagRYAmount
{
  return -[CIRAWFilterImpl RAWFiltersValueForKeyPath:](self, "RAWFiltersValueForKeyPath:", CFSTR("RAWHueMagnet.inputHueMagRY"));
}

- (id)inputHueMagRY
{
  return self->inputHueMagRY;
}

- (void)setInputHueMagYG:(id)a3
{
  NSNumber *inputHueMagYG;

  inputHueMagYG = self->inputHueMagYG;
  if (inputHueMagYG != a3)
  {
    if (a3)
    {
      if (-[NSNumber isEqualToNumber:](self->inputHueMagYG, "isEqualToNumber:", a3))
        return;
      inputHueMagYG = self->inputHueMagYG;
    }
    self->inputHueMagYG = (NSNumber *)objc_msgSend(a3, "copy");

    -[CIRAWFilterImpl invalidateFilters](self, "invalidateFilters");
  }
}

- (id)defaultInputHueMagYGAmount
{
  return -[CIRAWFilterImpl RAWFiltersValueForKeyPath:](self, "RAWFiltersValueForKeyPath:", CFSTR("RAWHueMagnet.inputHueMagYG"));
}

- (id)inputHueMagYG
{
  return self->inputHueMagYG;
}

- (void)setInputHueMagGC:(id)a3
{
  NSNumber *inputHueMagGC;

  inputHueMagGC = self->inputHueMagGC;
  if (inputHueMagGC != a3)
  {
    if (a3)
    {
      if (-[NSNumber isEqualToNumber:](self->inputHueMagGC, "isEqualToNumber:", a3))
        return;
      inputHueMagGC = self->inputHueMagGC;
    }
    self->inputHueMagGC = (NSNumber *)objc_msgSend(a3, "copy");

    -[CIRAWFilterImpl invalidateFilters](self, "invalidateFilters");
  }
}

- (id)defaultInputHueMagGCAmount
{
  return -[CIRAWFilterImpl RAWFiltersValueForKeyPath:](self, "RAWFiltersValueForKeyPath:", CFSTR("RAWHueMagnet.inputHueMagGC"));
}

- (id)inputHueMagGC
{
  return self->inputHueMagGC;
}

- (void)setInputHueMagCB:(id)a3
{
  NSNumber *inputHueMagCB;

  inputHueMagCB = self->inputHueMagCB;
  if (inputHueMagCB != a3)
  {
    if (a3)
    {
      if (-[NSNumber isEqualToNumber:](self->inputHueMagCB, "isEqualToNumber:", a3))
        return;
      inputHueMagCB = self->inputHueMagCB;
    }
    self->inputHueMagCB = (NSNumber *)objc_msgSend(a3, "copy");

    -[CIRAWFilterImpl invalidateFilters](self, "invalidateFilters");
  }
}

- (id)defaultInputHueMagCBAmount
{
  return -[CIRAWFilterImpl RAWFiltersValueForKeyPath:](self, "RAWFiltersValueForKeyPath:", CFSTR("RAWHueMagnet.inputHueMagCB"));
}

- (id)inputHueMagCB
{
  return self->inputHueMagCB;
}

- (void)setInputHueMagBM:(id)a3
{
  NSNumber *inputHueMagBM;

  inputHueMagBM = self->inputHueMagBM;
  if (inputHueMagBM != a3)
  {
    if (a3)
    {
      if (-[NSNumber isEqualToNumber:](self->inputHueMagBM, "isEqualToNumber:", a3))
        return;
      inputHueMagBM = self->inputHueMagBM;
    }
    self->inputHueMagBM = (NSNumber *)objc_msgSend(a3, "copy");

    -[CIRAWFilterImpl invalidateFilters](self, "invalidateFilters");
  }
}

- (id)defaultInputHueMagBMAmount
{
  return -[CIRAWFilterImpl RAWFiltersValueForKeyPath:](self, "RAWFiltersValueForKeyPath:", CFSTR("RAWHueMagnet.inputHueMagBM"));
}

- (id)inputHueMagBM
{
  return self->inputHueMagBM;
}

- (void)setInputDisableGamutMap:(id)a3
{
  NSNumber *inputDisableGamutMap;

  inputDisableGamutMap = self->inputDisableGamutMap;
  if (inputDisableGamutMap != a3)
  {
    if (a3)
    {
      if (-[NSNumber isEqualToNumber:](self->inputDisableGamutMap, "isEqualToNumber:", a3))
        return;
      inputDisableGamutMap = self->inputDisableGamutMap;
    }
    self->inputDisableGamutMap = (NSNumber *)objc_msgSend(a3, "copy");

    -[CIRAWFilterImpl invalidateFilters](self, "invalidateFilters");
  }
}

- (id)inputDisableGamutMap
{
  return self->inputDisableGamutMap;
}

- (void)setInputLinearSpaceFilter:(id)a3
{
  CIFilter *inputLinearSpaceFilter;

  inputLinearSpaceFilter = self->inputLinearSpaceFilter;
  if (inputLinearSpaceFilter != a3)
  {
    self->inputLinearSpaceFilter = (CIFilter *)a3;

    -[CIRAWFilterImpl invalidateFilters](self, "invalidateFilters");
  }
}

- (id)inputLinearSpaceFilter
{
  return self->inputLinearSpaceFilter;
}

- (void)setInputBoostShadowAmount:(id)a3
{
  NSNumber *inputBoostShadowAmount;

  inputBoostShadowAmount = self->inputBoostShadowAmount;
  if (inputBoostShadowAmount != a3)
  {
    if (a3)
    {
      if (-[NSNumber isEqualToNumber:](self->inputBoostShadowAmount, "isEqualToNumber:", a3))
        return;
      inputBoostShadowAmount = self->inputBoostShadowAmount;
    }
    self->inputBoostShadowAmount = (NSNumber *)objc_msgSend(a3, "copy");

    -[CIRAWFilterImpl invalidateFilters](self, "invalidateFilters");
  }
}

- (id)defaultBoostShadowAmount
{
  return -[NSDictionary objectForKeyedSubscript:](-[CIRAWFilterImpl rawDictionary](self, "rawDictionary"), "objectForKeyedSubscript:", CFSTR("bsamt"));
}

- (id)activeKeys
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  BOOL v12;
  const __CFString *v13;
  BOOL v14;
  uint64_t v15;
  const CIRAWFilterOption *v16;
  id obj;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 30);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = -[NSDictionary objectForKeyedSubscript:](-[CIRAWFilterImpl rawDictionary](self, "rawDictionary"), "objectForKeyedSubscript:", CFSTR("filters"));
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v22;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(obj);
        v5 = (objc_class *)objc_opt_class();
        v6 = NSStringFromClass(v5);
        v7 = CFSTR("inputNeutralChromaticityX");
        v8 = CFSTR("inputNeutralChromaticityY");
        v10 = CFSTR("inputNeutralTemperature");
        v9 = CFSTR("inputNeutralTint");
        v11 = CFSTR("inputNeutralLocation");
        if (-[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("RAWConvert")))
          goto LABEL_8;
        v7 = CFSTR("inputNeutralChromaticityX");
        v8 = CFSTR("inputNeutralChromaticityY");
        v10 = CFSTR("inputNeutralTemperature");
        v9 = CFSTR("inputNeutralTint");
        v11 = CFSTR("inputNeutralLocation");
        if (-[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("RAWAdjustTempTint")))
          goto LABEL_8;
        v9 = CFSTR("inputBias");
        v10 = CFSTR("inputBaselineExposure");
        v11 = CFSTR("inputEV");
        if (-[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("RAWAdjustExposureAndBias")))
          goto LABEL_9;
        v11 = CFSTR("inputBoostShadowAmount");
        v9 = CFSTR("inputBoost");
        if (-[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("RAWAdjustColorTRC")))
          goto LABEL_10;
        v11 = CFSTR("inputBoost");
        if (-[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("RAWAdjustColors")))
          goto LABEL_11;
        v12 = -[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("RAWTemperatureAdjust"));
        v13 = CFSTR("inputNeutralChromaticityX");
        v7 = CFSTR("inputNeutralChromaticityY");
        v8 = CFSTR("inputNeutralTemperature");
        v10 = CFSTR("inputNeutralTint");
        v9 = CFSTR("inputNeutralLocation");
        v11 = CFSTR("inputEV");
        if (v12
          || (v14 = -[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("RAWReduceNoise")),
              v7 = CFSTR("inputColorNoiseReductionAmount"),
              v13 = CFSTR("inputLuminanceNoiseReductionAmount"),
              v10 = CFSTR("inputNoiseReductionContrastAmount"),
              v8 = CFSTR("inputNoiseReductionSharpnessAmount"),
              v11 = CFSTR("inputMoireAmount"),
              v9 = CFSTR("inputNoiseReductionDetailAmount"),
              v14))
        {
          objc_msgSend(v3, "addObject:", v13);
LABEL_8:
          objc_msgSend(v3, "addObject:", v7);
          objc_msgSend(v3, "addObject:", v8);
LABEL_9:
          objc_msgSend(v3, "addObject:", v10);
LABEL_10:
          objc_msgSend(v3, "addObject:", v9);
LABEL_11:
          objc_msgSend(v3, "addObject:", v11);
          goto LABEL_12;
        }
        v11 = CFSTR("inputEnableVendorLensCorrection");
        if (-[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("RAWLensCorrectionDNG")))
          goto LABEL_11;
        v11 = CFSTR("inputEnableVendorLensCorrection");
        if (-[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("RAWRadialLensCorrection")))
          goto LABEL_11;
        v11 = CFSTR("inputEnableVendorLensCorrection");
        if (-[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("RAWRadialLensCorrectionRB")))
          goto LABEL_11;
        v11 = CFSTR("inputDisableGamutMap");
        if (-[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("RAWGamutMap")))
          goto LABEL_11;
        v11 = CFSTR("inputLocalToneMapAmount");
        if (-[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("RAWProfileGainTableMap")))
          goto LABEL_11;
LABEL_12:
        ++v4;
      }
      while (v20 != v4);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v20 = v15;
    }
    while (v15);
  }
  objc_msgSend(v3, "addObject:", CFSTR("inputEV"));
  objc_msgSend(v3, "addObject:", CFSTR("inputEnableSharpening"));
  objc_msgSend(v3, "addObject:", CFSTR("inputNeutralChromaticityX"));
  objc_msgSend(v3, "addObject:", CFSTR("inputNeutralChromaticityY"));
  objc_msgSend(v3, "addObject:", CFSTR("inputNeutralTemperature"));
  objc_msgSend(v3, "addObject:", CFSTR("inputNeutralTint"));
  objc_msgSend(v3, "addObject:", CFSTR("inputNeutralLocation"));
  if (-[CIRAWFilterImpl rawMajorVersion](self, "rawMajorVersion") == 2)
  {
    v16 = &kCIInputEnableChromaticNoiseTrackingKey;
  }
  else
  {
    if (-[CIRAWFilterImpl rawMajorVersion](self, "rawMajorVersion") < 6)
      goto LABEL_32;
    v16 = &kCIInputNoiseReductionAmountKey;
  }
  objc_msgSend(v3, "addObject:", *v16);
LABEL_32:
  if (-[CIRAWFilterImpl rawMajorVersion](self, "rawMajorVersion") > 6)
    objc_msgSend(v3, "addObject:", CFSTR("inputEnableEDRMode"));
  return v3;
}

- (id)properties
{
  return self->_baseImageProperties;
}

- (id)outputNativeSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  char v7;

  objc_msgSend(-[CIRAWFilterImpl transformedImageIgnoringOrientation:andIgnoringScaleFactor:](self, "transformedImageIgnoringOrientation:andIgnoringScaleFactor:", 1, 1), "extent");
  v4 = v3;
  v6 = v5;
  v7 = -[CIRAWFilterImpl subsampling](self, "subsampling");
  return +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", (double)((int)v4 << v7), (double)((int)v6 << v7));
}

+ (void)convertNeutralX:(id)a3 y:(id)a4 toTemperature:(id *)a5 tint:(id *)a6
{
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  objc_msgSend(a3, "doubleValue");
  v10 = v9;
  objc_msgSend(a4, "doubleValue");
  v12 = 0.0;
  v13 = 0.0;
  CI_xy_to_TempTint(&v13, &v12, v10, v11);
  if (a5)
    *a5 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
  if (a6)
    *a6 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
}

+ (void)convertNeutralTemperature:(id)a3 tint:(id)a4 toX:(id *)a5 y:(id *)a6
{
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  objc_msgSend(a3, "doubleValue");
  v10 = v9;
  objc_msgSend(a4, "doubleValue");
  v12 = 0.0;
  v13 = 0.0;
  CI_TempTint_to_xy(&v13, &v12, v10, v11);
  if (a5)
    *a5 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
  if (a6)
    *a6 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
}

- (void)updateTemperatureAndTint
{
  NSNumber *inputNeutralChromaticityX;
  NSNumber **p_inputNeutralTemperature;
  NSNumber **p_inputNeutralTint;
  NSNumber *v6;
  NSNumber *v7;

  inputNeutralChromaticityX = self->inputNeutralChromaticityX;
  if (!inputNeutralChromaticityX || !self->inputNeutralChromaticityY)
  {

    self->inputNeutralChromaticityX = 0;
    self->inputNeutralChromaticityY = 0;
    self->inputNeutralChromaticityX = (NSNumber *)-[CIRAWFilterImpl defaultNeutralChromaticityX](self, "defaultNeutralChromaticityX");
    self->inputNeutralChromaticityY = (NSNumber *)-[CIRAWFilterImpl defaultNeutralChromaticityY](self, "defaultNeutralChromaticityY");
  }
  if (self->inputNeutralTemperature)
    p_inputNeutralTemperature = 0;
  else
    p_inputNeutralTemperature = &self->inputNeutralTemperature;
  if (self->inputNeutralTint)
    p_inputNeutralTint = 0;
  else
    p_inputNeutralTint = &self->inputNeutralTint;
  objc_msgSend((id)objc_opt_class(), "convertNeutralX:y:toTemperature:tint:", self->inputNeutralChromaticityX, self->inputNeutralChromaticityY, p_inputNeutralTemperature, p_inputNeutralTint);
  if (p_inputNeutralTemperature)
    v6 = *p_inputNeutralTemperature;
  if (p_inputNeutralTint)
    v7 = *p_inputNeutralTint;
}

- (void)updateChomaticityXAndY
{
  NSNumber **p_inputNeutralChromaticityX;
  NSNumber **p_inputNeutralChromaticityY;
  NSNumber *v4;
  NSNumber *v5;

  if (self->inputNeutralChromaticityX)
    p_inputNeutralChromaticityX = 0;
  else
    p_inputNeutralChromaticityX = &self->inputNeutralChromaticityX;
  if (self->inputNeutralChromaticityY)
    p_inputNeutralChromaticityY = 0;
  else
    p_inputNeutralChromaticityY = &self->inputNeutralChromaticityY;
  objc_msgSend((id)objc_opt_class(), "convertNeutralTemperature:tint:toX:y:", self->inputNeutralTemperature, self->inputNeutralTint, p_inputNeutralChromaticityX, p_inputNeutralChromaticityY);
  if (p_inputNeutralChromaticityX)
    v4 = *p_inputNeutralChromaticityX;
  if (p_inputNeutralChromaticityY)
    v5 = *p_inputNeutralChromaticityY;
}

- (id)defaultNeutralTemperature
{
  id v3;
  id v4;
  uint64_t v6;
  void *v7;

  v3 = -[NSDictionary objectForKeyedSubscript:](-[CIRAWFilterImpl rawDictionary](self, "rawDictionary"), "objectForKeyedSubscript:", CFSTR("wx"));
  v4 = -[NSDictionary objectForKeyedSubscript:](-[CIRAWFilterImpl rawDictionary](self, "rawDictionary"), "objectForKeyedSubscript:", CFSTR("wy"));
  if (v3 && v4)
  {
    v7 = 0;
    objc_msgSend((id)objc_opt_class(), "convertNeutralX:y:toTemperature:tint:", v3, v4, &v7, 0);
    return v7;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    CI_xy_to_TempTint((double *)&v7, (double *)&v6, 0.34570291, 0.3585386);
    return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v7);
  }
}

- (id)inputNeutralTemperature
{
  id result;

  result = self->inputNeutralTemperature;
  if (!result)
  {
    -[CIRAWFilterImpl updateTemperatureAndTint](self, "updateTemperatureAndTint");
    return self->inputNeutralTemperature;
  }
  return result;
}

- (void)setInputNeutralTemperature:(id)a3
{
  NSNumber *inputNeutralTemperature;
  NSNumber *v6;

  if (!self->_calledDealloc)
  {
    inputNeutralTemperature = self->inputNeutralTemperature;
    if (inputNeutralTemperature != a3
      && (!a3 || !-[NSNumber isEqualToNumber:](inputNeutralTemperature, "isEqualToNumber:", a3)))
    {
      if (!self->inputNeutralTint)
        -[CIRAWFilterImpl inputNeutralTint](self, "inputNeutralTint");
      -[CIRAWFilterImpl willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("inputNeutralTemperature"));
      -[CIRAWFilterImpl willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("inputNeutralChromaticityX"));
      -[CIRAWFilterImpl willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("inputNeutralChromaticityY"));
      v6 = self->inputNeutralTemperature;
      self->inputNeutralTemperature = (NSNumber *)objc_msgSend(a3, "copy");

      self->inputNeutralChromaticityX = 0;
      self->inputNeutralChromaticityY = 0;
      -[CIRAWFilterImpl invalidateFilters](self, "invalidateFilters");
      -[CIRAWFilterImpl didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("inputNeutralChromaticityY"));
      -[CIRAWFilterImpl didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("inputNeutralChromaticityX"));
      -[CIRAWFilterImpl didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("inputNeutralTemperature"));
    }
  }
}

- (id)inputNeutralTint
{
  id result;

  result = self->inputNeutralTint;
  if (!result)
  {
    -[CIRAWFilterImpl updateTemperatureAndTint](self, "updateTemperatureAndTint");
    return self->inputNeutralTint;
  }
  return result;
}

- (id)defaultNeutralTint
{
  id v3;
  id v4;
  double v6;
  void *v7;

  v3 = -[NSDictionary objectForKeyedSubscript:](-[CIRAWFilterImpl rawDictionary](self, "rawDictionary"), "objectForKeyedSubscript:", CFSTR("wx"));
  v4 = -[NSDictionary objectForKeyedSubscript:](-[CIRAWFilterImpl rawDictionary](self, "rawDictionary"), "objectForKeyedSubscript:", CFSTR("wy"));
  if (v3 && v4)
  {
    v7 = 0;
    objc_msgSend((id)objc_opt_class(), "convertNeutralX:y:toTemperature:tint:", v3, v4, 0, &v7);
    return v7;
  }
  else
  {
    v6 = 0.0;
    v7 = 0;
    CI_xy_to_TempTint((double *)&v7, &v6, 0.34570291, 0.3585386);
    return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  }
}

- (void)setInputNeutralTint:(id)a3
{
  NSNumber *inputNeutralTint;
  NSNumber *v6;

  if (!self->_calledDealloc)
  {
    inputNeutralTint = self->inputNeutralTint;
    if (inputNeutralTint != a3 && (!a3 || !-[NSNumber isEqualToNumber:](inputNeutralTint, "isEqualToNumber:", a3)))
    {
      if (!self->inputNeutralTemperature)
        -[CIRAWFilterImpl inputNeutralTemperature](self, "inputNeutralTemperature");
      -[CIRAWFilterImpl willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("inputNeutralTint"));
      -[CIRAWFilterImpl willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("inputNeutralChromaticityX"));
      -[CIRAWFilterImpl willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("inputNeutralChromaticityY"));
      v6 = self->inputNeutralTint;
      self->inputNeutralTint = (NSNumber *)objc_msgSend(a3, "copy");

      self->inputNeutralChromaticityX = 0;
      self->inputNeutralChromaticityY = 0;
      -[CIRAWFilterImpl invalidateFilters](self, "invalidateFilters");
      -[CIRAWFilterImpl didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("inputNeutralChromaticityY"));
      -[CIRAWFilterImpl didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("inputNeutralChromaticityX"));
      -[CIRAWFilterImpl didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("inputNeutralTint"));
    }
  }
}

- (id)defaultNeutralChromaticityX
{
  void *v3;

  v3 = 0;
  objc_msgSend((id)objc_opt_class(), "convertNeutralTemperature:tint:toX:y:", -[CIRAWFilterImpl defaultNeutralTemperature](self, "defaultNeutralTemperature"), -[CIRAWFilterImpl defaultNeutralTint](self, "defaultNeutralTint"), &v3, 0);
  return v3;
}

- (id)inputNeutralChromaticityX
{
  id result;

  result = self->inputNeutralChromaticityX;
  if (!result)
  {
    -[CIRAWFilterImpl updateChomaticityXAndY](self, "updateChomaticityXAndY");
    return self->inputNeutralChromaticityX;
  }
  return result;
}

- (void)setInputNeutralChromaticityX:(id)a3
{
  NSNumber *inputNeutralChromaticityX;
  NSNumber *v6;

  if (!self->_calledDealloc)
  {
    inputNeutralChromaticityX = self->inputNeutralChromaticityX;
    if (inputNeutralChromaticityX != a3
      && (!a3 || !-[NSNumber isEqualToNumber:](inputNeutralChromaticityX, "isEqualToNumber:", a3)))
    {
      if (!self->inputNeutralChromaticityY)
        -[CIRAWFilterImpl inputNeutralChromaticityY](self, "inputNeutralChromaticityY");
      -[CIRAWFilterImpl willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("inputNeutralChromaticityX"));
      -[CIRAWFilterImpl willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("inputNeutralTint"));
      -[CIRAWFilterImpl willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("inputNeutralTemperature"));
      v6 = self->inputNeutralChromaticityX;
      self->inputNeutralChromaticityX = (NSNumber *)objc_msgSend(a3, "copy");

      self->inputNeutralTemperature = 0;
      self->inputNeutralTint = 0;
      -[CIRAWFilterImpl invalidateFilters](self, "invalidateFilters");
      -[CIRAWFilterImpl didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("inputNeutralTemperature"));
      -[CIRAWFilterImpl didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("inputNeutralTint"));
      -[CIRAWFilterImpl didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("inputNeutralChromaticityX"));
    }
  }
}

- (id)defaultNeutralChromaticityY
{
  void *v3;

  v3 = 0;
  objc_msgSend((id)objc_opt_class(), "convertNeutralTemperature:tint:toX:y:", -[CIRAWFilterImpl defaultNeutralTemperature](self, "defaultNeutralTemperature"), -[CIRAWFilterImpl defaultNeutralTint](self, "defaultNeutralTint"), 0, &v3);
  return v3;
}

- (id)inputNeutralChromaticityY
{
  id result;

  result = self->inputNeutralChromaticityY;
  if (!result)
  {
    -[CIRAWFilterImpl updateChomaticityXAndY](self, "updateChomaticityXAndY");
    return self->inputNeutralChromaticityY;
  }
  return result;
}

- (void)setInputNeutralChromaticityY:(id)a3
{
  NSNumber *inputNeutralChromaticityY;
  NSNumber *v6;

  if (!self->_calledDealloc)
  {
    inputNeutralChromaticityY = self->inputNeutralChromaticityY;
    if (inputNeutralChromaticityY != a3
      && (!a3 || !-[NSNumber isEqualToNumber:](inputNeutralChromaticityY, "isEqualToNumber:", a3)))
    {
      if (!self->inputNeutralChromaticityX)
        -[CIRAWFilterImpl inputNeutralChromaticityX](self, "inputNeutralChromaticityX");
      -[CIRAWFilterImpl willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("inputNeutralChromaticityY"));
      -[CIRAWFilterImpl willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("inputNeutralTint"));
      -[CIRAWFilterImpl willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("inputNeutralTemperature"));
      v6 = self->inputNeutralChromaticityY;
      self->inputNeutralChromaticityY = (NSNumber *)objc_msgSend(a3, "copy");

      self->inputNeutralTemperature = 0;
      self->inputNeutralTint = 0;
      -[CIRAWFilterImpl invalidateFilters](self, "invalidateFilters");
      -[CIRAWFilterImpl didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("inputNeutralTemperature"));
      -[CIRAWFilterImpl didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("inputNeutralTint"));
      -[CIRAWFilterImpl didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("inputNeutralChromaticityY"));
    }
  }
}

- (void)setInputRequestedSushiMode:(id)a3
{
  NSString *inputRequestedSushiMode;

  if (!self->_calledDealloc)
  {
    inputRequestedSushiMode = self->inputRequestedSushiMode;
    if (inputRequestedSushiMode != a3)
    {
      if (a3)
      {
        if (-[NSString isEqualToString:](self->inputRequestedSushiMode, "isEqualToString:", a3))
          return;
        inputRequestedSushiMode = self->inputRequestedSushiMode;
      }
      self->inputRequestedSushiMode = (NSString *)objc_msgSend(a3, "copy");

      self->_rawDictionary = 0;
    }
  }
}

- (id)whitePoint
{
  double v3;
  double v4;
  double v5;

  objc_msgSend(-[CIRAWFilterImpl inputNeutralChromaticityX](self, "inputNeutralChromaticityX"), "doubleValue");
  v4 = v3;
  objc_msgSend(-[CIRAWFilterImpl inputNeutralChromaticityY](self, "inputNeutralChromaticityY"), "doubleValue");
  return +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", v4, v5);
}

- (id)whitePointArray
{
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v4[0] = -[CIRAWFilterImpl inputNeutralChromaticityX](self, "inputNeutralChromaticityX");
  v4[1] = -[CIRAWFilterImpl inputNeutralChromaticityY](self, "inputNeutralChromaticityY");
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
}

- (void)getWhitePointVectorsR:(id *)a3 g:(id *)a4 b:(id *)a5
{
  double v9;
  double v10;
  double v11;
  double v12[10];

  v12[9] = *(double *)MEMORY[0x1E0C80C00];
  if (!a3 || !a4 || !a5)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CIRAWFilterImpl.m"), 2956, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(rVector != nil) && (gVector != nil) && (bVector != nil)"));
  objc_msgSend(-[CIRAWFilterImpl inputNeutralTemperature](self, "inputNeutralTemperature"), "doubleValue");
  v10 = v9;
  objc_msgSend(-[CIRAWFilterImpl inputNeutralTint](self, "inputNeutralTint"), "doubleValue");
  tempTint_to_matrix((uint64_t)v12, v10, v11);
  *a3 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v12[0], v12[1], v12[2]);
  *a4 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v12[3], v12[4], v12[5]);
  *a5 = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v12[6], v12[7], v12[8]);
}

@end

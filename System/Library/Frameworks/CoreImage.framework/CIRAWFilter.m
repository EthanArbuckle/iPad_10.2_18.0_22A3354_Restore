@implementation CIRAWFilter

+ (id)customAttributes
{
  _QWORD v3[3];
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("CIAttributeFilterCategories");
  v3[0] = CFSTR("CICategoryStillImage");
  v3[1] = CFSTR("CICategoryHighDynamicRange");
  v3[2] = CFSTR("CICategoryBuiltIn");
  v5[0] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  v5[1] = CFSTR("12.0");
  v4[1] = CFSTR("CIAttributeFilterAvailable_iOS");
  v4[2] = CFSTR("CIAttributeFilterAvailable_Mac");
  v5[2] = CFSTR("15.0");
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
}

- (CGSize)nativeSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = (void *)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("outputNativeSize"));
  objc_msgSend(v2, "X");
  v4 = v3;
  objc_msgSend(v2, "Y");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  id v6;
  objc_super v8;

  v5 = (void *)MEMORY[0x194026220](self, a2);
  v8.receiver = self;
  v8.super_class = (Class)CIRAWFilter;
  v6 = -[CIFilter copyWithZone:](&v8, sel_copyWithZone_, a3);
  objc_msgSend(v6, "setFilterImplementation:", (id)-[CIRAWFilterImpl copy](self->filterImplementation, "copy"));
  objc_msgSend(v6, "setImageURL:", (id)-[NSURL copy](self->imageURL, "copy"));
  objc_msgSend(v6, "setImageData:", (id)-[NSData copy](self->imageData, "copy"));
  objc_msgSend(v6, "setImageDataHint:", (id)-[NSString copy](self->imageDataHint, "copy"));
  objc_autoreleasePoolPop(v5);
  return v6;
}

- (id)outputImage
{
  return -[CIRAWFilterImpl outputImage](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "outputImage");
}

- (NSDictionary)properties
{
  return (NSDictionary *)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("properties"));
}

- (CGImagePropertyOrientation)orientation
{
  return objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("inputImageOrientation")), "intValue");
}

- (void)setOrientation:(CGImagePropertyOrientation)orientation
{
  uint64_t v3;
  CIRAWFilterImpl *v4;

  v3 = *(_QWORD *)&orientation;
  v4 = -[CIRAWFilter filterImplementation](self, "filterImplementation");
  -[CIRAWFilterImpl setValue:forKey:](v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3), CFSTR("inputImageOrientation"));
}

- (BOOL)isDraftModeEnabled
{
  return objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("inputDraftMode")), "BOOLValue");
}

- (void)setDraftModeEnabled:(BOOL)draftModeEnabled
{
  _BOOL8 v3;
  CIRAWFilterImpl *v4;

  v3 = draftModeEnabled;
  v4 = -[CIRAWFilter filterImplementation](self, "filterImplementation");
  -[CIRAWFilterImpl setValue:forKey:](v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3), CFSTR("inputDraftMode"));
}

- (NSArray)supportedDecoderVersions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  const __CFString *v16;
  _BYTE v17[128];
  _QWORD v18[6];
  _QWORD v19[7];

  v19[6] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("8");
  v18[1] = CFSTR("8.dng");
  v19[0] = CFSTR("8");
  v19[1] = CFSTR("8.dng");
  v18[2] = CFSTR("7");
  v18[3] = CFSTR("7.dng");
  v19[2] = CFSTR("7");
  v19[3] = CFSTR("7.dng");
  v18[4] = CFSTR("6");
  v18[5] = CFSTR("6.dng");
  v19[4] = CFSTR("6");
  v19[5] = CFSTR("6.dng");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 6);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("supportedDecoderVersions"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        if (v10)
          objc_msgSend(v4, "addObject:", v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v7);
  }
  if (objc_msgSend(v4, "count"))
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v4);
  v16 = CFSTR("None");
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
}

- (CIRAWDecoderVersion)decoderVersion
{
  return (CIRAWDecoderVersion)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("inputDecoderVersion"));
}

- (void)setDecoderVersion:(CIRAWDecoderVersion)decoderVersion
{
  -[CIRAWFilterImpl setValue:forKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "setValue:forKey:", decoderVersion, CFSTR("inputDecoderVersion"));
}

- (float)scaleFactor
{
  float result;

  objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("inputScaleFactor")), "floatValue");
  return result;
}

- (void)setScaleFactor:(float)scaleFactor
{
  CIRAWFilterImpl *v4;
  double v5;

  v4 = -[CIRAWFilter filterImplementation](self, "filterImplementation");
  *(float *)&v5 = scaleFactor;
  -[CIRAWFilterImpl setValue:forKey:](v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5), CFSTR("inputScaleFactor"));
}

- (float)exposure
{
  float result;

  objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("inputEV")), "floatValue");
  return result;
}

- (void)setExposure:(float)exposure
{
  CIRAWFilterImpl *v4;
  double v5;

  v4 = -[CIRAWFilter filterImplementation](self, "filterImplementation");
  *(float *)&v5 = exposure;
  -[CIRAWFilterImpl setValue:forKey:](v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5), CFSTR("inputEV"));
}

- (float)shadowBias
{
  float result;

  objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("inputBias")), "floatValue");
  return result;
}

- (void)setShadowBias:(float)shadowBias
{
  CIRAWFilterImpl *v4;
  double v5;

  v4 = -[CIRAWFilter filterImplementation](self, "filterImplementation");
  *(float *)&v5 = shadowBias;
  -[CIRAWFilterImpl setValue:forKey:](v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5), CFSTR("inputBias"));
}

- (float)baselineExposure
{
  float result;

  objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("inputBaselineExposure")), "floatValue");
  return result;
}

- (void)setBaselineExposure:(float)baselineExposure
{
  CIRAWFilterImpl *v4;
  double v5;

  v4 = -[CIRAWFilter filterImplementation](self, "filterImplementation");
  *(float *)&v5 = baselineExposure;
  -[CIRAWFilterImpl setValue:forKey:](v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5), CFSTR("inputBaselineExposure"));
}

- (float)boostAmount
{
  float result;

  objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("inputBoost")), "floatValue");
  return result;
}

- (void)setBoostAmount:(float)boostAmount
{
  CIRAWFilterImpl *v4;
  double v5;

  v4 = -[CIRAWFilter filterImplementation](self, "filterImplementation");
  *(float *)&v5 = boostAmount;
  -[CIRAWFilterImpl setValue:forKey:](v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5), CFSTR("inputBoost"));
}

- (float)boostShadowAmount
{
  float result;

  objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("inputBoostShadowAmount")), "floatValue");
  return result;
}

- (void)setBoostShadowAmount:(float)boostShadowAmount
{
  CIRAWFilterImpl *v4;
  double v5;

  v4 = -[CIRAWFilter filterImplementation](self, "filterImplementation");
  *(float *)&v5 = boostShadowAmount;
  -[CIRAWFilterImpl setValue:forKey:](v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5), CFSTR("inputBoostShadowAmount"));
}

- (BOOL)isGamutMappingEnabled
{
  return objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("inputDisableGamutMap")), "BOOLValue") ^ 1;
}

- (void)setGamutMappingEnabled:(BOOL)gamutMappingEnabled
{
  _BOOL4 v3;
  CIRAWFilterImpl *v4;

  v3 = gamutMappingEnabled;
  v4 = -[CIRAWFilter filterImplementation](self, "filterImplementation");
  -[CIRAWFilterImpl setValue:forKey:](v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !v3), CFSTR("inputDisableGamutMap"));
}

- (BOOL)isLensCorrectionSupported
{
  return objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("activeKeys")), "containsObject:", CFSTR("inputEnableVendorLensCorrection"));
}

- (BOOL)isLensCorrectionEnabled
{
  return objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("inputEnableVendorLensCorrection")), "BOOLValue");
}

- (void)setLensCorrectionEnabled:(BOOL)lensCorrectionEnabled
{
  _BOOL8 v3;
  CIRAWFilterImpl *v4;

  v3 = lensCorrectionEnabled;
  v4 = -[CIRAWFilter filterImplementation](self, "filterImplementation");
  -[CIRAWFilterImpl setValue:forKey:](v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3), CFSTR("inputEnableVendorLensCorrection"));
}

- (BOOL)isLuminanceNoiseReductionSupported
{
  return objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("activeKeys")), "containsObject:", CFSTR("inputLuminanceNoiseReductionAmount"));
}

- (float)luminanceNoiseReductionAmount
{
  float result;

  objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("inputLuminanceNoiseReductionAmount")), "floatValue");
  return result;
}

- (void)setLuminanceNoiseReductionAmount:(float)luminanceNoiseReductionAmount
{
  CIRAWFilterImpl *v4;
  double v5;

  v4 = -[CIRAWFilter filterImplementation](self, "filterImplementation");
  *(float *)&v5 = luminanceNoiseReductionAmount;
  -[CIRAWFilterImpl setValue:forKey:](v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5), CFSTR("inputLuminanceNoiseReductionAmount"));
}

- (BOOL)isColorNoiseReductionSupported
{
  return objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("activeKeys")), "containsObject:", CFSTR("inputColorNoiseReductionAmount"));
}

- (float)colorNoiseReductionAmount
{
  float result;

  objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("inputColorNoiseReductionAmount")), "floatValue");
  return result;
}

- (void)setColorNoiseReductionAmount:(float)colorNoiseReductionAmount
{
  CIRAWFilterImpl *v4;
  double v5;

  v4 = -[CIRAWFilter filterImplementation](self, "filterImplementation");
  *(float *)&v5 = colorNoiseReductionAmount;
  -[CIRAWFilterImpl setValue:forKey:](v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5), CFSTR("inputColorNoiseReductionAmount"));
}

- (BOOL)isSharpnessSupported
{
  return objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("activeKeys")), "containsObject:", CFSTR("inputNoiseReductionSharpnessAmount"));
}

- (float)sharpnessAmount
{
  float result;

  objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("inputNoiseReductionSharpnessAmount")), "floatValue");
  return result;
}

- (void)setSharpnessAmount:(float)sharpnessAmount
{
  CIRAWFilterImpl *v4;
  double v5;

  v4 = -[CIRAWFilter filterImplementation](self, "filterImplementation");
  *(float *)&v5 = sharpnessAmount;
  -[CIRAWFilterImpl setValue:forKey:](v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5), CFSTR("inputNoiseReductionSharpnessAmount"));
}

- (BOOL)isContrastSupported
{
  return objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("activeKeys")), "containsObject:", CFSTR("inputNoiseReductionContrastAmount"));
}

- (float)contrastAmount
{
  float result;

  objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("inputNoiseReductionContrastAmount")), "floatValue");
  return result;
}

- (void)setContrastAmount:(float)contrastAmount
{
  CIRAWFilterImpl *v4;
  double v5;

  v4 = -[CIRAWFilter filterImplementation](self, "filterImplementation");
  *(float *)&v5 = contrastAmount;
  -[CIRAWFilterImpl setValue:forKey:](v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5), CFSTR("inputNoiseReductionContrastAmount"));
}

- (BOOL)isDetailSupported
{
  return objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("activeKeys")), "containsObject:", CFSTR("inputNoiseReductionDetailAmount"));
}

- (float)detailAmount
{
  float result;

  objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("inputNoiseReductionDetailAmount")), "floatValue");
  return result;
}

- (void)setDetailAmount:(float)detailAmount
{
  CIRAWFilterImpl *v4;
  double v5;

  v4 = -[CIRAWFilter filterImplementation](self, "filterImplementation");
  *(float *)&v5 = detailAmount;
  -[CIRAWFilterImpl setValue:forKey:](v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5), CFSTR("inputNoiseReductionDetailAmount"));
}

- (BOOL)isMoireReductionSupported
{
  return objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("activeKeys")), "containsObject:", CFSTR("inputMoireAmount"));
}

- (float)moireReductionAmount
{
  float result;

  objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("inputMoireAmount")), "floatValue");
  return result;
}

- (void)setMoireReductionAmount:(float)moireReductionAmount
{
  CIRAWFilterImpl *v4;
  double v5;

  v4 = -[CIRAWFilter filterImplementation](self, "filterImplementation");
  *(float *)&v5 = moireReductionAmount;
  -[CIRAWFilterImpl setValue:forKey:](v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5), CFSTR("inputMoireAmount"));
}

- (BOOL)isLocalToneMapSupported
{
  return objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("activeKeys")), "containsObject:", CFSTR("inputLocalToneMapAmount"));
}

- (float)localToneMapAmount
{
  float result;

  objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("inputLocalToneMapAmount")), "floatValue");
  return result;
}

- (void)setLocalToneMapAmount:(float)localToneMapAmount
{
  CIRAWFilterImpl *v4;
  double v5;

  v4 = -[CIRAWFilter filterImplementation](self, "filterImplementation");
  *(float *)&v5 = localToneMapAmount;
  -[CIRAWFilterImpl setValue:forKey:](v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5), CFSTR("inputLocalToneMapAmount"));
}

- (float)extendedDynamicRangeAmount
{
  float result;

  objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("inputEnableEDRMode")), "floatValue");
  return result;
}

- (void)setExtendedDynamicRangeAmount:(float)extendedDynamicRangeAmount
{
  float v3;
  CIRAWFilterImpl *v4;
  double v5;

  v3 = fminf(fmaxf(extendedDynamicRangeAmount, 0.0), 2.0);
  v4 = -[CIRAWFilter filterImplementation](self, "filterImplementation");
  *(float *)&v5 = v3;
  -[CIRAWFilterImpl setValue:forKey:](v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5), CFSTR("inputEnableEDRMode"));
}

- (CGPoint)neutralChromaticity
{
  float v3;
  float v4;
  float v5;
  double v6;
  double v7;
  CGPoint result;

  objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("inputNeutralChromaticityX")), "floatValue");
  v4 = v3;
  objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("inputNeutralChromaticityY")), "floatValue");
  v6 = v5;
  v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (void)setNeutralChromaticity:(CGPoint)neutralChromaticity
{
  double y;
  double x;
  CIRAWFilterImpl *v6;
  CIRAWFilterImpl *v7;

  y = neutralChromaticity.y;
  x = neutralChromaticity.x;
  v6 = -[CIRAWFilter filterImplementation](self, "filterImplementation");
  -[CIRAWFilterImpl setValue:forKey:](v6, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", x), CFSTR("inputNeutralChromaticityX"));
  v7 = -[CIRAWFilter filterImplementation](self, "filterImplementation");
  -[CIRAWFilterImpl setValue:forKey:](v7, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", y), CFSTR("inputNeutralChromaticityY"));
}

- (CGPoint)neutralLocation
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  v2 = (void *)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("inputNeutralLocation"));
  objc_msgSend(v2, "X");
  v4 = v3;
  objc_msgSend(v2, "Y");
  v6 = v5;
  v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (void)setNeutralLocation:(CGPoint)neutralLocation
{
  -[CIRAWFilterImpl setValue:forKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "setValue:forKey:", +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", neutralLocation.x, neutralLocation.y), CFSTR("inputNeutralLocation"));
}

- (float)neutralTemperature
{
  float result;

  objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("inputNeutralTemperature")), "floatValue");
  return result;
}

- (void)setNeutralTemperature:(float)neutralTemperature
{
  CIRAWFilterImpl *v4;
  double v5;

  v4 = -[CIRAWFilter filterImplementation](self, "filterImplementation");
  *(float *)&v5 = neutralTemperature;
  -[CIRAWFilterImpl setValue:forKey:](v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5), CFSTR("inputNeutralTemperature"));
}

- (float)neutralTint
{
  float result;

  objc_msgSend((id)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("inputNeutralTint")), "floatValue");
  return result;
}

- (void)setNeutralTint:(float)neutralTint
{
  CIRAWFilterImpl *v4;
  double v5;

  v4 = -[CIRAWFilter filterImplementation](self, "filterImplementation");
  *(float *)&v5 = neutralTint;
  -[CIRAWFilterImpl setValue:forKey:](v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5), CFSTR("inputNeutralTint"));
}

- (CIFilter)linearSpaceFilter
{
  return (CIFilter *)-[CIRAWFilterImpl valueForKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "valueForKey:", CFSTR("inputLinearSpaceFilter"));
}

- (void)setLinearSpaceFilter:(CIFilter *)linearSpaceFilter
{
  -[CIRAWFilterImpl setValue:forKey:](-[CIRAWFilter filterImplementation](self, "filterImplementation"), "setValue:forKey:", linearSpaceFilter, CFSTR("inputLinearSpaceFilter"));
}

- (CIImage)previewImage
{
  CGImageSource *v3;
  const __CFDictionary *v4;
  CGImageSource *v5;
  CGImageRef ThumbnailAtIndex;
  CGImage *v7;
  CIImage *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (-[CIRAWFilter imageURL](self, "imageURL"))
  {
    v3 = CGImageSourceCreateWithURL((CFURLRef)-[CIRAWFilter imageURL](self, "imageURL"), 0);
  }
  else
  {
    if (!-[CIRAWFilter imageData](self, "imageData"))
      return 0;
    if (-[CIRAWFilter imageDataHint](self, "imageDataHint"))
    {
      v10 = *MEMORY[0x1E0CBD2A8];
      v11[0] = -[CIRAWFilter imageDataHint](self, "imageDataHint");
      v4 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    }
    else
    {
      v4 = 0;
    }
    v3 = CGImageSourceCreateWithData((CFDataRef)-[CIRAWFilter imageData](self, "imageData"), v4);
  }
  v5 = v3;
  if (!v3)
    return 0;
  ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v3, 0, 0);
  if (ThumbnailAtIndex)
  {
    v7 = ThumbnailAtIndex;
    v8 = +[CIImage imageWithCGImage:](CIImage, "imageWithCGImage:", ThumbnailAtIndex);
    CGImageRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  CFRelease(v5);
  return v8;
}

- (id)auxImageWithKey:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t *v7;
  id *v8;
  uint64_t v9;
  uint64_t v10;
  id result;
  id v12;
  uint64_t v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if (-[CIRAWFilter imageDataHint](self, "imageDataHint"))
  {
    v15[0] = MEMORY[0x1E0C9AAB0];
    v5 = *MEMORY[0x1E0CBD2A8];
    v14[0] = a3;
    v14[1] = v5;
    v15[1] = -[CIRAWFilter imageDataHint](self, "imageDataHint");
    v6 = (void *)MEMORY[0x1E0C99D80];
    v7 = v15;
    v8 = (id *)v14;
    v9 = 2;
  }
  else
  {
    v12 = a3;
    v13 = MEMORY[0x1E0C9AAB0];
    v6 = (void *)MEMORY[0x1E0C99D80];
    v7 = &v13;
    v8 = &v12;
    v9 = 1;
  }
  v10 = objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v7, v8, v9);
  if (-[CIRAWFilter imageURL](self, "imageURL"))
    return +[CIImage imageWithContentsOfURL:options:](CIImage, "imageWithContentsOfURL:options:", -[CIRAWFilter imageURL](self, "imageURL"), v10);
  result = -[CIRAWFilter imageData](self, "imageData");
  if (result)
    return +[CIImage imageWithData:options:](CIImage, "imageWithData:options:", -[CIRAWFilter imageData](self, "imageData"), v10);
  return result;
}

- (CIImage)portraitEffectsMatte
{
  return (CIImage *)-[CIRAWFilter auxImageWithKey:](self, "auxImageWithKey:", CFSTR("kCIImageAuxiliaryPortraitEffectsMatte"));
}

- (CIImage)semanticSegmentationSkinMatte
{
  return (CIImage *)-[CIRAWFilter auxImageWithKey:](self, "auxImageWithKey:", CFSTR("kCIImageAuxiliarySemanticSegmentationSkinMatte"));
}

- (CIImage)semanticSegmentationHairMatte
{
  return (CIImage *)-[CIRAWFilter auxImageWithKey:](self, "auxImageWithKey:", CFSTR("kCIImageAuxiliarySemanticSegmentationHairMatte"));
}

- (CIImage)semanticSegmentationGlassesMatte
{
  return (CIImage *)-[CIRAWFilter auxImageWithKey:](self, "auxImageWithKey:", CFSTR("kCIImageAuxiliarySemanticSegmentationGlassesMatte"));
}

- (CIImage)semanticSegmentationSkyMatte
{
  return (CIImage *)-[CIRAWFilter auxImageWithKey:](self, "auxImageWithKey:", CFSTR("kCIImageAuxiliarySemanticSegmentationSkyMatte"));
}

- (CIImage)semanticSegmentationTeethMatte
{
  return (CIImage *)-[CIRAWFilter auxImageWithKey:](self, "auxImageWithKey:", CFSTR("kCIImageAuxiliarySemanticSegmentationTeethMatte"));
}

- (CIRAWFilter)initWithImageURL:(id)a3
{
  if (self)
  {
    self->filterImplementation = (CIRAWFilterImpl *)+[CIRAWFilterImpl filterWithImageURL:options:](CIRAWFilterImpl, "filterWithImageURL:options:", a3, 0);
    self->imageURL = (NSURL *)a3;
  }
  return self;
}

- (CIRAWFilter)initWithImageData:(id)a3 identifierHint:(id)a4
{
  uint64_t v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (self)
  {
    if (a4)
    {
      v9 = *MEMORY[0x1E0CBD2A8];
      v10[0] = a4;
      v7 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    }
    else
    {
      v7 = 0;
    }
    self->filterImplementation = (CIRAWFilterImpl *)+[CIRAWFilterImpl filterWithImageData:options:](CIRAWFilterImpl, "filterWithImageData:options:", a3, v7);
    self->imageData = (NSData *)a3;
    self->imageDataHint = (NSString *)a4;
  }
  return self;
}

- (CIRAWFilter)initWithCVPixelBuffer:(__CVBuffer *)a3 properties:(id)a4
{
  if (self)
    self->filterImplementation = (CIRAWFilterImpl *)+[CIRAWFilterImpl filterWithCVPixelBuffer:properties:options:](CIRAWFilterImpl, "filterWithCVPixelBuffer:properties:options:", a3, a4, 0);
  return self;
}

+ (NSArray)supportedCameraModels
{
  NSArray *result;

  result = +[CIRAWFilterImpl supportedRawCameraModels](CIRAWFilterImpl, "supportedRawCameraModels");
  if (!result)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  return result;
}

+ (CIRAWFilter)filterWithImageURL:(NSURL *)url
{
  return (CIRAWFilter *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithImageURL:", url);
}

+ (CIRAWFilter)filterWithImageURL:(id)a3 options:(id)a4
{
  return (CIRAWFilter *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithImageURL:", a3);
}

+ (CIRAWFilter)filterWithImageData:(NSData *)data identifierHint:(NSString *)identifierHint
{
  return (CIRAWFilter *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithImageData:identifierHint:", data, identifierHint);
}

+ (CIRAWFilter)filterWithCVPixelBuffer:(CVPixelBufferRef)buffer properties:(NSDictionary *)properties
{
  return (CIRAWFilter *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithCVPixelBuffer:properties:", buffer, properties);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CIRAWFilter;
  -[CIFilter dealloc](&v3, sel_dealloc);
}

- (id)attributes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__CIRAWFilter_attributes__block_invoke;
  block[3] = &unk_1E2EC3CC8;
  block[4] = self;
  if (attributes_onceToken != -1)
    dispatch_once(&attributes_onceToken, block);
  return (id)attributes_rawFilterAttributes;
}

void __25__CIRAWFilter_attributes__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  objc_super v4;

  v2 = (void *)MEMORY[0x194026220]();
  objc_msgSend(*(id *)(a1 + 32), "filterImplementation");
  v3 = (void *)objc_msgSend(+[CIFilterClassAttributes classAttributesForClass:](CIFilterClassAttributes, "classAttributesForClass:", objc_opt_class()), "mutableCopy");
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)CIRAWFilter;
  objc_msgSend(v3, "addEntriesFromDictionary:", objc_msgSendSuper2(&v4, sel_attributes));
  attributes_rawFilterAttributes = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v3);

  objc_autoreleasePoolPop(v2);
}

- (CIRAWFilterImpl)filterImplementation
{
  return (CIRAWFilterImpl *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFilterImplementation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSURL)imageURL
{
  return (NSURL *)objc_getProperty(self, a2, 88, 1);
}

- (void)setImageURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSData)imageData
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (void)setImageData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSString)imageDataHint
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setImageDataHint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

@end

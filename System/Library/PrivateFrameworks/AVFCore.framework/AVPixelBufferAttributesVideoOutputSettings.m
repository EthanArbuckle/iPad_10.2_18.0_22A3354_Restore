@implementation AVPixelBufferAttributesVideoOutputSettings

+ (id)_videoOutputSettingsWithVideoSettingsDictionary:(id)a3 exceptionReason:(id *)a4
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPixelBufferAttributes:exceptionReason:", a3, a4);
}

- (AVPixelBufferAttributesVideoOutputSettings)initWithPixelBufferAttributes:(id)a3 exceptionReason:(id *)a4
{
  AVPixelBufferAttributesVideoOutputSettings *v6;
  AVPixelBufferAttributesVideoOutputSettings *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const __CFDictionary *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFDictionary *v27;
  uint64_t v28;
  id v30;
  objc_super v31;
  __CFString *v32;

  v31.receiver = self;
  v31.super_class = (Class)AVPixelBufferAttributesVideoOutputSettings;
  v32 = 0;
  v6 = -[AVVideoOutputSettings initWithVideoSettingsDictionary:exceptionReason:](&v31, sel_initWithVideoSettingsDictionary_exceptionReason_, a3, &v32);
  v7 = v6;
  if (a3 && v6)
  {
    v8 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CA90E0]);
    v9 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CA8FD8]);
    if (v8 && objc_msgSend(v8, "integerValue") < 0 || v9 && objc_msgSend(v9, "integerValue") < 0)
    {
      v10 = 0;
      v32 = CFSTR("Pixel buffer attributes width and height must be nonnegative");
    }
    else
    {
      v10 = 1;
    }
    v11 = objc_msgSend(a3, "objectForKey:", CFSTR("AVVideoScalingModeKey"));
    v12 = (void *)objc_msgSend((id)objc_opt_class(), "_validValuesForScalingMode");
    if (v10 && v11)
    {
      v13 = v12;
      if ((objc_msgSend(v12, "containsObject:", v11) & 1) != 0)
      {
        v10 = 1;
      }
      else
      {
        v10 = 0;
        v32 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Value for AVVideoScalingModeKey must be one of: %@"), objc_msgSend((id)objc_msgSend(v13, "allObjects"), "componentsJoinedByString:", CFSTR(", ")));
      }
    }
    v14 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVVideoPixelAspectRatioKey"));
    if (v10 && v14)
    {
      v30 = 0;
      v10 = AVVideoOutputSettingsValidateAVPixelAspectRatioDictionaryAndReturnVTPixelAspectRatioDictionary(v14, &v30, (const __CFString **)&v32);
      v7->_VTPixelAspectRatioDictionary = (NSDictionary *)objc_msgSend(v30, "copy");
    }
    v15 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVVideoCleanApertureKey"));
    if (v10 && v15)
    {
      v30 = 0;
      v10 = AVVideoOutputSettingsValidateAVCleanApertureDictionaryAndReturnVTCleanApertureDictionary(v15, v8, v9, &v30, (const __CFString **)&v32);
      v7->_VTCleanApertureDictionary = (NSDictionary *)objc_msgSend(v30, "copy");
    }
    v16 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVVideoColorPropertiesKey"));
    if (v10 && v16)
      v10 = AVVideoOutputSettingsValidateVideoColorProperties(v16, (const __CFString **)&v32);
    v17 = objc_msgSend(a3, "objectForKey:", CFSTR("AVVideoAllowWideColorKey"));
    if (v10 && v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = 1;
      }
      else
      {
        v10 = 0;
        v32 = CFSTR("Dictionary for AVVideoAllowWideColorKey must be an NSNumber");
      }
    }
    v18 = (const __CFDictionary *)objc_msgSend(a3, "objectForKey:", CFSTR("AVVideoMinimumFrameDuration"));
    if (v10 && v18)
      v10 = AVVideoOutputSettingsValidateMinimumFrameDuration(v18, (const __CFString **)&v32);
    v19 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVVideoFrameRateConversionAlgorithm"));
    if (v10 && v19)
      v10 = AVVideoOutputSettingsValidateFrameRateConversionAlgorithm(v19, (const __CFString **)&v32);
    v20 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVVideoDecompressionPropertiesKey"));
    v21 = objc_msgSend(v20, "objectForKey:", *MEMORY[0x1E0CED310]);
    if (v10)
    {
      v22 = (void *)v21;
      if (v21)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if ((objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0CED3F0]) & 1) != 0
            || (objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0CED410]) & 1) != 0
            || (objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0CED3F8]) & 1) != 0
            || (objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0CED408]) & 1) != 0
            || (objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0CED400]) & 1) != 0)
          {
            v10 = 1;
            goto LABEL_45;
          }
          v23 = CFSTR("kVTDecompressionPropertyKey_FieldMode must be one of: kVTDecompressionProperty_FieldMode_BothFields, kVTDecompressionProperty_FieldMode_TopFieldOnly, kVTDecompressionProperty_FieldMode_BottomFieldOnly, kVTDecompressionProperty_FieldMode_SingleField, or kVTDecompressionProperty_FieldMode_DeinterlaceFields");
        }
        else
        {
          v23 = CFSTR("String for kVTDecompressionPropertyKey_FieldMode must be an NSString");
        }
        v10 = 0;
        v32 = (__CFString *)v23;
      }
    }
LABEL_45:
    v24 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVVideoDecompressionPropertiesKey"));
    v25 = objc_msgSend(v24, "objectForKey:", *MEMORY[0x1E0CED380]);
    if (v10 && v25)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = 1;
      }
      else
      {
        v10 = 0;
        v32 = CFSTR("Value for kVTDecompressionPropertyKey_PropagatePerFrameHDRDisplayMetadata must be an NSNumber");
      }
    }
    v26 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVVideoEmitSequencesAtSyncFramesOnly"));
    if (v10 && v26)
      v10 = AVVideoOutputSettingsValidateEmitSequencesAtSyncFramesOnly(v26, (const __CFString **)&v32);
    v27 = (const __CFDictionary *)objc_msgSend(a3, "objectForKey:", CFSTR("AVVideoMinimumIntervalForSyncFrames"));
    if (v10 && v27)
      v10 = AVVideoOutputSettingsValidateMinimumFrameDuration(v27, (const __CFString **)&v32);
    v28 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CA9010]);
    if (v10 && v28 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v32 = CFSTR("Value for kCVPixelBufferMetalCompatibilityKey must be an NSNumber wrapping a BOOL");
    }
    else if ((v10 & 1) != 0)
    {
      goto LABEL_63;
    }

    v7 = 0;
  }
LABEL_63:
  if (a4)
    *a4 = v32;
  return v7;
}

+ (id)eligibleOutputSettingsDictionaryKeys
{
  return (id)objc_msgSend((id)AVVideoOutputSettingsValidPixelBufferAttributesKeys(), "setByAddingObjectsFromSet:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("AVVideoScalingModeKey"), CFSTR("AVVideoColorPropertiesKey"), CFSTR("AVVideoAllowWideColorKey"), CFSTR("AVVideoPixelAspectRatioKey"), CFSTR("AVVideoCleanApertureKey"), CFSTR("AVVideoFrameRateConversionAlgorithm"), CFSTR("AVVideoDecompressionPropertiesKey"), CFSTR("AVVideoMinimumFrameDuration"), CFSTR("AVVideoEmitSequencesAtSyncFramesOnly"), CFSTR("AVVideoMinimumIntervalForSyncFrames"), CFSTR("AVVideoAverageIntervalForSyncFramesKey"), 0));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVPixelBufferAttributesVideoOutputSettings;
  -[AVOutputSettings dealloc](&v3, sel_dealloc);
}

- (AVPixelBufferAttributesVideoOutputSettings)initWithTrustedPixelBufferAttributes:(id)a3
{
  AVPixelBufferAttributesVideoOutputSettings *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVPixelBufferAttributesVideoOutputSettings;
  v4 = -[AVVideoOutputSettings initWithVideoSettingsDictionary:exceptionReason:](&v8, sel_initWithVideoSettingsDictionary_exceptionReason_, a3, 0);
  v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVVideoPixelAspectRatioKey"));
  if (v5)
    v4->_VTPixelAspectRatioDictionary = (NSDictionary *)objc_msgSend(AVVideoOutputSettingsVTPASPDictionaryForAVPASPDictionary(v5), "copy");
  v6 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVVideoCleanApertureKey"));
  if (v6)
    v4->_VTCleanApertureDictionary = (NSDictionary *)objc_msgSend(AVVideoOutputSettingsVTCLAPDictionaryForAVCLAPDictionary(v6), "copy");
  return v4;
}

- (int)width
{
  NSDictionary *v2;
  id v3;

  v2 = -[AVOutputSettings outputSettingsDictionary](self, "outputSettingsDictionary");
  v3 = -[NSDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x1E0CA90E0]);
  if (v3)
    LODWORD(v3) = objc_msgSend(v3, "integerValue");
  return (int)v3;
}

- (int)height
{
  NSDictionary *v2;
  id v3;

  v2 = -[AVOutputSettings outputSettingsDictionary](self, "outputSettingsDictionary");
  v3 = -[NSDictionary objectForKey:](v2, "objectForKey:", *MEMORY[0x1E0CA8FD8]);
  if (v3)
    LODWORD(v3) = objc_msgSend(v3, "integerValue");
  return (int)v3;
}

- (id)pixelAspectRatioDictionary
{
  return self->_VTPixelAspectRatioDictionary;
}

- (id)cleanApertureDictionary
{
  return self->_VTCleanApertureDictionary;
}

- (BOOL)willYieldCompressedSamples
{
  return 0;
}

- (BOOL)encoderIsAvailableOnCurrentSystemReturningError:(id *)a3
{
  return 1;
}

- (BOOL)canFullySpecifyOutputFormatReturningReason:(id *)a3
{
  return 1;
}

- (NSDictionary)pixelBufferAttributes
{
  NSDictionary *v2;
  void *v3;

  v2 = -[AVVideoOutputSettings videoSettingsDictionary](self, "videoSettingsDictionary");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", -[NSDictionary allKeys](v2, "allKeys"));
  objc_msgSend(v3, "intersectSet:", AVVideoOutputSettingsValidPixelBufferAttributesKeys());
  return -[NSDictionary dictionaryWithValuesForKeys:](v2, "dictionaryWithValuesForKeys:", objc_msgSend(v3, "allObjects"));
}

- (NSString)fieldMode
{
  id v2;

  v2 = -[NSDictionary objectForKey:](-[AVVideoOutputSettings videoSettingsDictionary](self, "videoSettingsDictionary"), "objectForKey:", CFSTR("AVVideoDecompressionPropertiesKey"));
  return (NSString *)objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CED310]);
}

@end

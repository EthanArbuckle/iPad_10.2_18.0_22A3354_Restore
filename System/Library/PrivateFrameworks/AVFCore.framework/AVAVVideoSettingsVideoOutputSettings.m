@implementation AVAVVideoSettingsVideoOutputSettings

+ (id)eligibleOutputSettingsDictionaryKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("AVVideoCodecKey"), CFSTR("AVVideoWidthKey"), CFSTR("AVVideoHeightKey"), CFSTR("AVVideoScalingModeKey"), CFSTR("AVVideoColorPropertiesKey"), CFSTR("AVVideoAllowWideColorKey"), CFSTR("AVVideoCompressionPropertiesKey"), CFSTR("AVVideoPixelAspectRatioKey"), CFSTR("AVVideoCleanApertureKey"), CFSTR("AVVideoFrameRateConversionAlgorithm"), CFSTR("AVVideoMinimumFrameDuration"), CFSTR("AVVideoEmitSequencesAtSyncFramesOnly"), CFSTR("AVVideoMinimumIntervalForSyncFrames"), CFSTR("AVVideoAverageIntervalForSyncFramesKey"), 0);
}

+ (id)_videoOutputSettingsWithVideoSettingsDictionary:(id)a3 exceptionReason:(id *)a4
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAVVideoSettingsDictionary:exceptionReason:", a3, a4);
}

+ (BOOL)_validateVideoCompressionProperties:(id)a3 againstSupportedPropertyDictionary:(id)a4 forCodecType:(id)a5 exceptionReason:(id *)a6
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v26;
  id *v27;
  uint64_t v28;
  id obj;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = (id)objc_msgSend(a3, "allKeys");
  v8 = (void *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v8)
  {
    v9 = (uint64_t)v8;
    v10 = *(_QWORD *)v37;
    v33 = *MEMORY[0x1E0CEDA00];
    v32 = *MEMORY[0x1E0CED9F8];
    v31 = *MEMORY[0x1E0CED9F0];
    v30 = *MEMORY[0x1E0CED9C8];
    v28 = *MEMORY[0x1E0CED9D0];
    v27 = a6;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v37 != v10)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v11);
      if (!objc_msgSend(a5, "isEqualToString:", CFSTR("jpeg"))
        || (objc_msgSend(v12, "isEqualToString:", CFSTR("AverageBitRate")) & 1) == 0
        && (objc_msgSend(v12, "isEqualToString:", CFSTR("MaxKeyFrameInterval")) & 1) == 0)
      {
        v13 = (void *)objc_msgSend(a4, "objectForKey:", v12);
        v14 = objc_msgSend(a3, "objectForKey:", v12);
        if (!v13)
        {
          v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Compression property %@ is not supported for video codec type %@"), v12, a5, v26);
          goto LABEL_35;
        }
        v15 = (void *)v14;
        v16 = objc_msgSend(v13, "objectForKey:", v33);
        v17 = objc_msgSend(v13, "objectForKey:", v32);
        if (v16 | v17)
        {
          v18 = (void *)v17;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Video codec type %@ expects a value for compression property %@ in a particular numeric range, but property value %@ is not numeric"), a5, v12, v15);
            goto LABEL_35;
          }
          if (v16 && objc_msgSend((id)v16, "compare:", v15) == 1)
          {
            v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Video codec type %@ does not allow values for %@ that are numerically less than %@"), a5, v12, v16);
            goto LABEL_35;
          }
          if (v18 && objc_msgSend(v18, "compare:", v15) == -1)
          {
            v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Video codec type %@ does not allow values for %@ that are numerically greater than %@"), a5, v12, v18);
            goto LABEL_35;
          }
        }
        v19 = (void *)objc_msgSend(v13, "objectForKey:", v31);
        if (v19)
        {
          v20 = v19;
          if ((objc_msgSend(v19, "containsObject:", v15) & 1) == 0)
          {
            v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("For compression property %@, video codec type %@ only allows the following values: %@"), v12, a5, objc_msgSend(v20, "componentsJoinedByString:", CFSTR(", ")));
            goto LABEL_35;
          }
        }
        v21 = (void *)objc_msgSend(v13, "objectForKey:", v30);
        if (v21)
        {
          if (objc_msgSend(v21, "isEqualToString:", v28))
          {
            v22 = objc_msgSend(v13, "objectForKey:", CFSTR("av_kVTPropertyInitialValueKey"));
            if (v22)
            {
              v23 = v22;
              if ((objc_msgSend(v15, "isEqual:", v22) & 1) == 0)
                break;
            }
          }
        }
      }
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        v8 = 0;
        v24 = 1;
        a6 = v27;
        if (v9)
          goto LABEL_3;
        goto LABEL_26;
      }
    }
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("For compression property %@, video codec type %@ only allows the value %@"), v12, a5, v23);
LABEL_35:
    v24 = 0;
    a6 = v27;
    if (v27)
      goto LABEL_27;
  }
  else
  {
    v24 = 1;
LABEL_26:
    if (a6)
LABEL_27:
      *a6 = v8;
  }
  return v24;
}

- (AVAVVideoSettingsVideoOutputSettings)initWithAVVideoSettingsDictionary:(id)a3 exceptionReason:(id *)a4
{
  AVAVVideoSettingsVideoOutputSettings *v7;
  AVAVVideoSettingsVideoOutputSettings *v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  const __CFString *v19;
  int v20;
  BOOL v21;
  int v22;
  id v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  const __CFDictionary *v31;
  void *v32;
  void *v33;
  const __CFDictionary *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  float v40;
  void *v41;
  double v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  char v49;
  AVAVVideoSettingsVideoOutputSettings *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  id v58;
  __CFString *v59;
  id v60;

  v59 = 0;
  v7 = -[AVVideoOutputSettings initWithVideoSettingsDictionary:exceptionReason:](self, "initWithVideoSettingsDictionary:exceptionReason:", a3, &v59);
  v8 = v7;
  if (!a3)
  {
    v51 = v7;
    v57 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v52, v53, v54, v55, v56, (uint64_t)"avVideoSettingsDictionary != nil"), 0);
    objc_exception_throw(v57);
  }
  if (!v7)
    goto LABEL_121;
  v9 = objc_msgSend(a3, "objectForKey:", CFSTR("AVVideoCodecKey"));
  v10 = (void *)v9;
  if (!v9)
    v59 = CFSTR("AVVideoSettings dictionary must contain AVVideoCodecKey");
  v11 = v9 == 0;
  v12 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVVideoWidthKey"));
  v13 = objc_msgSend(a3, "objectForKey:", CFSTR("AVVideoHeightKey"));
  v14 = (void *)v13;
  if (v12)
    v15 = v11;
  else
    v15 = 1;
  if (v13)
    v15 = 1;
  if (v10)
    v16 = v15;
  else
    v16 = 0;
  if (v12)
    v17 = 0;
  else
    v17 = v16;
  if (!v13)
    v17 = 0;
  v18 = v16 ^ v17;
  if ((v17 & 1) != 0 || !v15)
  {
    v19 = CFSTR("AVVideoSettings dictionary must specify a height if it specifies a width");
    if (v17)
      v19 = CFSTR("AVVideoSettings dictionary must specify a width if it specifies a height");
    v59 = (__CFString *)v19;
  }
  if (v12)
    v20 = v16 ^ v17;
  else
    v20 = 0;
  if (v20 == 1)
  {
    if (objc_msgSend(v12, "integerValue") <= 0)
    {
      v24 = CFSTR("AVVideoSettings dictionary must specify a positive width");
LABEL_40:
      v59 = (__CFString *)v24;
      goto LABEL_41;
    }
    v18 = 1;
  }
  if (v18)
    v21 = v14 == 0;
  else
    v21 = 1;
  if (!v21 && objc_msgSend(v14, "integerValue") <= 0)
  {
    v24 = CFSTR("AVVideoSettings dictionary must specify a positive height");
    goto LABEL_40;
  }
  if ((v18 & 1) != 0)
  {
    v60 = 0;
    v58 = 0;
    v22 = AVVideoOutputSettingsExtractPixelAspectRatioAndCleanApertureFromAVVideoSettingsDictionary(a3, v12, v14, &v60, &v58, &v59);
    v8->_VTPixelAspectRatioDictionary = (NSDictionary *)objc_msgSend(v60, "copy");
    v8->_VTCleanApertureDictionary = (NSDictionary *)objc_msgSend(v58, "copy");
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v23 = 0;
    if (v10 && v22)
    {
      AVOSTypeForString(v10);
      objc_msgSend(v12, "integerValue");
      objc_msgSend(v14, "integerValue");
      v60 = 0;
      FigSharedRemote_CopyVideoCompressorSupportedPropertyDictionary();
      v23 = v60;
      v22 = 1;
    }
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v22 = 0;
  v23 = 0;
LABEL_42:
  v25 = objc_msgSend(a3, "objectForKey:", CFSTR("AVVideoScalingModeKey"));
  v26 = (void *)objc_msgSend((id)objc_opt_class(), "_validValuesForScalingMode");
  if (v22 && v25)
  {
    v27 = v26;
    if ((objc_msgSend(v26, "containsObject:", v25) & 1) != 0)
    {
      v22 = 1;
    }
    else
    {
      v22 = 0;
      v59 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Value for AVVideoScalingModeKey must be one of: %@"), objc_msgSend((id)objc_msgSend(v27, "allObjects"), "componentsJoinedByString:", CFSTR(", ")));
    }
  }
  v28 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVVideoColorPropertiesKey"));
  v29 = v28;
  if (v22)
  {
    if (v28)
    {
      v22 = AVVideoOutputSettingsValidateVideoColorProperties(v28, (const __CFString **)&v59);
      if (v22)
      {
        if (v23)
          v22 = objc_msgSend((id)objc_opt_class(), "_validateVideoCompressionProperties:againstSupportedPropertyDictionary:forCodecType:exceptionReason:", v29, v23, v10, &v59);
      }
    }
  }
  v30 = objc_msgSend(a3, "objectForKey:", CFSTR("AVVideoAllowWideColorKey"));
  if (v22 && v30)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = 1;
    }
    else
    {
      v22 = 0;
      v59 = CFSTR("Dictionary for AVVideoAllowWideColorKey must be an NSNumber");
    }
  }
  v31 = (const __CFDictionary *)objc_msgSend(a3, "objectForKey:", CFSTR("AVVideoMinimumFrameDuration"));
  if (v22 && v31)
    v22 = AVVideoOutputSettingsValidateMinimumFrameDuration(v31, (const __CFString **)&v59);
  v32 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVVideoFrameRateConversionAlgorithm"));
  if (v22 && v32)
    v22 = AVVideoOutputSettingsValidateFrameRateConversionAlgorithm(v32, (const __CFString **)&v59);
  v33 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AVVideoEmitSequencesAtSyncFramesOnly"));
  if (v22 && v33)
    v22 = AVVideoOutputSettingsValidateEmitSequencesAtSyncFramesOnly(v33, (const __CFString **)&v59);
  v34 = (const __CFDictionary *)objc_msgSend(a3, "objectForKey:", CFSTR("AVVideoMinimumIntervalForSyncFrames"));
  if (v22 && v34)
    v22 = AVVideoOutputSettingsValidateMinimumFrameDuration(v34, (const __CFString **)&v59);
  v35 = objc_msgSend(a3, "objectForKey:", CFSTR("AVVideoCompressionPropertiesKey"));
  if (!v22 || !v35)
  {
    if ((v22 & 1) != 0)
      goto LABEL_121;
    goto LABEL_120;
  }
  v36 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v35);
  objc_msgSend(v36, "removeObjectForKey:", CFSTR("AVVideoPixelAspectRatioKey"));
  objc_msgSend(v36, "removeObjectForKey:", CFSTR("AVVideoCleanApertureKey"));
  v37 = (void *)objc_msgSend(v36, "objectForKey:", CFSTR("AverageBitRate"));
  if (v37 && objc_msgSend(v37, "integerValue") <= 0)
  {
    v38 = 0;
    v59 = CFSTR("AVVideoCompressionPropertiesKey dictionary must specify a positive value for AVVideoAverageBitRateKey");
  }
  else
  {
    v38 = 1;
  }
  v39 = (void *)objc_msgSend(v36, "objectForKey:", CFSTR("Quality"));
  if (v38 && v39)
  {
    objc_msgSend(v39, "floatValue");
    if (v40 < 0.0 || v40 > 1.0)
    {
      v38 = 0;
      v59 = CFSTR("AVVideoCompressionPropertiesKey dictionary must specify a value between 0.0 and 1.0 for AVVideoQualityKey");
    }
    else
    {
      v38 = 1;
    }
  }
  v41 = (void *)objc_msgSend(v36, "objectForKey:", CFSTR("MaxKeyFrameIntervalDuration"));
  if (v38 && v41)
  {
    objc_msgSend(v41, "doubleValue");
    if (v42 >= 0.0)
    {
      v38 = 1;
    }
    else
    {
      v38 = 0;
      v59 = CFSTR("AVVideoCompressionPropertiesKey dictionary must specify a non-negative value for AVVideoMaxKeyFrameIntervalDurationKey");
    }
  }
  v43 = (void *)objc_msgSend(v36, "objectForKey:", CFSTR("MaxKeyFrameInterval"));
  if (v38 && v43)
  {
    if (objc_msgSend(v43, "integerValue") <= 0)
    {
      v38 = 0;
      v59 = CFSTR("AVVideoCompressionPropertiesKey dictionary must specify a positive value for AVVideoMaxKeyFrameIntervalKey");
    }
    else
    {
      v38 = 1;
    }
  }
  v44 = objc_msgSend(v36, "objectForKey:", CFSTR("H264EntropyMode"));
  if (v38 && v44)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = 1;
    }
    else
    {
      v38 = 0;
      v59 = CFSTR("Value for AVVideoH264EntropyModeKey must be an instance of NSString");
    }
  }
  v45 = objc_msgSend(v36, "objectForKey:", CFSTR("ExpectedFrameRate"));
  if (v38 && v45)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = 1;
    }
    else
    {
      v38 = 0;
      v59 = CFSTR("Value for AVVideoExpectedSourceFrameRateKey must be an instance of NSNumber");
    }
  }
  v46 = objc_msgSend(v36, "objectForKey:", CFSTR("AllowFrameReordering"));
  if (v38 && v46)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = 1;
    }
    else
    {
      v38 = 0;
      v59 = CFSTR("Value for AVVideoAllowFrameReorderingKey must be an instance of NSNumber");
    }
  }
  v47 = objc_msgSend(v36, "objectForKey:", CFSTR("AverageNonDroppableFrameRate"));
  if (v38)
  {
    if (v47)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v59 = CFSTR("Value for AVVideoAverageNonDroppableFrameRateKey must be an instance of NSNumber");
        v8->_adaptedVideoCompressionProperties = (NSDictionary *)objc_msgSend(v36, "copy");
        goto LABEL_120;
      }
    }
  }
  if (v23)
    v48 = v38;
  else
    v48 = 0;
  if (v48 == 1)
  {
    v49 = objc_msgSend((id)objc_opt_class(), "_validateVideoCompressionProperties:againstSupportedPropertyDictionary:forCodecType:exceptionReason:", v36, v23, v10, &v59);
    v8->_adaptedVideoCompressionProperties = (NSDictionary *)objc_msgSend(v36, "copy");
    if ((v49 & 1) != 0)
      goto LABEL_121;
LABEL_120:

    v8 = 0;
    goto LABEL_121;
  }
  v8->_adaptedVideoCompressionProperties = (NSDictionary *)objc_msgSend(v36, "copy");
  if ((v38 & 1) == 0)
    goto LABEL_120;
LABEL_121:
  if (a4)
    *a4 = v59;
  return v8;
}

- (AVAVVideoSettingsVideoOutputSettings)initWithTrustedAVVideoSettingsDictionary:(id)a3
{
  AVAVVideoSettingsVideoOutputSettings *v4;
  uint64_t v5;
  void *v6;
  id v8;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVAVVideoSettingsVideoOutputSettings;
  v4 = -[AVVideoOutputSettings initWithVideoSettingsDictionary:exceptionReason:](&v10, sel_initWithVideoSettingsDictionary_exceptionReason_, a3, 0);
  v8 = 0;
  v9 = 0;
  AVVideoOutputSettingsExtractPixelAspectRatioAndCleanApertureFromAVVideoSettingsDictionary(a3, 0, 0, &v9, &v8, 0);
  v4->_VTPixelAspectRatioDictionary = (NSDictionary *)objc_msgSend(v9, "copy");
  v4->_VTCleanApertureDictionary = (NSDictionary *)objc_msgSend(v8, "copy");
  v5 = objc_msgSend(a3, "objectForKey:", CFSTR("AVVideoCompressionPropertiesKey"));
  if (v5)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v5);
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("AVVideoPixelAspectRatioKey"));
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("AVVideoCleanApertureKey"));
    v4->_adaptedVideoCompressionProperties = (NSDictionary *)objc_msgSend(v6, "copy");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAVVideoSettingsVideoOutputSettings;
  -[AVOutputSettings dealloc](&v3, sel_dealloc);
}

- (BOOL)willYieldCompressedSamples
{
  return 1;
}

- (BOOL)encoderIsAvailableOnCurrentSystemReturningError:(id *)a3
{
  uint64_t v4;
  __CFDictionary *Mutable;
  const void *v6;
  CFIndex v7;
  const void *v8;
  const __CFDictionary *ValueAtIndex;
  int v10;
  BOOL v11;
  void *v12;
  CFArrayRef listOfVideoEncodersOut;

  listOfVideoEncodersOut = 0;
  v4 = -[AVAVVideoSettingsVideoOutputSettings videoCodecType](self, "videoCodecType");
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v6 = (const void *)*MEMORY[0x1E0C9AE50];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CEDD08], (const void *)*MEMORY[0x1E0C9AE50]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CEDD10], v6);
  VTCopyVideoEncoderList(Mutable, &listOfVideoEncodersOut);
  if (CFArrayGetCount(listOfVideoEncodersOut) < 1)
  {
    v11 = 1;
    if (Mutable)
LABEL_6:
      CFRelease(Mutable);
  }
  else
  {
    v7 = 0;
    v8 = (const void *)*MEMORY[0x1E0CEDCF0];
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(listOfVideoEncodersOut, v7);
      v10 = objc_msgSend((id)CFDictionaryGetValue(ValueAtIndex, v8), "unsignedIntValue");
      v11 = v10 == (_DWORD)v4;
      if (v10 == (_DWORD)v4)
        break;
      ++v7;
    }
    while (v7 < CFArrayGetCount(listOfVideoEncodersOut));
    if (Mutable)
      goto LABEL_6;
  }
  if (listOfVideoEncodersOut)
    CFRelease(listOfVideoEncodersOut);
  if (!v11)
  {
    v12 = (void *)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11834, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("vide"), CFSTR("AVErrorMediaTypeKey"), objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4), 0), CFSTR("AVErrorMediaSubTypeKey"), 0));
    if (a3)
      *a3 = v12;
  }
  return v11;
}

- (BOOL)canFullySpecifyOutputFormatReturningReason:(id *)a3
{
  NSDictionary *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  BOOL result;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = -[AVVideoOutputSettings videoSettingsDictionary](self, "videoSettingsDictionary");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("AVVideoCodecKey"), CFSTR("AVVideoWidthKey"), CFSTR("AVVideoHeightKey"), 0);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (!-[NSDictionary objectForKey:](v4, "objectForKey:", v10))
        {
          v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing required key %@"), v10);
          if (!a3)
            return 0;
          v13 = (void *)v12;
          result = 0;
          *a3 = v13;
          return result;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  return 1;
}

- (int)width
{
  id v2;

  v2 = -[NSDictionary objectForKey:](-[AVOutputSettings outputSettingsDictionary](self, "outputSettingsDictionary"), "objectForKey:", CFSTR("AVVideoWidthKey"));
  if (v2)
    LODWORD(v2) = objc_msgSend(v2, "integerValue");
  return (int)v2;
}

- (int)height
{
  id v2;

  v2 = -[NSDictionary objectForKey:](-[AVOutputSettings outputSettingsDictionary](self, "outputSettingsDictionary"), "objectForKey:", CFSTR("AVVideoHeightKey"));
  if (v2)
    LODWORD(v2) = objc_msgSend(v2, "integerValue");
  return (int)v2;
}

- (id)pixelAspectRatioDictionary
{
  return self->_VTPixelAspectRatioDictionary;
}

- (id)cleanApertureDictionary
{
  return self->_VTCleanApertureDictionary;
}

- (unsigned)videoCodecType
{
  id v2;

  v2 = -[NSDictionary objectForKey:](-[AVOutputSettings outputSettingsDictionary](self, "outputSettingsDictionary"), "objectForKey:", CFSTR("AVVideoCodecKey"));
  if (v2)
    LODWORD(v2) = AVOSTypeForString(v2);
  return v2;
}

- (NSDictionary)videoEncoderSpecification
{
  return 0;
}

- (NSDictionary)videoCompressionProperties
{
  NSDictionary *v3;
  NSDictionary *v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  NSDictionary *VTPixelAspectRatioDictionary;
  NSDictionary *VTCleanApertureDictionary;

  v3 = -[AVOutputSettings outputSettingsDictionary](self, "outputSettingsDictionary");
  v4 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", self->_adaptedVideoCompressionProperties);
  if (objc_msgSend(-[NSDictionary objectForKey:](v3, "objectForKey:", CFSTR("AVVideoCodecKey")), "isEqualToString:", CFSTR("jpeg"))&& !-[NSDictionary objectForKey:](v4, "objectForKey:", CFSTR("Quality")))
  {
    LODWORD(v5) = 1053609165;
    v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    -[NSDictionary setObject:forKey:](v4, "setObject:forKey:", v6, *MEMORY[0x1E0CED190]);
  }
  v7 = -[NSDictionary objectForKey:](v3, "objectForKey:", CFSTR("AVVideoColorPropertiesKey"));
  if (v7)
    -[NSDictionary addEntriesFromDictionary:](v4, "addEntriesFromDictionary:", v7);
  VTPixelAspectRatioDictionary = self->_VTPixelAspectRatioDictionary;
  if (VTPixelAspectRatioDictionary)
    -[NSDictionary setObject:forKey:](v4, "setObject:forKey:", VTPixelAspectRatioDictionary, *MEMORY[0x1E0CED140]);
  VTCleanApertureDictionary = self->_VTCleanApertureDictionary;
  if (VTCleanApertureDictionary)
    -[NSDictionary setObject:forKey:](v4, "setObject:forKey:", VTCleanApertureDictionary, *MEMORY[0x1E0CECF38]);
  return v4;
}

- (BOOL)shouldPrepareEncodedSampleBuffersForPaddedWrites
{
  return self->_shouldPrepareEncodedSampleBuffersForPaddedWrites;
}

- (void)setShouldPrepareEncodedSampleBuffersForPaddedWrites:(BOOL)a3
{
  self->_shouldPrepareEncodedSampleBuffersForPaddedWrites = a3;
}

@end

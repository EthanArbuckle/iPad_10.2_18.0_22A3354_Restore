@implementation AVVideoOutputSettings

- (id)compatibleMediaTypes
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("vide");
  v3[1] = CFSTR("auxv");
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:count:", v3, 2);
}

+ (AVVideoOutputSettings)videoOutputSettingsWithVideoSettingsDictionary:(id)a3
{
  AVVideoOutputSettings *result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v13 = 0;
  result = (AVVideoOutputSettings *)objc_msgSend(a1, "_videoOutputSettingsWithVideoSettingsDictionary:exceptionReason:", a3, &v13);
  if (!result)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, v13, v6, v7, v8, v9, v10, v12), 0);
    objc_exception_throw(v11);
  }
  return result;
}

+ (id)registeredOutputSettingsClasses
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

+ (id)_videoOutputSettingsWithVideoSettingsDictionary:(id)a3 exceptionReason:(id *)a4
{
  objc_super v5;

  if (!a3)
    return (id)objc_msgSend(a1, "defaultVideoOutputSettings", 0, a4);
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___AVVideoOutputSettings;
  return objc_msgSendSuper2(&v5, sel__outputSettingsWithOutputSettingsDictionary_mediaType_exceptionReason_, a3, CFSTR("vide"), a4);
}

+ (id)_outputSettingsWithOutputSettingsDictionary:(id)a3 mediaType:(id)a4 exceptionReason:(id *)a5
{
  return (id)objc_msgSend(a1, "_videoOutputSettingsWithVideoSettingsDictionary:exceptionReason:", a3, a5);
}

+ (id)_validValuesForScalingMode
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("AVVideoScalingModeFit"), CFSTR("AVVideoScalingModeResize"), CFSTR("AVVideoScalingModeResizeAspect"), CFSTR("AVVideoScalingModeResizeAspectFill"), 0);
}

+ (AVVideoOutputSettings)videoOutputSettingsWithTrustedVideoSettingsDictionary:(id)a3
{
  AVVideoOutputSettings *result;

  if (objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CA9040]))
    return (AVVideoOutputSettings *)-[AVPixelBufferAttributesVideoOutputSettings initWithTrustedPixelBufferAttributes:]([AVPixelBufferAttributesVideoOutputSettings alloc], "initWithTrustedPixelBufferAttributes:", a3);
  result = (AVVideoOutputSettings *)objc_msgSend(a3, "objectForKey:", CFSTR("AVVideoCodecKey"));
  if (result)
    return (AVVideoOutputSettings *)-[AVAVVideoSettingsVideoOutputSettings initWithTrustedAVVideoSettingsDictionary:]([AVAVVideoSettingsVideoOutputSettings alloc], "initWithTrustedAVVideoSettingsDictionary:", a3);
  return result;
}

+ (id)defaultVideoOutputSettings
{
  return +[AVVideoOutputSettings videoOutputSettingsWithVideoSettingsDictionary:](AVPixelBufferAttributesVideoOutputSettings, "videoOutputSettingsWithVideoSettingsDictionary:", 0);
}

- (int)width
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (int)height
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (NSDictionary)pixelAspectRatioDictionary
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (NSDictionary)cleanApertureDictionary
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- (NSDictionary)videoScalingProperties
{
  NSDictionary *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = -[NSDictionary objectForKey:](-[AVVideoOutputSettings videoSettingsDictionary](self, "videoSettingsDictionary"), "objectForKey:", CFSTR("AVVideoColorPropertiesKey"));
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "objectForKey:", CFSTR("ColorPrimaries"));
    v7 = objc_msgSend(v5, "objectForKey:", CFSTR("YCbCrMatrix"));
    v8 = objc_msgSend(v5, "objectForKey:", CFSTR("TransferFunction"));
    -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", v6, *MEMORY[0x1E0CED7C0]);
    -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", v7, *MEMORY[0x1E0CED7E0]);
    -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", v8, *MEMORY[0x1E0CED7D8]);
  }
  if (-[NSDictionary count](v3, "count"))
    return v3;
  else
    return 0;
}

- (NSDictionary)pixelTransferProperties
{
  NSDictionary *result;
  NSDictionary *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  result = -[NSDictionary objectForKey:](-[AVVideoOutputSettings videoSettingsDictionary](self, "videoSettingsDictionary"), "objectForKey:", CFSTR("AVVideoScalingModeKey"));
  if (result)
  {
    v5 = result;
    if ((-[NSDictionary isEqualToString:](result, "isEqualToString:", CFSTR("AVVideoScalingModeFit")) & 1) != 0
      || (-[NSDictionary isEqualToString:](v5, "isEqualToString:", CFSTR("AVVideoScalingModeResize")) & 1) != 0)
    {
      v6 = (_QWORD *)MEMORY[0x1E0CEDB30];
    }
    else if ((-[NSDictionary isEqualToString:](v5, "isEqualToString:", CFSTR("AVVideoScalingModeResizeAspect")) & 1) != 0)
    {
      v6 = (_QWORD *)MEMORY[0x1E0CEDB38];
    }
    else
    {
      if ((-[NSDictionary isEqualToString:](v5, "isEqualToString:", CFSTR("AVVideoScalingModeResizeAspectFill")) & 1) == 0)
      {
        v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Unrecognized value for %@: %@"), v7, v8, v9, v10, v11, (uint64_t)CFSTR("AVVideoScalingModeKey")), 0);
        objc_exception_throw(v12);
      }
      v6 = (_QWORD *)MEMORY[0x1E0CEDB48];
    }
    return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", *v6, *MEMORY[0x1E0CED848]);
  }
  return result;
}

- (void)colorPropertiesConsideringFormatDescriptions:(id)a3 colorPrimaries:(id *)a4 transferFunction:(id *)a5 ycbcrMatrix:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v13 = 0;
  v14 = 0;
  v12 = 0;
  v10 = -[NSDictionary objectForKey:](-[AVVideoOutputSettings videoSettingsDictionary](self, "videoSettingsDictionary"), "objectForKey:", CFSTR("AVVideoColorPropertiesKey"));
  if (v10)
  {
    v11 = v10;
    v14 = (void *)objc_msgSend(v10, "objectForKey:", CFSTR("ColorPrimaries"));
    v13 = (void *)objc_msgSend(v11, "objectForKey:", CFSTR("YCbCrMatrix"));
    v12 = (void *)objc_msgSend(v11, "objectForKey:", CFSTR("TransferFunction"));
    if (!-[AVVideoOutputSettings allowWideColor](self, "allowWideColor"))
    {
      -[AVVideoOutputSettings allowWideColor](self, "allowWideColor");
      CMFormatDescriptionGetWidestColorPropertiesFromFormatDescriptions();
    }
  }
  if (a4)
    *a4 = v14;
  if (a5)
    *a5 = v12;
  if (a6)
    *a6 = v13;
}

- (BOOL)dimensionsAreBoundingBox
{
  id v2;

  v2 = -[NSDictionary objectForKey:](-[AVVideoOutputSettings videoSettingsDictionary](self, "videoSettingsDictionary"), "objectForKey:", CFSTR("AVVideoScalingModeKey"));
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, "isEqualToString:", CFSTR("AVVideoScalingModeFit"));
  return (char)v2;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumFrameDuration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  CMTime v5;

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeFromDictionary(&v5, (CFDictionaryRef)-[NSDictionary objectForKey:](-[AVVideoOutputSettings videoSettingsDictionary](self, "videoSettingsDictionary"), "objectForKey:", CFSTR("AVVideoMinimumFrameDuration")));
  *(CMTime *)retstr = v5;
  return result;
}

- (NSString)frameRateConversionAlgorithm
{
  return (NSString *)-[NSDictionary objectForKey:](-[AVVideoOutputSettings videoSettingsDictionary](self, "videoSettingsDictionary"), "objectForKey:", CFSTR("AVVideoFrameRateConversionAlgorithm"));
}

- (BOOL)allowWideColor
{
  id v3;

  v3 = -[NSDictionary objectForKey:](-[AVVideoOutputSettings videoSettingsDictionary](self, "videoSettingsDictionary"), "objectForKey:", CFSTR("AVVideoAllowWideColorKey"));
  if (-[NSDictionary objectForKey:](-[AVVideoOutputSettings videoSettingsDictionary](self, "videoSettingsDictionary"), "objectForKey:", CFSTR("AVVideoColorPropertiesKey")))
  {
    return 1;
  }
  if (v3)
    return objc_msgSend(v3, "BOOLValue");
  return 0;
}

- (BOOL)isProRes
{
  NSDictionary *v2;
  int v3;
  BOOL v5;

  v2 = -[AVOutputSettings outputSettingsDictionary](self, "outputSettingsDictionary");
  if (v2)
  {
    v2 = -[NSDictionary objectForKey:](v2, "objectForKey:", CFSTR("AVVideoCodecKey"));
    if (v2)
    {
      v3 = AVOSTypeForString(v2);
      LOBYTE(v2) = 1;
      if (v3 <= 1634743415)
      {
        if (v3 != 1634742376 && v3 != 1634742888 && v3 != 1634743400)
          goto LABEL_16;
      }
      else if ((v3 - 1634755432) > 0xB || ((1 << (v3 - 104)) & 0x8C1) == 0)
      {
        v5 = (v3 - 1634759272) > 6 || ((1 << (v3 - 104)) & 0x51) == 0;
        if (v5 && v3 != 1634743416)
LABEL_16:
          LOBYTE(v2) = 0;
      }
    }
  }
  return (char)v2;
}

- (BOOL)isProRes4KHighFPSSetting
{
  NSDictionary *v2;
  NSDictionary *v3;
  int v4;
  BOOL v6;
  float v10;

  v2 = -[AVOutputSettings outputSettingsDictionary](self, "outputSettingsDictionary");
  if (!v2)
    return (char)v2;
  v3 = v2;
  v2 = -[NSDictionary objectForKey:](v2, "objectForKey:", CFSTR("AVVideoCodecKey"));
  if (!v2)
    return (char)v2;
  v4 = AVOSTypeForString(v2);
  LOBYTE(v2) = 0;
  if (v4 > 1634743415)
  {
    if ((v4 - 1634755432) > 0xB || ((1 << (v4 - 104)) & 0x8C1) == 0)
    {
      v6 = (v4 - 1634759272) > 6 || ((1 << (v4 - 104)) & 0x51) == 0;
      if (v6 && v4 != 1634743416)
        return (char)v2;
    }
LABEL_25:
    v2 = -[NSDictionary objectForKey:](v3, "objectForKey:", CFSTR("AVVideoWidthKey"));
    if (!v2)
      return (char)v2;
    if (-[NSDictionary longValue](v2, "longValue") >= 3840)
    {
      v2 = -[NSDictionary objectForKey:](v3, "objectForKey:", CFSTR("AVVideoHeightKey"));
      if (!v2)
        return (char)v2;
      if (-[NSDictionary longValue](v2, "longValue") >= 2160)
      {
        v2 = -[NSDictionary objectForKey:](v3, "objectForKey:", CFSTR("AVVideoCompressionPropertiesKey"));
        if (!v2)
          return (char)v2;
        v2 = -[NSDictionary objectForKey:](v2, "objectForKey:", CFSTR("ExpectedFrameRate"));
        if (!v2)
          return (char)v2;
        -[NSDictionary floatValue](v2, "floatValue");
        if (v10 >= 100.0)
        {
          LOBYTE(v2) = 1;
          return (char)v2;
        }
      }
    }
    LOBYTE(v2) = 0;
    return (char)v2;
  }
  if (v4 == 1634742376 || v4 == 1634742888 || v4 == 1634743400)
    goto LABEL_25;
  return (char)v2;
}

- (BOOL)validateUsingOutputSettingsValidator:(id)a3 reason:(id *)a4
{
  return objc_msgSend(a3, "validateVideoOutputSettings:reason:", self, a4);
}

@end

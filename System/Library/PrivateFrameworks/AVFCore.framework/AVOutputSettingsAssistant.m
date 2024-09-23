@implementation AVOutputSettingsAssistant

+ (id)_allOutputSettingsPresets
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("AVOutputSettingsPreset640x480"), CFSTR("AVOutputSettingsPreset960x540"), CFSTR("AVOutputSettingsPreset1280x720"), CFSTR("AVOutputSettingsPreset1920x1080"), CFSTR("AVOutputSettingsPreset3840x2160"), CFSTR("AVOutputSettingsPresetHEVC1920x1080"), CFSTR("AVOutputSettingsPresetHEVC1920x1080WithAlpha"), CFSTR("AVOutputSettingsPresetHEVC3840x2160"), CFSTR("AVOutputSettingsPresetHEVC3840x2160WithAlpha"), 0);
}

+ (NSArray)availableOutputSettingsPresets
{
  NSArray *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_msgSend(a1, "_allOutputSettingsPresets", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        if (objc_msgSend((id)objc_opt_class(), "baseSettingsProviderForPreset:", v9))
          -[NSArray addObject:](v3, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return v3;
}

+ (AVOutputSettingsAssistant)outputSettingsAssistantWithPreset:(AVOutputSettingsPreset)presetIdentifier
{
  return (AVOutputSettingsAssistant *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithPreset:", presetIdentifier);
}

- (AVOutputSettingsAssistant)init
{
  return -[AVOutputSettingsAssistant initWithPreset:](self, "initWithPreset:", 0);
}

- (AVOutputSettingsAssistant)initWithPreset:(id)a3
{
  AVOutputSettingsAssistant *v4;
  AVOutputSettingsAssistantInternal *v5;
  AVOutputSettingsAssistantInternal *v6;
  CMTime *internal;
  CMTime v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVOutputSettingsAssistant;
  v4 = -[AVOutputSettingsAssistant init](&v10, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(AVOutputSettingsAssistantInternal);
    v4->_internal = v5;
    if (v5
      && (CFRetain(v5),
          v4->_internal->baseSettingsProvider = (AVOutputSettingsAssistantBaseSettingsProvider *)(id)objc_msgSend((id)objc_opt_class(), "baseSettingsProviderForPreset:", a3),
          v4->_internal->videoSettingsAdjuster = (AVOutputSettingsAssistantVideoSettingsAdjuster *)(id)objc_msgSend((id)objc_opt_class(), "videoSettingsAdjusterForPreset:", a3),
          v6 = v4->_internal,
          v6->baseSettingsProvider)
      && v6->videoSettingsAdjuster)
    {
      CMTimeMake(&v9, 1, 30);
      v6->sourceVideoAverageFrameDuration = ($95D729B680665BEAEFA1D6FCA8238556)v9;
      internal = (CMTime *)v4->_internal;
      CMTimeMake(&v9, 1, 30);
      internal[3] = v9;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  AVOutputSettingsAssistantInternal *internal;
  AVOutputSettingsAssistantInternal *v4;
  opaqueCMFormatDescription *sourceVideoFormat;
  opaqueCMFormatDescription *sourceAudioFormat;
  objc_super v7;

  internal = self->_internal;
  if (internal)
  {

    v4 = self->_internal;
    sourceVideoFormat = v4->sourceVideoFormat;
    if (sourceVideoFormat)
      CFRelease(sourceVideoFormat);
    sourceAudioFormat = v4->sourceAudioFormat;
    if (sourceAudioFormat)
      CFRelease(sourceAudioFormat);

    CFRelease(v4);
  }
  v7.receiver = self;
  v7.super_class = (Class)AVOutputSettingsAssistant;
  -[AVOutputSettingsAssistant dealloc](&v7, sel_dealloc);
}

- (AVFileType)outputFileType
{
  return (AVFileType)CFSTR("com.apple.quicktime-movie");
}

- (NSDictionary)audioSettings
{
  NSDictionary *v3;
  uint64_t RichestDecodableFormatAndChannelLayout;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD v15[2];
  void *inSpecifier;

  v3 = (NSDictionary *)-[AVOutputSettingsAssistantBaseSettingsProvider baseAudioSettings](self->_internal->baseSettingsProvider, "baseAudioSettings");
  if (-[AVOutputSettingsAssistant sourceAudioFormat](self, "sourceAudioFormat"))
  {
    v3 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v3);
    *(_QWORD *)&v15[0] = 0;
    inSpecifier = 0;
    RichestDecodableFormatAndChannelLayout = FigAudioFormatDescriptionGetRichestDecodableFormatAndChannelLayout();
    v5 = *MEMORY[0x1E0C89970];
    objc_msgSend(-[NSDictionary objectForKey:](v3, "objectForKey:", *MEMORY[0x1E0C89970]), "doubleValue");
    if (v6 > *(double *)RichestDecodableFormatAndChannelLayout)
      v6 = *(double *)RichestDecodableFormatAndChannelLayout;
    -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6, *(_QWORD *)&v15[0]), v5);
    v9 = *(unsigned int *)(RichestDecodableFormatAndChannelLayout + 28);
    v10 = *MEMORY[0x1E0C89930];
    v11 = objc_msgSend(-[NSDictionary objectForKey:](v3, "objectForKey:", *MEMORY[0x1E0C89930]), "integerValue");
    v7 = objc_msgSend(MEMORY[0x1E0C99D50], "data");
    if (v11 == v9)
      v8 = objc_msgSend(-[NSDictionary objectForKey:](v3, "objectForKey:", v10), "integerValue");
    else
      v8 = *(unsigned int *)(RichestDecodableFormatAndChannelLayout + 28);
  }
  else
  {
    v15[0] = xmmword_19357D340;
    v15[1] = *(_OWORD *)algn_19357D350;
    v7 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v15, 32);
    v8 = 2;
  }
  v12 = *MEMORY[0x1E0C898A0];
  if (!-[NSDictionary objectForKey:](v3, "objectForKey:", *MEMORY[0x1E0C898A0]))
  {
    v3 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v3);
    -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", v7, v12);
    v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", v13, *MEMORY[0x1E0C89930]);
  }
  return v3;
}

- (NSDictionary)videoSettings
{
  NSDictionary *v3;
  const opaqueCMFormatDescription *v4;
  const opaqueCMFormatDescription *v5;
  uint64_t Dimensions;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  double v13;
  double v14;
  __CFArray *Mutable;
  uint64_t v16;
  void *v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CMTime v23;
  CMTime time1;
  CMTime v25;
  CMTime time;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v3 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", -[AVOutputSettingsAssistantBaseSettingsProvider baseVideoSettings](self->_internal->baseSettingsProvider, "baseVideoSettings"));
  v4 = -[AVOutputSettingsAssistant sourceVideoFormat](self, "sourceVideoFormat");
  v5 = v4;
  if (v4)
  {
    Dimensions = (uint64_t)CMVideoFormatDescriptionGetDimensions(v4);
    v7 = objc_msgSend(-[NSDictionary objectForKey:](v3, "objectForKey:", CFSTR("AVVideoWidthKey")), "integerValue");
    v8 = objc_msgSend(-[NSDictionary objectForKey:](v3, "objectForKey:", CFSTR("AVVideoHeightKey")), "integerValue");
    v9 = (double)SHIDWORD(Dimensions);
    v10 = (double)(int)Dimensions * (double)v8 / (double)SHIDWORD(Dimensions);
    if (v7 * (Dimensions >> 32) >= v8 * (int)Dimensions)
    {
      v11 = (double)v8;
    }
    else
    {
      v10 = (double)v7;
      v11 = v9 * (double)v7 / (double)(int)Dimensions;
    }
    v12 = v10 > (double)(int)Dimensions;
    if (v11 > v9)
      v12 = 1;
    if (v12)
      v13 = (double)(int)Dimensions;
    else
      v13 = v10;
    if (v12)
      v14 = (double)SHIDWORD(Dimensions);
    else
      v14 = v11;
    -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13), CFSTR("AVVideoWidthKey"));
    -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14), CFSTR("AVVideoHeightKey"));
    if (objc_msgSend(-[NSDictionary objectForKey:](v3, "objectForKey:", CFSTR("AVVideoCodecKey")), "isEqualToString:", CFSTR("hvc1")))
    {
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B378]);
      CFArrayAppendValue(Mutable, v5);
      if ((int)FigExportSettings_GetMaximumBitsPerComponent() <= 9)
        v16 = 0;
      else
        v16 = *MEMORY[0x1E0CED988];
      if (Mutable)
        CFRelease(Mutable);
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }
  v17 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", -[NSDictionary objectForKey:](v3, "objectForKey:", CFSTR("AVVideoCompressionPropertiesKey")));
  if (v5)
  {
    -[AVOutputSettingsAssistant sourceVideoAverageFrameDuration](self, "sourceVideoAverageFrameDuration");
    v18 = 1.0 / CMTimeGetSeconds(&time);
    *(float *)&v18 = v18;
    v19 = -[AVOutputSettingsAssistantVideoSettingsAdjuster averageBitRateForSourceFormatDescription:andTargetFrameRate:andEncoderSpecification:](self->_internal->videoSettingsAdjuster, "averageBitRateForSourceFormatDescription:andTargetFrameRate:andEncoderSpecification:", v5, self->_internal->videoEncoderSpecification, v18);
    objc_msgSend(v17, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19), CFSTR("AverageBitRate"));
  }
  -[AVOutputSettingsAssistant sourceVideoMinFrameDuration](self, "sourceVideoMinFrameDuration");
  objc_msgSend(v17, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 / CMTimeGetSeconds(&v25)), CFSTR("ExpectedFrameRate"));
  if (objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "videoEncoderCapabilities"), "averageNonDroppableFrameIntervalIsSupportedByDefaultEncoderForVideoCodec:", -[NSDictionary objectForKey:](v3, "objectForKey:", CFSTR("AVVideoCodecKey"))))
  {
    -[AVOutputSettingsAssistant sourceVideoMinFrameDuration](self, "sourceVideoMinFrameDuration");
    CMTimeMake(&v23, 1, 30);
    if (CMTimeCompare(&time1, &v23) < 0)
      objc_msgSend(v17, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 30), CFSTR("AverageNonDroppableFrameRate"));
  }
  if (v16)
    objc_msgSend(v17, "setObject:forKey:", v16, CFSTR("ProfileLevel"));
  -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", v17, CFSTR("AVVideoCompressionPropertiesKey"));
  if (v5)
  {
    v27[0] = v5;
    v20 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  }
  else
  {
    v20 = 0;
  }
  v21 = -[AVOutputSettingsAssistantVideoSettingsAdjuster colorSpaceFromSourceFormatDescriptions:andRendererColorSpace:](self->_internal->videoSettingsAdjuster, "colorSpaceFromSourceFormatDescriptions:andRendererColorSpace:", v20, 0);
  if (v21)
    -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", v21, CFSTR("AVVideoColorPropertiesKey"));
  return v3;
}

- (CMAudioFormatDescriptionRef)sourceAudioFormat
{
  return self->_internal->sourceAudioFormat;
}

- (void)setSourceAudioFormat:(CMAudioFormatDescriptionRef)sourceAudioFormat
{
  AVOutputSettingsAssistantInternal *internal;
  opaqueCMFormatDescription *v4;

  internal = self->_internal;
  v4 = internal->sourceAudioFormat;
  internal->sourceAudioFormat = sourceAudioFormat;
  if (sourceAudioFormat)
    CFRetain(sourceAudioFormat);
  if (v4)
    CFRelease(v4);
}

- (CMVideoFormatDescriptionRef)sourceVideoFormat
{
  return self->_internal->sourceVideoFormat;
}

- (void)setSourceVideoFormat:(CMVideoFormatDescriptionRef)sourceVideoFormat
{
  AVOutputSettingsAssistantInternal *internal;
  opaqueCMFormatDescription *v4;

  internal = self->_internal;
  v4 = internal->sourceVideoFormat;
  internal->sourceVideoFormat = sourceVideoFormat;
  if (sourceVideoFormat)
    CFRetain(sourceVideoFormat);
  if (v4)
    CFRelease(v4);
}

- (CMTime)sourceVideoAverageFrameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(*(_QWORD *)&self->timescale
                                                                                      + 48);
  return self;
}

- (void)setSourceVideoAverageFrameDuration:(CMTime *)sourceVideoAverageFrameDuration
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  AVOutputSettingsAssistantInternal *internal;
  __int128 v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  CMTime time2;
  CMTime time1;

  if ((sourceVideoAverageFrameDuration->flags & 0x1D) != 1)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = "CMTIME_IS_NUMERIC(sourceVideoAverageFrameDuration)";
    goto LABEL_6;
  }
  time1 = *sourceVideoAverageFrameDuration;
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  if (CMTimeCompare(&time1, &time2) <= 0)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = "CMTIME_COMPARE_INLINE(sourceVideoAverageFrameDuration, >, kCMTimeZero)";
LABEL_6:
    v16 = (void *)objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)v15), 0);
    objc_exception_throw(v16);
  }
  internal = self->_internal;
  v12 = *(_OWORD *)&sourceVideoAverageFrameDuration->value;
  internal->sourceVideoAverageFrameDuration.epoch = sourceVideoAverageFrameDuration->epoch;
  *(_OWORD *)&internal->sourceVideoAverageFrameDuration.value = v12;
}

- (CMTime)sourceVideoMinFrameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(*(_QWORD *)&self->timescale
                                                                                      + 72);
  return self;
}

- (void)setSourceVideoMinFrameDuration:(CMTime *)sourceVideoMinFrameDuration
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  AVOutputSettingsAssistantInternal *internal;
  __int128 v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  CMTime time2;
  CMTime time1;

  if (objc_msgSend((id)objc_opt_class(), "validatesSourceVideoMinFrameDuration"))
  {
    if ((sourceVideoMinFrameDuration->flags & 0x1D) == 1)
    {
      time1 = *sourceVideoMinFrameDuration;
      time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
      if (CMTimeCompare(&time1, &time2) > 0)
        goto LABEL_4;
      v13 = (void *)MEMORY[0x1E0C99DA0];
      v14 = *MEMORY[0x1E0C99778];
      v15 = "CMTIME_COMPARE_INLINE(sourceVideoMinFrameDuration, >, kCMTimeZero)";
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0C99DA0];
      v14 = *MEMORY[0x1E0C99778];
      v15 = "CMTIME_IS_NUMERIC(sourceVideoMinFrameDuration)";
    }
    v16 = (void *)objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v6, v7, v8, v9, v10, (uint64_t)v15), 0);
    objc_exception_throw(v16);
  }
LABEL_4:
  internal = self->_internal;
  v12 = *(_OWORD *)&sourceVideoMinFrameDuration->value;
  internal->sourceVideoMinFrameDuration.epoch = sourceVideoMinFrameDuration->epoch;
  *(_OWORD *)&internal->sourceVideoMinFrameDuration.value = v12;
}

- (void)setVideoEncoderSpecification:(id)a3
{
  uint64_t v5;
  AVOutputSettingsAssistantInternal **p_internal;
  AVOutputSettingsAssistantInternal *internal;
  NSDictionary *videoEncoderSpecification;
  NSDictionary *v9;
  void *v10;
  AVOutputSettingsAssistantInternal *v11;

  v5 = *MEMORY[0x1E0CEDD20];
  if (a3 && objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CEDD20]))
  {
    internal = self->_internal;
    p_internal = &self->_internal;
    videoEncoderSpecification = internal->videoEncoderSpecification;
    if (videoEncoderSpecification == a3)
      return;

    v9 = (NSDictionary *)objc_msgSend(a3, "copy");
  }
  else
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a3);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v5);
    v11 = self->_internal;
    p_internal = &self->_internal;

    v9 = v10;
  }
  (*p_internal)->videoEncoderSpecification = v9;
}

- (id)videoEncoderSpecification
{
  return self->_internal->videoEncoderSpecification;
}

+ (id)baseSettingsProviderForPreset:(id)a3
{
  return -[AVExportSettingsOutputSettingsAssistantBaseSettings initWithOutputSettingsPreset:]([AVExportSettingsOutputSettingsAssistantBaseSettings alloc], "initWithOutputSettingsPreset:", a3);
}

+ (id)videoSettingsAdjusterForPreset:(id)a3
{
  return -[AVExportSettingsOutputSettingsAssistantVideoSettingsAdjuster initWithOutputSettingsPreset:]([AVExportSettingsOutputSettingsAssistantVideoSettingsAdjuster alloc], "initWithOutputSettingsPreset:", a3);
}

+ (id)videoEncoderCapabilities
{
  return objc_alloc_init(AVIOKitOutputSettingsAssistantVideoEncoderCapabilities);
}

+ (BOOL)validatesSourceVideoMinFrameDuration
{
  return 0;
}

@end

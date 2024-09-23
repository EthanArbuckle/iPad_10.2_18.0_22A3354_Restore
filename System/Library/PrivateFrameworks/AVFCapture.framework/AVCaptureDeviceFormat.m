@implementation AVCaptureDeviceFormat

- (id)supportedZoomRangesForCinematicVideo
{
  float v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "maxContinuousZoomFactorForCinematicVideo");
  if (v2 <= 0.0)
    return (id)MEMORY[0x1E0C9AA60];
  v4[0] = +[AVZoomRange zoomRangeWithMinZoomFactor:maxZoomFactor:](AVZoomRange, "zoomRangeWithMinZoomFactor:maxZoomFactor:", 2.0, v2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
}

- (id)AVCaptureSessionPresets
{
  return (id)objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "AVCaptureSessionPresets");
}

- (BOOL)isCenterStageSupported
{
  return self->_internal->centerStageSupported;
}

- (AVCaptureDeviceFormat)initWithFigCaptureSourceFormat:(id)a3 fcSourceAttributes:(id)a4
{
  AVCaptureDeviceFormat *v6;
  AVCaptureDeviceFormatInternal *v7;
  AVCaptureDeviceFormatInternal *internal;
  int IsContinuityCapture;
  AVCaptureDeviceFormatInternal *v10;
  int v11;
  AVCaptureDeviceFormatInternal *v12;
  int v13;
  AVCaptureDeviceFormatInternal *v14;
  int v15;
  AVCaptureDeviceFormatInternal *v16;
  int v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)AVCaptureDeviceFormat;
  v6 = -[AVCaptureDeviceFormat init](&v19, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(AVCaptureDeviceFormatInternal);
    v6->_internal = v7;
    if (v7)
    {
      v6->_internal->sourceFormat = (FigCaptureSourceFormat *)a3;
      v6->_internal->fcSourceAttributes = (NSDictionary *)a4;
      if (-[FigCaptureSourceFormat mediaType](v6->_internal->sourceFormat, "mediaType") == 1986618469)
      {
        -[AVCaptureDeviceFormat _initializeSupportedMaxPhotoDimensions](v6, "_initializeSupportedMaxPhotoDimensions");
        v6->_internal->backgroundBlurSupported = -[FigCaptureSourceFormat isBackgroundBlurSupported](v6->_internal->sourceFormat, "isBackgroundBlurSupported");
        v6->_internal->backgroundBlurSupportedForContinuityCamera = -[FigCaptureSourceFormat isBackgroundBlurSupportedForContinuityCapture](v6->_internal->sourceFormat, "isBackgroundBlurSupportedForContinuityCapture");
        internal = v6->_internal;
        if (!internal->backgroundBlurSupported)
        {
          IsContinuityCapture = AVCaptureClientIsContinuityCapture();
          internal = v6->_internal;
          if (IsContinuityCapture)
          {
            internal->backgroundBlurSupported = internal->backgroundBlurSupportedForContinuityCamera;
            internal = v6->_internal;
          }
        }
        v6->_internal->studioLightingSupported = -[FigCaptureSourceFormat isStudioLightingSupported](internal->sourceFormat, "isStudioLightingSupported");
        v6->_internal->studioLightingSupportedForContinuityCamera = -[FigCaptureSourceFormat isStudioLightingSupportedForContinuityCapture](v6->_internal->sourceFormat, "isStudioLightingSupportedForContinuityCapture");
        v10 = v6->_internal;
        if (!v10->studioLightingSupported)
        {
          v11 = AVCaptureClientIsContinuityCapture();
          v10 = v6->_internal;
          if (v11)
          {
            v10->studioLightingSupported = v10->studioLightingSupportedForContinuityCamera;
            v10 = v6->_internal;
          }
        }
        v6->_internal->reactionEffectsSupported = -[FigCaptureSourceFormat reactionEffectsSupported](v10->sourceFormat, "reactionEffectsSupported");
        v6->_internal->reactionEffectsSupportedForContinuityCamera = -[FigCaptureSourceFormat reactionEffectsSupportedForContinuityCapture](v6->_internal->sourceFormat, "reactionEffectsSupportedForContinuityCapture");
        v12 = v6->_internal;
        if (!v12->reactionEffectsSupported)
        {
          v13 = AVCaptureClientIsContinuityCapture();
          v12 = v6->_internal;
          if (v13)
          {
            v12->reactionEffectsSupported = v12->reactionEffectsSupportedForContinuityCamera;
            v12 = v6->_internal;
          }
        }
        v6->_internal->backgroundReplacementSupported = -[FigCaptureSourceFormat isBackgroundReplacementSupported](v12->sourceFormat, "isBackgroundReplacementSupported");
        v6->_internal->backgroundReplacementSupportedForContinuityCamera = -[FigCaptureSourceFormat isBackgroundReplacementSupportedForContinuityCapture](v6->_internal->sourceFormat, "isBackgroundReplacementSupportedForContinuityCapture");
        v14 = v6->_internal;
        if (!v14->backgroundReplacementSupported)
        {
          v15 = AVCaptureClientIsContinuityCapture();
          v14 = v6->_internal;
          if (v15)
          {
            v14->backgroundReplacementSupported = v14->backgroundReplacementSupportedForContinuityCamera;
            v14 = v6->_internal;
          }
        }
        v6->_internal->centerStageSupported = -[FigCaptureSourceFormat isCinematicFramingSupported](v14->sourceFormat, "isCinematicFramingSupported");
        v6->_internal->centerStageSupportedForContinuityCamera = -[FigCaptureSourceFormat isCinematicFramingSupportedForContinuityCapture](v6->_internal->sourceFormat, "isCinematicFramingSupportedForContinuityCapture");
        v16 = v6->_internal;
        if (!v16->centerStageSupported)
        {
          v17 = AVCaptureClientIsContinuityCapture();
          v16 = v6->_internal;
          if (v17)
          {
            v16->centerStageSupported = v16->centerStageSupportedForContinuityCamera;
            v16 = v6->_internal;
          }
        }
        v6->_internal->constantColorSupported = -[FigCaptureSourceFormat isConstantColorSupported](v16->sourceFormat, "isConstantColorSupported");
        if (objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v6->_internal->fcSourceAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D047F0]), "intValue") == 9)v6->_internal->depthDataFormatsDisabled = !v6->_internal->continuousZoomWithDepthEnabled;
      }
      v6->_internal->isDepthDataFormat = objc_msgSend(a3, "mediaType") == 1685091432;
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (BOOL)isPortraitEffectSupported
{
  return self->_internal->backgroundBlurSupported;
}

- (BOOL)isStudioLightSupported
{
  return self->_internal->studioLightingSupported;
}

- (BOOL)reactionEffectsSupported
{
  return self->_internal->reactionEffectsSupported;
}

- (void)_initializeSupportedMaxPhotoDimensions
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  $2825F4736939C4A6D3AD43837233062D v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "geometricDistortionCorrectionFormat");
  v4 = -[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat");
  if (v3)
  {
    v5 = (id)objc_msgSend(v4, "geometricDistortionCorrectionFormat");
LABEL_7:
    v6 = v5;
    goto LABEL_8;
  }
  if (v4)
  {
    v5 = -[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat");
    goto LABEL_7;
  }
  if (-[AVCaptureDeviceFormat figCaptureSourceDepthDataFormat](self, "figCaptureSourceDepthDataFormat"))
  {
    v5 = -[AVCaptureDeviceFormat figCaptureSourceDepthDataFormat](self, "figCaptureSourceDepthDataFormat");
    goto LABEL_7;
  }
  v6 = 0;
LABEL_8:
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = -[AVCaptureDeviceFormat defaultPhotoDimensionsWithHighResolutionCaptureEnabled:](self, "defaultPhotoDimensionsWithHighResolutionCaptureEnabled:", 0);
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D03C20]), "initWithDimensions:deferredPhotoProxyDimensions:isPrivate:flavor:maxUpscalingDimensions:", v8, 0, 0, 0, 0));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = (void *)objc_msgSend(v6, "highResStillImageDimensions", 0);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v14, "dimensionsAreEqualToDimensions:", v8) & 1) == 0)
          objc_msgSend(v7, "addObject:", v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }
  self->_internal->supportedMaxPhotoDimensions = (NSArray *)objc_msgSend(v7, "copy");
}

- (BOOL)isContinuousZoomWithDepthSupported
{
  float v2;

  objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "clientMaxContinuousZoomFactorForDepthDataDelivery");
  return v2 > 0.0;
}

- (id)figCaptureSourceVideoFormat
{
  if (-[FigCaptureSourceFormat mediaType](self->_internal->sourceFormat, "mediaType") == 1986618469
    || -[FigCaptureSourceFormat mediaType](self->_internal->sourceFormat, "mediaType") == 1885564004)
  {
    return self->_internal->sourceFormat;
  }
  else
  {
    return 0;
  }
}

- ($2825F4736939C4A6D3AD43837233062D)defaultPhotoDimensionsWithHighResolutionCaptureEnabled:(BOOL)a3
{
  uint64_t v4;
  id v5;
  id v6;
  CMVideoDimensions Dimensions;
  unint64_t v8;

  if (a3)
  {
    v4 = objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "geometricDistortionCorrectionFormat");
    v5 = -[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat");
    if (v4)
    {
      v6 = (id)objc_msgSend(v5, "geometricDistortionCorrectionFormat");
    }
    else if (v5)
    {
      v6 = -[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat");
    }
    else
    {
      Dimensions = -[AVCaptureDeviceFormat figCaptureSourceDepthDataFormat](self, "figCaptureSourceDepthDataFormat");
      if (!*(_QWORD *)&Dimensions)
      {
        v8 = 0;
        return ($2825F4736939C4A6D3AD43837233062D)(v8 | Dimensions.width);
      }
      v6 = -[AVCaptureDeviceFormat figCaptureSourceDepthDataFormat](self, "figCaptureSourceDepthDataFormat");
    }
    Dimensions = (CMVideoDimensions)objc_msgSend(v6, "defaultHighResStillImageDimensions");
  }
  else
  {
    Dimensions = CMVideoFormatDescriptionGetDimensions(-[AVCaptureDeviceFormat formatDescription](self, "formatDescription"));
  }
  v8 = *(_QWORD *)&Dimensions & 0xFFFFFFFF00000000;
  return ($2825F4736939C4A6D3AD43837233062D)(v8 | Dimensions.width);
}

- (CMFormatDescriptionRef)formatDescription
{
  AVCaptureDeviceFormatInternal *internal;
  CMFormatDescriptionRef result;

  internal = self->_internal;
  result = internal->formatDescription;
  if (!result)
  {
    self->_internal->formatDescription = (opaqueCMFormatDescription *)-[FigCaptureSourceFormat formatDescription](internal->sourceFormat, "formatDescription");
    result = self->_internal->formatDescription;
    if (result)
    {
      CFRetain(result);
      return self->_internal->formatDescription;
    }
  }
  return result;
}

- (BOOL)isDefaultActiveFormat
{
  return -[FigCaptureSourceFormat isDefaultActiveFormat](self->_internal->sourceFormat, "isDefaultActiveFormat");
}

- (void)setContinuousZoomWithDepthEnabled:(BOOL)a3
{
  AVCaptureDeviceFormatInternal *internal;

  internal = self->_internal;
  if (internal->continuousZoomWithDepthEnabled != a3)
  {
    internal->continuousZoomWithDepthEnabled = a3;
    if (objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_internal->fcSourceAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D047F0]), "intValue") == 9)
    {
      self->_internal->depthDataFormatsDisabled = !a3;

      self->_internal->supportedDepthDataFormats = 0;
    }
  }
}

- (BOOL)isContinuousZoomWithDepthEnabled
{
  return self->_internal->continuousZoomWithDepthEnabled;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)defaultActiveMinFrameDurationForSessionPreset:(SEL)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v4;
  uint64_t v6;
  CMTime *v8;
  float v9;
  uint64_t v10;
  CMTime v11;

  v4 = self;
  v6 = *(_QWORD *)&self->var1;
  if ((*(_BYTE *)(v6 + 36) & 1) == 0)
  {
    -[$3CC8671D27C23BF42ADDB32F2B5E48AE lowestSupportedVideoFrameDuration](self, "lowestSupportedVideoFrameDuration");
    *(CMTime *)(v6 + 24) = v11;
    self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE figCaptureSourceVideoFormat](v4, "figCaptureSourceVideoFormat");
    if (self)
    {
      objc_msgSend((id)-[$3CC8671D27C23BF42ADDB32F2B5E48AE figCaptureSourceVideoFormat](v4, "figCaptureSourceVideoFormat"), "defaultMaxFrameRateForSessionPreset:", a4);
      v8 = *(CMTime **)&v4->var1;
      self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake(&v11, 1, (int)v9);
      v8[1] = v11;
    }
  }
  v10 = *(_QWORD *)&v4->var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)(v10 + 24);
  retstr->var3 = *(_QWORD *)(v10 + 40);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)defaultActiveMaxFrameDurationForSessionPreset:(SEL)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v4;
  uint64_t v6;
  CMTime *v8;
  float v9;
  uint64_t v10;
  CMTime v11;

  v4 = self;
  v6 = *(_QWORD *)&self->var1;
  if ((*(_BYTE *)(v6 + 60) & 1) == 0)
  {
    -[$3CC8671D27C23BF42ADDB32F2B5E48AE highestSupportedVideoFrameDuration](self, "highestSupportedVideoFrameDuration");
    *(CMTime *)(v6 + 48) = v11;
    self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE figCaptureSourceVideoFormat](v4, "figCaptureSourceVideoFormat");
    if (self)
    {
      objc_msgSend((id)-[$3CC8671D27C23BF42ADDB32F2B5E48AE figCaptureSourceVideoFormat](v4, "figCaptureSourceVideoFormat"), "defaultMinFrameRateForSessionPreset:", a4);
      v8 = *(CMTime **)&v4->var1;
      self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake(&v11, 1, (int)v9);
      v8[2] = v11;
    }
  }
  v10 = *(_QWORD *)&v4->var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)(v10 + 48);
  retstr->var3 = *(_QWORD *)(v10 + 64);
  return self;
}

- (BOOL)isPhotoFormat
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isPhotoFormat");
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lowestSupportedVideoFrameDuration
{
  NSArray *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v6;
  uint64_t v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v8;
  void *v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;
  CMTime time1;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E30];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = -[AVCaptureDeviceFormat videoSupportedFrameRateRanges](self, "videoSupportedFrameRateRanges");
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8);
        if (v9)
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8), "minFrameDuration");
        else
          memset(&time1, 0, sizeof(time1));
        v10 = *retstr;
        if (CMTimeCompare(&time1, (CMTime *)&v10) < 0)
        {
          if (v9)
            objc_msgSend(v9, "minFrameDuration");
          else
            memset(&v10, 0, sizeof(v10));
          *retstr = v10;
        }
        v8 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)((char *)v8 + 1);
      }
      while (v6 != v8);
      result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v6 = result;
    }
    while (result);
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)highestSupportedVideoFrameDuration
{
  NSArray *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v6;
  uint64_t v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v8;
  void *v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;
  CMTime time1;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E28];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = -[AVCaptureDeviceFormat videoSupportedFrameRateRanges](self, "videoSupportedFrameRateRanges");
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8);
        if (v9)
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8), "maxFrameDuration");
        else
          memset(&time1, 0, sizeof(time1));
        v10 = *retstr;
        if (CMTimeCompare(&time1, (CMTime *)&v10) >= 1)
        {
          if (v9)
            objc_msgSend(v9, "maxFrameDuration");
          else
            memset(&v10, 0, sizeof(v10));
          *retstr = v10;
        }
        v8 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)((char *)v8 + 1);
      }
      while (v6 != v8);
      result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v6 = result;
    }
    while (result);
  }
  return result;
}

- (BOOL)supportsQuadraHighResolutionStillImageOutput
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isQuadraHighResStillImageSupported");
}

- (BOOL)isStreamingDisparitySupported
{
  if (self->_internal->depthDataFormatsDisabled)
    return 0;
  else
    return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isStreamingDisparitySupported");
}

- (BOOL)isStillImageDisparitySupported
{
  if (self->_internal->depthDataFormatsDisabled)
    return 0;
  else
    return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isStillImageDisparitySupported");
}

- (BOOL)isStreamingDepthSupported
{
  if (self->_internal->depthDataFormatsDisabled)
    return 0;
  else
    return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isStreamingDepthSupported");
}

- (BOOL)isStillImageDepthSupported
{
  if (self->_internal->depthDataFormatsDisabled)
    return 0;
  else
    return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isStillImageDepthSupported");
}

- (BOOL)isVideoHDRSupported
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = -[AVCaptureDeviceFormat supportedColorSpaces](self, "supportedColorSpaces", 0);
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (!AVCaptureColorSpaceIsHDR(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "integerValue")))
        {
          v8 = 1;
          goto LABEL_11;
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:
  if ((objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "hasSensorHDRCompanionIndex") & 1) == 0&& !objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isSIFRSupported"))
  {
    return 0;
  }
  return v8;
}

- (NSArray)supportedColorSpaces
{
  return (NSArray *)objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "supportedColorSpaces");
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  FigCaptureSourceFormat *sourceFormat;

  if (a3 == self)
    goto LABEL_5;
  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    sourceFormat = self->_internal->sourceFormat;
    if (sourceFormat != *(FigCaptureSourceFormat **)(*((_QWORD *)a3 + 1) + 8))
    {
      LOBYTE(v5) = -[FigCaptureSourceFormat isEqual:](sourceFormat, "isEqual:");
      return v5;
    }
LABEL_5:
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (NSArray)supportedDepthDataFormats
{
  AVCaptureDeviceFormatInternal *internal;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  AVCaptureDeviceFormat *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  internal = self->_internal;
  if (!internal->supportedDepthDataFormats)
  {
    if (internal->depthDataFormatsDisabled)
      v4 = 0;
    else
      v4 = (void *)objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "supportedDepthDataFormats");
    if (objc_msgSend(v4, "count"))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
              objc_enumerationMutation(v4);
            v10 = -[AVCaptureDeviceFormat initWithFigCaptureSourceFormat:fcSourceAttributes:]([AVCaptureDeviceFormat alloc], "initWithFigCaptureSourceFormat:fcSourceAttributes:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), self->_internal->fcSourceAttributes);
            objc_msgSend(v5, "addObject:", v10);

            ++v9;
          }
          while (v7 != v9);
          v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v7);
      }
      self->_internal->supportedDepthDataFormats = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v5);

    }
    else
    {
      self->_internal->supportedDepthDataFormats = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    }
  }
  return self->_internal->supportedDepthDataFormats;
}

- (id)_stringForMediaType:(unsigned int)a3 formatDescription:(opaqueCMFormatDescription *)a4 frameRateRanges:(id)a5
{
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  double v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  const AudioStreamBasicDescription *StreamBasicDescription;
  const __CFString *v27;
  double v28;
  double v29;
  uint64_t v30;
  NSUInteger v31;
  NSArray *v32;
  float v33;
  float v34;
  unint64_t v35;
  float v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  float v40;
  float v41;
  float v42;
  double v43;
  float v44;
  double Seconds;
  double v46;
  float v47;
  double v48;
  float v49;
  _BOOL4 v50;
  _BOOL4 v51;
  const __CFString *v52;
  const __CFString *v53;
  CMVideoDimensions Dimensions;
  uint64_t v56;
  CMTime v57;
  CMTime time;
  unint64_t v59;

  CMFormatDescriptionGetMediaSubType(a4);
  v9 = (void *)MEMORY[0x1E0CB37A0];
  v10 = AVStringForOSType();
  v11 = (void *)objc_msgSend(v9, "stringWithFormat:", CFSTR("'%@'/'%@' "), v10, AVStringForOSType());
  if ((int)a3 > 1936684397)
  {
    if (a3 == 1936684398)
    {
      StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(a4);
      objc_msgSend(v11, "appendFormat:", CFSTR("SR=%0.0f,FF=%u,BPP=%u,FPP=%u,BPF=%u,CH=%u,BPC=%u"), *(_QWORD *)&StreamBasicDescription->mSampleRate, StreamBasicDescription->mFormatFlags, StreamBasicDescription->mBytesPerPacket, StreamBasicDescription->mFramesPerPacket, StreamBasicDescription->mBytesPerFrame, StreamBasicDescription->mChannelsPerFrame, StreamBasicDescription->mBitsPerChannel);
      return v11;
    }
    v12 = 1986618469;
LABEL_6:
    if (a3 != v12)
      return v11;
    goto LABEL_7;
  }
  if (a3 != 1685091432)
  {
    v12 = 1885564004;
    goto LABEL_6;
  }
LABEL_7:
  if (objc_msgSend(a5, "count"))
  {
    objc_msgSend((id)objc_msgSend(a5, "firstObject"), "minFrameRate");
    v14 = (int)v13;
    objc_msgSend((id)objc_msgSend(a5, "firstObject"), "maxFrameRate");
    v16 = (int)v15;
  }
  else
  {
    v16 = 0;
    v14 = 0;
  }
  if (a3 == 1885564004)
  {
    objc_msgSend(v11, "appendFormat:", CFSTR("max points: %d, {%2d-%3d fps} "), CMPointCloudFormatDescriptionGetNumberOfPoints(), v14, v16, v56);
  }
  else
  {
    Dimensions = CMVideoFormatDescriptionGetDimensions(a4);
    objc_msgSend(v11, "appendFormat:", CFSTR("%4dx%4d, {%2d-%3d fps}"), Dimensions, HIDWORD(*(unint64_t *)&Dimensions), v14, v16);
  }
  objc_msgSend(v11, "appendString:", CFSTR(", photo dims:{"));
  if (-[NSArray count](-[AVCaptureDeviceFormat supportedMaxPhotoDimensions](self, "supportedMaxPhotoDimensions"), "count"))
  {
    v17 = 0;
    do
    {
      if (v17)
        objc_msgSend(v11, "appendString:", CFSTR(","));
      v18 = -[NSArray objectAtIndexedSubscript:](-[AVCaptureDeviceFormat supportedMaxPhotoDimensions](self, "supportedMaxPhotoDimensions"), "objectAtIndexedSubscript:", v17);
      v59 = 0;
      objc_msgSend(v18, "getValue:", &v59);
      objc_msgSend(v11, "appendFormat:", CFSTR("%dx%d"), v59, HIDWORD(v59));
      ++v17;
    }
    while (-[NSArray count](-[AVCaptureDeviceFormat supportedMaxPhotoDimensions](self, "supportedMaxPhotoDimensions"), "count") > v17);
  }
  objc_msgSend(v11, "appendString:", CFSTR("}"));
  -[AVCaptureDeviceFormat videoFieldOfView](self, "videoFieldOfView");
  if (v19 > 0.0)
  {
    -[AVCaptureDeviceFormat videoFieldOfView](self, "videoFieldOfView");
    objc_msgSend(v11, "appendFormat:", CFSTR(", fov:%2.3f"), v20);
  }
  -[AVCaptureDeviceFormat geometricDistortionCorrectedVideoFieldOfView](self, "geometricDistortionCorrectedVideoFieldOfView");
  if (v21 > 0.0)
  {
    -[AVCaptureDeviceFormat geometricDistortionCorrectedVideoFieldOfView](self, "geometricDistortionCorrectedVideoFieldOfView");
    v23 = v22;
    -[AVCaptureDeviceFormat videoFieldOfView](self, "videoFieldOfView");
    if (v23 != v24)
    {
      -[AVCaptureDeviceFormat geometricDistortionCorrectedVideoFieldOfView](self, "geometricDistortionCorrectedVideoFieldOfView");
      objc_msgSend(v11, "appendFormat:", CFSTR(", gdc fov:%2.3f"), v25);
    }
  }
  if (-[AVCaptureDeviceFormat isVideoBinned](self, "isVideoBinned"))
    objc_msgSend(v11, "appendFormat:", CFSTR(", binned"));
  if (-[AVCaptureDeviceFormat supportedStabilizationMethod](self, "supportedStabilizationMethod") >= 1)
  {
    objc_msgSend(v11, "appendFormat:", CFSTR(", supports vis"));
    objc_msgSend(v11, "appendString:", CFSTR(" (max strength:"));
    if (-[AVCaptureDeviceFormat isVideoStabilizationStrengthSupported:](self, "isVideoStabilizationStrengthSupported:", 4)|| -[AVCaptureDeviceFormat isVideoStabilizationStrengthSupported:](self, "isVideoStabilizationStrengthSupported:", 3)|| -[AVCaptureDeviceFormat isVideoStabilizationStrengthSupported:](self, "isVideoStabilizationStrengthSupported:", 2)|| -[AVCaptureDeviceFormat isVideoStabilizationStrengthSupported:](self, "isVideoStabilizationStrengthSupported:", 1))
    {
      v27 = (const __CFString *)FigCaptureVideoStabilizationStrengthToString();
    }
    else
    {
      v27 = CFSTR("Unknown");
    }
    objc_msgSend(v11, "appendString:", v27);
    objc_msgSend(v11, "appendString:", CFSTR(")"));
  }
  -[AVCaptureDeviceFormat videoMaxZoomFactor](self, "videoMaxZoomFactor");
  v29 = v28;
  if (v28 > 1.0)
  {
    -[AVCaptureDeviceFormat videoZoomFactorUpscaleThreshold](self, "videoZoomFactorUpscaleThreshold");
    objc_msgSend(v11, "appendFormat:", CFSTR(", max zoom:%2.2f (upscales @%2.2f)"), *(_QWORD *)&v29, v30);
  }
  v31 = -[NSArray count](-[AVCaptureDeviceFormat secondaryNativeResolutionZoomFactors](self, "secondaryNativeResolutionZoomFactors"), "count");
  v32 = -[AVCaptureDeviceFormat secondaryNativeResolutionZoomFactors](self, "secondaryNativeResolutionZoomFactors");
  if (v31 == 1)
  {
    objc_msgSend(-[NSArray firstObject](v32, "firstObject"), "floatValue");
    objc_msgSend(v11, "appendFormat:", CFSTR(", secondary:%.2f"), v33);
  }
  else if (-[NSArray count](v32, "count") >= 2)
  {
    objc_msgSend(-[NSArray firstObject](-[AVCaptureDeviceFormat secondaryNativeResolutionZoomFactors](self, "secondaryNativeResolutionZoomFactors"), "firstObject"), "floatValue");
    objc_msgSend(v11, "appendFormat:", CFSTR(", secondaries:{%.2f"), v34);
    if (-[NSArray count](-[AVCaptureDeviceFormat secondaryNativeResolutionZoomFactors](self, "secondaryNativeResolutionZoomFactors"), "count") >= 2)
    {
      v35 = 1;
      do
      {
        objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[AVCaptureDeviceFormat secondaryNativeResolutionZoomFactors](self, "secondaryNativeResolutionZoomFactors"), "objectAtIndexedSubscript:", v35), "floatValue");
        objc_msgSend(v11, "appendFormat:", CFSTR(",%.2f"), v36);
        ++v35;
      }
      while (-[NSArray count](-[AVCaptureDeviceFormat secondaryNativeResolutionZoomFactors](self, "secondaryNativeResolutionZoomFactors"), "count") > v35);
    }
    objc_msgSend(v11, "appendString:", CFSTR("}"));
  }
  if (-[AVCaptureDeviceFormat systemRecommendedVideoZoomRange](self, "systemRecommendedVideoZoomRange"))
  {
    -[AVZoomRange minZoomFactor](-[AVCaptureDeviceFormat systemRecommendedVideoZoomRange](self, "systemRecommendedVideoZoomRange"), "minZoomFactor");
    v38 = v37;
    -[AVZoomRange maxZoomFactor](-[AVCaptureDeviceFormat systemRecommendedVideoZoomRange](self, "systemRecommendedVideoZoomRange"), "maxZoomFactor");
    objc_msgSend(v11, "appendFormat:", CFSTR(", system zoom range:%.1f-%.1f"), v38, v39);
  }
  if (-[AVCaptureDeviceFormat autoFocusSystem](self, "autoFocusSystem"))
    objc_msgSend(v11, "appendFormat:", CFSTR(", AF System:%d"), -[AVCaptureDeviceFormat autoFocusSystem](self, "autoFocusSystem"));
  -[AVCaptureDeviceFormat minISO](self, "minISO");
  if (v40 > 0.0)
  {
    -[AVCaptureDeviceFormat maxISO](self, "maxISO");
    if (v41 > 0.0)
    {
      -[AVCaptureDeviceFormat minISO](self, "minISO");
      v43 = v42;
      -[AVCaptureDeviceFormat maxISO](self, "maxISO");
      objc_msgSend(v11, "appendFormat:", CFSTR(", ISO:%.1f-%.1f"), *(_QWORD *)&v43, v44);
    }
  }
  if (self)
  {
    -[AVCaptureDeviceFormat minExposureDuration](self, "minExposureDuration");
    Seconds = CMTimeGetSeconds(&time);
    -[AVCaptureDeviceFormat maxExposureDuration](self, "maxExposureDuration");
  }
  else
  {
    memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);
    memset(&v57, 0, sizeof(v57));
  }
  v46 = CMTimeGetSeconds(&v57);
  if (Seconds > 0.0 && v46 > 0.0)
    objc_msgSend(v11, "appendFormat:", CFSTR(", SS:%f-%f"), *(_QWORD *)&Seconds, *(_QWORD *)&v46);
  if (-[AVCaptureDeviceFormat systemRecommendedExposureBiasRange](self, "systemRecommendedExposureBiasRange"))
  {
    -[AVExposureBiasRange minExposureBias](-[AVCaptureDeviceFormat systemRecommendedExposureBiasRange](self, "systemRecommendedExposureBiasRange"), "minExposureBias");
    v48 = v47;
    -[AVExposureBiasRange maxExposureBias](-[AVCaptureDeviceFormat systemRecommendedExposureBiasRange](self, "systemRecommendedExposureBiasRange"), "maxExposureBias");
    objc_msgSend(v11, "appendFormat:", CFSTR(", system exposure bias range:%.1f-%.1f"), *(_QWORD *)&v48, v49);
  }
  if (-[AVCaptureDeviceFormat isVideoHDRSupported](self, "isVideoHDRSupported"))
    objc_msgSend(v11, "appendString:", CFSTR(", supports HDR"));
  if (-[AVCaptureDeviceFormat isWideColorSupported](self, "isWideColorSupported"))
    objc_msgSend(v11, "appendString:", CFSTR(", supports wide color"));
  if (-[AVCaptureDeviceFormat isExperimental](self, "isExperimental"))
    objc_msgSend(v11, "appendString:", CFSTR(", *EXPERIMENTAL*"));
  v50 = -[AVCaptureDeviceFormat isStillImageDisparitySupported](self, "isStillImageDisparitySupported")
     || -[AVCaptureDeviceFormat isStillImageDepthSupported](self, "isStillImageDepthSupported");
  v51 = -[AVCaptureDeviceFormat isStreamingDisparitySupported](self, "isStreamingDisparitySupported")
     || -[AVCaptureDeviceFormat isStreamingDepthSupported](self, "isStreamingDepthSupported");
  if (v50 || v51)
  {
    v52 = CFSTR(", supports still image only depth");
    if (v50 && v51)
      v52 = CFSTR(", supports depth");
    if (v50)
      v53 = v52;
    else
      v53 = CFSTR(", supports streaming only depth");
    objc_msgSend(v11, "appendString:", v53);
  }
  if (-[AVCaptureDeviceFormat isMultiCamSupported](self, "isMultiCamSupported"))
    objc_msgSend(v11, "appendString:", CFSTR(", supports multicam"));
  if (-[AVCaptureDeviceFormat isSpatialVideoCaptureSupported](self, "isSpatialVideoCaptureSupported"))
    objc_msgSend(v11, "appendString:", CFSTR(", supports spatial video capture"));
  if (-[AVCaptureDeviceFormat isFastCapturePrioritizationSupported](self, "isFastCapturePrioritizationSupported"))
    objc_msgSend(v11, "appendString:", CFSTR(", supports responsive capture"));
  if (-[AVCaptureDeviceFormat isZeroShutterLagSupported](self, "isZeroShutterLagSupported"))
  {
    objc_msgSend(v11, "appendString:", CFSTR(", supports zero shutter lag"));
    if (-[AVCaptureDeviceFormat isZeroShutterLagWithDepthSupported](self, "isZeroShutterLagWithDepthSupported"))
      objc_msgSend(v11, "appendString:", CFSTR(" (with depth)"));
  }
  if (-[AVCaptureDeviceFormat isHighPhotoQualitySupported](self, "isHighPhotoQualitySupported"))
    objc_msgSend(v11, "appendString:", CFSTR(", supports high photo quality"));
  if (-[AVCaptureDeviceFormat isHighestPhotoQualitySupported](self, "isHighestPhotoQualitySupported"))
    objc_msgSend(v11, "appendString:", CFSTR(", supports highest photo quality"));
  if (-[AVCaptureDeviceFormat isCenterStageSupported](self, "isCenterStageSupported"))
    objc_msgSend(v11, "appendFormat:", CFSTR(", supports Center Stage"));
  if (objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isCenterStageRectOfInterestSupported"))objc_msgSend(v11, "appendString:", CFSTR(", supports CS RoI"));
  if (-[AVCaptureDeviceFormat isBackgroundBlurSupported](self, "isBackgroundBlurSupported"))
    objc_msgSend(v11, "appendString:", CFSTR(", supports Portrait Effect"));
  if (-[AVCaptureDeviceFormat isStudioLightSupported](self, "isStudioLightSupported"))
    objc_msgSend(v11, "appendString:", CFSTR(", supports Studio Lighting"));
  if (-[AVCaptureDeviceFormat reactionEffectsSupported](self, "reactionEffectsSupported"))
    objc_msgSend(v11, "appendString:", CFSTR(", supports Reactions"));
  if (-[AVCaptureDeviceFormat isBackgroundReplacementSupported](self, "isBackgroundReplacementSupported"))
    objc_msgSend(v11, "appendString:", CFSTR(", supports Background Replacement"));
  if (-[AVCaptureDeviceFormat isSmartStyleRenderingSupported](self, "isSmartStyleRenderingSupported"))
    objc_msgSend(v11, "appendString:", CFSTR(", supports Smart Style"));
  return v11;
}

- (id)_supportedMaxPhotoDimensionsPrivateDimensionsEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSArray *supportedMaxPhotoDimensions;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  supportedMaxPhotoDimensions = self->_internal->supportedMaxPhotoDimensions;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](supportedMaxPhotoDimensions, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(supportedMaxPhotoDimensions);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "isPrivate"))
          v12 = !v3;
        else
          v12 = 0;
        if (!v12)
        {
          v18 = objc_msgSend(v11, "dimensions");
          objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v18, "{?=ii}"));
        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](supportedMaxPhotoDimensions, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v8);
  }
  return (id)objc_msgSend(v5, "copy");
}

- (NSArray)supportedMaxPhotoDimensions
{
  return (NSArray *)-[AVCaptureDeviceFormat _supportedMaxPhotoDimensionsPrivateDimensionsEnabled:](self, "_supportedMaxPhotoDimensionsPrivateDimensionsEnabled:", 0);
}

- (float)videoFieldOfView
{
  id v3;
  float result;

  if (-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"))
  {
    v3 = -[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat");
LABEL_5:
    objc_msgSend(v3, "fieldOfView");
    return result;
  }
  if (-[AVCaptureDeviceFormat figCaptureSourceDepthDataFormat](self, "figCaptureSourceDepthDataFormat"))
  {
    v3 = -[AVCaptureDeviceFormat figCaptureSourceDepthDataFormat](self, "figCaptureSourceDepthDataFormat");
    goto LABEL_5;
  }
  return 0.0;
}

- (BOOL)isVideoStabilizationStrengthSupported:(int64_t)a3
{
  if (-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"))
    return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isVideoStabilizationStrengthSupported:", a3);
  else
    return a3 == 0;
}

- (BOOL)isFastCapturePrioritizationSupported
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isResponsiveShutterSupported");
}

- (NSArray)secondaryNativeResolutionZoomFactors
{
  return (NSArray *)objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "secondaryNativeResolutionZoomFactors");
}

- (float)geometricDistortionCorrectedVideoFieldOfView
{
  uint64_t v3;
  id v4;
  float result;

  v3 = objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "geometricDistortionCorrectionFormat");
  v4 = -[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat");
  if (v3)
    v4 = (id)objc_msgSend(v4, "geometricDistortionCorrectionFormat");
  objc_msgSend(v4, "geometricDistortionCorrectedFieldOfView");
  return result;
}

- (float)minISO
{
  float result;

  objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "minISO");
  return result;
}

- (AVCaptureAutoFocusSystem)autoFocusSystem
{
  return (uint64_t)(int)objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "autoFocusSystem");
}

- (float)maxISO
{
  float result;

  objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "maxISO");
  return result;
}

- (BOOL)isWideColorSupported
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isWideColorSupported");
}

- (CGFloat)videoMaxZoomFactor
{
  float v3;

  if (!-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"))
    return 1.0;
  objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "maxZoomFactor");
  return v3;
}

- (float)minSimulatedAperture
{
  float result;

  objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "minSimulatedAperture");
  return result;
}

- (float)defaultSimulatedAperture
{
  float result;

  objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "defaultSimulatedAperture");
  return result;
}

- (BOOL)isZeroShutterLagSupported
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isZeroShutterLagSupported");
}

- (BOOL)isVideoBinned
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isBinned");
}

- (float)defaultPortraitLightingEffectStrength
{
  id v2;
  float result;

  v2 = -[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat");
  if (!v2)
    return NAN;
  objc_msgSend(v2, "defaultPortraitLightingEffectStrength");
  return result;
}

- (float)maxSimulatedAperture
{
  float result;

  objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "maxSimulatedAperture");
  return result;
}

- (BOOL)isHighPhotoQualitySupported
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isHighPhotoQualitySupported");
}

- (BOOL)isDeferredPhotoProcessingSupported
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isDeferredPhotoProcessingSupported");
}

- (int)supportedStabilizationMethod
{
  if (-[AVCaptureDeviceFormat isVideoStabilizationModeSupported:](self, "isVideoStabilizationModeSupported:", 1))
    return 2;
  else
    return 0;
}

- (BOOL)isVideoStabilizationModeSupported:(AVCaptureVideoStabilizationMode)videoStabilizationMode
{
  AVCaptureDeviceFormat *v3;
  id v5;
  AVCaptureVideoStabilizationMode v6;

  v3 = self;
  LOBYTE(self) = 1;
  switch(videoStabilizationMode)
  {
    case AVCaptureVideoStabilizationModeAuto:
      return (char)self;
    case AVCaptureVideoStabilizationModeOff:
    case AVCaptureVideoStabilizationModeStandard:
    case AVCaptureVideoStabilizationModeCinematic:
      v5 = -[AVCaptureDeviceFormat figCaptureSourceVideoFormat](v3, "figCaptureSourceVideoFormat");
      v6 = videoStabilizationMode;
      goto LABEL_8;
    case AVCaptureVideoStabilizationModeCinematicExtended:
      LODWORD(self) = AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureExtendedCinematicVISSupported"));
      if (!(_DWORD)self)
        return (char)self;
      v5 = -[AVCaptureDeviceFormat figCaptureSourceVideoFormat](v3, "figCaptureSourceVideoFormat");
      v6 = AVCaptureVideoStabilizationModeCinematicExtended;
LABEL_8:
      LOBYTE(self) = objc_msgSend(v5, "isStabilizationModeSupported:", v6);
      return (char)self;
    case AVCaptureVideoStabilizationModePreviewOptimized:
      v5 = -[AVCaptureDeviceFormat figCaptureSourceVideoFormat](v3, "figCaptureSourceVideoFormat");
      v6 = AVCaptureVideoStabilizationModePreviewOptimized;
      goto LABEL_8;
    case AVCaptureVideoStabilizationModePreviewOptimized|AVCaptureVideoStabilizationModeStandard:
      v5 = -[AVCaptureDeviceFormat figCaptureSourceVideoFormat](v3, "figCaptureSourceVideoFormat");
      v6 = AVCaptureVideoStabilizationModePreviewOptimized|AVCaptureVideoStabilizationModeStandard;
      goto LABEL_8;
    default:
      LOBYTE(self) = 0;
      return (char)self;
  }
}

- (CMTime)minExposureDuration
{
  CMTime *result;

  result = -[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat");
  if (result)
    return (CMTime *)-[CMTime minExposureDuration](result, "minExposureDuration");
  retstr->value = 0;
  *(_QWORD *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (CMTime)maxExposureDuration
{
  CMTime *result;

  result = -[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat");
  if (result)
    return (CMTime *)-[CMTime maxExposureDuration](result, "maxExposureDuration");
  retstr->value = 0;
  *(_QWORD *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (BOOL)isVisionDataDeliverySupported
{
  AVCaptureDeviceFormatInternal *internal;

  internal = self->_internal;
  if (internal->isDepthDataFormat)
    return 0;
  else
    return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](internal->fcSourceAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04940]), "BOOLValue");
}

- (BOOL)isMultiCamSupported
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isMultiCamSupported");
}

- (BOOL)isHighestPhotoQualitySupported
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isStillImageStabilizationSupported");
}

- (BOOL)isExperimental
{
  return -[FigCaptureSourceFormat isExperimental](self->_internal->sourceFormat, "isExperimental");
}

- (BOOL)isDeepFusionSupported
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isDeepFusionSupported");
}

- (BOOL)isConstantColorSupported
{
  return self->_internal->constantColorSupported;
}

- (BOOL)isCameraCalibrationDataDeliverySupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_internal->fcSourceAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D047A8]), "BOOLValue");
}

- (CGFloat)videoZoomFactorUpscaleThreshold
{
  float v3;

  if (!-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"))
    return 1.0;
  objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "zoomFactorUpscaleThreshold");
  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[AVCaptureDeviceFormat debugDescription](self, "debugDescription"));
}

- (id)debugDescription
{
  -[AVCaptureDeviceFormat mediaType](self, "mediaType");
  return -[AVCaptureDeviceFormat _stringForMediaType:formatDescription:frameRateRanges:](self, "_stringForMediaType:formatDescription:frameRateRanges:", AVOSTypeForString(), -[AVCaptureDeviceFormat formatDescription](self, "formatDescription"), -[AVCaptureDeviceFormat videoSupportedFrameRateRanges](self, "videoSupportedFrameRateRanges"));
}

- (NSArray)videoSupportedFrameRateRanges
{
  float v3;
  float v4;
  id v5;
  float v6;
  float v7;
  NSArray *v8;

  if (!self->_internal->videoSupportedFrameRateRanges)
  {
    if (-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"))
    {
      objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "minSupportedFrameRate");
      v4 = v3;
      v5 = -[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat");
    }
    else
    {
      if (!-[AVCaptureDeviceFormat figCaptureSourceDepthDataFormat](self, "figCaptureSourceDepthDataFormat"))
      {
        v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
        goto LABEL_7;
      }
      objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceDepthDataFormat](self, "figCaptureSourceDepthDataFormat"), "minSupportedFrameRate");
      v4 = v6;
      v5 = -[AVCaptureDeviceFormat figCaptureSourceDepthDataFormat](self, "figCaptureSourceDepthDataFormat");
    }
    objc_msgSend(v5, "maxSupportedFrameRate");
    v8 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", +[AVFrameRateRange frameRateRangeWithMinRate:maxFrameRate:](AVFrameRateRange, "frameRateRangeWithMinRate:maxFrameRate:", (int)v4, (int)v7), 0);
LABEL_7:
    self->_internal->videoSupportedFrameRateRanges = v8;
  }
  return self->_internal->videoSupportedFrameRateRanges;
}

- (AVMediaType)mediaType
{
  -[FigCaptureSourceFormat mediaType](self->_internal->sourceFormat, "mediaType");
  return (AVMediaType)AVStringForOSType();
}

- (id)figCaptureSourceDepthDataFormat
{
  if (-[FigCaptureSourceFormat mediaType](self->_internal->sourceFormat, "mediaType") == 1685091432)
    return self->_internal->sourceFormat;
  else
    return 0;
}

- (float)maxPortraitLightingEffectStrength
{
  id v2;
  float result;

  v2 = -[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat");
  if (!v2)
    return NAN;
  objc_msgSend(v2, "maxPortraitLightingEffectStrength");
  return result;
}

- (BOOL)supportsHighResolutionStillImageOutput
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "geometricDistortionCorrectionFormat");
  v4 = -[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat");
  if (v3)
  {
    v5 = (id)objc_msgSend(v4, "geometricDistortionCorrectionFormat");
    return objc_msgSend(v5, "isHighResStillImageSupported");
  }
  if (v4)
  {
    v5 = -[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat");
    return objc_msgSend(v5, "isHighResStillImageSupported");
  }
  return -[AVCaptureDeviceFormat figCaptureSourceDepthDataFormat](self, "figCaptureSourceDepthDataFormat") != 0;
}

- (BOOL)prefersVideoHDREnabledForSessionPreset:(id)a3
{
  int v5;

  if ((objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isSIFRSupported") & 1) != 0)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = objc_msgSend(-[AVCaptureDeviceFormat AVCaptureSessionPresets](self, "AVCaptureSessionPresets"), "containsObject:", a3);
    if (v5)
      LOBYTE(v5) = objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "prefersSensorHDREnabled");
  }
  return v5;
}

- (BOOL)isVideoGreenGhostMitigationSupported
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isVideoGreenGhostMitigationSupported");
}

- (float)minPortraitLightingEffectStrength
{
  id v2;
  float result;

  v2 = -[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat");
  if (!v2)
    return NAN;
  objc_msgSend(v2, "minPortraitLightingEffectStrength");
  return result;
}

- (BOOL)isIrisVideoStabilizationSupported
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isIrisVideoStabilizationSupported");
}

- (BOOL)isSpatialOverCaptureSupported
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isSpatialOverCaptureSupported");
}

- (BOOL)isIrisSupported
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isIrisSupported");
}

- (id)supportedMaxPhotoDimensionsPrivate
{
  return -[AVCaptureDeviceFormat _supportedMaxPhotoDimensionsPrivateDimensionsEnabled:](self, "_supportedMaxPhotoDimensionsPrivateDimensionsEnabled:", 1);
}

- (NSArray)supportedVideoZoomRangesForDepthDataDelivery
{
  float v3;
  AVCaptureDeviceFormatInternal *internal;
  float v5;
  float v6;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  float v15;
  double v16;
  float v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  if (!-[NSArray count](-[AVCaptureDeviceFormat supportedDepthDataFormats](self, "supportedDepthDataFormats"), "count"))
    return (NSArray *)MEMORY[0x1E0C9AA60];
  objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "clientMaxContinuousZoomFactorForDepthDataDelivery");
  internal = self->_internal;
  if (internal->continuousZoomWithDepthEnabled && (v5 = v3, v3 > 0.0))
  {
    objc_msgSend((id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](internal->fcSourceAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04928]), "firstObject"), "floatValue");
    if (v6 == 0.0)
      v6 = 1.0;
    v23[0] = +[AVZoomRange zoomRangeWithMinZoomFactor:maxZoomFactor:](AVZoomRange, "zoomRangeWithMinZoomFactor:maxZoomFactor:", v6, v5);
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  }
  else
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = -[NSDictionary objectForKeyedSubscript:](self->_internal->fcSourceAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04928]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v14, "floatValue");
          v16 = v15;
          objc_msgSend(v14, "floatValue");
          objc_msgSend(v8, "addObject:", +[AVZoomRange zoomRangeWithMinZoomFactor:maxZoomFactor:](AVZoomRange, "zoomRangeWithMinZoomFactor:maxZoomFactor:", v16, v17));
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }
    return (NSArray *)(id)objc_msgSend(v8, "copy");
  }
}

- (id)supportedSemanticSegmentationMatteTypes
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = -[NSDictionary objectForKeyedSubscript:](self->_internal->fcSourceAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D048F0]);
  if (objc_msgSend(v4, "count"))
  {
    v5 = *MEMORY[0x1E0D09290];
    v19[0] = *MEMORY[0x1E0D09288];
    v19[1] = v5;
    v20[0] = CFSTR("AVSemanticSegmentationMatteTypeHair");
    v20[1] = CFSTR("AVSemanticSegmentationMatteTypeSkin");
    v6 = *MEMORY[0x1E0D09280];
    v19[2] = *MEMORY[0x1E0D092A0];
    v19[3] = v6;
    v20[2] = CFSTR("AVSemanticSegmentationMatteTypeTeeth");
    v20[3] = CFSTR("AVSemanticSegmentationMatteTypeGlasses");
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v4);
          v12 = objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11));
          if (v12)
            objc_msgSend(v3, "addObject:", v12);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }
  }
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
}

- (BOOL)isPortraitEffectsMatteStillImageDeliverySupported
{
  AVCaptureDeviceFormatInternal *internal;
  float v3;

  internal = self->_internal;
  if (!internal->isDepthDataFormat)
    return 0;
  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](internal->fcSourceAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D048A8]), "floatValue");
  return v3 > 0.0;
}

- (BOOL)isSemanticStyleRenderingSupported
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isSemanticStyleRenderingSupported");
}

- (id)vtScalingMode
{
  return 0;
}

- ($2825F4736939C4A6D3AD43837233062D)sensorDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "sensorDimensions");
}

- (BOOL)isVideoHDRSuspensionSupported
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isSIFRSupported");
}

- (int64_t)videoHDRFlavor
{
  if ((objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isSIFRSupported") & 1) != 0)return 2;
  else
    return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "hasSensorHDRCompanionIndex");
}

- (BOOL)isHDRSupported
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isHDRSupported");
}

- (unsigned)supportedRawPixelFormat
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "supportedRawPixelFormat");
}

+ (void)initialize
{
  objc_opt_class();
}

- (BOOL)isZeroShutterLagWithDepthSupported
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isZeroShutterLagWithDepthSupported");
}

- (BOOL)isContentAwareDistortionCorrectionSupported
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "intelligentDistortionCorrectionSupported");
}

- (BOOL)isDemosaicedRawSupported
{
  unsigned int v3;

  v3 = -[AVCaptureDeviceFormat internalDemosaicedRawPixelFormat](self, "internalDemosaicedRawPixelFormat");
  if (v3)
    LOBYTE(v3) = -[AVCaptureDeviceFormat supportedDemosaicedRawPixelFormat](self, "supportedDemosaicedRawPixelFormat") != 0;
  return v3;
}

- (unsigned)supportedDemosaicedRawPixelFormat
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "supportedDemosaicedRawPixelFormat");
}

- (unsigned)internalDemosaicedRawPixelFormat
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "internalDemosaicedRawPixelFormat");
}

- (BOOL)isMomentCaptureMovieRecordingSupported
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isMomentCaptureMovieRecordingSupported");
}

- (BOOL)isDigitalFlashSupported
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isDigitalFlashSupported");
}

- (BOOL)supportsRedEyeReduction
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isRedEyeReductionSupported");
}

- (BOOL)isStereoFusionSupported
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isStereoFusionSupported");
}

- (BOOL)isSISSupported
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isStillImageStabilizationSupported");
}

- (BOOL)isDemosaicedRawConfigurationWithDepthSupported
{
  id v2;

  v2 = -[NSDictionary objectForKeyedSubscript:](self->_internal->fcSourceAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D047E8]);
  return objc_msgSend((id)objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D04090]), "BOOLValue");
}

- (BOOL)isDCProcessingWithDepthSupported
{
  id v2;

  v2 = -[NSDictionary objectForKeyedSubscript:](self->_internal->fcSourceAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D047E8]);
  return objc_msgSend((id)objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D04088]), "BOOLValue");
}

- (BOOL)isVariableFrameRateVideoCaptureSupported
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isVariableFrameRateVideoCaptureSupported");
}

- (BOOL)isLowLightVideoCaptureSupported
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isLowLightVideoCaptureSupported");
}

- (BOOL)validateMaxPhotoDimensions:(id)a3 privateDimensionsEnabled:(BOOL)a4
{
  _BOOL4 v4;
  NSArray *supportedMaxPhotoDimensions;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  supportedMaxPhotoDimensions = self->_internal->supportedMaxPhotoDimensions;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](supportedMaxPhotoDimensions, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(supportedMaxPhotoDimensions);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        if (objc_msgSend(v11, "isPrivate"))
          v12 = !v4;
        else
          v12 = 0;
        if (!v12 && (objc_msgSend(v11, "dimensionsAreEqualToDimensions:", a3) & 1) != 0)
        {
          LOBYTE(v7) = 1;
          return v7;
        }
        ++v10;
      }
      while (v8 != v10);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](supportedMaxPhotoDimensions, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v8 = v7;
      if (v7)
        continue;
      break;
    }
  }
  return v7;
}

- (BOOL)isNonDestructiveCropSupported
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isNonDestructiveCropSupported");
}

- (BOOL)isPortraitAutoSuggestSupported
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isPortraitAutoSuggestSupported");
}

- (void)dealloc
{
  AVCaptureDeviceFormatInternal *internal;
  AVCaptureDeviceFormatInternal *v4;
  opaqueCMFormatDescription *formatDescription;
  objc_super v6;

  internal = self->_internal;
  if (internal)
  {

    v4 = self->_internal;
    formatDescription = v4->formatDescription;
    if (formatDescription)
    {
      CFRelease(formatDescription);
      v4 = self->_internal;
    }

  }
  v6.receiver = self;
  v6.super_class = (Class)AVCaptureDeviceFormat;
  -[AVCaptureDeviceFormat dealloc](&v6, sel_dealloc);
}

- (AVZoomRange)systemRecommendedVideoZoomRange
{
  int v3;
  int v4;
  double v5;
  id v6;
  float v7;

  if (-[FigCaptureSourceFormat mediaType](self->_internal->sourceFormat, "mediaType") != 1986618469)
    return 0;
  v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_internal->fcSourceAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D047F0]), "intValue");
  if (v3 == 15)
    return 0;
  v4 = v3;
  v5 = -[AVCaptureDeviceFormat isHighestPhotoQualitySupported](self, "isHighestPhotoQualitySupported") ? 5.0 : 3.0;
  if (objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_internal->fcSourceAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D048B0]), "intValue") != 1)return 0;
  v6 = -[NSDictionary objectForKeyedSubscript:](self->_internal->fcSourceAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04798]);
  if (v6)
  {
    objc_msgSend((id)objc_msgSend(v6, "lastObject"), "floatValue");
    v5 = v5 * v7;
  }
  if (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQQ4PFVIJ6WPTAHHYTAR5J5O7YNA")))
  {
    if (v4 == 8 || v4 == 2)
      v5 = v5 + v5;
  }
  if (v5 == -1.0)
    return 0;
  else
    return +[AVZoomRange zoomRangeWithMinZoomFactor:maxZoomFactor:](AVZoomRange, "zoomRangeWithMinZoomFactor:maxZoomFactor:", 1.0, v5);
}

- (CGFloat)videoMinZoomFactorForDepthDataDelivery
{
  double v2;

  objc_msgSend(-[NSArray firstObject](-[AVCaptureDeviceFormat supportedVideoZoomRangesForDepthDataDelivery](self, "supportedVideoZoomRangesForDepthDataDelivery"), "firstObject"), "minZoomFactor");
  if (v2 == 0.0)
    return (float)1.0;
  return (float)v2;
}

- (CGFloat)videoMaxZoomFactorForDepthDataDelivery
{
  double v2;

  objc_msgSend(-[NSArray firstObject](-[AVCaptureDeviceFormat supportedVideoZoomRangesForDepthDataDelivery](self, "supportedVideoZoomRangesForDepthDataDelivery"), "firstObject"), "maxZoomFactor");
  if (v2 == 0.0)
    return (float)1.0;
  return (float)v2;
}

- (NSArray)supportedVideoZoomFactorsForDepthDataDelivery
{
  NSArray *result;

  result = -[NSDictionary objectForKeyedSubscript:](self->_internal->fcSourceAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04928]);
  if (!result)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  return result;
}

- (BOOL)zoomFactorsOutsideOfVideoZoomRangesForDepthDeliverySupported
{
  float v2;

  objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "clientMaxContinuousZoomFactorForDepthDataDelivery");
  return v2 > 0.0;
}

- (double)videoMinZoomFactorForCameraCalibrationDataDelivery
{
  return 1.0;
}

- (double)videoMaxZoomFactorForCameraCalibrationDataDelivery
{
  return 1.0;
}

- (CGFloat)videoMinZoomFactorForCenterStage
{
  return 1.0;
}

- (CGFloat)videoMaxZoomFactorForCenterStage
{
  CGFloat result;

  if (-[AVCaptureDeviceFormat isCenterStageSupported](self, "isCenterStageSupported"))
    return 1.0;
  -[AVCaptureDeviceFormat videoMaxZoomFactor](self, "videoMaxZoomFactor");
  return result;
}

- (AVFrameRateRange)videoFrameRateRangeForCenterStage
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!-[AVCaptureDeviceFormat isCenterStageSupported](self, "isCenterStageSupported"))
    return 0;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = -[AVCaptureDeviceFormat videoSupportedFrameRateRanges](self, "videoSupportedFrameRateRanges", 0);
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    v7 = 0.0;
    v8 = 3.40282347e38;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v10, "minFrameRate");
        if (v11 < v8)
        {
          objc_msgSend(v10, "minFrameRate");
          v8 = v12;
        }
        objc_msgSend(v10, "maxFrameRate");
        if (v13 > v7)
        {
          objc_msgSend(v10, "maxFrameRate");
          v7 = v14;
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
    v8 = 3.40282347e38;
  }
  v16 = (void *)objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "cinematicFramingFormat");
  objc_msgSend(v16, "minSupportedFrameRate");
  if (v8 < v17)
  {
    objc_msgSend(v16, "minSupportedFrameRate");
    v8 = v18;
  }
  objc_msgSend(v16, "maxSupportedFrameRate");
  if (v8 > v19)
  {
    objc_msgSend(v16, "maxSupportedFrameRate");
    v8 = v20;
  }
  objc_msgSend(v16, "minSupportedFrameRate");
  if (v7 < v21)
  {
    objc_msgSend(v16, "minSupportedFrameRate");
    v7 = v22;
  }
  objc_msgSend(v16, "maxSupportedFrameRate");
  if (v7 > v23)
  {
    objc_msgSend(v16, "maxSupportedFrameRate");
    v7 = v24;
  }
  return +[AVFrameRateRange frameRateRangeWithMinRate:maxFrameRate:](AVFrameRateRange, "frameRateRangeWithMinRate:maxFrameRate:", (int)v8, (int)v7);
}

- (id)videoFrameRateRangeForCenterStageForContinuityCamera
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!-[AVCaptureDeviceFormat isCenterStageSupported](self, "isCenterStageSupported")
    && !-[AVCaptureDeviceFormat isCenterStageSupportedForContinuityCamera](self, "isCenterStageSupportedForContinuityCamera"))
  {
    return 0;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = -[AVCaptureDeviceFormat videoSupportedFrameRateRanges](self, "videoSupportedFrameRateRanges", 0);
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    v7 = 0.0;
    v8 = 3.40282347e38;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v10, "minFrameRate");
        if (v11 < v8)
        {
          objc_msgSend(v10, "minFrameRate");
          v8 = v12;
        }
        objc_msgSend(v10, "maxFrameRate");
        if (v13 > v7)
        {
          objc_msgSend(v10, "maxFrameRate");
          v7 = v14;
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
    v8 = 3.40282347e38;
  }
  v15 = (void *)objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "cinematicFramingFormat");
  objc_msgSend(v15, "minSupportedFrameRate");
  if (v8 < v16)
  {
    objc_msgSend(v15, "minSupportedFrameRate");
    v8 = v17;
  }
  objc_msgSend(v15, "maxSupportedFrameRate");
  if (v8 > v18)
  {
    objc_msgSend(v15, "maxSupportedFrameRate");
    v8 = v19;
  }
  objc_msgSend(v15, "minSupportedFrameRate");
  if (v7 < v20)
  {
    objc_msgSend(v15, "minSupportedFrameRate");
    v7 = v21;
  }
  objc_msgSend(v15, "maxSupportedFrameRate");
  if (v7 > v22)
  {
    objc_msgSend(v15, "maxSupportedFrameRate");
    v7 = v23;
  }
  return +[AVFrameRateRange frameRateRangeWithMinRate:maxFrameRate:](AVFrameRateRange, "frameRateRangeWithMinRate:maxFrameRate:", (int)v8, (int)v7);
}

- (AVFrameRateRange)videoFrameRateRangeForPortraitEffect
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!-[AVCaptureDeviceFormat isBackgroundBlurSupported](self, "isBackgroundBlurSupported"))
    return 0;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = -[AVCaptureDeviceFormat videoSupportedFrameRateRanges](self, "videoSupportedFrameRateRanges", 0);
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    v7 = 0.0;
    v8 = 3.40282347e38;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "minFrameRate");
        if (v11 < v8)
        {
          objc_msgSend(v10, "minFrameRate");
          v8 = v12;
        }
        objc_msgSend(v10, "maxFrameRate");
        if (v13 > v7)
        {
          objc_msgSend(v10, "maxFrameRate");
          v7 = v14;
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
    v8 = 3.40282347e38;
  }
  v16 = 30.0;
  if (v7 <= 30.0)
    v16 = v7;
  return +[AVFrameRateRange frameRateRangeWithMinRate:maxFrameRate:](AVFrameRateRange, "frameRateRangeWithMinRate:maxFrameRate:", (int)v8, (int)v16);
}

- (AVFrameRateRange)videoFrameRateRangeForStudioLight
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!-[AVCaptureDeviceFormat isStudioLightSupported](self, "isStudioLightSupported"))
    return 0;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = -[AVCaptureDeviceFormat videoSupportedFrameRateRanges](self, "videoSupportedFrameRateRanges", 0);
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    v7 = 0.0;
    v8 = 3.40282347e38;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "minFrameRate");
        if (v11 < v8)
        {
          objc_msgSend(v10, "minFrameRate");
          v8 = v12;
        }
        objc_msgSend(v10, "maxFrameRate");
        if (v13 > v7)
        {
          objc_msgSend(v10, "maxFrameRate");
          v7 = v14;
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
    v8 = 3.40282347e38;
  }
  v16 = 30.0;
  if (v7 <= 30.0)
    v16 = v7;
  return +[AVFrameRateRange frameRateRangeWithMinRate:maxFrameRate:](AVFrameRateRange, "frameRateRangeWithMinRate:maxFrameRate:", (int)v8, (int)v16);
}

- (AVFrameRateRange)videoFrameRateRangeForReactionEffectsInProgress
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!-[AVCaptureDeviceFormat reactionEffectsSupported](self, "reactionEffectsSupported"))
    return 0;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = -[AVCaptureDeviceFormat videoSupportedFrameRateRanges](self, "videoSupportedFrameRateRanges", 0);
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    v7 = 0.0;
    v8 = 3.40282347e38;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "minFrameRate");
        if (v11 < v8)
        {
          objc_msgSend(v10, "minFrameRate");
          v8 = v12;
        }
        objc_msgSend(v10, "maxFrameRate");
        if (v13 > v7)
        {
          objc_msgSend(v10, "maxFrameRate");
          v7 = v14;
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
    v8 = 3.40282347e38;
  }
  v16 = 30.0;
  if (v7 <= 30.0)
    v16 = v7;
  return +[AVFrameRateRange frameRateRangeWithMinRate:maxFrameRate:](AVFrameRateRange, "frameRateRangeWithMinRate:maxFrameRate:", (int)v8, (int)v16);
}

- (id)videoFrameRateRangeForBackgroundReplacement
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!-[AVCaptureDeviceFormat isBackgroundReplacementSupported](self, "isBackgroundReplacementSupported"))
    return 0;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = -[AVCaptureDeviceFormat videoSupportedFrameRateRanges](self, "videoSupportedFrameRateRanges", 0);
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    v7 = 0.0;
    v8 = 3.40282347e38;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "minFrameRate");
        if (v11 < v8)
        {
          objc_msgSend(v10, "minFrameRate");
          v8 = v12;
        }
        objc_msgSend(v10, "maxFrameRate");
        if (v13 > v7)
        {
          objc_msgSend(v10, "maxFrameRate");
          v7 = v14;
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
    v8 = 3.40282347e38;
  }
  v16 = 30.0;
  if (v7 <= 30.0)
    v16 = v7;
  return +[AVFrameRateRange frameRateRangeWithMinRate:maxFrameRate:](AVFrameRateRange, "frameRateRangeWithMinRate:maxFrameRate:", (int)v8, (int)v16);
}

- (BOOL)isVideoStabilizationSupported
{
  void *v4;
  uint64_t v5;
  NSString *v6;

  if (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureConnectionCinematicVISAwareAPIsAreAvailable")))
  {
    v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "environment"), "objectForKeyedSubscript:", CFSTR("SKIP_DEPRECATED_LOG"));
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("YES")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("yes")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("1")) & 1) == 0)
    {
      v5 = objc_opt_class();
      v6 = NSStringFromSelector(a2);
      NSLog(CFSTR("WARNING: -[<%@: 0x%x> %@] is deprecated. Please use %@"), v5, self, v6, CFSTR("-[AVCaptureDeviceFormat isVideoStabilizationModeSupported:]"));
    }
  }
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isStabilizationModeSupported:", 1);
}

- (BOOL)isGlobalToneMappingSupported
{
  AVCaptureDeviceFormatInternal *internal;

  internal = self->_internal;
  if (internal->isDepthDataFormat)
    return 0;
  else
    return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](internal->fcSourceAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04840]), "BOOLValue");
}

- (CMVideoDimensions)highResolutionStillImageDimensions
{
  return (CMVideoDimensions)-[AVCaptureDeviceFormat defaultPhotoDimensionsWithHighResolutionCaptureEnabled:](self, "defaultPhotoDimensionsWithHighResolutionCaptureEnabled:", 1);
}

- (NSArray)unsupportedCaptureOutputClasses
{
  void *v3;

  if (-[AVCaptureDeviceFormat isPhotoFormat](self, "isPhotoFormat")
    && (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureMFOSupportsPhotoFormats")) & 1) == 0)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    objc_msgSend(v3, "addObject:", objc_opt_class());
  }
  else
  {
    v3 = 0;
  }
  if (!-[AVCaptureDeviceFormat isStreamingDisparitySupported](self, "isStreamingDisparitySupported")
    && !-[AVCaptureDeviceFormat isStreamingDepthSupported](self, "isStreamingDepthSupported"))
  {
    if (!v3)
      v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    objc_msgSend(v3, "addObject:", objc_opt_class());
  }
  if (v3)
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)isSpatialVideoCaptureSupported
{
  int BoolAnswer;

  BoolAnswer = AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQBWQSOG5QWWG276TG2HH4RGJZDA"));
  if (BoolAnswer)
    LOBYTE(BoolAnswer) = objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isStereoVideoCaptureSupported");
  return BoolAnswer;
}

- (BOOL)isCenterStageSupportedForContinuityCamera
{
  return self->_internal->centerStageSupportedForContinuityCamera;
}

- (BOOL)isManualFramingSupported
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isManualFramingSupported");
}

- (BOOL)isBackgroundBlurSupportedForContinuityCamera
{
  return self->_internal->backgroundBlurSupportedForContinuityCamera;
}

- (BOOL)isBackgroundBlurApertureSupported
{
  return self->_internal->backgroundBlurSupported;
}

- (BOOL)isStudioLightingSupportedForContinuityCamera
{
  return self->_internal->studioLightingSupportedForContinuityCamera;
}

- (BOOL)isStudioLightingIntensitySupported
{
  return self->_internal->studioLightingSupported;
}

- (BOOL)reactionEffectsSupportedForContinuityCamera
{
  return self->_internal->reactionEffectsSupportedForContinuityCamera;
}

- (BOOL)isBackgroundReplacementSupported
{
  return self->_internal->backgroundReplacementSupported;
}

- (BOOL)isBackgroundReplacementSupportedForContinuityCamera
{
  return self->_internal->backgroundReplacementSupportedForContinuityCamera;
}

- ($2825F4736939C4A6D3AD43837233062D)previewDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "previewDimensions");
}

- (AVExposureBiasRange)systemRecommendedExposureBiasRange
{
  double v2;
  double v3;

  LODWORD(v2) = -2.0;
  LODWORD(v3) = 2.0;
  return +[AVExposureBiasRange exposureBiasRangeWithMinExposureBias:maxExposureBias:](AVExposureBiasRange, "exposureBiasRangeWithMinExposureBias:maxExposureBias:", v2, v3);
}

- (id)optimizedVideoPreviewFilterNames
{
  void *v3;

  if (-[FigCaptureSourceFormat mediaType](self->_internal->sourceFormat, "mediaType") != 1986618469)
    return (id)MEMORY[0x1E0C9AA60];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", CFSTR("CIPhotoEffectChrome"), CFSTR("CIPhotoEffectFade"), CFSTR("CIPhotoEffectInstant"), CFSTR("CIPhotoEffectMono"), CFSTR("CIPhotoEffectNoir"), CFSTR("CIPhotoEffectProcess"), CFSTR("CIPhotoEffectTonal"), CFSTR("CIPhotoEffectTransfer"), CFSTR("CIPhotoEffect3DVivid"), CFSTR("CIPhotoEffect3DVividWarm"), CFSTR("CIPhotoEffect3DVividCool"), CFSTR("CIPhotoEffect3DDramatic"), CFSTR("CIPhotoEffect3DDramaticWarm"), CFSTR("CIPhotoEffect3DDramaticCool"), CFSTR("CIPhotoEffect3DSilverplate"), CFSTR("CIPhotoEffect3DNoir"), CFSTR("CIDepthEffect"),
                 CFSTR("CIPhotoEffect3DCommercial"),
                 CFSTR("CIPortraitEffectLight"),
                 CFSTR("CIPortraitEffectCommercial"),
                 CFSTR("CIPortraitEffectStudio"),
                 CFSTR("CIPortraitEffectContour"),
                 CFSTR("CIPortraitEffectBlack"),
                 CFSTR("CIPortraitEffectStage"),
                 CFSTR("CIPortraitEffectBlackoutMono"),
                 CFSTR("CIPortraitEffectStageMono"),
                 CFSTR("CIPortraitEffectStudioV2"),
                 CFSTR("CIPortraitEffectContourV2"),
                 CFSTR("CIPortraitEffectStageV2"),
                 CFSTR("CIPortraitEffectStageMonoV2"),
                 CFSTR("CIPortraitEffectStageWhite"),
                 0);
  if (objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isStreamingDisparitySupported"))objc_msgSend(v3, "addObject:", AVCaptureShallowDepthOfFieldCIFilterName);
  return v3;
}

- (BOOL)isUltraHighResolutionZeroShutterLagSupported
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isUltraHighResolutionZeroShutterLagSupported");
}

- (float)hardwareCost
{
  float result;

  objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "hardwareCost");
  return result;
}

- (int)baseSensorPowerConsumption
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "baseSensorPowerConsumption");
}

- (int)variableSensorPowerConsumption
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "variableSensorPowerConsumption");
}

- (int)ispPowerConsumption
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "ispPowerConsumption");
}

- (BOOL)isAutoVideoFrameRateSupported
{
  return -[AVCaptureDeviceFormat isVariableFrameRateVideoCaptureSupported](self, "isVariableFrameRateVideoCaptureSupported")|| -[AVCaptureDeviceFormat isLowLightVideoCaptureSupported](self, "isLowLightVideoCaptureSupported");
}

- (BOOL)isSmartStyleRenderingSupported
{
  return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isSmartStyleRenderingSupported");
}

- (float)spatialOverCapturePercentage
{
  float result;

  objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "spatialOverCapturePercentage");
  return result;
}

- (BOOL)maxPhotoDimensionsAreUltraHighResolution:(id)a3 privateDimensionsEnabled:(BOOL)a4
{
  _BOOL4 v4;
  NSArray *supportedMaxPhotoDimensions;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  supportedMaxPhotoDimensions = self->_internal->supportedMaxPhotoDimensions;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](supportedMaxPhotoDimensions, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(supportedMaxPhotoDimensions);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        if (objc_msgSend(v11, "isPrivate"))
          v12 = !v4;
        else
          v12 = 0;
        if (!v12
          && objc_msgSend(v11, "dimensionsAreEqualToDimensions:", a3)
          && objc_msgSend(v11, "flavor") == 2)
        {
          LOBYTE(v7) = 1;
          return v7;
        }
        ++v10;
      }
      while (v8 != v10);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](supportedMaxPhotoDimensions, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v8 = v7;
      if (v7)
        continue;
      break;
    }
  }
  return v7;
}

- (double)focalLengthIn35mmFilmWithGeometricDistortionCorrection:(BOOL)a3
{
  float v4;
  float v5;
  uint64_t v6;
  double v7;
  long double v8;

  if (a3)
    -[AVCaptureDeviceFormat geometricDistortionCorrectedVideoFieldOfView](self, "geometricDistortionCorrectedVideoFieldOfView");
  else
    -[AVCaptureDeviceFormat videoFieldOfView](self, "videoFieldOfView");
  v5 = v4;
  v6 = objc_msgSend(-[NSArray firstObject](-[AVCaptureDeviceFormat supportedMaxPhotoDimensions](self, "supportedMaxPhotoDimensions"), "firstObject"), "CMVideoDimensionsValue");
  if (HIDWORD(v6))
    v7 = (float)((float)(int)v6 / (float)SHIDWORD(v6));
  else
    v7 = 1.33333333;
  v8 = tan(v5 * 3.14159265 / 180.0 * 0.5);
  return 36.0 / (v8 + v8) / (sqrt(36.0 / v7 * (36.0 / v7) + 1296.0) / 43.266615);
}

@end

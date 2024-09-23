@implementation AVAssetExportSession

+ (NSArray)exportPresetsCompatibleWithAsset:(AVAsset *)asset
{
  if (-[AVAsset _figAsset](asset, "_figAsset"))
    return (NSArray *)FigAssetExportSessionExportGetPresetsCompatibleWithFigAsset();
  else
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

+ (void)determineCompatibilityOfExportPreset:(NSString *)presetName withAsset:(AVAsset *)asset outputFileType:(AVFileType)outputFileType completionHandler:(void *)handler
{
  uint64_t v6;
  uint64_t v7;
  void *v9;
  uint64_t v10;

  if (!handler)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, (uint64_t)CFSTR("handler cannot be nil"), (uint64_t)asset, (uint64_t)outputFileType, 0, v6, v7, v10), 0);
    objc_exception_throw(v9);
  }
  if (-[AVAsset _figAsset](asset, "_figAsset"))
  {
    objc_msgSend(handler, "copy");
    objc_opt_class();
    objc_opt_isKindOfClass();
    FigAssetExportSessionDetermineCompatibilityOfExportPreset();
  }
  else
  {
    (*((void (**)(void *, _QWORD))handler + 2))(handler, 0);
  }
}

+ (AVAssetExportSession)exportSessionWithAsset:(AVAsset *)asset presetName:(NSString *)presetName
{
  return (AVAssetExportSession *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithAsset:presetName:", asset, presetName);
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumDurationForPreset:(SEL)a3 properties:(id)a4
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)FigAssetExportSessionGetMaximumDuration();
}

- (void)estimateMaximumDurationWithCompletionHandler:(void *)handler
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  if (!handler)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("completionHandler is nil"), v3, v4, v5, v6, v7, v9), 0);
    objc_exception_throw(v8);
  }
  objc_msgSend(handler, "copy");
  FigAssetExportSessionEstimateMaximumDurationWithCompletionHandler();
}

+ (int64_t)estimatedOutputFileLengthForPreset:(id)a3 duration:(id *)a4 properties:(id)a5
{
  if (FigAssetExportSessionGetEstimatedOutputFileLength())
    return 0;
  else
    return 0;
}

- (void)estimateOutputFileLengthWithCompletionHandler:(void *)handler
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  if (!handler)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("handler cannot be nil"), v3, v4, v5, v6, v7, v9), 0);
    objc_exception_throw(v8);
  }
  objc_msgSend(handler, "copy");
  FigAssetExportSessionEstimateOutputFileLengthWithCompletionHandler();
}

- (AVAssetExportSession)init
{
  return -[AVAssetExportSession initWithAsset:presetName:](self, "initWithAsset:presetName:", 0, 0);
}

- (AVAssetExportSession)initWithAsset:(AVAsset *)asset presetName:(NSString *)presetName
{
  AVAssetExportSession *v6;
  AVAssetExportSessionInternal *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVAssetExportSession;
  v6 = -[AVAssetExportSession init](&v9, sel_init);
  if (v6)
  {
    if (asset
      && presetName
      && (-[NSString isEqualToString:](presetName, "isEqualToString:", CFSTR("AVAssetExportPresetPassthrough"))
       || FigExportSettingsForExportPreset())
      && (v7 = objc_alloc_init(AVAssetExportSessionInternal), (v6->_exportSession = v7) != 0)
      && (v7->videoComposition = 0, -[AVAsset _figAsset](asset, "_figAsset"))
      && (objc_opt_class(),
          objc_opt_isKindOfClass(),
          -[AVAsset _hasResourceLoaderDelegate](asset, "_hasResourceLoaderDelegate"),
          !FigAssetExportSessionCreateWithAsset()))
    {
      v6->_exportSession->asset = asset;
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  AVAssetExportSessionInternal *exportSession;
  OpaqueFigAssetExportSession *figExportSession;
  AVAssetExportSessionInternal *v5;
  void *figVideoCompositor;
  objc_super v7;

  exportSession = self->_exportSession;
  if (exportSession)
  {
    figExportSession = exportSession->figExportSession;
    if (figExportSession)
    {
      CFRelease(figExportSession);
      exportSession = self->_exportSession;
    }

    v5 = self->_exportSession;
    figVideoCompositor = v5->figVideoCompositor;
    if (figVideoCompositor)
    {
      CFRelease(figVideoCompositor);
      v5 = self->_exportSession;
    }

  }
  v7.receiver = self;
  v7.super_class = (Class)AVAssetExportSession;
  -[AVAssetExportSession dealloc](&v7, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, asset = %@, presetName = %@, outputFileType = %@"), NSStringFromClass(v4), self, self->_exportSession->asset, -[AVAssetExportSession presetName](self, "presetName"), -[AVAssetExportSession outputFileType](self, "outputFileType"));
}

- (AVAsset)asset
{
  return self->_exportSession->asset;
}

- (NSString)presetName
{
  FigAssetExportSessionCopyProperty();
  return (NSString *)0;
}

- (NSArray)supportedFileTypes
{
  FigAssetExportSessionCopyProperty();
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (void)determineCompatibleFileTypesWithCompletionHandler:(void *)handler
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  if (!handler)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("handler cannot be nil"), v3, v4, v5, v6, v7, v9), 0);
    objc_exception_throw(v8);
  }
  objc_msgSend(handler, "copy");
  FigAssetExportSessionDetermineCompatibleFileTypes();
}

- (AVFileType)outputFileType
{
  FigAssetExportSessionCopyProperty();
  return (AVFileType)0;
}

- (void)setOutputFileType:(AVFileType)outputFileType
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;

  if (-[AVAssetExportSession status](self, "status"))
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99768];
    v13 = CFSTR("Cannot alter output file type attribute on an AVAssetExportSession after an export has started.");
    goto LABEL_8;
  }
  if (!outputFileType)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v13 = CFSTR("Cannot set outputFileType to nil");
    goto LABEL_8;
  }
  if (FigAssetExportSessionSetProperty() == -16972)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v13 = CFSTR("Invalid output file type");
LABEL_8:
    v14 = (void *)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v13, v6, v7, v8, v9, v10, v15), 0);
    objc_exception_throw(v14);
  }
}

- (NSURL)outputURL
{
  FigAssetExportSessionCopyProperty();
  return (NSURL *)0;
}

- (void)setOutputURL:(NSURL *)outputURL
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;

  if (-[AVAssetExportSession status](self, "status"))
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99768];
    v13 = CFSTR("Cannot alter output URL attribute on an AVAssetExportSession after an export has started.");
    goto LABEL_6;
  }
  if (!outputURL)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v13 = CFSTR("Cannot set outputURL to nil");
LABEL_6:
    v14 = (void *)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v13, v6, v7, v8, v9, v10, v15), 0);
    objc_exception_throw(v14);
  }
  FigAssetExportSessionSetProperty();
}

- (AVAssetExportSessionStatus)status
{
  FigAssetExportSessionCopyProperty();
  return 0;
}

- (NSError)error
{
  FigAssetExportSessionCopyProperty();
  return 0;
}

- (float)progress
{
  FigAssetExportSessionCopyProperty();
  return 0.0;
}

- (void)AVExportSessionExportAsynchronouslyCompletionHandler
{
  AVAssetExportSessionInternal *exportSession;
  void (**handler)(_QWORD, _QWORD);

  exportSession = self->_exportSession;
  handler = (void (**)(_QWORD, _QWORD))exportSession->handler;
  if (handler)
  {
    exportSession->handler = 0;
    ((void (**)(_QWORD, SEL))handler)[2](handler, a2);

  }
}

- (void)exportAsynchronouslyWithCompletionHandler:(void *)handler
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  AVAssetExportSession *v11;
  AVCustomVideoCompositorSession *customVideoCompositorSession;
  _BOOL4 v13;
  uint64_t v14;
  AVAssetExportSession *v15;
  int v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  CFTypeRef cf;
  uint64_t v22;

  if (-[AVAssetExportSession status](self, "status") >= AVAssetExportSessionStatusWaiting)
  {
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99768];
    v19 = CFSTR("Cannot call exportAsynchronouslyWithCompletionHandler: more than once.");
    goto LABEL_18;
  }
  if (!-[AVAssetExportSession outputURL](self, "outputURL"))
  {
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99768];
    v19 = CFSTR("outputURL cannot be nil");
    goto LABEL_18;
  }
  cf = 0;
  v22 = 0;
  v11 = self;
  FigAssetExportSessionCopyProperty();
  customVideoCompositorSession = self->_exportSession->customVideoCompositorSession;
  if (customVideoCompositorSession)
  {
    v13 = -[AVCustomVideoCompositorSession commitCustomVideoCompositorPropertiesAndReturnError:](customVideoCompositorSession, "commitCustomVideoCompositorPropertiesAndReturnError:", &v22);
    v14 = v22;
    if (!v13)
      goto LABEL_9;
  }
  else
  {
    v14 = 0;
  }
  if (!v14)
  {
    if (handler)
    {
      v15 = self;
      self->_exportSession->handler = (id)objc_msgSend(handler, "copy");
    }
    v16 = FigAssetExportSessionExportAsynchronously();
    if (v16 == -16972)
    {
      v17 = (void *)MEMORY[0x1E0C99DA0];
      v18 = *MEMORY[0x1E0C99768];
      v19 = CFSTR("Invalid output file type");
    }
    else
    {
      if (v16 != -16974)
        goto LABEL_13;
      v17 = (void *)MEMORY[0x1E0C99DA0];
      v18 = *MEMORY[0x1E0C99768];
      v19 = CFSTR("outputFileType cannot be nil");
    }
LABEL_18:
    v20 = (void *)objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v19, v6, v7, v8, v9, v10, (uint64_t)cf), 0);
    objc_exception_throw(v20);
  }
LABEL_9:
  FigAssetExportSessionSetProperty();
  if (handler)
    (*((void (**)(void *))handler + 2))(handler);
LABEL_13:

}

- (void)cancelExport
{
  FigAssetExportSessionCancelExport();
}

- (CMTimeRange)timeRange
{
  uint64_t v4;
  __int128 v5;

  v4 = MEMORY[0x1E0CA2E50];
  v5 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
  *(_OWORD *)&retstr->start.value = *MEMORY[0x1E0CA2E50];
  *(_OWORD *)&retstr->start.epoch = v5;
  *(_OWORD *)&retstr->duration.timescale = *(_OWORD *)(v4 + 32);
  FigAssetExportSessionCopyProperty();
  return 0;
}

- (void)setTimeRange:(CMTimeRange *)timeRange
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFAllocator *v11;
  __int128 v12;
  CFDictionaryRef v13;
  void *v14;
  CMTimeRange v15;

  if (-[AVAssetExportSession status](self, "status"))
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot alter time range attribute on an AVAssetExportSession after an export has started."), v6, v7, v8, v9, v10, v15.start.value), 0);
    objc_exception_throw(v14);
  }
  v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v12 = *(_OWORD *)&timeRange->start.epoch;
  *(_OWORD *)&v15.start.value = *(_OWORD *)&timeRange->start.value;
  *(_OWORD *)&v15.start.epoch = v12;
  *(_OWORD *)&v15.duration.timescale = *(_OWORD *)&timeRange->duration.timescale;
  v13 = CMTimeRangeCopyAsDictionary(&v15, v11);
  FigAssetExportSessionSetProperty();
  if (v13)
    CFRelease(v13);
}

- (CMTime)maxDuration
{
  *retstr = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  FigAssetExportSessionCopyProperty();
  return 0;
}

- (void)setMinVideoFrameDuration:(id *)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFAllocator *v11;
  CFDictionaryRef v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  CMTime v17;
  CMTime time1;

  if (-[AVAssetExportSession status](self, "status"))
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99768];
    v15 = CFSTR("Cannot alter min frame duration attribute on an AVAssetExportSession after an export has started.");
    goto LABEL_10;
  }
  if ((a3->var2 & 0x1D) != 1)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = CFSTR("Cannot set non-numeric min video frame duration.");
    goto LABEL_10;
  }
  time1 = (CMTime)*a3;
  v17 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  if (CMTimeCompare(&time1, &v17) <= 0)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = CFSTR("Min video frame duration must be greater than zero.");
LABEL_10:
    v16 = (void *)objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v15, v6, v7, v8, v9, v10, v17.value), 0);
    objc_exception_throw(v16);
  }
  v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  time1 = (CMTime)*a3;
  v12 = CMTimeCopyAsDictionary(&time1, v11);
  FigAssetExportSessionSetProperty();
  if (v12)
    CFRelease(v12);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minVideoFrameDuration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  FigAssetExportSessionCopyProperty();
  return 0;
}

- (void)setVideoFrameRateConversionAlgorithm:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;

  if (-[AVAssetExportSession status](self, "status"))
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99768];
    v13 = CFSTR("Cannot alter max frame duration attribute on an AVAssetExportSession after an export has started.");
    goto LABEL_9;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("AVVideoFrameRateConversionAlgorithmFast")) & 1) == 0
    && (objc_msgSend(a3, "isEqualToString:", CFSTR("AVVideoFrameRateConversionAlgorithmPrecise")) & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v13 = CFSTR("Invalid frame rate conversion algorithm.");
LABEL_9:
    v14 = (void *)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v13, v6, v7, v8, v9, v10, v15), 0);
    objc_exception_throw(v14);
  }
  if (!objc_msgSend(a3, "isEqualToString:", CFSTR("AVVideoFrameRateConversionAlgorithmFast")))
    objc_msgSend(a3, "isEqualToString:", CFSTR("AVVideoFrameRateConversionAlgorithmPrecise"));
  FigAssetExportSessionSetProperty();
}

- (id)videoFrameRateConversionAlgorithm
{
  FigAssetExportSessionCopyProperty();
  return 0;
}

- (void)setPreserveSyncFrames:(BOOL)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  if (-[AVAssetExportSession status](self, "status"))
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot alter preserve sync frame attribute on an AVAssetExportSession after an export has started."), v5, v6, v7, v8, v9, v11), 0);
    objc_exception_throw(v10);
  }
  FigAssetExportSessionSetProperty();
}

- (BOOL)preserveSyncFrames
{
  uint64_t v3;

  v3 = *MEMORY[0x1E0C9AE40];
  FigAssetExportSessionCopyProperty();
  return *MEMORY[0x1E0C9AE50] == v3;
}

+ (id)keyPathsForValuesAffectingEstimatedOutputFileLength
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("timeRange"), 0);
}

- (uint64_t)estimatedOutputFileLength
{
  FigAssetExportSessionCopyProperty();
  return 0;
}

- (NSArray)metadata
{
  return self->_exportSession->metadata;
}

- (void)setMetadata:(NSArray *)metadata
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *v11;
  void *v12;
  uint64_t v13;
  id v14;

  if (-[AVAssetExportSession status](self, "status"))
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot alter metadata attribute on an AVAssetExportSession after an export has started."), v6, v7, v8, v9, v10, v13), 0);
    objc_exception_throw(v12);
  }
  if (metadata)
  {
    v14 = 0;
    metadata = +[AVMetadataItem _metadataArrayWithSmartDeferredLoadingForMetataArray:error:](AVMetadataItem, "_metadataArrayWithSmartDeferredLoadingForMetataArray:error:", metadata, &v14);
    if (!metadata && objc_msgSend(v14, "code") == -11999)
      objc_exception_throw((id)objc_msgSend((id)objc_msgSend(v14, "userInfo"), "objectForKey:", CFSTR("AVErrorExceptionKey")));
  }
  +[AVMetadataItem _figMetadataPropertyFromMetadataItems:](AVMetadataItem, "_figMetadataPropertyFromMetadataItems:", metadata);
  if (!FigAssetExportSessionSetProperty())
  {
    v11 = self->_exportSession->metadata;
    if (v11 != metadata)
    {

      self->_exportSession->metadata = (NSArray *)-[NSArray copy](metadata, "copy");
    }
  }
}

- (AVMetadataItemFilter)metadataItemFilter
{
  return self->_exportSession->metadataItemFilter;
}

- (void)setMetadataItemFilter:(AVMetadataItemFilter *)metadataItemFilter
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  AVMetadataItemFilter *v11;
  void *v12;
  uint64_t v13;

  if (-[AVAssetExportSession status](self, "status"))
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot alter metadataItemFilter attribute on an AVAssetExportSession after an export has started."), v6, v7, v8, v9, v10, v13), 0);
    objc_exception_throw(v12);
  }
  -[AVMetadataItemFilter whitelist](metadataItemFilter, "whitelist");
  if (!FigAssetExportSessionSetProperty())
  {
    v11 = self->_exportSession->metadataItemFilter;
    if (v11 != metadataItemFilter)
    {

      self->_exportSession->metadataItemFilter = metadataItemFilter;
    }
  }
}

- (uint64_t)fileLengthLimit
{
  FigAssetExportSessionCopyProperty();
  return 0;
}

- (void)setFileLengthLimit:(uint64_t)fileLengthLimit
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  if (-[AVAssetExportSession status](self, "status"))
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot alter output file length limit attribute on an AVAssetExportSession after an export has started."), v6, v7, v8, v9, v10, v12), 0);
    objc_exception_throw(v11);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", fileLengthLimit);
  FigAssetExportSessionSetProperty();
}

- (BOOL)maximizePowerEfficiency
{
  CFTypeRef v2;
  CFTypeRef cf;

  cf = (CFTypeRef)*MEMORY[0x1E0C9AE40];
  FigAssetExportSessionCopyProperty();
  v2 = (CFTypeRef)*MEMORY[0x1E0C9AE50];
  if (cf)
    CFRelease(cf);
  return v2 == cf;
}

- (void)setMaximizePowerEfficiency:(BOOL)a3
{
  FigAssetExportSessionSetProperty();
}

- (AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm
{
  AVAudioTimePitchAlgorithm *v2;

  FigAssetExportSessionCopyProperty();
  if (FigCFEqual())
  {
    v2 = (AVAudioTimePitchAlgorithm *)&AVAudioTimePitchAlgorithmSpectral;
    return *v2;
  }
  if (FigCFEqual())
  {
    v2 = (AVAudioTimePitchAlgorithm *)&AVAudioTimePitchAlgorithmTimeDomain;
    return *v2;
  }
  if (FigCFEqual())
  {
    v2 = (AVAudioTimePitchAlgorithm *)&AVAudioTimePitchAlgorithmVarispeed;
    return *v2;
  }
  if (FigCFEqual())
    return (AVAudioTimePitchAlgorithm)CFSTR("LowQualityZeroLatency");
  else
    return 0;
}

- (void)setAudioTimePitchAlgorithm:(AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *valid;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if (-[AVAssetExportSession status](self, "status"))
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99768];
    v14 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot alter audio time pitch algorithm attribute on an AVAssetExportSession after an export has started."), v6, v7, v8, v9, v10, v25);
    v15 = v12;
    v16 = v13;
    goto LABEL_6;
  }
  valid = (void *)AVGetValidAudioTimePitchAlgorithms();
  if ((objc_msgSend(valid, "containsObject:", audioTimePitchAlgorithm) & 1) == 0)
  {
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99778];
    v19 = objc_msgSend((id)objc_msgSend(valid, "allObjects"), "componentsJoinedByString:", CFSTR(", "));
    v14 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("audioTimePitchAlgorithm must be one of: %@"), v20, v21, v22, v23, v24, v19);
    v15 = v17;
    v16 = v18;
LABEL_6:
    objc_exception_throw((id)objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v16, v14, 0));
  }
  AVAssetExportSessionGetFigRemakerAudioTimePitchAlgorithmForAudioTimePitchAlgorithm(audioTimePitchAlgorithm);
  FigAssetExportSessionSetProperty();
}

- (AVAudioMix)audioMix
{
  return self->_exportSession->audioMix;
}

- (void)setAudioMix:(AVAudioMix *)audioMix
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSArray *v11;
  CFIndex v12;
  const __CFAllocator *v13;
  const CFDictionaryValueCallBacks *v14;
  void *valid;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  _QWORD *v23;
  _QWORD *v24;
  int v25;
  void *v26;
  uint64_t v27;
  const __CFString *v28;
  objc_class *v29;
  const char *v30;
  void *v31;
  uint64_t v32;
  SEL v33;
  AVAudioMix *v34;
  AVAssetExportSession *v35;
  __CFDictionary *theDict;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (-[AVAssetExportSession status](self, "status"))
  {
    v26 = (void *)MEMORY[0x1E0C99DA0];
    v27 = *MEMORY[0x1E0C99768];
    v28 = CFSTR("Cannot alter audio mix attribute on an AVAssetExportSession after an export has started.");
    v29 = (objc_class *)self;
    v30 = a2;
LABEL_18:
    v31 = (void *)objc_msgSend(v26, "exceptionWithName:reason:userInfo:", v27, AVMethodExceptionReasonWithObjectAndSelector(v29, v30, (uint64_t)v28, v6, v7, v8, v9, v10, v32), 0);
    objc_exception_throw(v31);
  }
  if (self->_exportSession->audioMix != audioMix)
  {
    v11 = -[AVAudioMix inputParameters](audioMix, "inputParameters");
    v12 = -[NSArray count](v11, "count");
    v13 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v14 = (const CFDictionaryValueCallBacks *)FigAssetExportSessionProperty_GetAudioMix_CFDictionaryValueCallBacks();
    theDict = CFDictionaryCreateMutable(v13, v12, 0, v14);
    if (theDict)
    {
      v33 = a2;
      v34 = audioMix;
      v35 = self;
      valid = (void *)AVGetValidAudioTimePitchAlgorithms();
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v16 = v11;
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (!v17)
        goto LABEL_15;
      v18 = v17;
      v19 = *(_QWORD *)v38;
      while (1)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v38 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          v22 = (void *)objc_msgSend(v21, "audioTimePitchAlgorithm");
          if (v22 && (objc_msgSend(valid, "containsObject:", v22) & 1) == 0)
          {
            v26 = (void *)MEMORY[0x1E0C99DA0];
            v27 = *MEMORY[0x1E0C99778];
            v32 = objc_msgSend((id)objc_msgSend(valid, "allObjects"), "componentsJoinedByString:", CFSTR(", "));
            v28 = CFSTR("audioTimePitchAlgorithm must be one of: %@");
            v29 = (objc_class *)v35;
            v30 = v33;
            goto LABEL_18;
          }
          v23 = CFAllocatorAllocate(v13, 32, 0);
          if (v23)
          {
            v24 = v23;
            v25 = objc_msgSend(v21, "trackID");
            *(_DWORD *)v24 = 0;
            v24[2] = objc_msgSend(v21, "audioTapProcessor");
            v24[1] = AVAssetExportSessionGetFigRemakerAudioTimePitchAlgorithmForAudioTimePitchAlgorithm(v22);
            v24[3] = objc_msgSend(v21, "_audioVolumeCurve");
            CFDictionaryAddValue(theDict, (const void *)v25, v24);
          }
        }
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        if (!v18)
        {
LABEL_15:
          FigAssetExportSessionSetProperty();
          CFRelease(theDict);

          v35->_exportSession->audioMix = (AVAudioMix *)-[AVAudioMix copy](v34, "copy");
          return;
        }
      }
    }
  }
}

- (AVAssetTrackGroupOutputHandling)audioTrackGroupHandling
{
  if (FigAssetExportSessionCopyProperty())
    return 0;
  else
    return objc_msgSend(0, "unsignedIntegerValue");
}

- (void)setAudioTrackGroupHandling:(AVAssetTrackGroupOutputHandling)audioTrackGroupHandling
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  if (-[AVAssetExportSession status](self, "status"))
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot alter output audioTrackGroupHandling attribute on an AVAssetExportSession after an export has started."), v6, v7, v8, v9, v10, v12), 0);
    objc_exception_throw(v11);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", audioTrackGroupHandling);
  FigAssetExportSessionSetProperty();
  self->_exportSession->audioTrackGroupHandling = audioTrackGroupHandling;
}

- (AVVideoComposition)videoComposition
{
  return self->_exportSession->videoComposition;
}

- (void)setVideoComposition:(AVVideoComposition *)videoComposition
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  AVCustomVideoCompositorSession *v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  CFTypeRef cf[2];
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  int v41;
  uint64_t (*v42)(void *, _OWORD *);
  uint64_t (*v43)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v44)(uint64_t);
  uint64_t v45;
  void *v46;
  void *v47;
  AVCustomVideoCompositorSession *v48;
  CFTypeRef v49;

  if (-[AVAssetExportSession status](self, "status"))
  {
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99768];
    v23 = CFSTR("Cannot alter video composition attribute on an AVAssetExportSession after an export has started.");
    goto LABEL_19;
  }
  if (self->_exportSession->videoComposition == videoComposition)
    return;
  if (videoComposition)
  {
    *(_QWORD *)&v28 = 0;
    if (!-[AVVideoComposition _isValidReturningExceptionReason:](videoComposition, "_isValidReturningExceptionReason:", &v28))
    {
      v21 = (void *)MEMORY[0x1E0C99DA0];
      v22 = *MEMORY[0x1E0C99778];
      v24 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("%@"), v11, v12, v13, v14, v15, v28);
      goto LABEL_20;
    }
    if (-[AVVideoComposition instructions](videoComposition, "instructions"))
    {
      -[AVVideoComposition renderScale](videoComposition, "renderScale");
      if (v16 == 1.0)
        goto LABEL_7;
      v21 = (void *)MEMORY[0x1E0C99DA0];
      v22 = *MEMORY[0x1E0C99778];
      v23 = CFSTR("renderScale must be 1.0 when used with AVAssetExportSession.");
    }
    else
    {
      v21 = (void *)MEMORY[0x1E0C99DA0];
      v22 = *MEMORY[0x1E0C99778];
      v23 = CFSTR("video composition must have composition instructions");
    }
LABEL_19:
    v24 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v23, v6, v7, v8, v9, v10, v25);
LABEL_20:
    objc_exception_throw((id)objc_msgSend(v21, "exceptionWithName:reason:userInfo:", v22, v24, 0));
  }
LABEL_7:
  v17 = (id)-[AVVideoComposition copy](videoComposition, "copy");
  v48 = 0;
  v49 = 0;
  objc_msgSend(v17, "_copyFigVideoCompositor:andSession:recyclingSession:forFigRemaker:error:", &v49, &v48, self->_exportSession->customVideoCompositorSession, 1, 0);
  v31 = 0u;
  v32 = 0u;
  if (v17)
  {
    objc_msgSend(v17, "frameDuration");
  }
  else
  {
    *(_OWORD *)cf = 0uLL;
    v27 = 0;
  }
  v28 = *(_OWORD *)cf;
  v29 = v27;
  v30 = objc_msgSend(v17, "_serializableInstructions");
  LOBYTE(v31) = objc_msgSend(v17, "_hasLayerAsAuxiliaryTrack");
  *((_QWORD *)&v31 + 1) = objc_msgSend(v17, "_auxiliaryTrackLayer");
  *(_QWORD *)&v32 = v49;
  BYTE8(v32) = objc_msgSend(v17, "_hasPostProcessingLayers");
  v33 = objc_msgSend(v17, "_postProcessingRootLayer");
  v34 = objc_msgSend(v17, "_postProcessingVideoLayers");
  objc_msgSend(v17, "renderSize");
  v35 = v18;
  v36 = v19;
  v37 = objc_msgSend(v17, "colorPrimaries");
  v38 = objc_msgSend(v17, "colorYCbCrMatrix");
  v39 = objc_msgSend(v17, "colorTransferFunction");
  v40 = objc_msgSend(v17, "_auxiliaryTrackID");
  v41 = objc_msgSend(v17, "sourceTrackIDForFrameTiming");
  v42 = avAssetExportSession_IsVideoCompositionValidForAssetWithTimeRange;
  v43 = avAssetExportSession_VideoCompositionOutputColorPropertiesWithCustomCompositor;
  v44 = avAssetExportSession_CustomVideoCompositorSessionGetAndClearClientError;
  v45 = objc_msgSend(v17, "sourceSampleDataTrackIDs");
  v46 = AVVideoCompositionSerializeSourceTrackWindows((void *)objc_msgSend(v17, "sourceVideoTrackWindowsForTrackIDs"));
  v47 = AVVideoCompositionSerializeSourceTrackWindows((void *)objc_msgSend(v17, "sourceSampleDataTrackWindowsForTrackIDs"));
  FigAssetExportSessionVideoCompositionCreate();
  if (v49)
    CFRelease(v49);
  if (!FigAssetExportSessionSetProperty())
  {

    self->_exportSession->videoComposition = (AVVideoComposition *)v17;
    v20 = self->_exportSession->customVideoCompositorSession;
    self->_exportSession->customVideoCompositorSession = v48;
  }
}

- (id)customVideoCompositor
{
  return -[AVCustomVideoCompositorSession customVideoCompositor](self->_exportSession->customVideoCompositorSession, "customVideoCompositor");
}

- (BOOL)shouldOptimizeForNetworkUse
{
  uint64_t v3;

  v3 = *MEMORY[0x1E0C9AE40];
  FigAssetExportSessionCopyProperty();
  return *MEMORY[0x1E0C9AE50] == v3;
}

- (void)setShouldOptimizeForNetworkUse:(BOOL)shouldOptimizeForNetworkUse
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  if (-[AVAssetExportSession status](self, "status"))
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot alter optimize for network use attribute on an AVAssetExportSession after an export has started."), v5, v6, v7, v8, v9, v11), 0);
    objc_exception_throw(v10);
  }
  FigAssetExportSessionSetProperty();
}

- (BOOL)allowsParallelizedExport
{
  uint64_t v3;

  v3 = *MEMORY[0x1E0C9AE40];
  FigAssetExportSessionCopyProperty();
  return *MEMORY[0x1E0C9AE50] == v3;
}

- (void)setAllowsParallelizedExport:(BOOL)allowsParallelizedExport
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  if (-[AVAssetExportSession status](self, "status"))
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot alter export parallelization attribute on an AVAssetExportSession after an export has started."), v5, v6, v7, v8, v9, v11), 0);
    objc_exception_throw(v10);
  }
  FigAssetExportSessionSetProperty();
}

- (BOOL)allowsAppleOnlySWAV1Decode
{
  uint64_t v3;

  v3 = *MEMORY[0x1E0C9AE40];
  FigAssetExportSessionCopyProperty();
  return *MEMORY[0x1E0C9AE50] == v3;
}

- (void)setAllowsAppleOnlySWAV1Decode:(BOOL)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  if (-[AVAssetExportSession status](self, "status"))
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot alter decodeSWAV1 attribute on an AVAssetExportSession after an export has started."), v5, v6, v7, v8, v9, v11), 0);
    objc_exception_throw(v10);
  }
  FigAssetExportSessionSetProperty();
}

- (BOOL)canPerformMultiplePassesOverSourceMediaData
{
  uint64_t v3;

  v3 = *MEMORY[0x1E0C9AE40];
  FigAssetExportSessionCopyProperty();
  return *MEMORY[0x1E0C9AE50] == v3;
}

- (void)setCanPerformMultiplePassesOverSourceMediaData:(BOOL)canPerformMultiplePassesOverSourceMediaData
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  if (-[AVAssetExportSession status](self, "status"))
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot alter canPerformMultiplePassesOverSourceMediaData attribute on an AVAssetExportSession after an export has started."), v5, v6, v7, v8, v9, v11), 0);
    objc_exception_throw(v10);
  }
  FigAssetExportSessionSetProperty();
}

- (NSURL)directoryForTemporaryFiles
{
  FigAssetExportSessionCopyProperty();
  return (NSURL *)0;
}

- (void)setDirectoryForTemporaryFiles:(NSURL *)directoryForTemporaryFiles
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  if (-[AVAssetExportSession status](self, "status"))
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot alter directoryForTemporaryFiles attribute on an AVAssetExportSession after an export has started."), v5, v6, v7, v8, v9, v11), 0);
    objc_exception_throw(v10);
  }
  FigAssetExportSessionSetProperty();
}

- (BOOL)isDefunct
{
  OpaqueFigAssetExportSession *figExportSession;
  _QWORD *v3;
  unsigned int (*v4)(OpaqueFigAssetExportSession *, unsigned __int8 *);
  BOOL v5;
  int v6;
  unsigned __int8 v8;

  v8 = 0;
  figExportSession = self->_exportSession->figExportSession;
  v3 = *(_QWORD **)(CMBaseObjectGetVTable() + 8);
  if (*v3 < 5uLL)
  {
    LODWORD(v4) = 0;
  }
  else
  {
    v4 = (unsigned int (*)(OpaqueFigAssetExportSession *, unsigned __int8 *))v3[11];
    if (v4)
    {
      v5 = v4(figExportSession, &v8) == 0;
      LODWORD(v4) = v8;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  if (v5)
    v6 = (int)v4;
  else
    v6 = 1;
  if (!(_DWORD)v4)
    LODWORD(v4) = v6;
  return (_DWORD)v4 == 1;
}

@end

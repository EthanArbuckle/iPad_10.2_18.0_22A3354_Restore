@implementation AVAssetWriterInput

+ (void)initialize
{
  objc_opt_class();
}

+ (AVAssetWriterInput)assetWriterInputWithMediaType:(AVMediaType)mediaType outputSettings:(NSDictionary *)outputSettings
{
  return (AVAssetWriterInput *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithMediaType:outputSettings:", mediaType, outputSettings);
}

+ (AVAssetWriterInput)assetWriterInputWithMediaType:(AVMediaType)mediaType outputSettings:(NSDictionary *)outputSettings sourceFormatHint:(CMFormatDescriptionRef)sourceFormatHint
{
  return (AVAssetWriterInput *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithMediaType:outputSettings:sourceFormatHint:", mediaType, outputSettings, sourceFormatHint);
}

- (AVAssetWriterInput)init
{
  return -[AVAssetWriterInput initWithMediaType:outputSettings:](self, "initWithMediaType:outputSettings:", 0, 0);
}

- (AVAssetWriterInput)initWithMediaType:(AVMediaType)mediaType outputSettings:(NSDictionary *)outputSettings
{
  return -[AVAssetWriterInput initWithMediaType:outputSettings:sourceFormatHint:](self, "initWithMediaType:outputSettings:sourceFormatHint:", mediaType, outputSettings, 0);
}

- (AVAssetWriterInput)initWithMediaType:(AVMediaType)mediaType outputSettings:(NSDictionary *)outputSettings sourceFormatHint:(CMFormatDescriptionRef)sourceFormatHint
{
  AVAssetWriterInput *v9;
  AVAssetWriterInput *v10;
  AVAssetWriterInputInternal *v11;
  CMMediaType v12;
  CMVideoDimensions Dimensions;
  id v14;
  void *v15;
  char v16;
  id v17;
  AVAssetWriterInput *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  objc_class *v28;
  const char *v29;
  NSObject *v30;
  void *v31;
  objc_class *v32;
  const char *v33;
  AVAssetWriterInputInternal *internal;
  AVAssetWriterInputHelper *helper;
  AVAssetWriterInput *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  AVAssetWriterInput *v41;
  void *v42;
  uint64_t v43;
  objc_class *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  AVAssetWriterInput *v50;
  AVAssetWriterInput *v51;
  AVAssetWriterInput *v52;
  AVAssetWriterInput *v53;
  AVAssetWriterInput *v54;
  AVAssetWriterInput *v55;
  const char *v56;
  const __CFString *v57;
  const __CFString *v58;
  objc_super v59;

  v59.receiver = self;
  v59.super_class = (Class)AVAssetWriterInput;
  v9 = -[AVAssetWriterInput init](&v59, sel_init);
  v10 = v9;
  if (!mediaType)
  {
    v37 = v9;
    v24 = (void *)MEMORY[0x1E0C99DA0];
    v25 = *MEMORY[0x1E0C99778];
    v56 = "mediaType != nil";
    v26 = CFSTR("invalid parameter not satisfying: %s");
    goto LABEL_25;
  }
  if (v9)
  {
    v11 = objc_alloc_init(AVAssetWriterInputInternal);
    v10->_internal = v11;
    if (!v11)
      goto LABEL_22;
    CFRetain(v11);
    if (sourceFormatHint)
    {
      v12 = CMFormatDescriptionGetMediaType(sourceFormatHint);
      if ((objc_msgSend((id)AVMediaTypeFromCMMediaType(), "isEqualToString:", mediaType) & 1) == 0)
      {
        v41 = v10;
        v42 = (void *)MEMORY[0x1E0C99DA0];
        v43 = *MEMORY[0x1E0C99778];
        v44 = (objc_class *)objc_opt_class();
        v38 = AVMethodExceptionReasonWithClassAndSelector(v44, a2, (uint64_t)CFSTR("The media type of sourceFormatHint must match mediaType"), v45, v46, v47, v48, v49, (uint64_t)v56);
        v39 = v42;
        v40 = v43;
LABEL_26:
        objc_exception_throw((id)objc_msgSend(v39, "exceptionWithName:reason:userInfo:", v40, v38, 0));
      }
      if (v12 == 1986618469)
      {
        Dimensions = CMVideoFormatDescriptionGetDimensions(sourceFormatHint);
        if (Dimensions.width < 1 || Dimensions.height <= 0)
        {
          v55 = v10;
          v24 = (void *)MEMORY[0x1E0C99DA0];
          v25 = *MEMORY[0x1E0C99778];
          v26 = CFSTR("Width and height of video format hint must be positive");
          goto LABEL_25;
        }
      }
    }
    if (outputSettings)
    {
      v58 = 0;
      v14 = +[AVOutputSettings _outputSettingsWithOutputSettingsDictionary:mediaType:exceptionReason:](AVOutputSettings, "_outputSettingsWithOutputSettingsDictionary:mediaType:exceptionReason:", outputSettings, mediaType, &v58);
      if (!v14)
      {
        v50 = v10;
        v24 = (void *)MEMORY[0x1E0C99DA0];
        v25 = *MEMORY[0x1E0C99778];
        v26 = v58;
        goto LABEL_25;
      }
      v15 = v14;
      if ((objc_msgSend((id)objc_msgSend(v14, "compatibleMediaTypes"), "containsObject:", mediaType) & 1) == 0)
      {
        v51 = v10;
        v24 = (void *)MEMORY[0x1E0C99DA0];
        v25 = *MEMORY[0x1E0C99778];
        v26 = CFSTR("Output settings must match supplied media type");
        goto LABEL_25;
      }
      v57 = 0;
      v16 = objc_msgSend(v15, "canFullySpecifyOutputFormatReturningReason:", &v57);
      if (!sourceFormatHint && (v16 & 1) == 0)
      {
        v52 = v10;
        v24 = (void *)MEMORY[0x1E0C99DA0];
        v25 = *MEMORY[0x1E0C99778];
        v26 = v57;
        goto LABEL_25;
      }
      v17 = -[NSDictionary objectForKey:](outputSettings, "objectForKey:", CFSTR("AVVideoScalingModeKey"));
      if (v17 && objc_msgSend(v17, "isEqualToString:", CFSTR("AVVideoScalingModeFit")))
      {
        v54 = v10;
        v24 = (void *)MEMORY[0x1E0C99DA0];
        v25 = *MEMORY[0x1E0C99778];
        v26 = CFSTR("AVAssetWriterInput does not currently support AVVideoScalingModeFit");
        goto LABEL_25;
      }
      if (-[NSDictionary objectForKey:](outputSettings, "objectForKey:", *MEMORY[0x1E0C89968]))
      {
        v53 = v10;
        v24 = (void *)MEMORY[0x1E0C99DA0];
        v25 = *MEMORY[0x1E0C99778];
        v26 = CFSTR("AVAssetWriterInput does not support AVSampleRateConverterAudioQualityKey");
        goto LABEL_25;
      }
      if (-[NSDictionary objectForKey:](outputSettings, "objectForKey:", CFSTR("AVVideoDecompressionPropertiesKey")))
      {
        v18 = v10;
        v24 = (void *)MEMORY[0x1E0C99DA0];
        v25 = *MEMORY[0x1E0C99778];
        v26 = CFSTR("AVAssetWriterInput does not support AVVideoDecompressionPropertiesKey");
LABEL_25:
        v38 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v10, a2, (uint64_t)v26, v19, v20, v21, v22, v23, (uint64_t)v56);
        v39 = v24;
        v40 = v25;
        goto LABEL_26;
      }
    }
    else
    {
      v15 = 0;
    }
    v10->_internal->weakReference = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v10);
    v10->_internal->keyPathDependencyManager = -[AVKeyPathDependencyManager initWithDependencyHost:]([AVKeyPathDependencyManager alloc], "initWithDependencyHost:", v10);
    v27 = (void *)MEMORY[0x1E0CB3940];
    v28 = (objc_class *)objc_opt_class();
    v29 = (const char *)objc_msgSend((id)objc_msgSend(v27, "stringWithFormat:", CFSTR("<%@: %p> helper queue"), NSStringFromClass(v28), v10), "UTF8String");
    v30 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10->_internal->helperQueue = (OS_dispatch_queue *)dispatch_queue_create(v29, v30);
    v10->_internal->numberOfAppendFailures = 0;
    v10->_internal->markAsFinishedCalled = 0;
    v31 = (void *)MEMORY[0x1E0CB3940];
    v32 = (objc_class *)objc_opt_class();
    v33 = (const char *)objc_msgSend((id)objc_msgSend(v31, "stringWithFormat:", CFSTR("<%@: %p> \"number of append failures\" read/write queue"), NSStringFromClass(v32), v10), "UTF8String");
    v10->_internal->appendFailureReadWriteQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create(v33);
    v10->_internal->helper = (AVAssetWriterInputHelper *)-[AVAssetWriterInputUnknownHelper initWithMediaType:outputSettings:sourceFormatHint:]([AVAssetWriterInputUnknownHelper alloc], "initWithMediaType:outputSettings:sourceFormatHint:", mediaType, v15, sourceFormatHint);
    internal = v10->_internal;
    helper = internal->helper;
    if (helper)
    {
      -[AVAssetWriterInputHelper setWeakReferenceToAssetWriterInput:](helper, "setWeakReferenceToAssetWriterInput:", internal->weakReference);
      -[AVKeyPathDependencyManager dependencyHostIsFullyInitialized](v10->_internal->keyPathDependencyManager, "dependencyHostIsFullyInitialized");
    }
    else
    {
LABEL_22:

      return 0;
    }
  }
  return v10;
}

- (void)dealloc
{
  AVAssetWriterInputInternal *internal;
  AVAssetWriterInputInternal *v4;
  AVAssetWriterInputInternal *v5;
  NSObject *helperQueue;
  NSObject *appendFailureReadWriteQueue;
  objc_super v8;

  internal = self->_internal;
  if (internal)
  {
    -[AVKeyPathDependencyManager cancelAllCallbacks](internal->keyPathDependencyManager, "cancelAllCallbacks");

    v4 = self->_internal;
    if (v4->passDescriptionResponder)
    {
      -[AVAssetWriterInput removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("currentPassDescription"), CFSTR("AVAssetWriterInputCurrentPassDescriptionChangeContext"));
      v4 = self->_internal;
    }

    v5 = self->_internal;
    helperQueue = v5->helperQueue;
    if (helperQueue)
      dispatch_release(helperQueue);
    appendFailureReadWriteQueue = v5->appendFailureReadWriteQueue;
    if (appendFailureReadWriteQueue)
      dispatch_release(appendFailureReadWriteQueue);
    CFRelease(self->_internal);
    internal = self->_internal;
  }

  v8.receiver = self;
  v8.super_class = (Class)AVAssetWriterInput;
  -[AVAssetWriterInput dealloc](&v8, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, mediaType = %@, outputSettings = %@>"), NSStringFromClass(v4), self, -[AVAssetWriterInput mediaType](self, "mediaType"), -[AVAssetWriterInput outputSettings](self, "outputSettings"));
}

- (AVAssetWriterInputHelper)_helper
{
  NSObject *helperQueue;
  AVAssetWriterInputHelper *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  helperQueue = self->_internal->helperQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__AVAssetWriterInput__helper__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(helperQueue, v5);
  v3 = (AVAssetWriterInputHelper *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __29__AVAssetWriterInput__helper__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (AVWeakReference)_weakReferenceToAssetWriter
{
  return self->_internal->weakReferenceToAssetWriter;
}

- (void)_setWeakReferenceToAssetWriter:(id)a3
{
  id v5;

  v5 = a3;

  self->_internal->weakReferenceToAssetWriter = (AVWeakReference *)a3;
}

- (void)_tellAssetWriterToTransitionToFailedStatusWithError:(id)a3
{
  objc_msgSend(-[AVWeakReference referencedObject](-[AVAssetWriterInput _weakReferenceToAssetWriter](self, "_weakReferenceToAssetWriter"), "referencedObject"), "_transitionToFailedStatusWithError:", a3);
}

- (int64_t)_status
{
  return -[AVAssetWriterInputHelper status](-[AVAssetWriterInput _helper](self, "_helper"), "status");
}

- (void)_setHelper:(id)a3
{
  NSObject *helperQueue;
  _QWORD v4[6];

  helperQueue = self->_internal->helperQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__AVAssetWriterInput__setHelper___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = a3;
  v4[5] = self;
  dispatch_sync(helperQueue, v4);
}

void *__33__AVAssetWriterInput__setHelper___block_invoke(uint64_t a1)
{
  void *v2;
  void *result;

  v2 = *(void **)(a1 + 32);
  result = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 16);
  if (v2 != result)
  {
    objc_msgSend(result, "setWeakReferenceToAssetWriterInput:", 0);

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 16) = *(id *)(a1 + 32);
    return (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 16), "setWeakReferenceToAssetWriterInput:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 8));
  }
  return result;
}

- (AVMediaType)mediaType
{
  return -[AVAssetWriterInputHelper mediaType](-[AVAssetWriterInput _helper](self, "_helper"), "mediaType");
}

- (AVOutputSettings)_outputSettingsObject
{
  return -[AVAssetWriterInputHelper outputSettings](-[AVAssetWriterInput _helper](self, "_helper"), "outputSettings");
}

- (NSDictionary)outputSettings
{
  return -[AVOutputSettings outputSettingsDictionary](-[AVAssetWriterInput _outputSettingsObject](self, "_outputSettingsObject"), "outputSettingsDictionary");
}

- (CMFormatDescriptionRef)sourceFormatHint
{
  return -[AVAssetWriterInputHelper sourceFormatHint](-[AVAssetWriterInput _helper](self, "_helper"), "sourceFormatHint");
}

- (int)outputTrackID
{
  return -[AVAssetWriterInputHelper trackID](-[AVAssetWriterInput _helper](self, "_helper"), "trackID");
}

- (NSArray)metadata
{
  return -[AVAssetWriterInputHelper metadata](-[AVAssetWriterInput _helper](self, "_helper"), "metadata");
}

- (void)setMetadata:(NSArray *)metadata
{
  -[AVAssetWriterInputHelper setMetadata:](-[AVAssetWriterInput _helper](self, "_helper"), "setMetadata:", metadata);
}

- (CGAffineTransform)transform
{
  CGAffineTransform *result;

  result = -[AVAssetWriterInput _helper](self, "_helper");
  if (result)
    return (CGAffineTransform *)-[CGAffineTransform transform](result, "transform");
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (void)setTransform:(CGAffineTransform *)transform
{
  AVAssetWriterInputHelper *v4;
  __int128 v5;
  _OWORD v6[3];

  v4 = -[AVAssetWriterInput _helper](self, "_helper");
  v5 = *(_OWORD *)&transform->c;
  v6[0] = *(_OWORD *)&transform->a;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&transform->tx;
  -[AVAssetWriterInputHelper setTransform:](v4, "setTransform:", v6);
}

- (CMTimeScale)mediaTimeScale
{
  return -[AVAssetWriterInputHelper mediaTimeScale](-[AVAssetWriterInput _helper](self, "_helper"), "mediaTimeScale");
}

- (void)setMediaTimeScale:(CMTimeScale)mediaTimeScale
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (mediaTimeScale < 0)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"mediaTimeScale >= 0"), 0);
    objc_exception_throw(v8);
  }
  -[AVAssetWriterInputHelper setMediaTimeScale:](-[AVAssetWriterInput _helper](self, "_helper"), "setMediaTimeScale:", *(_QWORD *)&mediaTimeScale);
}

- (CGSize)naturalSize
{
  double v2;
  double v3;
  CGSize result;

  -[AVAssetWriterInputHelper naturalSize](-[AVAssetWriterInput _helper](self, "_helper"), "naturalSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setNaturalSize:(CGSize)naturalSize
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (naturalSize.width < 0.0 || naturalSize.height < 0.0)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"naturalSize.width >= 0.0 && naturalSize.height >= 0.0"), 0);
    objc_exception_throw(v8);
  }
  -[AVAssetWriterInputHelper setNaturalSize:](-[AVAssetWriterInput _helper](self, "_helper"), "setNaturalSize:", naturalSize.width, naturalSize.height);
}

- (NSString)languageCode
{
  return -[AVAssetWriterInputHelper languageCode](-[AVAssetWriterInput _helper](self, "_helper"), "languageCode");
}

- (void)setLanguageCode:(NSString *)languageCode
{
  -[AVAssetWriterInputHelper setLanguageCode:](-[AVAssetWriterInput _helper](self, "_helper"), "setLanguageCode:", languageCode);
}

- (NSString)extendedLanguageTag
{
  return -[AVAssetWriterInputHelper extendedLanguageTag](-[AVAssetWriterInput _helper](self, "_helper"), "extendedLanguageTag");
}

- (void)setExtendedLanguageTag:(NSString *)extendedLanguageTag
{
  -[AVAssetWriterInputHelper setExtendedLanguageTag:](-[AVAssetWriterInput _helper](self, "_helper"), "setExtendedLanguageTag:", extendedLanguageTag);
}

- (BOOL)marksOutputTrackAsEnabled
{
  return -[AVAssetWriterInputHelper marksOutputTrackAsEnabled](-[AVAssetWriterInput _helper](self, "_helper"), "marksOutputTrackAsEnabled");
}

- (void)setMarksOutputTrackAsEnabled:(BOOL)marksOutputTrackAsEnabled
{
  _BOOL8 v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v3 = marksOutputTrackAsEnabled;
  if (-[AVAssetWriterInputHelper alternateGroupID](-[AVAssetWriterInput _helper](self, "_helper"), "alternateGroupID"))
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot set marksOutputTrackAsEnabled of the receiver in an input group"), v6, v7, v8, v9, v10, v12), 0);
    objc_exception_throw(v11);
  }
  -[AVAssetWriterInputHelper setMarksOutputTrackAsEnabled:](-[AVAssetWriterInput _helper](self, "_helper"), "setMarksOutputTrackAsEnabled:", v3);
}

- (float)preferredVolume
{
  float result;

  -[AVAssetWriterInputHelper preferredVolume](-[AVAssetWriterInput _helper](self, "_helper"), "preferredVolume");
  return result;
}

- (void)setPreferredVolume:(float)preferredVolume
{
  AVAssetWriterInputHelper *v4;
  double v5;

  v4 = -[AVAssetWriterInput _helper](self, "_helper");
  *(float *)&v5 = preferredVolume;
  -[AVAssetWriterInputHelper setPreferredVolume:](v4, "setPreferredVolume:", v5);
}

- (int64_t)layer
{
  return -[AVAssetWriterInputHelper layer](-[AVAssetWriterInput _helper](self, "_helper"), "layer");
}

- (void)setLayer:(int64_t)a3
{
  -[AVAssetWriterInputHelper setLayer:](-[AVAssetWriterInput _helper](self, "_helper"), "setLayer:", a3);
}

- (signed)_alternateGroupID
{
  return -[AVAssetWriterInputHelper alternateGroupID](-[AVAssetWriterInput _helper](self, "_helper"), "alternateGroupID");
}

- (void)_setAlternateGroupID:(signed __int16)a3
{
  -[AVAssetWriterInputHelper setAlternateGroupID:](-[AVAssetWriterInput _helper](self, "_helper"), "setAlternateGroupID:", a3);
}

- (signed)_provisionalAlternateGroupID
{
  return -[AVAssetWriterInputHelper provisionalAlternateGroupID](-[AVAssetWriterInput _helper](self, "_helper"), "provisionalAlternateGroupID");
}

- (void)_setProvisionalAlternateGroupID:(signed __int16)a3
{
  -[AVAssetWriterInputHelper setProvisionalAlternateGroupID:](-[AVAssetWriterInput _helper](self, "_helper"), "setProvisionalAlternateGroupID:", a3);
}

- (NSDictionary)_trackReferences
{
  return -[AVAssetWriterInputHelper trackReferences](-[AVAssetWriterInput _helper](self, "_helper"), "trackReferences");
}

- (CMTime)preferredMediaChunkDuration
{
  CMTime *result;

  result = -[AVAssetWriterInput _helper](self, "_helper");
  if (result)
    return (CMTime *)-[CMTime preferredMediaChunkDuration](result, "preferredMediaChunkDuration");
  retstr->value = 0;
  *(_QWORD *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return result;
}

- (void)setPreferredMediaChunkDuration:(CMTime *)preferredMediaChunkDuration
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  AVAssetWriterInputHelper *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  __int128 v14;
  CMTimeEpoch epoch;

  if ((preferredMediaChunkDuration->flags & 1) != 0 && (preferredMediaChunkDuration->flags & 0x1D) != 1)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    v12 = CFSTR("media chunk duration must be numeric.  See CMTIME_IS_NUMERIC");
    goto LABEL_7;
  }
  if (preferredMediaChunkDuration->value < 0)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    v12 = CFSTR("media chunk duration must be a positive value");
LABEL_7:
    v13 = (void *)objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v12, v3, v4, v5, v6, v7, v14), 0);
    objc_exception_throw(v13);
  }
  v9 = -[AVAssetWriterInput _helper](self, "_helper");
  v14 = *(_OWORD *)&preferredMediaChunkDuration->value;
  epoch = preferredMediaChunkDuration->epoch;
  -[AVAssetWriterInputHelper setPreferredMediaChunkDuration:](v9, "setPreferredMediaChunkDuration:", &v14);
}

- (NSInteger)preferredMediaChunkAlignment
{
  return -[AVAssetWriterInputHelper preferredMediaChunkAlignment](-[AVAssetWriterInput _helper](self, "_helper"), "preferredMediaChunkAlignment");
}

- (void)setPreferredMediaChunkAlignment:(NSInteger)preferredMediaChunkAlignment
{
  if (preferredMediaChunkAlignment < 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AVAssetWriterInput.m"), 1602, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preferredMediaChunkAlignment >= 0"));
  -[AVAssetWriterInputHelper setPreferredMediaChunkAlignment:](-[AVAssetWriterInput _helper](self, "_helper"), "setPreferredMediaChunkAlignment:", preferredMediaChunkAlignment);
}

- (int64_t)preferredMediaChunkSize
{
  return -[AVAssetWriterInputHelper preferredMediaChunkSize](-[AVAssetWriterInput _helper](self, "_helper"), "preferredMediaChunkSize");
}

- (void)setPreferredMediaChunkSize:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (a3 < 0)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"preferredMediaChunkSize >= 0"), 0);
    objc_exception_throw(v8);
  }
  -[AVAssetWriterInputHelper setPreferredMediaChunkSize:](-[AVAssetWriterInput _helper](self, "_helper"), "setPreferredMediaChunkSize:", a3);
}

- (BOOL)writesMediaDataToBeginningOfFile
{
  return -[NSString isEqualToString:](-[AVAssetWriterInput mediaDataLocation](self, "mediaDataLocation"), "isEqualToString:", CFSTR("AVAssetWriterInputMediaDataLocationBeforeMainMediaDataNotInterleaved"));
}

- (void)setWritesMediaDataToBeginningOfFile:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("AVAssetWriterInputMediaDataLocationBeforeMainMediaDataNotInterleaved");
  else
    v3 = CFSTR("AVAssetWriterInputMediaDataLocationInterleavedWithMainMediaData");
  -[AVAssetWriterInput setMediaDataLocation:](self, "setMediaDataLocation:", v3);
}

- (AVAssetWriterInputMediaDataLocation)mediaDataLocation
{
  return -[AVAssetWriterInputHelper mediaDataLocation](-[AVAssetWriterInput _helper](self, "_helper"), "mediaDataLocation");
}

- (void)setMediaDataLocation:(AVAssetWriterInputMediaDataLocation)mediaDataLocation
{
  -[AVAssetWriterInputHelper setMediaDataLocation:](-[AVAssetWriterInput _helper](self, "_helper"), "setMediaDataLocation:", mediaDataLocation);
}

- (NSURL)sampleReferenceBaseURL
{
  return -[AVAssetWriterInputHelper sampleReferenceBaseURL](-[AVAssetWriterInput _helper](self, "_helper"), "sampleReferenceBaseURL");
}

- (void)setSampleReferenceBaseURL:(NSURL *)sampleReferenceBaseURL
{
  -[AVAssetWriterInputHelper setSampleReferenceBaseURL:](-[AVAssetWriterInput _helper](self, "_helper"), "setSampleReferenceBaseURL:", sampleReferenceBaseURL);
}

- (__CVPixelBufferPool)_pixelBufferPool
{
  return -[AVAssetWriterInputHelper pixelBufferPool](-[AVAssetWriterInput _helper](self, "_helper"), "pixelBufferPool");
}

- (NSDictionary)_sourcePixelBufferAttributes
{
  return -[AVAssetWriterInputHelper sourcePixelBufferAttributes](-[AVAssetWriterInput _helper](self, "_helper"), "sourcePixelBufferAttributes");
}

- (void)_setSourcePixelBufferAttributes:(id)a3
{
  -[AVAssetWriterInputHelper setSourcePixelBufferAttributes:](-[AVAssetWriterInput _helper](self, "_helper"), "setSourcePixelBufferAttributes:", a3);
}

- (id)_attachedAdaptor
{
  return -[AVWeakReference referencedObject](self->_internal->weakReferenceToAttachedAdaptor, "referencedObject");
}

- (BOOL)_isAttachedToAdaptor
{
  return -[AVWeakReference referencedObject](self->_internal->weakReferenceToAttachedAdaptor, "referencedObject") != 0;
}

- (void)_setAttachedAdaptor:(id)a3
{

  self->_internal->weakReferenceToAttachedAdaptor = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", a3);
}

- (BOOL)_prepareForWritingWithFigAssetWriter:(OpaqueFigAssetWriter *)a3 mediaFileType:(id)a4 error:(id *)a5
{
  AVOutputSettings *v9;
  AVOutputSettings *v10;
  AVAssetWriterInputWritingHelper *v11;
  AVAssetWriterInputWritingHelper *v12;
  AVAssetWriterInputConfigurationState *v13;
  AVAssetWriterInputWritingHelper *v14;
  CMTime v16;
  void *v17;

  v17 = 0;
  v9 = -[AVAssetWriterInputHelper outputSettings](-[AVAssetWriterInput _helper](self, "_helper"), "outputSettings");
  v10 = v9;
  if (!v9
    || (LODWORD(v11) = -[AVOutputSettings encoderIsAvailableOnCurrentSystemReturningError:](v9, "encoderIsAvailableOnCurrentSystemReturningError:", &v17), (_DWORD)v11))
  {
    v11 = +[AVFigAssetWriterTrack assetWriterTrackWithFigAssetWriter:mediaType:mediaFileType:formatSpecification:sourcePixelBufferAttributes:multiPass:attachedAdaptor:error:](AVFigAssetWriterTrack, "assetWriterTrackWithFigAssetWriter:mediaType:mediaFileType:formatSpecification:sourcePixelBufferAttributes:multiPass:attachedAdaptor:error:", a3, -[AVAssetWriterInput mediaType](self, "mediaType"), a4, +[AVFormatSpecification formatSpecificationWithOutputSettings:sourceFormatDescription:](AVFormatSpecification, "formatSpecificationWithOutputSettings:sourceFormatDescription:", v10, -[AVAssetWriterInput sourceFormatHint](self, "sourceFormatHint")), -[AVAssetWriterInput _sourcePixelBufferAttributes](self, "_sourcePixelBufferAttributes"), -[AVAssetWriterInput performsMultiPassEncodingIfSupported](self, "performsMultiPassEncodingIfSupported"), -[AVAssetWriterInput _attachedAdaptor](self, "_attachedAdaptor"), &v17);
    if (v11)
    {
      v12 = v11;
      v13 = -[AVAssetWriterInputHelper configurationState](-[AVAssetWriterInput _helper](self, "_helper"), "configurationState");
      if (-[AVAssetWriterInput expectsMediaDataInRealTime](self, "expectsMediaDataInRealTime")
        && -[NSString isEqualToString:](-[AVAssetWriterInput mediaType](self, "mediaType"), "isEqualToString:", CFSTR("soun")))
      {
        CMTimeMake(&v16, 1, 2);
        -[AVAssetWriterInputWritingHelper setSampleBufferCoalescingInterval:](v12, "setSampleBufferCoalescingInterval:", &v16);
      }
      v11 = -[AVAssetWriterInputWritingHelper initWithConfigurationState:assetWriterTrack:error:]([AVAssetWriterInputWritingHelper alloc], "initWithConfigurationState:assetWriterTrack:error:", v13, v12, &v17);
      if (v11)
      {
        v14 = v11;
        -[AVAssetWriterInput _setHelper:](self, "_setHelper:", v11);

        LOBYTE(v11) = -[AVAssetWriterInputHelper status](-[AVAssetWriterInput _helper](self, "_helper"), "status") == 1;
      }
    }
  }
  if (a5 && (v11 & 1) == 0)
    *a5 = v17;
  return (char)v11;
}

- (void)_didStartInitialSession
{
  -[AVAssetWriterInputHelper didStartInitialSession](-[AVAssetWriterInput _helper](self, "_helper"), "didStartInitialSession");
}

- (void)_prepareToEndSession
{
  -[AVAssetWriterInputHelper prepareToEndSession](-[AVAssetWriterInput _helper](self, "_helper"), "prepareToEndSession");
}

- (BOOL)_prepareToFinishWritingReturningError:(id *)a3
{
  return -[AVAssetWriterInputHelper prepareToFinishWritingReturningError:](-[AVAssetWriterInput _helper](self, "_helper"), "prepareToFinishWritingReturningError:", a3);
}

- (void)_transitionToTerminalStatus:(int64_t)a3
{
  -[AVAssetWriterInputHelper transitionToAndReturnTerminalHelperWithTerminalStatus:](-[AVAssetWriterInput _helper](self, "_helper"), "transitionToAndReturnTerminalHelperWithTerminalStatus:", a3);
}

- (void)declareKeyPathDependenciesWithRegistry:(id)a3
{
  objc_msgSend(a3, "valueForKey:dependsOnValueAtKeyPath:", CFSTR("canPerformMultiplePasses"), AVTwoPartKeyPathMake((uint64_t)CFSTR("helper"), (uint64_t)CFSTR("canPerformMultiplePasses")));
  objc_msgSend(a3, "valueForKey:dependsOnValueAtKeyPath:", CFSTR("currentPassDescription"), AVTwoPartKeyPathMake((uint64_t)CFSTR("helper"), (uint64_t)CFSTR("currentPassDescription")));
  objc_msgSend(a3, "valueForKey:dependsOnValueAtKeyPath:", CFSTR("readyForMoreMediaData"), AVTwoPartKeyPathMake((uint64_t)CFSTR("helper"), (uint64_t)CFSTR("readyForMoreMediaData")));
  objc_msgSend(a3, "valueForKey:dependsOnValueAtKeyPath:", CFSTR("status"), AVTwoPartKeyPathMake((uint64_t)CFSTR("helper"), (uint64_t)CFSTR("status")));
  objc_msgSend(a3, "valueForKey:dependsOnValueAtKeyPath:", CFSTR("pixelBufferPool"), AVTwoPartKeyPathMake((uint64_t)CFSTR("helper"), (uint64_t)CFSTR("pixelBufferPool")));
}

- (BOOL)isReadyForMoreMediaData
{
  return -[AVAssetWriterInputHelper isReadyForMoreMediaData](-[AVAssetWriterInput _helper](self, "_helper"), "isReadyForMoreMediaData");
}

- (BOOL)expectsMediaDataInRealTime
{
  return -[AVAssetWriterInputHelper expectsMediaDataInRealTime](-[AVAssetWriterInput _helper](self, "_helper"), "expectsMediaDataInRealTime");
}

- (void)setExpectsMediaDataInRealTime:(BOOL)expectsMediaDataInRealTime
{
  -[AVAssetWriterInputHelper setExpectsMediaDataInRealTime:](-[AVAssetWriterInput _helper](self, "_helper"), "setExpectsMediaDataInRealTime:", expectsMediaDataInRealTime);
}

- (BOOL)maximizePowerEfficiency
{
  return -[AVAssetWriterInputHelper maximizePowerEfficiency](-[AVAssetWriterInput _helper](self, "_helper"), "maximizePowerEfficiency");
}

- (void)setMaximizePowerEfficiency:(BOOL)a3
{
  -[AVAssetWriterInputHelper setMaximizePowerEfficiency:](-[AVAssetWriterInput _helper](self, "_helper"), "setMaximizePowerEfficiency:", a3);
}

- (BOOL)performsMultiPassEncodingIfSupported
{
  return -[AVAssetWriterInputHelper performsMultiPassEncodingIfSupported](-[AVAssetWriterInput _helper](self, "_helper"), "performsMultiPassEncodingIfSupported");
}

- (void)setPerformsMultiPassEncodingIfSupported:(BOOL)performsMultiPassEncodingIfSupported
{
  -[AVAssetWriterInputHelper setPerformsMultiPassEncodingIfSupported:](-[AVAssetWriterInput _helper](self, "_helper"), "setPerformsMultiPassEncodingIfSupported:", performsMultiPassEncodingIfSupported);
}

- (void)addCallbackToCancelDuringDeallocation:(id)a3
{
  -[AVKeyPathDependencyManager addCallbackToCancel:](self->_internal->keyPathDependencyManager, "addCallbackToCancel:", a3);
}

- (BOOL)canPerformMultiplePasses
{
  return -[AVAssetWriterInputHelper canPerformMultiplePasses](-[AVAssetWriterInput _helper](self, "_helper"), "canPerformMultiplePasses");
}

- (AVAssetWriterInputPassDescription)currentPassDescription
{
  return -[AVAssetWriterInputHelper currentPassDescription](-[AVAssetWriterInput _helper](self, "_helper"), "currentPassDescription");
}

- (void)respondToEachPassDescriptionOnQueue:(dispatch_queue_t)queue usingBlock:(dispatch_block_t)block
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  AVAssetWriterInputHelper *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  const __CFString *v24;

  if (!queue)
  {
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99778];
    v20 = "queue != NULL";
LABEL_10:
    v21 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)block, v4, v5, v6, v7, (uint64_t)v20);
    goto LABEL_14;
  }
  if (!block)
  {
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99778];
    v20 = "block != nil";
    goto LABEL_10;
  }
  v12 = -[AVAssetWriterInput _helper](self, "_helper");
  v24 = 0;
  if (!-[AVAssetWriterInputHelper canStartRespondingToEachPassDescriptionReturningReason:](v12, "canStartRespondingToEachPassDescriptionReturningReason:", &v24))
  {
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99768];
    v22 = v24;
LABEL_13:
    v21 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v22, v13, v14, v15, v16, v17, v23);
LABEL_14:
    objc_exception_throw((id)objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, v21, 0));
  }
  if (self->_internal->passDescriptionResponder)
  {
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99768];
    v22 = CFSTR("cannot be called more than once.");
    goto LABEL_13;
  }
  self->_internal->passDescriptionResponder = -[AVAssetWriterInputPassDescriptionResponder initWithCallbackQueue:block:]([AVAssetWriterInputPassDescriptionResponder alloc], "initWithCallbackQueue:block:", queue, block);
  -[AVAssetWriterInput addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", self, CFSTR("currentPassDescription"), 0, CFSTR("AVAssetWriterInputCurrentPassDescriptionChangeContext"));
  if (-[AVAssetWriterInputHelper shouldRespondToInitialPassDescription](v12, "shouldRespondToInitialPassDescription"))
    -[AVAssetWriterInputPassDescriptionResponder respondToNewPassDescription:](self->_internal->passDescriptionResponder, "respondToNewPassDescription:", -[AVAssetWriterInput currentPassDescription](self, "currentPassDescription"));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  if (a6 == CFSTR("AVAssetWriterInputCurrentPassDescriptionChangeContext"))
  {
    -[AVAssetWriterInputPassDescriptionResponder respondToNewPassDescription:](self->_internal->passDescriptionResponder, "respondToNewPassDescription:", -[AVAssetWriterInput currentPassDescription](self, "currentPassDescription", a3, a4, a5));
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)AVAssetWriterInput;
    -[AVAssetWriterInput observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)requestMediaDataWhenReadyOnQueue:(dispatch_queue_t)queue usingBlock:(void *)block
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  void *v11;

  if (!queue)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = "queue != NULL";
    goto LABEL_6;
  }
  if (!block)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = "block != nil";
LABEL_6:
    v11 = (void *)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)block, v4, v5, v6, v7, (uint64_t)v10), 0);
    objc_exception_throw(v11);
  }
  -[AVAssetWriterInputHelper requestMediaDataWhenReadyOnQueue:usingBlock:](-[AVAssetWriterInput _helper](self, "_helper"), "requestMediaDataWhenReadyOnQueue:usingBlock:", queue, block);
}

- (void)stopRequestingMediaData
{
  -[AVAssetWriterInputHelper stopRequestingMediaData](-[AVAssetWriterInput _helper](self, "_helper"), "stopRequestingMediaData");
}

- (int64_t)_appendSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  return -[AVAssetWriterInputHelper appendSampleBuffer:error:](-[AVAssetWriterInput _helper](self, "_helper"), "appendSampleBuffer:error:", a3, a4);
}

- (BOOL)appendSampleBuffer:(CMSampleBufferRef)sampleBuffer
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CMFormatDescriptionRef FormatDescription;
  const opaqueCMFormatDescription *v12;
  NSString *v13;
  uint64_t MediaType;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  NSObject *appendFailureReadWriteQueue;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD block[5];
  id v40;

  if (!sampleBuffer)
  {
    v24 = (void *)MEMORY[0x1E0C99DA0];
    v25 = *MEMORY[0x1E0C99778];
    v26 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"sampleBuffer != NULL");
    v27 = v24;
    v28 = v25;
    goto LABEL_14;
  }
  FormatDescription = CMSampleBufferGetFormatDescription(sampleBuffer);
  if (FormatDescription)
  {
    v12 = FormatDescription;
    v13 = -[AVAssetWriterInput mediaType](self, "mediaType");
    MediaType = CMFormatDescriptionGetMediaType(v12);
    v15 = (void *)AVMediaTypeFromCMMediaType(MediaType);
    if ((objc_msgSend(v15, "isEqualToString:", v13) & 1) == 0
      && (!objc_msgSend(v15, "isEqualToString:", CFSTR("vide"))
       || !-[NSString isEqualToString:](v13, "isEqualToString:", CFSTR("auxv"))))
    {
      v29 = (void *)MEMORY[0x1E0C99DA0];
      v30 = *MEMORY[0x1E0C99778];
      v26 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Media type of sample buffer must match receiver's media type (\"%@\")"), v16, v17, v18, v19, v20, (uint64_t)v13);
      v27 = v29;
LABEL_13:
      v28 = v30;
LABEL_14:
      objc_exception_throw((id)objc_msgSend(v27, "exceptionWithName:reason:userInfo:", v28, v26, 0));
    }
  }
  v40 = 0;
  v21 = -[AVAssetWriterInput _appendSampleBuffer:error:](self, "_appendSampleBuffer:error:", sampleBuffer, &v40);
  if (v21 == 1)
  {
    if (objc_msgSend(v40, "code") != -11999)
    {
      -[AVAssetWriterInput _tellAssetWriterToTransitionToFailedStatusWithError:](self, "_tellAssetWriterToTransitionToFailedStatusWithError:", v40);
      appendFailureReadWriteQueue = self->_internal->appendFailureReadWriteQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __41__AVAssetWriterInput_appendSampleBuffer___block_invoke;
      block[3] = &unk_1E302FA10;
      block[4] = self;
      av_readwrite_dispatch_queue_write_async(appendFailureReadWriteQueue, block);
      return v21 == 0;
    }
    v31 = (void *)objc_msgSend((id)objc_msgSend(v40, "userInfo"), "objectForKey:", CFSTR("AVErrorExceptionKey"));
    v32 = (void *)MEMORY[0x1E0C99DA0];
    v30 = objc_msgSend(v31, "name");
    v33 = objc_msgSend(v31, "reason");
    v26 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot append sample buffer: %@"), v34, v35, v36, v37, v38, v33);
    v27 = v32;
    goto LABEL_13;
  }
  return v21 == 0;
}

uint64_t __41__AVAssetWriterInput_appendSampleBuffer___block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 56);
  return result;
}

- (BOOL)_appendPixelBuffer:(__CVBuffer *)a3 withPresentationTime:(id *)a4
{
  AVAssetWriterInputHelper *v7;
  BOOL v8;
  NSObject *appendFailureReadWriteQueue;
  _QWORD block[5];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;

  v7 = -[AVAssetWriterInput _helper](self, "_helper");
  v12 = *a4;
  v8 = -[AVAssetWriterInputHelper appendPixelBuffer:withPresentationTime:](v7, "appendPixelBuffer:withPresentationTime:", a3, &v12);
  if (!v8)
  {
    appendFailureReadWriteQueue = self->_internal->appendFailureReadWriteQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__AVAssetWriterInput__appendPixelBuffer_withPresentationTime___block_invoke;
    block[3] = &unk_1E302FA10;
    block[4] = self;
    av_readwrite_dispatch_queue_write_async(appendFailureReadWriteQueue, block);
  }
  return v8;
}

uint64_t __62__AVAssetWriterInput__appendPixelBuffer_withPresentationTime___block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 56);
  return result;
}

- (BOOL)_appendTaggedPixelBufferGroup:(OpaqueCMTaggedBufferGroup *)a3 withPresentationTime:(id *)a4
{
  AVAssetWriterInputHelper *v7;
  BOOL v8;
  NSObject *appendFailureReadWriteQueue;
  _QWORD block[5];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;

  v7 = -[AVAssetWriterInput _helper](self, "_helper");
  v12 = *a4;
  v8 = -[AVAssetWriterInputHelper appendTaggedPixelBufferGroup:withPresentationTime:](v7, "appendTaggedPixelBufferGroup:withPresentationTime:", a3, &v12);
  if (!v8)
  {
    appendFailureReadWriteQueue = self->_internal->appendFailureReadWriteQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__AVAssetWriterInput__appendTaggedPixelBufferGroup_withPresentationTime___block_invoke;
    block[3] = &unk_1E302FA10;
    block[4] = self;
    av_readwrite_dispatch_queue_write_async(appendFailureReadWriteQueue, block);
  }
  return v8;
}

uint64_t __73__AVAssetWriterInput__appendTaggedPixelBufferGroup_withPresentationTime___block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 56);
  return result;
}

- (int64_t)_appendCaption:(id)a3 error:(id *)a4
{
  int64_t v6;
  NSObject *appendFailureReadWriteQueue;
  _QWORD v9[5];
  void *v10;

  v10 = 0;
  v6 = -[AVAssetWriterInputHelper appendCaption:error:](-[AVAssetWriterInput _helper](self, "_helper"), "appendCaption:error:", a3, &v10);
  if (v6 == 1)
  {
    -[AVAssetWriterInput _tellAssetWriterToTransitionToFailedStatusWithError:](self, "_tellAssetWriterToTransitionToFailedStatusWithError:", v10);
    if (a4)
      *a4 = v10;
    appendFailureReadWriteQueue = self->_internal->appendFailureReadWriteQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__AVAssetWriterInput__appendCaption_error___block_invoke;
    v9[3] = &unk_1E302FA10;
    v9[4] = self;
    av_readwrite_dispatch_queue_write_async(appendFailureReadWriteQueue, v9);
  }
  return v6;
}

uint64_t __43__AVAssetWriterInput__appendCaption_error___block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 56);
  return result;
}

- (int64_t)_appendCaptionGroup:(id)a3 error:(id *)a4
{
  int64_t v6;
  NSObject *appendFailureReadWriteQueue;
  _QWORD v9[5];
  void *v10;

  v10 = 0;
  v6 = -[AVAssetWriterInputHelper appendCaptionGroup:error:](-[AVAssetWriterInput _helper](self, "_helper"), "appendCaptionGroup:error:", a3, &v10);
  if (v6 == 1)
  {
    -[AVAssetWriterInput _tellAssetWriterToTransitionToFailedStatusWithError:](self, "_tellAssetWriterToTransitionToFailedStatusWithError:", v10);
    if (a4)
      *a4 = v10;
    appendFailureReadWriteQueue = self->_internal->appendFailureReadWriteQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__AVAssetWriterInput__appendCaptionGroup_error___block_invoke;
    v9[3] = &unk_1E302FA10;
    v9[4] = self;
    av_readwrite_dispatch_queue_write_async(appendFailureReadWriteQueue, v9);
  }
  return v6;
}

uint64_t __48__AVAssetWriterInput__appendCaptionGroup_error___block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 56);
  return result;
}

- (int64_t)numberOfAppendFailures
{
  NSObject *appendFailureReadWriteQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  appendFailureReadWriteQueue = self->_internal->appendFailureReadWriteQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__AVAssetWriterInput_numberOfAppendFailures__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(appendFailureReadWriteQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__AVAssetWriterInput_numberOfAppendFailures__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 56);
  return result;
}

- (void)markAsFinished
{
  NSObject *appendFailureReadWriteQueue;
  AVAssetWriterInputPassDescriptionResponder *passDescriptionResponder;
  _QWORD block[5];

  appendFailureReadWriteQueue = self->_internal->appendFailureReadWriteQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__AVAssetWriterInput_markAsFinished__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  av_readwrite_dispatch_queue_write(appendFailureReadWriteQueue, block);
  passDescriptionResponder = self->_internal->passDescriptionResponder;
  if (passDescriptionResponder)
    -[AVAssetWriterInputPassDescriptionResponder stopRespondingToPassDescriptions](passDescriptionResponder, "stopRespondingToPassDescriptions");
  -[AVAssetWriterInputHelper markAsFinished](-[AVAssetWriterInput _helper](self, "_helper"), "markAsFinished");
}

uint64_t __36__AVAssetWriterInput_markAsFinished__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 64) = 1;
  return result;
}

- (BOOL)_markAsFinishedCalled
{
  NSObject *appendFailureReadWriteQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  appendFailureReadWriteQueue = self->_internal->appendFailureReadWriteQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__AVAssetWriterInput__markAsFinishedCalled__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(appendFailureReadWriteQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__AVAssetWriterInput__markAsFinishedCalled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 64);
  return result;
}

- (void)markCurrentPassAsFinished
{
  -[AVAssetWriterInputHelper markCurrentPassAsFinished](-[AVAssetWriterInput _helper](self, "_helper"), "markCurrentPassAsFinished");
}

- (BOOL)canAddTrackAssociationWithTrackOfInput:(AVAssetWriterInput *)input type:(NSString *)trackAssociationType
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;

  if (!input)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    v11 = "input != nil";
    goto LABEL_6;
  }
  if (!trackAssociationType)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    v11 = "trackAssociationType != nil";
LABEL_6:
    v12 = (void *)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)trackAssociationType, v4, v5, v6, v7, (uint64_t)v11), 0);
    objc_exception_throw(v12);
  }
  return -[AVAssetWriterInputHelper canAddTrackAssociationWithTrackOfInput:type:](-[AVAssetWriterInput _helper](self, "_helper"), "canAddTrackAssociationWithTrackOfInput:type:", input, trackAssociationType);
}

- (void)addTrackAssociationWithTrackOfInput:(AVAssetWriterInput *)input type:(NSString *)trackAssociationType
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v11;
  uint64_t v12;
  const char *v13;
  void *v14;

  if (!input)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v13 = "input != nil";
    goto LABEL_6;
  }
  if (!trackAssociationType)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v13 = "trackAssociationType != nil";
LABEL_6:
    v14 = (void *)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)trackAssociationType, v4, v5, v6, v7, (uint64_t)v13), 0);
    objc_exception_throw(v14);
  }
  -[AVAssetWriterInput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("trackReferences"));
  -[AVAssetWriterInputHelper addTrackAssociationWithTrackOfInput:type:](-[AVAssetWriterInput _helper](self, "_helper"), "addTrackAssociationWithTrackOfInput:type:", input, trackAssociationType);
  -[AVAssetWriterInput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("trackReferences"));
}

- (id)availableTrackAssociationTypes
{
  return -[AVAssetWriterInputHelper availableTrackAssociationTypes](-[AVAssetWriterInput _helper](self, "_helper"), "availableTrackAssociationTypes");
}

- (id)associatedInputsWithTrackAssociationType:(id)a3
{
  return -[AVAssetWriterInputHelper associatedInputsWithTrackAssociationType:](-[AVAssetWriterInput _helper](self, "_helper"), "associatedInputsWithTrackAssociationType:", a3);
}

@end

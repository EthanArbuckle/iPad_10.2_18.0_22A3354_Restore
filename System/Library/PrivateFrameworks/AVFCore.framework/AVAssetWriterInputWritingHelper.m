@implementation AVAssetWriterInputWritingHelper

- (AVAssetWriterInputWritingHelper)initWithConfigurationState:(id)a3
{
  return -[AVAssetWriterInputWritingHelper initWithConfigurationState:assetWriterTrack:error:](self, "initWithConfigurationState:assetWriterTrack:error:", a3, 0, 0);
}

- (AVAssetWriterInputWritingHelper)initWithConfigurationState:(id)a3 assetWriterTrack:(id)a4 error:(id *)a5
{
  AVAssetWriterInputWritingHelper *v8;
  AVAssetWriterInputWritingHelper *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const void *v13;
  uint64_t v14;
  double v15;
  double v16;
  CFDictionaryRef DictionaryRepresentation;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  AVFigAssetWriterTrack *assetWriterTrack;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __CFString *v28;
  uint64_t v29;
  uint64_t v30;
  AVAssetWriterInputPassDescription *v31;
  void *v32;
  void *v33;
  AVKeyPathDependencyManager *v34;
  NSObject *v35;
  NSObject *v36;
  AVAssetWriterInputWritingHelper *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  CMTime duration;
  CMTimeRange v46;
  CMTime start;
  CGAffineTransform v48;
  CGAffineTransform v49;
  objc_super v50;

  v50.receiver = self;
  v50.super_class = (Class)AVAssetWriterInputWritingHelper;
  v8 = -[AVAssetWriterInputHelper initWithConfigurationState:](&v50, sel_initWithConfigurationState_, a3, a4, a5);
  v9 = v8;
  if (!a4)
  {
    v38 = v8;
    v44 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v9, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v39, v40, v41, v42, v43, (uint64_t)"assetWriterTrack != nil"), 0);
    objc_exception_throw(v44);
  }
  if (v8)
  {
    v8->_assetWriterTrack = (AVFigAssetWriterTrack *)a4;
    objc_msgSend(a3, "setTrackID:", objc_msgSend(a4, "trackID"));
    if (!objc_msgSend(a3, "outputSettings"))
    {
      if (objc_msgSend((id)objc_msgSend(a3, "mediaType"), "isEqualToString:", CFSTR("meta")))
      {
        v10 = objc_msgSend(a3, "sourceFormatHint");
        if (v10)
          -[AVFigAssetWriterTrack setFormatDescriptions:](v9->_assetWriterTrack, "setFormatDescriptions:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v10));
      }
    }
    v11 = (void *)objc_msgSend(a3, "metadataItems");
    if (v11)
    {
      v12 = v11;
      if (objc_msgSend(v11, "count"))
      {
        -[AVFigAssetWriterTrack setFigMetadata:](v9->_assetWriterTrack, "setFigMetadata:", +[AVMetadataItem _figMetadataPropertyFromMetadataItems:](AVMetadataItem, "_figMetadataPropertyFromMetadataItems:", v12));
        if (objc_msgSend(+[AVMetadataItem metadataItemsFromArray:withStringValue:](AVMetadataItem, "metadataItemsFromArray:withStringValue:", -[NSArray arrayByAddingObjectsFromArray:](+[AVMetadataItem metadataItemsFromArray:withKey:keySpace:](AVMetadataItem, "metadataItemsFromArray:withKey:keySpace:", v12, CFSTR("tagc"), CFSTR("uiso")), "arrayByAddingObjectsFromArray:", +[AVMetadataItem metadataItemsFromArray:withKey:keySpace:](AVMetadataItem, "metadataItemsFromArray:withKey:keySpace:", v12, CFSTR("tagc"), CFSTR("udta"))), CFSTR("public.auxiliary-content")), "count"))
        {
          -[AVFigAssetWriterTrack setExcludeFromAutoSelection:](v9->_assetWriterTrack, "setExcludeFromAutoSelection:", 1);
        }
      }
    }
    memset(&v49, 0, sizeof(v49));
    if (a3)
      objc_msgSend(a3, "transform");
    v48 = v49;
    if (!CGAffineTransformIsIdentity(&v48))
    {
      v48 = v49;
      v13 = (const void *)FigCreate3x3MatrixArrayFromCGAffineTransform();
      -[AVFigAssetWriterTrack setFigTrackMatrix:](v9->_assetWriterTrack, "setFigTrackMatrix:", v13);
      CFRelease(v13);
    }
    v14 = objc_msgSend(a3, "mediaTimeScale");
    if ((_DWORD)v14)
      -[AVFigAssetWriterTrack setMediaTimeScale:](v9->_assetWriterTrack, "setMediaTimeScale:", v14);
    objc_msgSend(a3, "naturalSize");
    if (v15 != *MEMORY[0x1E0C9D820] || v16 != *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(*(CGSize *)&v15);
      -[AVFigAssetWriterTrack setFigDimensions:](v9->_assetWriterTrack, "setFigDimensions:", DictionaryRepresentation);
      if (DictionaryRepresentation)
        CFRelease(DictionaryRepresentation);
    }
    v18 = (void *)objc_msgSend(a3, "languageCode");
    if (v18)
    {
      v19 = v18;
      if (objc_msgSend(v18, "length"))
        -[AVFigAssetWriterTrack setLanguageCode:](v9->_assetWriterTrack, "setLanguageCode:", v19);
    }
    v20 = (void *)objc_msgSend(a3, "extendedLanguageTag");
    if (v20)
    {
      v21 = v20;
      if (objc_msgSend(v20, "length"))
        -[AVFigAssetWriterTrack setExtendedLanguageTag:](v9->_assetWriterTrack, "setExtendedLanguageTag:", v21);
    }
    -[AVFigAssetWriterTrack setMarksOutputTrackAsEnabled:](v9->_assetWriterTrack, "setMarksOutputTrackAsEnabled:", objc_msgSend(a3, "marksOutputTrackAsEnabled"));
    objc_msgSend(a3, "preferredVolume");
    -[AVFigAssetWriterTrack setTrackVolume:](v9->_assetWriterTrack, "setTrackVolume:");
    -[AVFigAssetWriterTrack setLayer:](v9->_assetWriterTrack, "setLayer:", objc_msgSend(a3, "layer"));
    v22 = objc_msgSend(a3, "alternateGroupID");
    if ((_DWORD)v22)
      -[AVFigAssetWriterTrack setAlternateGroupID:](v9->_assetWriterTrack, "setAlternateGroupID:", v22);
    v23 = objc_msgSend(a3, "provisionalAlternateGroupID");
    if ((_DWORD)v23)
      -[AVFigAssetWriterTrack setProvisionalAlternateGroupID:](v9->_assetWriterTrack, "setProvisionalAlternateGroupID:", v23);
    memset(&v48, 0, 24);
    if (a3)
    {
      objc_msgSend(a3, "preferredMediaChunkDuration");
      if ((BYTE4(v48.b) & 1) != 0)
      {
        assetWriterTrack = v9->_assetWriterTrack;
        *(_OWORD *)&start.value = *(_OWORD *)&v48.a;
        start.epoch = *(_QWORD *)&v48.c;
        -[AVFigAssetWriterTrack setPreferredChunkDuration:](assetWriterTrack, "setPreferredChunkDuration:", &start);
      }
    }
    v25 = objc_msgSend(a3, "preferredMediaChunkAlignment");
    if (v25)
      -[AVFigAssetWriterTrack setPreferredChunkAlignment:](v9->_assetWriterTrack, "setPreferredChunkAlignment:", v25);
    v26 = objc_msgSend(a3, "preferredMediaChunkSize");
    if (v26)
      -[AVFigAssetWriterTrack setPreferredChunkSize:](v9->_assetWriterTrack, "setPreferredChunkSize:", v26);
    v27 = (void *)objc_msgSend(a3, "mediaType");
    if ((objc_msgSend(v27, "isEqualToString:", CFSTR("meta")) & 1) != 0
      || objc_msgSend(v27, "isEqualToString:", CFSTR("auxv")))
    {
      v28 = CFSTR("AVAssetWriterInputMediaDataLocationSparselyInterleavedWithMainMediaData");
    }
    else
    {
      v28 = CFSTR("AVAssetWriterInputMediaDataLocationInterleavedWithMainMediaData");
    }
    v29 = objc_msgSend(a3, "mediaDataLocation");
    if ((-[__CFString isEqualToString:](v28, "isEqualToString:", v29) & 1) == 0)
      -[AVFigAssetWriterTrack setMediaDataLocation:](v9->_assetWriterTrack, "setMediaDataLocation:", v29);
    v30 = objc_msgSend(a3, "sampleReferenceBaseURL");
    if (v30)
      -[AVFigAssetWriterTrack setSampleReferenceBaseURL:](v9->_assetWriterTrack, "setSampleReferenceBaseURL:", v30);
    v31 = [AVAssetWriterInputPassDescription alloc];
    v32 = (void *)MEMORY[0x1E0C99D20];
    v33 = (void *)MEMORY[0x1E0CB3B18];
    start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    duration = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E30];
    CMTimeRangeMake(&v46, &start, &duration);
    v9->_currentPassDescription = -[AVAssetWriterInputPassDescription initWithTimeRanges:](v31, "initWithTimeRanges:", objc_msgSend(v32, "arrayWithObject:", objc_msgSend(v33, "valueWithCMTimeRange:", &v46)));
    v34 = -[AVKeyPathDependencyManager initWithDependencyHost:]([AVKeyPathDependencyManager alloc], "initWithDependencyHost:", v9);
    v9->_keyPathDependencyManager = v34;
    -[AVKeyPathDependencyManager dependencyHostIsFullyInitialized](v34, "dependencyHostIsFullyInitialized");
    v35 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9->_mediaDataRequesterSerialQueue = (OS_dispatch_queue *)dispatch_queue_create("AVAssetWriterInputWritingHelperMediaDataRequester", v35);
    v36 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9->_readyForMoreMediaDataObserverSerialQueue = (OS_dispatch_queue *)dispatch_queue_create("AVAssetWriterInputWritingHelperReadyForMoreMediaDataObserver", v36);
  }
  return v9;
}

- (void)addCallbackToCancelDuringDeallocation:(id)a3
{
  -[AVKeyPathDependencyManager addCallbackToCancel:](self->_keyPathDependencyManager, "addCallbackToCancel:", a3);
}

- (void)dealloc
{
  NSObject *mediaDataRequesterSerialQueue;
  NSObject *readyForMoreMediaDataObserverSerialQueue;
  objc_super v5;

  if (self->_observingSelf)
    -[AVAssetWriterInputWritingHelper removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("readyForMoreMediaData"), CFSTR("AVAssetWriterInputWritingHelperNudgeMediaDataRequesterObservationContext"));
  -[AVKeyPathDependencyManager cancelAllCallbacks](self->_keyPathDependencyManager, "cancelAllCallbacks");

  mediaDataRequesterSerialQueue = self->_mediaDataRequesterSerialQueue;
  if (mediaDataRequesterSerialQueue)
    dispatch_release(mediaDataRequesterSerialQueue);
  readyForMoreMediaDataObserverSerialQueue = self->_readyForMoreMediaDataObserverSerialQueue;
  if (readyForMoreMediaDataObserverSerialQueue)
    dispatch_release(readyForMoreMediaDataObserverSerialQueue);
  CVPixelBufferPoolRelease(self->_pixelBufferPool);
  v5.receiver = self;
  v5.super_class = (Class)AVAssetWriterInputWritingHelper;
  -[AVAssetWriterInputHelper dealloc](&v5, sel_dealloc);
}

- (int64_t)status
{
  return 1;
}

- (BOOL)canPerformMultiplePasses
{
  _BOOL4 v3;

  v3 = -[AVAssetWriterInputHelper performsMultiPassEncodingIfSupported](self, "performsMultiPassEncodingIfSupported");
  if (v3)
    LOBYTE(v3) = -[AVFigAssetWriterTrack encoderSupportsMultiPass](-[AVAssetWriterInputWritingHelper _assetWriterTrack](self, "_assetWriterTrack"), "encoderSupportsMultiPass");
  return v3;
}

- (void)declareKeyPathDependenciesWithRegistry:(id)a3
{
  objc_msgSend(a3, "valueForKey:dependsOnValueAtKeyPath:", CFSTR("readyForMoreMediaData"), AVTwoPartKeyPathMake((uint64_t)CFSTR("assetWriterTrack"), (uint64_t)CFSTR("aboveHighWaterLevel")));
}

- (BOOL)isReadyForMoreMediaData
{
  return !-[AVFigAssetWriterTrack isAboveHighWaterLevel](-[AVAssetWriterInputWritingHelper _assetWriterTrack](self, "_assetWriterTrack"), "isAboveHighWaterLevel");
}

- (void)requestMediaDataWhenReadyOnQueue:(id)a3 usingBlock:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *mediaDataRequesterSerialQueue;
  void *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD block[8];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  uint64_t v31;

  if (!a3)
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    v14 = "queue != NULL";
    goto LABEL_7;
  }
  if (!a4)
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    v14 = "block != nil";
LABEL_7:
    v15 = (void *)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)a4, v4, v5, v6, v7, (uint64_t)v14), 0);
    objc_exception_throw(v15);
  }
  v26 = 0;
  v27 = &v26;
  v28 = 0x3052000000;
  v29 = __Block_byref_object_copy__11;
  v30 = __Block_byref_object_dispose__11;
  v31 = 0;
  mediaDataRequesterSerialQueue = self->_mediaDataRequesterSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__AVAssetWriterInputWritingHelper_requestMediaDataWhenReadyOnQueue_usingBlock___block_invoke;
  block[3] = &unk_1E3032610;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = &v26;
  dispatch_sync(mediaDataRequesterSerialQueue, block);
  v11 = (void *)v27[5];
  if (!v11)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = (objc_class *)objc_opt_class();
    v23 = (void *)objc_msgSend(v16, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithClassAndSelector(v17, a2, (uint64_t)CFSTR("cannot be called more than once."), v18, v19, v20, v21, v22, v24), 0);
    objc_exception_throw(v23);
  }
  objc_msgSend(v11, "setDelegate:", self);
  -[AVAssetWriterInputWritingHelper _nudgeMediaDataRequesterIfAppropriate:](self, "_nudgeMediaDataRequesterIfAppropriate:", v27[5]);

  _Block_object_dispose(&v26, 8);
}

_QWORD *__79__AVAssetWriterInputWritingHelper_requestMediaDataWhenReadyOnQueue_usingBlock___block_invoke(_QWORD *result)
{
  _QWORD *v1;

  if (!*(_QWORD *)(result[4] + 32))
  {
    v1 = result;
    *(_QWORD *)(result[4] + 32) = -[AVAssetWriterInputMediaDataRequester initWithRequestQueue:requestBlock:]([AVAssetWriterInputMediaDataRequester alloc], "initWithRequestQueue:requestBlock:", result[5], result[6]);
    *(_QWORD *)(*(_QWORD *)(v1[7] + 8) + 40) = *(id *)(v1[4] + 32);
    return (_QWORD *)objc_msgSend((id)v1[4], "_startObservingReadyForMoreMediaDataKeyPath");
  }
  return result;
}

- (void)stopRequestingMediaData
{
  NSObject *mediaDataRequesterSerialQueue;
  void *v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__11;
  v9 = __Block_byref_object_dispose__11;
  v10 = 0;
  mediaDataRequesterSerialQueue = self->_mediaDataRequesterSerialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__AVAssetWriterInputWritingHelper_stopRequestingMediaData__block_invoke;
  v4[3] = &unk_1E302FDB0;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(mediaDataRequesterSerialQueue, v4);
  v3 = (void *)v6[5];
  if (v3)

  _Block_object_dispose(&v5, 8);
}

uint64_t __58__AVAssetWriterInputWritingHelper_stopRequestingMediaData__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 32);
  if (v1)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40) = v1;
    *(_QWORD *)(*(_QWORD *)(result + 32) + 32) = 0;
    return objc_msgSend(*(id *)(result + 32), "_stopObservingReadyForMoreMediaDataKeyPath");
  }
  return result;
}

- (void)_nudgeMediaDataRequesterIfAppropriate:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  if (-[AVAssetWriterInputWritingHelper isReadyForMoreMediaData](self, "isReadyForMoreMediaData"))
  {
    v4 = objc_msgSend(a3, "requestQueue");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__AVAssetWriterInputWritingHelper__nudgeMediaDataRequesterIfAppropriate___block_invoke;
    block[3] = &unk_1E302FA10;
    block[4] = a3;
    dispatch_async(v4, block);
  }
}

uint64_t __73__AVAssetWriterInputWritingHelper__nudgeMediaDataRequesterIfAppropriate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "requestMediaDataIfNecessary");
}

- (BOOL)mediaDataRequesterShouldRequestMediaData
{
  NSObject *mediaDataRequesterSerialQueue;
  BOOL v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  mediaDataRequesterSerialQueue = self->_mediaDataRequesterSerialQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__AVAssetWriterInputWritingHelper_mediaDataRequesterShouldRequestMediaData__block_invoke;
  v6[3] = &unk_1E302FDB0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(mediaDataRequesterSerialQueue, v6);
  v4 = -[AVAssetWriterInputWritingHelper isReadyForMoreMediaData](self, "isReadyForMoreMediaData")
    && !objc_msgSend(-[AVWeakReference referencedObject](-[AVAssetWriterInputHelper weakReferenceToAssetWriterInput](self, "weakReferenceToAssetWriterInput"), "referencedObject"), "numberOfAppendFailures")&& *((_BYTE *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __75__AVAssetWriterInputWritingHelper_mediaDataRequesterShouldRequestMediaData__block_invoke(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 32))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  return result;
}

- (void)_startObservingReadyForMoreMediaDataKeyPath
{
  NSObject *readyForMoreMediaDataObserverSerialQueue;
  _QWORD block[5];

  readyForMoreMediaDataObserverSerialQueue = self->_readyForMoreMediaDataObserverSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__AVAssetWriterInputWritingHelper__startObservingReadyForMoreMediaDataKeyPath__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_async(readyForMoreMediaDataObserverSerialQueue, block);
}

_BYTE *__78__AVAssetWriterInputWritingHelper__startObservingReadyForMoreMediaDataKeyPath__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[40])
  {
    result = (_BYTE *)objc_msgSend(result, "addObserver:forKeyPath:options:context:", result, CFSTR("readyForMoreMediaData"), 0, CFSTR("AVAssetWriterInputWritingHelperNudgeMediaDataRequesterObservationContext"));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
  }
  return result;
}

- (void)_stopObservingReadyForMoreMediaDataKeyPath
{
  NSObject *readyForMoreMediaDataObserverSerialQueue;
  _QWORD block[5];

  readyForMoreMediaDataObserverSerialQueue = self->_readyForMoreMediaDataObserverSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__AVAssetWriterInputWritingHelper__stopObservingReadyForMoreMediaDataKeyPath__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_async(readyForMoreMediaDataObserverSerialQueue, block);
}

_BYTE *__77__AVAssetWriterInputWritingHelper__stopObservingReadyForMoreMediaDataKeyPath__block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[40])
  {
    result = (_BYTE *)objc_msgSend(result, "removeObserver:forKeyPath:context:", result, CFSTR("readyForMoreMediaData"), CFSTR("AVAssetWriterInputWritingHelperNudgeMediaDataRequesterObservationContext"));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  }
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  NSObject *mediaDataRequesterSerialQueue;
  objc_super v8;
  _QWORD block[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  if (a6 == CFSTR("AVAssetWriterInputWritingHelperNudgeMediaDataRequesterObservationContext"))
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3052000000;
    v13 = __Block_byref_object_copy__11;
    v14 = __Block_byref_object_dispose__11;
    v15 = 0;
    mediaDataRequesterSerialQueue = self->_mediaDataRequesterSerialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__AVAssetWriterInputWritingHelper_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E302FDB0;
    block[4] = self;
    block[5] = &v10;
    dispatch_sync(mediaDataRequesterSerialQueue, block);
    if (v11[5])
    {
      -[AVAssetWriterInputWritingHelper _nudgeMediaDataRequesterIfAppropriate:](self, "_nudgeMediaDataRequesterIfAppropriate:");

    }
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVAssetWriterInputWritingHelper;
    -[AVAssetWriterInputWritingHelper observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

_QWORD *__82__AVAssetWriterInputWritingHelper_observeValueForKeyPath_ofObject_change_context___block_invoke(_QWORD *result)
{
  void *v1;
  _QWORD *v2;

  v1 = *(void **)(result[4] + 32);
  if (v1)
  {
    v2 = result;
    result = v1;
    *(_QWORD *)(*(_QWORD *)(v2[5] + 8) + 40) = result;
  }
  return result;
}

- (void)beginPassIfAppropriate
{
  uint64_t v3;

  if (-[AVAssetWriterInputWritingHelper canPerformMultiplePasses](self, "canPerformMultiplePasses"))
  {
    v3 = 0;
    if (!-[AVFigAssetWriterTrack beginPassReturningError:](-[AVAssetWriterInputWritingHelper _assetWriterTrack](self, "_assetWriterTrack"), "beginPassReturningError:", &v3))-[AVAssetWriterInputHelper transitionAssetWriterAndAllInputsToFailedStatusWithError:](self, "transitionAssetWriterAndAllInputsToFailedStatusWithError:", v3);
  }
}

- (int64_t)appendSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  int v7;
  uint64_t v8;
  void *v10;

  v10 = 0;
  if (-[AVAssetWriterInputWritingHelper isReadyForMoreMediaData](self, "isReadyForMoreMediaData"))
  {
    if (!CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0CA26F8], 0)
      || (v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[AVWeakReference referencedObject](-[AVAssetWriterInputHelper weakReferenceToAssetWriterInput](self, "weakReferenceToAssetWriterInput"), "referencedObject"), "_weakReferenceToAssetWriter"), "referencedObject"), "_supportsSampleReferencesReturningError:", &v10)) != 0)
    {
      v7 = -[AVFigAssetWriterTrack addSampleBuffer:error:](-[AVAssetWriterInputWritingHelper _assetWriterTrack](self, "_assetWriterTrack"), "addSampleBuffer:error:", a3, &v10);
    }
  }
  else
  {
    v8 = AVErrorForClientProgrammingError(objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("readyForMoreMediaData is NO."), 0));
    v7 = 0;
    v10 = (void *)v8;
  }
  if (a4 && (v7 & 1) == 0)
    *a4 = v10;
  return v7 ^ 1u;
}

- (BOOL)appendPixelBuffer:(__CVBuffer *)a3 withPresentationTime:(id *)a4
{
  AVFigAssetWriterTrack *v8;
  BOOL v9;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  int64_t var3;
  uint64_t v22;

  if (!-[AVAssetWriterInputWritingHelper isReadyForMoreMediaData](self, "isReadyForMoreMediaData"))
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99768];
    v13 = (objc_class *)objc_opt_class();
    v19 = (void *)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, AVMethodExceptionReasonWithClassAndSelector(v13, a2, (uint64_t)CFSTR("A pixel buffer cannot be appended when readyForMoreMediaData is NO."), v14, v15, v16, v17, v18, v20), 0);
    objc_exception_throw(v19);
  }
  v22 = 0;
  v8 = -[AVAssetWriterInputWritingHelper _assetWriterTrack](self, "_assetWriterTrack");
  v20 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  v9 = -[AVFigAssetWriterTrack addPixelBuffer:atPresentationTime:error:](v8, "addPixelBuffer:atPresentationTime:error:", a3, &v20, &v22);
  if (!v9)
    -[AVAssetWriterInputHelper transitionAssetWriterAndAllInputsToFailedStatusWithError:](self, "transitionAssetWriterAndAllInputsToFailedStatusWithError:", v22);
  return v9;
}

- (BOOL)appendTaggedPixelBufferGroup:(OpaqueCMTaggedBufferGroup *)a3 withPresentationTime:(id *)a4
{
  AVFigAssetWriterTrack *v8;
  BOOL v9;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  int64_t var3;
  uint64_t v22;

  if (!-[AVAssetWriterInputWritingHelper isReadyForMoreMediaData](self, "isReadyForMoreMediaData"))
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99768];
    v13 = (objc_class *)objc_opt_class();
    v19 = (void *)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, AVMethodExceptionReasonWithClassAndSelector(v13, a2, (uint64_t)CFSTR("A tagged buffer group cannot be appended when readyForMoreMediaData is NO."), v14, v15, v16, v17, v18, v20), 0);
    objc_exception_throw(v19);
  }
  v22 = 0;
  v8 = -[AVAssetWriterInputWritingHelper _assetWriterTrack](self, "_assetWriterTrack");
  v20 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  v9 = -[AVFigAssetWriterTrack addTaggedPixelBufferGroup:atPresentationTime:error:](v8, "addTaggedPixelBufferGroup:atPresentationTime:error:", a3, &v20, &v22);
  if (!v9)
    -[AVAssetWriterInputHelper transitionAssetWriterAndAllInputsToFailedStatusWithError:](self, "transitionAssetWriterAndAllInputsToFailedStatusWithError:", v22);
  return v9;
}

- (int64_t)appendCaption:(id)a3 error:(id *)a4
{
  AVFigAssetWriterTrack *v7;
  void *v9;

  v9 = 0;
  if (!-[AVAssetWriterInputWritingHelper isReadyForMoreMediaData](self, "isReadyForMoreMediaData"))
  {
    v9 = (void *)AVErrorForClientProgrammingError(objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("readyForMoreMediaData is NO."), 0));
LABEL_6:
    if (!a4)
      return 1;
LABEL_7:
    *a4 = v9;
    return 1;
  }
  v7 = -[AVAssetWriterInputWritingHelper _assetWriterTrack](self, "_assetWriterTrack");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  if ((-[AVFigAssetWriterTrack addCaption:error:](v7, "addCaption:error:", a3, &v9) & 1) != 0)
    return 0;
  -[AVAssetWriterInputHelper transitionAssetWriterAndAllInputsToFailedStatusWithError:](self, "transitionAssetWriterAndAllInputsToFailedStatusWithError:", v9);
  if (a4)
    goto LABEL_7;
  return 1;
}

- (int64_t)appendCaptionGroup:(id)a3 error:(id *)a4
{
  AVFigAssetWriterTrack *v7;
  void *v9;

  v9 = 0;
  if (!-[AVAssetWriterInputWritingHelper isReadyForMoreMediaData](self, "isReadyForMoreMediaData"))
  {
    v9 = (void *)AVErrorForClientProgrammingError(objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("readyForMoreMediaData is NO."), 0));
LABEL_6:
    if (!a4)
      return 1;
LABEL_7:
    *a4 = v9;
    return 1;
  }
  v7 = -[AVAssetWriterInputWritingHelper _assetWriterTrack](self, "_assetWriterTrack");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  if ((-[AVFigAssetWriterTrack addCaptionGroup:error:](v7, "addCaptionGroup:error:", a3, &v9) & 1) != 0)
    return 0;
  -[AVAssetWriterInputHelper transitionAssetWriterAndAllInputsToFailedStatusWithError:](self, "transitionAssetWriterAndAllInputsToFailedStatusWithError:", v9);
  if (a4)
    goto LABEL_7;
  return 1;
}

- (void)prepareToEndSession
{
  -[AVFigAssetWriterTrack prepareToEndSession](-[AVAssetWriterInputWritingHelper _assetWriterTrack](self, "_assetWriterTrack"), "prepareToEndSession");
}

- (BOOL)prepareToFinishWritingReturningError:(id *)a3
{
  return -[AVFigAssetWriterTrack markEndOfDataReturningError:](-[AVAssetWriterInputWritingHelper _assetWriterTrack](self, "_assetWriterTrack"), "markEndOfDataReturningError:", a3);
}

- (void)markCurrentPassAsFinished
{
  id v3;
  AVAssetWriterInputMediaDataRequester *mediaDataRequester;
  NSObject *v5;
  AVAssetWriterInputInterPassAnalysisHelper *v6;
  _QWORD block[5];

  v3 = -[AVWeakReference referencedObject](-[AVAssetWriterInputHelper weakReferenceToAssetWriterInput](self, "weakReferenceToAssetWriterInput"), "referencedObject");
  mediaDataRequester = self->_mediaDataRequester;
  if (mediaDataRequester)
  {
    -[AVAssetWriterInputWritingHelper _stopObservingReadyForMoreMediaDataKeyPath](self, "_stopObservingReadyForMoreMediaDataKeyPath");
    -[AVAssetWriterInputMediaDataRequester setDelegate:](mediaDataRequester, "setDelegate:", 0);
    self->_mediaDataRequester = 0;
    v5 = -[AVAssetWriterInputMediaDataRequester requestQueue](mediaDataRequester, "requestQueue");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__AVAssetWriterInputWritingHelper_markCurrentPassAsFinished__block_invoke;
    block[3] = &unk_1E302FA10;
    block[4] = mediaDataRequester;
    dispatch_async(v5, block);
  }
  if (-[AVAssetWriterInputWritingHelper canPerformMultiplePasses](self, "canPerformMultiplePasses"))
  {
    v6 = -[AVAssetWriterInputInterPassAnalysisHelper initWithWritingHelper:]([AVAssetWriterInputInterPassAnalysisHelper alloc], "initWithWritingHelper:", self);
    objc_msgSend(v3, "_setHelper:", v6);
    -[AVAssetWriterInputInterPassAnalysisHelper startPassAnalysis](v6, "startPassAnalysis");
  }
  else
  {
    v6 = -[AVAssetWriterInputNoMorePassesHelper initWithWritingHelper:]([AVAssetWriterInputNoMorePassesHelper alloc], "initWithWritingHelper:", self);
    objc_msgSend(v3, "_setHelper:", v6);
  }

}

void __60__AVAssetWriterInputWritingHelper_markCurrentPassAsFinished__block_invoke(uint64_t a1)
{

}

- (void)markAsFinished
{
  -[AVAssetWriterInputWritingHelper markAsFinishedAndTransitionCurrentHelper:](self, "markAsFinishedAndTransitionCurrentHelper:", self);
}

- (void)markAsFinishedAndTransitionCurrentHelper:(id)a3
{
  uint64_t v4;

  v4 = 0;
  if (-[AVFigAssetWriterTrack markEndOfDataReturningError:](-[AVAssetWriterInputWritingHelper _assetWriterTrack](self, "_assetWriterTrack"), "markEndOfDataReturningError:", &v4))
  {
    objc_msgSend(a3, "transitionToAndReturnTerminalHelperWithTerminalStatus:", 2);
  }
  else
  {
    objc_msgSend(a3, "transitionAssetWriterAndAllInputsToFailedStatusWithError:", v4);
  }
}

- (id)transitionToAndReturnTerminalHelperWithTerminalStatus:(int64_t)a3
{
  id v5;
  void *v6;
  objc_super v8;

  if (self->_mediaDataRequester)
  {
    -[AVAssetWriterInputWritingHelper _stopObservingReadyForMoreMediaDataKeyPath](self, "_stopObservingReadyForMoreMediaDataKeyPath");
    -[AVAssetWriterInputMediaDataRequester setDelegate:](self->_mediaDataRequester, "setDelegate:", 0);
  }
  v8.receiver = self;
  v8.super_class = (Class)AVAssetWriterInputWritingHelper;
  v5 = -[AVAssetWriterInputHelper transitionToAndReturnTerminalHelperWithTerminalStatus:](&v8, sel_transitionToAndReturnTerminalHelperWithTerminalStatus_, a3);
  v6 = v5;
  if (self->_mediaDataRequester)
    objc_msgSend(v5, "requestMediaDataOnceIfNecessaryWithMediaDataRequester:");
  return v6;
}

- (__CVPixelBufferPool)pixelBufferPool
{
  __CVPixelBufferPool **p_pixelBufferPool;
  __CVPixelBufferPool *result;
  const __CFDictionary *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  p_pixelBufferPool = &self->_pixelBufferPool;
  result = self->_pixelBufferPool;
  if (!result)
  {
    result = -[AVFigAssetWriterTrack pixelBufferPool](-[AVAssetWriterInputWritingHelper _assetWriterTrack](self, "_assetWriterTrack"), "pixelBufferPool");
    if (!result)
    {
      result = *p_pixelBufferPool;
      if (!*p_pixelBufferPool)
      {
        -[AVAssetWriterInputHelper sourcePixelBufferAttributes](self, "sourcePixelBufferAttributes");
        if (FigCreatePixelBufferAttributesWithIOSurfaceSupport())
        {
          return 0;
        }
        else
        {
          v6 = (const __CFDictionary *)0;
          if (CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v6, p_pixelBufferPool) == -6682)
          {
            v7 = (void *)MEMORY[0x1E0C99DA0];
            v8 = *MEMORY[0x1E0C99768];
            v9 = (objc_class *)objc_opt_class();
            v15 = (void *)objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, AVMethodExceptionReasonWithClassAndSelector(v9, a2, (uint64_t)CFSTR("A pixel buffer pool cannot be created with the receiver's sourcePixelBufferAttributes. The pixel buffer attributes must specify a width, height, and either a pixel format or a pixel format description."), v10, v11, v12, v13, v14, v16), 0);
            objc_exception_throw(v15);
          }
          return *p_pixelBufferPool;
        }
      }
    }
  }
  return result;
}

- (AVFigAssetWriterTrack)_assetWriterTrack
{
  return self->_assetWriterTrack;
}

- (AVAssetWriterInputPassDescription)currentPassDescription
{
  return self->_currentPassDescription;
}

- (void)setCurrentPassDescription:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

@end

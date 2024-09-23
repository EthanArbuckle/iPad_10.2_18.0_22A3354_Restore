@implementation AVAssetTrack

- (BOOL)hasMediaCharacteristics:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(a3);
      v9 = -[AVAssetTrack hasMediaCharacteristic:](self, "hasMediaCharacteristic:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
      if (!v9)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v9) = 1;
  }
  return v9;
}

- (BOOL)hasMediaCharacteristic:(AVMediaCharacteristic)mediaCharacteristic
{
  return -[NSArray containsObject:](-[AVAssetTrackInspector mediaCharacteristics](self->_track->trackInspector, "mediaCharacteristics"), "containsObject:", mediaCharacteristic);
}

- (CMPersistentTrackID)trackID
{
  return -[AVAssetTrackInspector trackID](self->_track->trackInspector, "trackID");
}

- (id)_initWithAsset:(id)a3 trackID:(int)a4 trackIndex:(int64_t)a5
{
  uint64_t v6;
  AVAssetTrack *v8;
  AVAssetTrackInspector *v9;
  AVAssetTrackInspector *v10;
  AVAssetTrackInternal *v11;
  objc_super v13;

  v6 = *(_QWORD *)&a4;
  v13.receiver = self;
  v13.super_class = (Class)AVAssetTrack;
  v8 = -[AVAssetTrack init](&v13, sel_init);
  if (v8)
  {
    v9 = +[AVAssetTrackInspector assetTrackInspectorWithAsset:trackID:trackIndex:](AVAssetTrackInspector, "assetTrackInspectorWithAsset:trackID:trackIndex:", a3, v6, a5);
    if (v9 && (v10 = v9, v11 = objc_alloc_init(AVAssetTrackInternal), (v8->_track = v11) != 0))
    {
      CFRetain(v11);
      v8->_track->trackInspector = v10;
      v8->_track->assetWeakReference = (AVWeakReference *)(id)objc_msgSend(a3, "_weakReference");
      v8->_track->weakReferenceToSelf = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v8);
      -[AVAssetTrack _startListeningToFigAssetTrackNotifications](v8, "_startListeningToFigAssetTrackNotifications");
    }
    else
    {

      return 0;
    }
  }
  return v8;
}

- (void)_startListeningToFigAssetTrackNotifications
{
  OpaqueFigAssetTrack *v3;
  id v4;
  const void *v5;

  v3 = -[AVAssetTrack _figAssetTrack](self, "_figAssetTrack");
  v4 = -[AVAssetTrack _weakReference](self, "_weakReference");
  if (v3)
  {
    v5 = v4;
    if (v4)
    {
      self->_track->figAssetTrackNotificationSource = (OpaqueFigAssetTrack *)CFRetain(v3);
      self->_track->figAssetTrackNotificationListenerWeakReference = (AVWeakReference *)CFRetain(v5);
      objc_msgSend(+[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "addListenerWithWeakReference:callback:name:object:flags:", self->_track->figAssetTrackNotificationListenerWeakReference, assetTrackNotificationHandler, *MEMORY[0x1E0CC3C00], self->_track->figAssetTrackNotificationSource, 0);
    }
  }
}

- (id)_weakReference
{
  return self->_track->weakReferenceToSelf;
}

- (OpaqueFigAssetTrack)_figAssetTrack
{
  return -[AVAssetTrackInspector _figAssetTrack](self->_track->trackInspector, "_figAssetTrack");
}

- (AVMediaType)mediaType
{
  return -[AVAssetTrackInspector mediaType](self->_track->trackInspector, "mediaType");
}

- (id)_initWithAsset:(id)a3 trackIndex:(int64_t)a4
{
  return -[AVAssetTrack _initWithAsset:trackID:trackIndex:](self, "_initWithAsset:trackID:trackIndex:", a3, 0, a4);
}

- (id)_initWithAsset:(id)a3 trackID:(int)a4
{
  return -[AVAssetTrack _initWithAsset:trackID:trackIndex:](self, "_initWithAsset:trackID:trackIndex:", a3, *(_QWORD *)&a4, -1);
}

- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4
{
  return -[AVAssetTrackInspector statusOfValueForKey:error:](self->_track->trackInspector, "statusOfValueForKey:error:", a3, a4);
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4
{
  -[AVAssetTrackInspector loadValuesAsynchronouslyForKeys:completionHandler:](self->_track->trackInspector, "loadValuesAsynchronouslyForKeys:completionHandler:", a3, a4);
}

- (BOOL)isEnabled
{
  return -[AVAssetTrackInspector isEnabled](self->_track->trackInspector, "isEnabled");
}

- (NSArray)formatDescriptions
{
  return -[AVAssetTrackInspector formatDescriptions](self->_track->trackInspector, "formatDescriptions");
}

- (void)dealloc
{
  objc_super v3;

  if (self->_track)
  {
    -[AVAssetTrack _stopListeningToFigAssetTrackNotifications](self, "_stopListeningToFigAssetTrackNotifications");

    CFRelease(self->_track);
  }
  v3.receiver = self;
  v3.super_class = (Class)AVAssetTrack;
  -[AVAssetTrack dealloc](&v3, sel_dealloc);
}

- (void)_stopListeningToFigAssetTrackNotifications
{
  AVAssetTrackInternal *track;
  AVWeakReference *figAssetTrackNotificationListenerWeakReference;
  OpaqueFigAssetTrack *figAssetTrackNotificationSource;

  track = self->_track;
  if (track->figAssetTrackNotificationSource && track->figAssetTrackNotificationListenerWeakReference)
  {
    objc_msgSend(+[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "removeListenerWithWeakReference:callback:name:object:", self->_track->figAssetTrackNotificationListenerWeakReference, assetTrackNotificationHandler, *MEMORY[0x1E0CC3C00], self->_track->figAssetTrackNotificationSource);
    track = self->_track;
  }
  figAssetTrackNotificationListenerWeakReference = track->figAssetTrackNotificationListenerWeakReference;
  if (figAssetTrackNotificationListenerWeakReference)
  {
    CFRelease(figAssetTrackNotificationListenerWeakReference);
    self->_track->figAssetTrackNotificationListenerWeakReference = 0;
    track = self->_track;
  }
  figAssetTrackNotificationSource = track->figAssetTrackNotificationSource;
  if (figAssetTrackNotificationSource)
  {
    CFRelease(figAssetTrackNotificationSource);
    self->_track->figAssetTrackNotificationSource = 0;
  }
}

+ (id)mediaCharacteristicsForMediaTypes
{
  if (mediaCharacteristicsForMediaTypes_onceToken != -1)
    dispatch_once(&mediaCharacteristicsForMediaTypes_onceToken, &__block_literal_global_3);
  return (id)mediaCharacteristicsForMediaTypes_sMediaCharacteristicsForMediaTypes;
}

void __49__AVAssetTrack_mediaCharacteristicsForMediaTypes__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (!mediaCharacteristicsForMediaTypes_sMediaCharacteristicsForMediaTypes)
  {
    v6 = (void *)MEMORY[0x1E0C99D80];
    v5 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("AVMediaCharacteristicVisual"), CFSTR("AVMediaCharacteristicFrameBased"), 0);
    v4 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("AVMediaCharacteristicAudible"), 0);
    v0 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("AVMediaCharacteristicVisual"), CFSTR("AVMediaCharacteristicLegible"), CFSTR("AVMediaCharacteristicFrameBased"), 0);
    v1 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("AVMediaCharacteristicVisual"), CFSTR("AVMediaCharacteristicLegible"), 0);
    v2 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("AVMediaCharacteristicVisual"), CFSTR("AVMediaCharacteristicLegible"), CFSTR("AVMediaCharacteristicFrameBased"), 0);
    v3 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("AVMediaCharacteristicVisual"), 0);
    mediaCharacteristicsForMediaTypes_sMediaCharacteristicsForMediaTypes = (uint64_t)(id)objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v5, CFSTR("vide"), v4, CFSTR("soun"), v0, CFSTR("text"), v1, CFSTR("clcp"), v2, CFSTR("sbtl"), v3, CFSTR("tmcd"), objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("AVMediaCharacteristicFrameBased"), 0), CFSTR("meta"), 0);
  }
}

- (AVAssetTrack)init
{
  return (AVAssetTrack *)-[AVAssetTrack _initWithAsset:trackID:trackIndex:](self, "_initWithAsset:trackID:trackIndex:", 0, 0, -1);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, trackID = %d, mediaType = %@>"), NSStringFromClass(v4), self, -[AVAssetTrack trackID](self, "trackID"), -[AVAssetTrack mediaType](self, "mediaType"));
}

- (AVAsset)asset
{
  return (AVAsset *)-[AVWeakReference referencedObject](self->_track->assetWeakReference, "referencedObject");
}

- (id)_assetTrackInspector
{
  return self->_track->trackInspector;
}

- (OpaqueFigTrackReader)_figTrackReader
{
  return -[AVAssetTrackInspector _figTrackReader](self->_track->trackInspector, "_figTrackReader");
}

- (OpaqueFigFormatReader)_figFormatReader
{
  return -[AVAssetTrackInspector _figFormatReader](self->_track->trackInspector, "_figFormatReader");
}

- (int64_t)statusOfValueForKey:(id)a3
{
  return -[AVAssetTrack statusOfValueForKey:error:](self, "statusOfValueForKey:error:", a3, 0);
}

- (BOOL)isPlayable
{
  return -[AVAssetTrackInspector isPlayable](self->_track->trackInspector, "isPlayable");
}

- (BOOL)isDecodable
{
  return -[AVAssetTrackInspector isDecodable](self->_track->trackInspector, "isDecodable");
}

- (int)playabilityValidationResult
{
  return -[AVAssetTrackInspector playabilityValidationResult](self->_track->trackInspector, "playabilityValidationResult");
}

- (BOOL)isSelfContained
{
  return -[AVAssetTrackInspector isSelfContained](self->_track->trackInspector, "isSelfContained");
}

- (uint64_t)totalSampleDataLength
{
  return -[AVAssetTrackInspector totalSampleDataLength](self->_track->trackInspector, "totalSampleDataLength");
}

- (BOOL)_subtitleFormatDescriptionMatchesTextDisplayFlags:(unsigned int)a3 flagsMask:(unsigned int)a4
{
  _BOOL4 v7;
  NSArray *v8;
  const opaqueCMFormatDescription *v9;
  CMMediaType MediaType;
  BOOL v11;
  CMTextDisplayFlags displayFlagsOut;

  v7 = -[NSString isEqualToString:](-[AVAssetTrack mediaType](self, "mediaType"), "isEqualToString:", CFSTR("sbtl"));
  if (v7)
  {
    v8 = -[AVAssetTrack formatDescriptions](self, "formatDescriptions");
    if (-[NSArray count](v8, "count") == 1)
    {
      displayFlagsOut = 0;
      v9 = -[NSArray objectAtIndex:](v8, "objectAtIndex:", 0);
      MediaType = CMFormatDescriptionGetMediaType(v9);
      LOBYTE(v7) = 0;
      if (MediaType == 1935832172)
      {
        if (CMTextFormatDescriptionGetDisplayFlags(v9, &displayFlagsOut))
          v11 = 0;
        else
          v11 = (displayFlagsOut & a4) == a3;
        LOBYTE(v7) = v11;
      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (id)mediaCharacteristics
{
  return -[AVAssetTrackInspector mediaCharacteristics](self->_track->trackInspector, "mediaCharacteristics");
}

- (CMTimeRange)timeRange
{
  CMTimeRange *result;

  result = (CMTimeRange *)self->_track->trackInspector;
  if (result)
    return (CMTimeRange *)-[CMTimeRange timeRange](result, "timeRange");
  *(_OWORD *)&retstr->start.epoch = 0u;
  *(_OWORD *)&retstr->duration.timescale = 0u;
  *(_OWORD *)&retstr->start.value = 0u;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)uneditedDuration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_track->trackInspector;
  if (result)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE uneditedDuration](result, "uneditedDuration");
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- ($1CE2C3FC342086196D07C2B4E8C70800)mediaPresentationTimeRange
{
  $1CE2C3FC342086196D07C2B4E8C70800 *result;

  result = ($1CE2C3FC342086196D07C2B4E8C70800 *)self->_track->trackInspector;
  if (result)
    return ($1CE2C3FC342086196D07C2B4E8C70800 *)-[$1CE2C3FC342086196D07C2B4E8C70800 mediaPresentationTimeRange](result, "mediaPresentationTimeRange");
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  return result;
}

- ($1CE2C3FC342086196D07C2B4E8C70800)mediaDecodeTimeRange
{
  $1CE2C3FC342086196D07C2B4E8C70800 *result;

  result = ($1CE2C3FC342086196D07C2B4E8C70800 *)self->_track->trackInspector;
  if (result)
    return ($1CE2C3FC342086196D07C2B4E8C70800 *)-[$1CE2C3FC342086196D07C2B4E8C70800 mediaDecodeTimeRange](result, "mediaDecodeTimeRange");
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)latentBaseDecodeTimeStampOfFirstTrackFragment
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_track->trackInspector;
  if (result)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE latentBaseDecodeTimeStampOfFirstTrackFragment](result, "latentBaseDecodeTimeStampOfFirstTrackFragment");
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- (BOOL)requiresFrameReordering
{
  return -[AVAssetTrackInspector requiresFrameReordering](self->_track->trackInspector, "requiresFrameReordering");
}

- (BOOL)hasAudioSampleDependencies
{
  return -[AVAssetTrackInspector hasAudioSampleDependencies](self->_track->trackInspector, "hasAudioSampleDependencies");
}

- (CMTimeScale)naturalTimeScale
{
  return -[AVAssetTrackInspector naturalTimeScale](self->_track->trackInspector, "naturalTimeScale");
}

- (float)estimatedDataRate
{
  float result;

  -[AVAssetTrackInspector estimatedDataRate](self->_track->trackInspector, "estimatedDataRate");
  return result;
}

- (float)peakDataRate
{
  float result;

  -[AVAssetTrackInspector peakDataRate](self->_track->trackInspector, "peakDataRate");
  return result;
}

- (NSString)languageCode
{
  return -[AVAssetTrackInspector languageCode](self->_track->trackInspector, "languageCode");
}

- (NSString)extendedLanguageTag
{
  return -[AVAssetTrackInspector extendedLanguageTag](self->_track->trackInspector, "extendedLanguageTag");
}

- (id)locale
{
  return -[AVAssetTrackInspector locale](self->_track->trackInspector, "locale");
}

- (CGSize)naturalSize
{
  double v2;
  double v3;
  CGSize result;

  -[AVAssetTrackInspector naturalSize](self->_track->trackInspector, "naturalSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)dimensions
{
  double v2;
  double v3;
  CGSize result;

  -[AVAssetTrackInspector dimensions](self->_track->trackInspector, "dimensions");
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGAffineTransform)preferredTransform
{
  CGAffineTransform *result;

  result = (CGAffineTransform *)self->_track->trackInspector;
  if (result)
    return (CGAffineTransform *)-[CGAffineTransform preferredTransform](result, "preferredTransform");
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (int64_t)layer
{
  return -[AVAssetTrackInspector layer](self->_track->trackInspector, "layer");
}

- (float)preferredVolume
{
  float result;

  -[AVAssetTrackInspector preferredVolume](self->_track->trackInspector, "preferredVolume");
  return result;
}

- (id)loudnessInfo
{
  return -[AVAssetTrackInspector loudnessInfo](self->_track->trackInspector, "loudnessInfo");
}

- (float)nominalFrameRate
{
  float result;

  -[AVAssetTrackInspector nominalFrameRate](self->_track->trackInspector, "nominalFrameRate");
  return result;
}

- (CMTime)minFrameDuration
{
  AVAssetTrackInspector *trackInspector;
  CMTime *result;
  CMTimeEpoch v7;
  uint64_t v8;

  trackInspector = self->_track->trackInspector;
  if (trackInspector)
    -[AVAssetTrackInspector minSampleDuration](trackInspector, "minSampleDuration");
  result = (CMTime *)objc_msgSend((id)objc_msgSend(+[AVAssetTrack mediaCharacteristicsForMediaTypes](AVAssetTrack, "mediaCharacteristicsForMediaTypes"), "objectForKey:", -[AVAssetTrack mediaType](self, "mediaType")), "containsObject:", CFSTR("AVMediaCharacteristicFrameBased"));
  if ((_DWORD)result)
  {
    *(_OWORD *)&retstr->value = 0uLL;
    v7 = 0;
  }
  else
  {
    v8 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&retstr->value = *MEMORY[0x1E0CA2E18];
    v7 = *(_QWORD *)(v8 + 16);
  }
  retstr->epoch = v7;
  return result;
}

- (NSArray)segments
{
  return -[AVAssetTrackInspector segments](self->_track->trackInspector, "segments");
}

- (AVAssetTrackSegment)segmentForTrackTime:(CMTime *)trackTime
{
  AVAssetTrackInspector *trackInspector;
  CMTime v5;

  trackInspector = self->_track->trackInspector;
  v5 = *trackTime;
  return (AVAssetTrackSegment *)-[AVAssetTrackInspector segmentForTrackTime:](trackInspector, "segmentForTrackTime:", &v5);
}

- (void)loadSegmentForTrackTime:(CMTime *)trackTime completionHandler:(void *)completionHandler
{
  _QWORD v4[6];
  CMTime v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__AVAssetTrack_loadSegmentForTrackTime_completionHandler___block_invoke;
  v4[3] = &unk_1E3031160;
  v5 = *trackTime;
  v4[4] = self;
  v4[5] = completionHandler;
  AVLoadValueAsynchronously(self, (uint64_t)CFSTR("segments"), (uint64_t)v4);
}

uint64_t __58__AVAssetTrack_loadSegmentForTrackTime_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  __int128 v5;
  uint64_t v6;

  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = *(void **)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v4, "segmentForTrackTime:", &v5);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)segmentsExcludeAudioPrimingAndRemainderDurations
{
  return -[AVAssetTrackInspector segmentsExcludeAudioPrimingAndRemainderDurations](self->_track->trackInspector, "segmentsExcludeAudioPrimingAndRemainderDurations");
}

- ($1CE2C3FC342086196D07C2B4E8C70800)gaplessSourceTimeRange
{
  $1CE2C3FC342086196D07C2B4E8C70800 *result;

  result = ($1CE2C3FC342086196D07C2B4E8C70800 *)self->_track->trackInspector;
  if (result)
    return ($1CE2C3FC342086196D07C2B4E8C70800 *)-[$1CE2C3FC342086196D07C2B4E8C70800 gaplessSourceTimeRange](result, "gaplessSourceTimeRange");
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  return result;
}

- (id)segmentsAsPresented
{
  return -[AVAssetTrackInspector segmentsAsPresented](self->_track->trackInspector, "segmentsAsPresented");
}

- (CMTime)samplePresentationTimeForTrackTime:(SEL)a3
{
  CMTime *result;
  CMTime v5;

  result = (CMTime *)self->_track->trackInspector;
  if (result)
  {
    v5 = *trackTime;
    return (CMTime *)-[CMTime samplePresentationTimeForTrackTime:](result, "samplePresentationTimeForTrackTime:", &v5);
  }
  else
  {
    retstr->value = 0;
    *(_QWORD *)&retstr->timescale = 0;
    retstr->epoch = 0;
  }
  return result;
}

- (void)loadSamplePresentationTimeForTrackTime:(CMTime *)trackTime completionHandler:(void *)completionHandler
{
  _QWORD v4[6];
  CMTime v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__AVAssetTrack_loadSamplePresentationTimeForTrackTime_completionHandler___block_invoke;
  v4[3] = &unk_1E3031160;
  v5 = *trackTime;
  v4[4] = self;
  v4[5] = completionHandler;
  AVLoadValueAsynchronously(self, (uint64_t)CFSTR("segments"), (uint64_t)v4);
}

uint64_t __73__AVAssetTrack_loadSamplePresentationTimeForTrackTime_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, __int128 *, uint64_t);
  void *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, __int128 *, _QWORD);
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(uint64_t (**)(uint64_t, __int128 *, uint64_t))(v3 + 16);
    v11 = *MEMORY[0x1E0CA2E18];
    v12 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    return v4(v3, &v11, a2);
  }
  else
  {
    v11 = 0uLL;
    v12 = 0;
    v6 = *(void **)(a1 + 32);
    if (v6)
    {
      v9 = *(_OWORD *)(a1 + 48);
      v10 = *(_QWORD *)(a1 + 64);
      objc_msgSend(v6, "samplePresentationTimeForTrackTime:", &v9);
    }
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD))(v7 + 16);
    v9 = v11;
    v10 = v12;
    return v8(v7, &v9, 0);
  }
}

- (NSArray)commonMetadata
{
  return -[AVAssetTrackInspector commonMetadata](self->_track->trackInspector, "commonMetadata");
}

- (NSArray)availableMetadataFormats
{
  NSArray *v2;

  v2 = -[AVAssetTrackInspector availableMetadataFormats](self->_track->trackInspector, "availableMetadataFormats");
  if (+[AVMetadataItem _clientExpectsISOUserDataKeysInQuickTimeUserDataKeySpace](AVMetadataItem, "_clientExpectsISOUserDataKeysInQuickTimeUserDataKeySpace")&& -[NSArray containsObject:](v2, "containsObject:", CFSTR("org.mp4ra")))
  {
    return -[NSArray arrayByAddingObject:](v2, "arrayByAddingObject:", CFSTR("com.apple.quicktime.udta"));
  }
  else
  {
    return v2;
  }
}

- (NSArray)metadataForFormat:(AVMetadataFormat)format
{
  NSArray *v5;

  v5 = -[AVAssetTrackInspector metadataForFormat:](self->_track->trackInspector, "metadataForFormat:");
  if (+[AVMetadataItem _clientExpectsISOUserDataKeysInQuickTimeUserDataKeySpace](AVMetadataItem, "_clientExpectsISOUserDataKeysInQuickTimeUserDataKeySpace")&& -[NSString isEqualToString:](format, "isEqualToString:", CFSTR("com.apple.quicktime.udta")))
  {
    return -[NSArray arrayByAddingObjectsFromArray:](v5, "arrayByAddingObjectsFromArray:", +[AVMetadataItem _replaceQuickTimeUserDataKeySpaceWithISOUserDataKeySpaceIfRequired:](AVMetadataItem, "_replaceQuickTimeUserDataKeySpaceWithISOUserDataKeySpaceIfRequired:", -[NSArray arrayByAddingObjectsFromArray:](v5, "arrayByAddingObjectsFromArray:", -[AVAssetTrackInspector metadataForFormat:](self->_track->trackInspector, "metadataForFormat:", CFSTR("org.mp4ra")))));
  }
  else
  {
    return v5;
  }
}

- (void)loadMetadataForFormat:(AVMetadataFormat)format completionHandler:(void *)completionHandler
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__AVAssetTrack_loadMetadataForFormat_completionHandler___block_invoke;
  v4[3] = &unk_1E3030E88;
  v4[4] = self;
  v4[5] = format;
  v4[6] = completionHandler;
  AVLoadValueAsynchronously(self, (uint64_t)CFSTR("availableMetadataFormats"), (uint64_t)v4);
}

uint64_t __56__AVAssetTrack_loadMetadataForFormat_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t (*v3)(void);

  if (a2)
  {
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "metadataForFormat:", *(_QWORD *)(a1 + 40));
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  return v3();
}

- (NSArray)metadata
{
  NSArray *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = -[AVAssetTrack availableMetadataFormats](self, "availableMetadataFormats");
  v4 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        -[NSArray addObjectsFromArray:](v4, "addObjectsFromArray:", -[AVAssetTrack metadataForFormat:](self, "metadataForFormat:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++)));
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return v4;
}

- (int64_t)alternateGroupID
{
  return -[AVAssetTrackInspector alternateGroupID](self->_track->trackInspector, "alternateGroupID");
}

- (int64_t)defaultAlternateGroupID
{
  return -[AVAssetTrackInspector defaultAlternateGroupID](self->_track->trackInspector, "defaultAlternateGroupID");
}

- (int64_t)provisionalAlternateGroupID
{
  return -[AVAssetTrackInspector provisionalAlternateGroupID](self->_track->trackInspector, "provisionalAlternateGroupID");
}

- (BOOL)isExcludedFromAutoselectionInTrackGroup
{
  return -[AVAssetTrackInspector isExcludedFromAutoselectionInTrackGroup](self->_track->trackInspector, "isExcludedFromAutoselectionInTrackGroup");
}

- (id)_firstAssociatedTrackWithAssociationType:(id)a3
{
  NSArray *v3;
  id result;

  v3 = -[AVAssetTrack associatedTracksOfType:](self, "associatedTracksOfType:", a3);
  result = -[NSArray count](v3, "count");
  if (result)
    return -[NSArray objectAtIndex:](v3, "objectAtIndex:", 0);
  return result;
}

- (id)_fallbackTrack
{
  return -[AVAssetTrack _firstAssociatedTrackWithAssociationType:](self, "_firstAssociatedTrackWithAssociationType:", CFSTR("fall"));
}

- (id)_pairedForcedOnlySubtitlesTrack
{
  return -[AVAssetTrack _firstAssociatedTrackWithAssociationType:](self, "_firstAssociatedTrackWithAssociationType:", CFSTR("forc"));
}

+ (BOOL)expectsPropertyRevisedNotifications
{
  return 1;
}

- (id)_trackReferences
{
  return -[AVAssetTrackInspector _trackReferences](self->_track->trackInspector, "_trackReferences");
}

- (BOOL)hasProtectedContent
{
  return -[AVAssetTrackInspector hasProtectedContent](self->_track->trackInspector, "hasProtectedContent");
}

- (BOOL)hasAudibleBooksContent
{
  return -[AVAssetTrackInspector hasAudibleBooksContent](self->_track->trackInspector, "hasAudibleBooksContent");
}

- (BOOL)isAudibleBooksContentAuthorized
{
  return -[AVAssetTrackInspector isAudibleBooksContentAuthorized](self->_track->trackInspector, "isAudibleBooksContentAuthorized");
}

- (BOOL)hasSeamSamples
{
  return -[AVAssetTrackInspector hasSeamSamples](self->_track->trackInspector, "hasSeamSamples");
}

- (NSArray)availableTrackAssociationTypes
{
  return (NSArray *)objc_msgSend(-[AVAssetTrack _trackReferences](self, "_trackReferences"), "allKeys");
}

- (NSArray)associatedTracksOfType:(AVTrackAssociationType)trackAssociationType
{
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  AVAssetTrack *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(-[AVAssetTrack _trackReferences](self, "_trackReferences"), "objectForKey:", trackAssociationType);
  if (!v4)
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v5 = v4;
  v6 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v11 = -[AVAsset trackWithTrackID:](-[AVAssetTrack asset](self, "asset"), "trackWithTrackID:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "intValue"));
        if (v11)
          -[NSArray addObject:](v6, "addObject:", v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  if (!v6)
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  return v6;
}

- (void)loadAssociatedTracksOfType:(AVTrackAssociationType)trackAssociationType completionHandler:(void *)completionHandler
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__AVAssetTrack_loadAssociatedTracksOfType_completionHandler___block_invoke;
  v4[3] = &unk_1E3030E88;
  v4[4] = self;
  v4[5] = trackAssociationType;
  v4[6] = completionHandler;
  AVLoadValueAsynchronously(self, (uint64_t)CFSTR("availableTrackAssociationTypes"), (uint64_t)v4);
}

uint64_t __61__AVAssetTrack_loadAssociatedTracksOfType_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t (*v3)(void);

  if (a2)
  {
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "associatedTracksOfType:", *(_QWORD *)(a1 + 40));
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  return v3();
}

- (BOOL)canProvideSampleCursors
{
  return -[AVAssetTrackInspector canProvideSampleCursors](self->_track->trackInspector, "canProvideSampleCursors");
}

- (AVSampleCursor)makeSampleCursorWithPresentationTimeStamp:(CMTime *)presentationTimeStamp
{
  AVAssetTrackInspector *trackInspector;
  CMTime v5;

  trackInspector = self->_track->trackInspector;
  v5 = *presentationTimeStamp;
  return (AVSampleCursor *)-[AVAssetTrackInspector makeSampleCursorWithPresentationTimeStamp:](trackInspector, "makeSampleCursorWithPresentationTimeStamp:", &v5);
}

- (AVSampleCursor)makeSampleCursorAtFirstSampleInDecodeOrder
{
  return (AVSampleCursor *)-[AVAssetTrackInspector makeSampleCursorAtFirstSampleInDecodeOrder](self->_track->trackInspector, "makeSampleCursorAtFirstSampleInDecodeOrder");
}

- (AVSampleCursor)makeSampleCursorAtLastSampleInDecodeOrder
{
  return (AVSampleCursor *)-[AVAssetTrackInspector makeSampleCursorAtLastSampleInDecodeOrder](self->_track->trackInspector, "makeSampleCursorAtLastSampleInDecodeOrder");
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(-[AVAssetTrack _assetTrackInspector](self, "_assetTrackInspector"), "isEqual:", objc_msgSend(a3, "_assetTrackInspector"));
  else
    return 0;
}

- (unint64_t)hash
{
  return -[AVAssetTrackInspector hash](self->_track->trackInspector, "hash");
}

+ (id)keyPathsForValuesAffectingTimeRange
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("segments"), 0);
}

- (BOOL)_hasMultipleEdits
{
  return -[NSArray count](-[AVAssetTrack segments](self, "segments"), "count") > 1;
}

- (BOOL)_hasScaledEdits
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[4];
  CMTime time2;
  __int128 v11;
  _OWORD v12[5];
  CMTime time1;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = -[AVAssetTrack segments](self, "segments");
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v6);
        if (v7)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v6), "timeMapping");
          time1 = *(CMTime *)((char *)v12 + 8);
          objc_msgSend(v7, "timeMapping");
        }
        else
        {
          v11 = 0u;
          memset(v12, 0, sizeof(v12));
          *(_OWORD *)&time1.value = *(_OWORD *)((char *)v12 + 8);
          time1.epoch = 0;
          memset(v9, 0, sizeof(v9));
        }
        time2 = *(CMTime *)&v9[1];
        if (CMTimeCompare(&time1, &time2))
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }
  return v3;
}

- (BOOL)_hasEmptyEdits
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  char v9;
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
  v2 = -[AVAssetTrack segments](self, "segments");
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (v7)
        {
          objc_msgSend(v7, "timeMapping");
          if ((v9 & 1) != 0)
            continue;
        }
        LOBYTE(v3) = 1;
        return v3;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      LOBYTE(v3) = 0;
      if (v4)
        continue;
      break;
    }
  }
  return v3;
}

- (BOOL)_hasMultipleDistinctFormatDescriptions
{
  NSArray *v2;
  unint64_t v3;
  const opaqueCMFormatDescription *v4;
  const opaqueCMFormatDescription *v5;
  BOOL v6;
  uint64_t v7;
  unint64_t v8;
  int v9;

  v2 = -[AVAssetTrack formatDescriptions](self, "formatDescriptions");
  v3 = -[NSArray count](v2, "count");
  v4 = -[NSArray firstObject](v2, "firstObject");
  if (v3 < 2)
    return 0;
  v5 = v4;
  v6 = 1;
  if (CMFormatDescriptionEqual((CMFormatDescriptionRef)-[NSArray objectAtIndex:](v2, "objectAtIndex:", 1), v4))
  {
    v7 = 2;
    do
    {
      v8 = v7;
      if (v3 == v7)
        break;
      v9 = CMFormatDescriptionEqual((CMFormatDescriptionRef)-[NSArray objectAtIndex:](v2, "objectAtIndex:", v7), v5);
      v7 = v8 + 1;
    }
    while (v9);
    return v8 < v3;
  }
  return v6;
}

- (BOOL)_firstFormatDescriptionIsLPCM
{
  NSArray *v2;
  uint64_t v3;

  v2 = -[AVAssetTrack formatDescriptions](self, "formatDescriptions");
  v3 = -[NSArray count](v2, "count");
  if (v3)
    LOBYTE(v3) = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)-[NSArray firstObject](v2, "firstObject")) == 1819304813;
  return v3;
}

- (BOOL)isDefunct
{
  return objc_msgSend(-[AVAssetTrack _assetTrackInspector](self, "_assetTrackInspector"), "_isDefunct");
}

@end

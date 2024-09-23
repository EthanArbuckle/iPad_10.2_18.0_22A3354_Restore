@implementation BWQuickTimeMovieFileSinkNode

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWQuickTimeMovieFileSinkNode;
  -[BWSinkNode configurationWithID:updatedFormat:didBecomeLiveForInput:](&v5, sel_configurationWithID_updatedFormat_didBecomeLiveForInput_, a3, a4, a5);
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  BWMovingWindowStats *v3;
  objc_super v4;

  self->_gmLoggingPreamble = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%p"), self);
  self->_limitedGMErrorLogger = -[BWLimitedGMErrorLogger initWithName:maxLoggingCount:]([BWLimitedGMErrorLogger alloc], "initWithName:maxLoggingCount:", self->_gmLoggingPreamble, 10);
  v3 = -[BWMovingWindowStats initWithWindowSize:]([BWMovingWindowStats alloc], "initWithWindowSize:", 128);
  self->_capturePipelineLatencyStats = v3;
  -[BWStats setMultiplier:](v3, "setMultiplier:", 0.000001);
  -[BWStats setUnitDesignator:](self->_capturePipelineLatencyStats, "setUnitDesignator:", CFSTR("ms"));
  v4.receiver = self;
  v4.super_class = (Class)BWQuickTimeMovieFileSinkNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v4, sel_prepareForCurrentConfigurationToBecomeLive);
}

- (void)setIrisStillImageMovieMetadataCache:(id)a3
{
  BWIrisStillImageMovieMetadataCache *irisStillImageMovieMetadataCache;

  irisStillImageMovieMetadataCache = self->_irisStillImageMovieMetadataCache;
  if (irisStillImageMovieMetadataCache != a3)
  {

    self->_irisStillImageMovieMetadataCache = (BWIrisStillImageMovieMetadataCache *)a3;
  }
}

- (void)setupRingBufferForStabilizedTrajectoryHomographies:(int)a3
{
  BWObjectRingBuffer *v4;

  if (self->_irisStabilizedTrajectoryHomographyRingBuffer)
    -[BWQuickTimeMovieFileSinkNode setupRingBufferForStabilizedTrajectoryHomographies:].cold.1();
  if (a3 >= 1)
  {
    v4 = -[BWObjectRingBuffer initWithCapacity:]([BWObjectRingBuffer alloc], "initWithCapacity:", *(_QWORD *)&a3);
    self->_irisStabilizedTrajectoryHomographyRingBuffer = v4;
    -[BWObjectRingBuffer setEnforceAscending:](v4, "setEnforceAscending:", 1);
  }
}

- (void)setVideoOrientationTimeMachine:(id)a3
{
  BWVideoOrientationTimeMachine *videoOrientationTimeMachine;

  videoOrientationTimeMachine = self->_videoOrientationTimeMachine;
  if (videoOrientationTimeMachine != a3)
  {

    self->_videoOrientationTimeMachine = (BWVideoOrientationTimeMachine *)a3;
  }
}

- (void)setTrackReferenceListForMetadataInputs:(id)a3
{
  -[BWQuickTimeMovieFileSinkNode _setTrackReferenceListForMetadataInputs:inOutTrackReferenceListForMetadataInputs:]((uint64_t)self, a3, (id *)&self->_trackReferenceListForMetadataInputs);
}

- (void)setStructuralDependentTrackReferenceListForMetadataInputs:(id)a3
{
  -[BWQuickTimeMovieFileSinkNode _validateTrackReferenceListForInputs:ofType:]((uint64_t)self, a3, (uint64_t)CFSTR("structural dependent metadata"));
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);

  self->_structuralDependentTrackReferenceListForMetadataInputs = (NSArray *)objc_msgSend(a3, "copy");
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
}

- (void)setStereoVideoCaptureEnabled:(BOOL)a3
{
  self->_stereoVideoCaptureEnabled = a3;
}

- (void)setPipelineTraceID:(int)a3
{
  self->_pipelineTraceID = a3;
}

- (void)setMaximumAllowedInFlightCompressedBytes:(int64_t)a3
{
  self->_maximumAllowedInFlightCompressedBytes = a3;
}

- (void)setIrisSampleReferenceMoviesEnabled:(BOOL)a3
{
  self->_irisSampleReferenceMoviesEnabled = a3;
}

- (void)setIrisMotionAnalysisRingBuffer:(id)a3
{

  self->_irisMotionAnalysisRingBuffer = (BWInferenceResultRingBuffers *)a3;
}

- (void)setClientApplicationID:(id)a3
{
  if (!-[NSString isEqualToString:](self->_clientApplicationID, "isEqualToString:"))
  {

    self->_clientApplicationID = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (void)setCinematicVideoEnabled:(BOOL)a3
{
  self->_cinematicVideoEnabled = a3;
}

- (BWQuickTimeMovieFileSinkNode)initWithNumberOfVideoInputs:(unint64_t)a3 numberOfAuxiliaryPictureInputs:(unint64_t)a4 numberOfAudioInputs:(unint64_t)a5 numberOfMetadataInputs:(unint64_t)a6 cameraInfoByPortType:(id)a7 pipelineIndex:(unint64_t)a8 sinkID:(id)a9
{
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  void *v17;
  uint64_t i;
  BWNodeInput *v19;
  BWVideoFormatRequirements *v20;
  BWNodeInput *v21;
  BWVideoFormatRequirements *v22;
  unint64_t v23;
  BWNodeInput *v24;
  BWNodeInput *v25;
  size_t v26;
  _OWORD *v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  uint64_t j;
  double v39;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t k;
  size_t v48;
  unint64_t v49;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  CMTime v60;
  objc_super v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v9 = a4 + a3;
  v10 = a6 + a5;
  v11 = a6 + a5 + a4 + a3;
  if (!v11)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Need at least 1 input"), 0));
  v13 = a6;
  v14 = a4;
  v15 = a3;
  v61.receiver = self;
  v61.super_class = (Class)BWQuickTimeMovieFileSinkNode;
  v16 = -[BWSinkNode initWithSinkID:](&v61, sel_initWithSinkID_, a9);
  if (v16)
  {
    v48 = v11;
    v49 = a8;
    v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v10 + v15);
    if (v15)
    {
      for (i = 0; i != v15; ++i)
      {
        v19 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v16, i);
        v20 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWNodeInput setFormatRequirements:](v19, "setFormatRequirements:", v20);

        objc_msgSend(v16, "addInput:", v19);
        objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0));

      }
    }
    for (; v14; --v14)
    {
      v21 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1635088502, v16, v15);
      v22 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWNodeInput setFormatRequirements:](v21, "setFormatRequirements:", v22);

      objc_msgSend(v16, "addInput:", v21);
      objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0));
      ++v15;

    }
    if (a5)
    {
      v23 = a5;
      do
      {
        v24 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1936684398, v16, v15);
        objc_msgSend(v16, "addInput:", v24);
        objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0));
        ++v15;

        --v23;
      }
      while (v23);
    }
    for (; v13; --v13)
    {
      v25 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1835365473, v16, v15);
      objc_msgSend(v16, "addInput:", v25);
      objc_msgSend(v17, "addObject:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0));
      ++v15;

    }
    *((_QWORD *)v16 + 196) = v15;
    *((_QWORD *)v16 + 88) = 0;
    v26 = v48 + 1;
    *((_QWORD *)v16 + 76) = malloc_type_calloc(v48 + 1, 4uLL, 0x100004052888210uLL);
    *((_QWORD *)v16 + 77) = malloc_type_calloc(v48, 1uLL, 0x100004077774924uLL);
    *((_QWORD *)v16 + 78) = malloc_type_calloc(v48, 1uLL, 0x100004077774924uLL);
    *((_QWORD *)v16 + 79) = malloc_type_calloc(v48 + 1, 1uLL, 0x100004077774924uLL);
    *((_QWORD *)v16 + 80) = malloc_type_calloc(v48, 8uLL, 0x6004044C4A2DFuLL);
    *((_QWORD *)v16 + 71) = FigDispatchQueueCreateWithPriority();
    *((_QWORD *)v16 + 91) = v9;
    *((_QWORD *)v16 + 93) = a5;
    if (a5)
    {
      v16[737] = 0;
      v16[738] = 0;
    }
    *((_QWORD *)v16 + 22) = 0;
    v27 = (_OWORD *)MEMORY[0x1E0CA2E68];
    *((_QWORD *)v16 + 31) = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    *(_OWORD *)(v16 + 232) = *v27;
    *((_QWORD *)v16 + 49) = v17;
    *((_QWORD *)v16 + 69) = v48;
    *((_QWORD *)v16 + 70) = 1;
    *((_DWORD *)v16 + 146) = 0;
    *((_QWORD *)v16 + 51) = 0;
    v16[713] = 0;
    v16[712] = 0;
    v16[716] = 0;
    *((_DWORD *)v16 + 180) = 0;
    *((_QWORD *)v16 + 56) = malloc_type_malloc(24 * v26, 0x1000040504FFAC1uLL);
    *((_QWORD *)v16 + 57) = malloc_type_malloc(24 * v26, 0x1000040504FFAC1uLL);
    v28 = *((_QWORD *)v16 + 91);
    if (v28)
    {
      *((_QWORD *)v16 + 58) = malloc_type_malloc(24 * v28, 0x1000040504FFAC1uLL);
      v28 = *((_QWORD *)v16 + 91);
    }
    v29 = *((_QWORD *)v16 + 93) + v28;
    if (v29)
    {
      *((_QWORD *)v16 + 59) = malloc_type_malloc(24 * v29, 0x1000040504FFAC1uLL);
      *((_QWORD *)v16 + 60) = malloc_type_malloc(24 * (*((_QWORD *)v16 + 93) + *((_QWORD *)v16 + 91)), 0x1000040504FFAC1uLL);
    }
    CMTimeMake(&v60, 0, 1);
    v30 = *(_OWORD *)&v60.value;
    *((_QWORD *)v16 + 102) = v60.epoch;
    *((_OWORD *)v16 + 50) = v30;
    if (!*((_QWORD *)v16 + 100))
    {
      v31 = MEMORY[0x1E0CA2E18];
      *((_OWORD *)v16 + 50) = *MEMORY[0x1E0CA2E18];
      *((_QWORD *)v16 + 102) = *(_QWORD *)(v31 + 16);
    }
    *((_QWORD *)v16 + 103) = FigSimpleMutexCreate();
    *((_QWORD *)v16 + 82) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *((_QWORD *)v16 + 84) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *((_QWORD *)v16 + 85) = FigDispatchQueueCreateWithPriority();
    *((_QWORD *)v16 + 118) = v49;
    *((_DWORD *)v16 + 238) = 81;
    *((_DWORD *)v16 + 95) = 0;
    *((_QWORD *)v16 + 127) = 0;
    *((_QWORD *)v16 + 128) = 0;
    *((_QWORD *)v16 + 129) = 0;
    *((_QWORD *)v16 + 130) = 0;
    *((_QWORD *)v16 + 131) = 0;
    *((_QWORD *)v16 + 132) = objc_alloc_init(BWMovieFileOutputAnalyticsPayload);
    *((_QWORD *)v16 + 189) = objc_alloc_init(BWVideoStabilizationAnalyticsPayload);
    *((_QWORD *)v16 + 158) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *((_QWORD *)v16 + 159) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *((_QWORD *)v16 + 169) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *((_QWORD *)v16 + 170) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v16[1280] = 0;
    *((_QWORD *)v16 + 114) = 0;
    *((_QWORD *)v16 + 115) = 0;
    *((_QWORD *)v16 + 162) = 0;
    *((_QWORD *)v16 + 161) = 0;
    *((_DWORD *)v16 + 326) = 0;
    *((_QWORD *)v16 + 164) = 0;
    *((_QWORD *)v16 + 165) = -1;
    *((_DWORD *)v16 + 333) = 0;
    *((_DWORD *)v16 + 332) = 0;
    *((_QWORD *)v16 + 110) = 0x3FF199999999999ALL;
    if (a7)
    {
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v32 = (void *)objc_msgSend(a7, "allValues");
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v57;
        v36 = *MEMORY[0x1E0D058C0];
        v37 = INFINITY;
        do
        {
          for (j = 0; j != v34; ++j)
          {
            if (*(_QWORD *)v57 != v35)
              objc_enumerationMutation(v32);
            objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * j), "objectForKeyedSubscript:", v36), "doubleValue");
            if (v39 > 0.0 && v39 < v37)
            {
              *((double *)v16 + 110) = v39 * 1.1;
              v37 = v39;
            }
          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
        }
        while (v34);
      }
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v41 = (void *)objc_msgSend(a7, "allKeys");
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
      if (v42)
      {
        v43 = v42;
        v44 = 0;
        v45 = *(_QWORD *)v53;
        while (2)
        {
          for (k = 0; k != v43; ++k)
          {
            if (*(_QWORD *)v53 != v45)
              objc_enumerationMutation(v41);
            if (BWCaptureDevicePositionFromPortType(*(void **)(*((_QWORD *)&v52 + 1) + 8 * k)) == 1)
            {
              if (v44 > 0)
              {
                *((_QWORD *)v16 + 172) = objc_alloc_init(MEMORY[0x1E0C99E08]);
                goto LABEL_47;
              }
              v44 = 1;
            }
          }
          v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
          if (v43)
            continue;
          break;
        }
      }
    }
LABEL_47:
    *((_QWORD *)v16 + 191) = 0;
    if (FigVirtualCaptureCardGetSingleton())
      FigDebugAssert3();
  }
  return (BWQuickTimeMovieFileSinkNode *)v16;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWQuickTimeMovieFileSinkNode)initWithSinkID:(id)a3
{
  return -[BWQuickTimeMovieFileSinkNode initWithNumberOfVideoInputs:numberOfAuxiliaryPictureInputs:numberOfAudioInputs:numberOfMetadataInputs:cameraInfoByPortType:pipelineIndex:sinkID:](self, "initWithNumberOfVideoInputs:numberOfAuxiliaryPictureInputs:numberOfAudioInputs:numberOfMetadataInputs:cameraInfoByPortType:pipelineIndex:sinkID:", 1, 0, 0, 0, 0, 0, a3);
}

- (void)dealloc
{
  uint64_t v2;
  __CFNotificationCenter *LocalCenter;
  uint64_t FigBaseObject;
  uint64_t v6;
  void (*v7)(uint64_t);
  OpaqueFigFormatWriter *formatWriter;
  OpaqueCMByteStream *byteStream;
  __IOSurface *thumbnailSurface;
  BWIrisMovieGenerator *irisMovieGenerator;
  opaqueCMFormatDescription *movieSegmentMetadataFormatDescription;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;

  free(self->_parentPath);
  if (self->_formatWriter)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterRemoveObserver(LocalCenter, self, 0, self->_formatWriter);
    FigBaseObject = FigFormatWriterGetFigBaseObject();
    if (FigBaseObject)
    {
      v6 = FigBaseObject;
      v7 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
      if (v7)
        v7(v6);
    }
    formatWriter = self->_formatWriter;
    if (formatWriter)
    {
      CFRelease(formatWriter);
      self->_formatWriter = 0;
    }
  }
  byteStream = self->_byteStream;
  if (byteStream)
  {
    CFRelease(byteStream);
    self->_byteStream = 0;
  }
  free(self->_trackIDs);

  thumbnailSurface = self->_thumbnailSurface;
  if (thumbnailSurface)
    CFRelease(thumbnailSurface);
  if (self->_irisMovieProcessingSuspended)
  {
    v15 = v2;
    LODWORD(v13) = 0;
    FigDebugAssert3();
  }
  if (-[NSMutableArray count](self->_flushingIrisMovieGenerators, "count", v13, v15))
  {
    v16 = v2;
    LODWORD(v14) = 0;
    FigDebugAssert3();
  }
  irisMovieGenerator = self->_irisMovieGenerator;
  if (irisMovieGenerator)
  {
    v16 = v2;
    LODWORD(v14) = 0;
    FigDebugAssert3();
    irisMovieGenerator = self->_irisMovieGenerator;
  }

  free(self->_smallestWrittenPTSs);
  free(self->_largestWrittenPTSs);
  free(self->_largestWrittenVideoDTSs);
  free(self->_secondLargestWrittenAudioVideoPTSs);
  free(self->_lastWrittenAudioVideoDurations);
  free(self->_expectingToSeeSamplesForInput);
  free(self->_haveSeenSamplesForTrack);
  free(self->_finalDurationNeedsToBeWrittenForTrack);
  -[BWQuickTimeMovieFileSinkNode _clearProvidedTrackFormatDescriptions]((uint64_t)self);
  free(self->_providedTrackFormatDescriptions);
  free(self->_debugABL);
  FigSimpleMutexDestroy();

  self->_virtualCaptureCard = 0;
  movieSegmentMetadataFormatDescription = self->_movieSegmentMetadataFormatDescription;
  if (movieSegmentMetadataFormatDescription)
    CFRelease(movieSegmentMetadataFormatDescription);
  v17.receiver = self;
  v17.super_class = (Class)BWQuickTimeMovieFileSinkNode;
  -[BWSinkNode dealloc](&v17, sel_dealloc, v14, v16);
}

- (void)_clearProvidedTrackFormatDescriptions
{
  unint64_t v2;
  const void *v3;

  if (a1 && *(_QWORD *)(a1 + 552))
  {
    v2 = 0;
    do
    {
      v3 = *(const void **)(*(_QWORD *)(a1 + 640) + 8 * v2);
      if (v3)
      {
        CFRelease(v3);
        *(_QWORD *)(*(_QWORD *)(a1 + 640) + 8 * v2) = 0;
      }
      ++v2;
    }
    while (v2 < *(_QWORD *)(a1 + 552));
  }
}

- (id)nodeSubType
{
  return CFSTR("QuickTimeMovie");
}

- (BOOL)irisSampleReferenceMoviesEnabled
{
  return self->_irisSampleReferenceMoviesEnabled;
}

- (id)irisMotionAnalysisRingBuffer
{
  return self->_irisMotionAnalysisRingBuffer;
}

- (id)irisStillImageMovieMetadataCache
{
  return self->_irisStillImageMovieMetadataCache;
}

- (id)videoOrientationTimeMachine
{
  return self->_videoOrientationTimeMachine;
}

- (void)setupOverCaptureQualityMetricsForLivePhotoHistory:(int)a3
{
  self->_overCaptureQualityMetadataRingBuffer = -[BWObjectRingBufferThreadSafe initWithCapacity:]([BWObjectRingBufferThreadSafe alloc], "initWithCapacity:", *(_QWORD *)&a3);
  self->_overCaptureQualityMetrics = objc_alloc_init(BWVideoQualityMetrics);
}

- (void)didReachEndOfDataForInput:(id)a3
{
  unsigned int recordingState;
  BWNodeFileWriterStatusDelegate *v6;
  BWNodeFileWriterStatusDelegate *v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSArray *stagingQueues;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  os_log_type_t type;
  int v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (-[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 0))
  {
    recordingState = self->_recordingState;
    if (recordingState <= 6)
    {
      if (((1 << recordingState) & 0x76) != 0)
      {
        -[BWQuickTimeMovieFileSinkNode _doEndRecordingAtTime:earlyTerminationErrCode:]((unint64_t)self, MEMORY[0x1E0CA2E18], 4294950882);
      }
      else if (self->_firstIrisMovieInfo)
      {
        v6 = -[BWFileSinkNode recordingStatusDelegate](self, "recordingStatusDelegate");
        if (v6)
        {
          v7 = v6;
          -[BWIrisMovieInfo setMasterMovieURL:](self->_firstIrisMovieInfo, "setMasterMovieURL:", 0);
          if (dword_1ECFE9510)
          {
            v23 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          -[BWNodeFileWriterStatusDelegate fileWriter:writerPipelineIndex:stoppedRecordingSampleDataForSettingsID:](v7, "fileWriter:writerPipelineIndex:stoppedRecordingSampleDataForSettingsID:", self, self->_pipelineIndex, -[FigCaptureRecordingSettings settingsID](-[BWIrisMovieInfo settings](self->_firstIrisMovieInfo, "settings", v14, v15), "settingsID"));
          -[BWQuickTimeMovieFileSinkNode _initAnalyticsDataInIrisMovieInfo:]((uint64_t)self, self->_firstIrisMovieInfo);
          LOBYTE(v16) = 0;
          -[BWNodeFileWriterStatusDelegate fileWriter:writerPipelineIndex:stoppedRecordingForSettings:withError:thumbnailSurface:irisMovieInfo:debugMetadataSidecarFileURL:recordingSucceeded:](v7, "fileWriter:writerPipelineIndex:stoppedRecordingForSettings:withError:thumbnailSurface:irisMovieInfo:debugMetadataSidecarFileURL:recordingSucceeded:", self, self->_pipelineIndex, -[BWIrisMovieInfo settings](self->_firstIrisMovieInfo, "settings"), 4294950878, 0, self->_firstIrisMovieInfo, 0, v16);
        }

        self->_firstIrisMovieInfo = 0;
      }
    }
    -[BWQuickTimeMovieFileSinkNode _finishIrisMovieGeneration]((uint64_t)self);
    self->_recordingState = 0;
    -[BWLimitedGMErrorLogger resetCurrentLoggingCounter](self->_limitedGMErrorLogger, "resetCurrentLoggingCounter");
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    stagingQueues = self->_stagingQueues;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](stagingQueues, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(stagingQueues);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "removeAllObjects");
        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](stagingQueues, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v11);
    }

    self->_settings = 0;
    self->_currentRecordingStateSettingsID = 0;
    -[BWQuickTimeMovieFileSinkNode _clearProvidedTrackFormatDescriptions]((uint64_t)self);
  }
  v17.receiver = self;
  v17.super_class = (Class)BWQuickTimeMovieFileSinkNode;
  -[BWSinkNode didReachEndOfDataForInput:](&v17, sel_didReachEndOfDataForInput_, a3);
}

- (uint64_t)_initAnalyticsDataInIrisMovieInfo:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    objc_msgSend(a2, "setFileCoordinatorToWriterMovingWindowLatencyStats:", -[BWStats initWithStats:]([BWStats alloc], "initWithStats:", *(_QWORD *)(result + 960)));
    objc_msgSend(a2, "setMaxSystemPressureLevel:", *(unsigned int *)(v3 + 1332));
    objc_msgSend(a2, "setIrisSequenceAdjusterRecipeIdentifier:", *(_QWORD *)(v3 + 1344));
    objc_msgSend(a2, "setVideoFrameDurationStats:", *(_QWORD *)(v3 + 1336));
    return objc_msgSend(a2, "setNumberOfFramesDropped:", *(_QWORD *)(v3 + 912));
  }
  return result;
}

- (void)_doEndRecordingAtTime:(uint64_t)a3 earlyTerminationErrCode:
{
  int *v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  double v10;
  int *v11;
  uint64_t v12;
  int *v13;
  _BOOL4 v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  int v19;
  int v20;
  int *v21;
  char v22;
  int32_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, CMSampleTimingInfo *);
  int v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  OSStatus v32;
  int *v33;
  uint64_t v34;
  uint64_t v35;
  CMAttachmentBearerRef v36;
  uint64_t (*v37)(uint64_t, uint64_t, CMAttachmentBearerRef);
  int v38;
  __CFNotificationCenter *LocalCenter;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, _QWORD);
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t, uint64_t, uint64_t);
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t, _QWORD, uint64_t);
  int v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, _QWORD);
  int v58;
  __int128 *v59;
  uint64_t v60;
  uint64_t v61;
  __int128 *v62;
  __int128 *v63;
  uint64_t v64;
  __int128 *v65;
  CMTimeEpoch v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  __int128 *v71;
  uint64_t v72;
  NSObject *v73;
  int v74;
  NSObject *v75;
  unsigned int v76;
  unsigned int v77;
  uint64_t v78;
  uint64_t v79;
  NSObject *v80;
  unsigned int v81;
  unsigned int v82;
  uint64_t v83;
  uint64_t v84;
  NSObject *v85;
  unsigned int v86;
  unsigned int v87;
  uint64_t v88;
  uint64_t v89;
  NSObject *v90;
  unsigned int v91;
  unsigned int v92;
  uint64_t v93;
  uint64_t v94;
  __CFNotificationCenter *v95;
  uint64_t FigBaseObject;
  uint64_t v97;
  uint64_t (*v98)(uint64_t);
  int v99;
  uint64_t v100;
  uint64_t (*v101)(uint64_t);
  int v102;
  void *v103;
  id MovieLevelMetadataWithSpatialAggressorsSeenMetadata;
  id v105;
  uint64_t v106;
  float v107;
  float v108;
  int has_internal_diagnostics;
  int v110;
  void *v111;
  double v112;
  float v113;
  const void *v114;
  int v115;
  int v116;
  uint64_t v117;
  _QWORD *v118;
  id v119;
  void *v120;
  void *v121;
  void *v122;
  void *MetadataSidecarFileURL;
  void *v124;
  void *v125;
  void *v126;
  id v127;
  NSObject *v128;
  unsigned int v129;
  unsigned int v130;
  uint64_t v131;
  uint64_t v132;
  int v133;
  uint64_t v134;
  NSObject *v135;
  unsigned int v136;
  unsigned int v137;
  uint64_t v138;
  int v139;
  const void *v140;
  const void *v141;
  unsigned int v142;
  uint64_t v143;
  void *v144;
  unsigned int v145;
  uint64_t v146;
  NSObject *v147;
  unsigned int v148;
  unsigned int v149;
  uint64_t v150;
  const void *v151;
  CMSampleTimingInfo *sampleTimingArray;
  CMSampleTimingInfo *sampleTimingArraya;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  const void *v157;
  const __CFString *v158;
  unsigned int v159;
  unsigned int v160;
  const __CFAllocator *v161;
  int v162;
  _BOOL4 v163;
  _BOOL4 v164;
  uint64_t v165;
  int v166;
  int v168;
  __int128 v169;
  CMTimeEpoch v170;
  __int128 v171;
  CMTimeEpoch epoch;
  CMTime lhs;
  os_log_type_t v174;
  unsigned int v175;
  _QWORD v176[3];
  __int128 v177;
  uint64_t v178;
  __int128 v179;
  uint64_t v180;
  __int128 v181;
  uint64_t v182;
  __int128 v183;
  CMTimeEpoch v184;
  CMAttachmentBearerRef target[2];
  CMTimeEpoch v186;
  CMTime v187;
  __int128 v188;
  CMTimeEpoch v189;
  __int128 v190;
  CMTimeEpoch v191;
  CMTime v192;
  os_log_type_t type[16];
  CMTimeEpoch v194;
  __int128 v195;
  CMTimeEpoch v196;
  CMTime v197;
  CMTime time2;
  CMSampleTimingInfo time;
  CMTime rhs;
  uint64_t v201;
  __int16 v202;
  int v203;
  uint64_t v204;

  v204 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  mach_absolute_time();
  v5 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
  if (dword_1ECFE9510)
  {
    LODWORD(v195) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v7 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
  objc_msgSend((id)objc_msgSend((id)a1, "recordingStatusDelegate", sampleTimingArray, v154), "fileWriter:writerPipelineIndex:stoppedRecordingSampleDataForSettingsID:", a1, *(_QWORD *)(a1 + 944), objc_msgSend(*(id *)(a1 + 400), "settingsID"));
  v166 = objc_msgSend(*(id *)(a1 + 400), "isIrisRecording");
  if (v166)
    v8 = *(_QWORD *)(a1 + 648) != 0;
  else
    v8 = 0;
  if (*(_BYTE *)(a1 + 714))
    v9 = *(_BYTE *)(a1 + 715) != 0;
  else
    v9 = 0;
  if (objc_msgSend(*(id *)(a1 + 400), "isIrisMovieRecording")
    && *(_QWORD *)(a1 + 944)
    && (v10 = *(double *)(a1 + 872), v10 != 0.0)
    && v10 < *(double *)(a1 + 880))
  {
    a3 = 4294951866;
    v168 = 1;
  }
  else
  {
    v168 = 0;
  }
  if (*(_BYTE *)(a1 + 716))
  {
    a3 = *(unsigned int *)(a1 + 720);
    v168 = 1;
  }
  if (v8 && *(_QWORD *)(a1 + 944))
    v168 |= objc_msgSend(*(id *)(a1 + 648), "spatialOverCaptureExpected") ^ 1;
  v162 = !v8;
  v11 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
  v12 = *(_QWORD *)(a1 + 592);
  v13 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
  if ((v168 & 1) == 0 && v12)
  {
    v163 = v8;
    if (*(_BYTE *)(a1 + 713))
      v14 = v8;
    else
      v14 = 0;
    if (v14 && *(int *)(a1 + 688) >= 1)
    {
      v15 = *(void **)(a1 + 648);
      if (v15)
        objc_msgSend(v15, "movieStartTime");
      else
        memset(&time2, 0, sizeof(time2));
      *(_OWORD *)&time.duration.value = *(_OWORD *)(a1 + 424);
      time.duration.epoch = *(_QWORD *)(a1 + 440);
      if (CMTimeCompare(&time.duration, &time2))
      {
        v155 = v165;
        LODWORD(sampleTimingArraya) = 0;
        FigDebugAssert3();
      }
      v16 = *(id *)(a1 + 888);
      if (v16)
      {
        v16 = (id)objc_msgSend(v16, "copyAndClearStillImageTransformDataForSettingsID:", objc_msgSend(*(id *)(a1 + 648), "livePhotoMetadataStillImageKeyFrameSettingsID"));
        if (!v16)
        {
          LODWORD(v195) = 0;
          type[0] = OS_LOG_TYPE_DEFAULT;
          v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          v16 = (id)objc_msgSend(MEMORY[0x1E0C99D50], "data");
        }
      }
      v18 = *(void **)(a1 + 648);
      if (v18)
        objc_msgSend(v18, "stillImageCaptureTime");
      else
        memset(&v197, 0, sizeof(v197));
      v11 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
      v19 = -[BWQuickTimeMovieFileSinkNode _writeStillImageTimeMetadataSampleForCaptureTime:stillImageTransformData:referenceDimensions:toTrackWithID:usingTrackTimeScale:](a1, &v197, v16, *(_QWORD *)(a1 + 896), *(unsigned int *)(a1 + 688), *(_DWORD *)(a1 + 692));
      if (v19)
      {
        v155 = v165;
        LODWORD(sampleTimingArraya) = v19;
        FigDebugAssert3();
      }
    }
    v159 = a3;
    v20 = v166 & v162;
    v195 = 0uLL;
    v196 = 0;
    *(_OWORD *)&time.duration.value = *(_OWORD *)&a2->value;
    time.duration.epoch = a2->epoch;
    -[BWQuickTimeMovieFileSinkNode _finalizeAudioVideoDurationsAndFindWrittenEndingPTSFromEndingPTS:]((CMTime *)a1, (uint64_t)&time, (uint64_t)&v195);
    memset(type, 0, sizeof(type));
    v194 = 0;
    *(_OWORD *)&time.duration.value = *(_OWORD *)&a2->value;
    time.duration.epoch = a2->epoch;
    -[BWQuickTimeMovieFileSinkNode _validatedEndingPTSFromEndingPTS:](a1, (uint64_t)&time, (uint64_t)type);
    if (!*(_BYTE *)(a1 + 713) || (BYTE12(v195) & 1) == 0)
      goto LABEL_46;
    v21 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
    if ((*(_BYTE *)(a1 + 1588) & 1) != 0)
    {
      *(_OWORD *)&time.duration.value = *(_OWORD *)(a1 + 1576);
      time.duration.epoch = *(_QWORD *)(a1 + 1592);
      -[BWQuickTimeMovieFileSinkNode _writeMovieSegmentMetadataForSegmentStartPTS:segmentDuration:](a1, (__int128 *)&time.duration.value, MEMORY[0x1E0CA2E18]);
      *(_BYTE *)(*(_QWORD *)(a1 + 632) + *(_QWORD *)(a1 + 1568)) = 1;
    }
    if (!(*(_QWORD *)(a1 + 560) + *(_QWORD *)(a1 + 552)))
    {
LABEL_46:
      v13 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
      if (*(_BYTE *)(a1 + 713))
      {
        v22 = (type[12] & 1) != 0 ? v20 : 1;
        if ((v22 & 1) == 0)
        {
          memset(&rhs, 0, sizeof(rhs));
          v23 = *(_DWORD *)(a1 + 376);
          *(_OWORD *)&time.duration.value = *(_OWORD *)type;
          time.duration.epoch = v194;
          CMTimeConvertScale(&rhs, &time.duration, v23, kCMTimeRoundingMethod_RoundTowardZero);
          v24 = *(_QWORD *)(a1 + v11[962]);
          v192 = rhs;
          v25 = *(uint64_t (**)(uint64_t, CMSampleTimingInfo *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                        + 64);
          if (v25)
          {
            time.duration = v192;
            v26 = v25(v24, &time);
            if (!v26)
              goto LABEL_70;
          }
          else
          {
            v26 = -12782;
          }
          v155 = v165;
          LODWORD(sampleTimingArraya) = v26;
          FigDebugAssert3();
        }
      }
LABEL_70:
      LocalCenter = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterRemoveObserver(LocalCenter, (const void *)a1, 0, *(const void **)(a1 + v11[962]));
      v40 = *(_QWORD *)(a1 + v11[962]);
      v41 = *(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
      if (v41)
      {
        v42 = v41(v40, 0);
        v5 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
        a3 = v159;
        if (!v42)
        {
          if (!v163)
            goto LABEL_92;
          goto LABEL_76;
        }
      }
      else
      {
        v42 = -12782;
      }
      v155 = v165;
      LODWORD(sampleTimingArraya) = v42;
      FigDebugAssert3();
      v5 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
      a3 = v159;
      if (!v163)
        goto LABEL_92;
LABEL_76:
      if (!objc_msgSend(*(id *)(a1 + 648), "containsTrims", sampleTimingArraya, v155))
        goto LABEL_92;
      v43 = BWTrackEditListArrayForRegularTrackInIrisTrimmedMovie(*(void **)(a1 + 648));
      if (!*(_QWORD *)(a1 + 552))
      {
LABEL_86:
        v5 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
        a3 = v159;
        v13 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
        if (!*(_DWORD *)(a1 + 688))
          goto LABEL_92;
        v51 = BWTrackEditListArrayForStillImageDisplayTimeTrackInIrisTrimmedMovie(*(void **)(a1 + 648), *(_DWORD *)(a1 + 692));
        v52 = *(_QWORD *)(a1 + v11[962]);
        v53 = *(unsigned int *)(a1 + 688);
        v54 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                          + 24);
        if (v54)
        {
          v55 = v54(v52, v53, *MEMORY[0x1E0CC4550], v51);
          if (!v55)
            goto LABEL_92;
        }
        else
        {
          v55 = -12782;
        }
        v155 = v165;
        LODWORD(sampleTimingArraya) = v55;
        FigDebugAssert3();
LABEL_92:
        v56 = *(_QWORD *)(a1 + v11[962]);
        v57 = *(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
        if (v57)
        {
          v58 = v57(v56, 0);
          if (!v58)
          {
LABEL_97:
            v59 = (__int128 *)MEMORY[0x1E0CA2E18];
            v60 = -[BWQuickTimeMovieFileSinkNode _getCurrentFileSize:currentHostTime:](a1, 1, MEMORY[0x1E0CA2E18]);
            v192 = *(CMTime *)(a1 + 232);
            if ((*(_BYTE *)(a1 + 436) & 1) != 0 && (type[12] & 1) != 0)
            {
              *(_OWORD *)&time.duration.value = *(_OWORD *)type;
              time.duration.epoch = v194;
              rhs = *(CMTime *)(a1 + 424);
              if (CMTimeCompare(&time.duration, &rhs) >= 1)
              {
                *(_OWORD *)&time.duration.value = *(_OWORD *)type;
                time.duration.epoch = v194;
                rhs = *(CMTime *)(a1 + 424);
                CMTimeSubtract(&v187, &time.duration, &rhs);
                CMTimeConvertScale(&v192, &v187, *(_DWORD *)(a1 + 376), kCMTimeRoundingMethod_RoundHalfAwayFromZero);
              }
            }
            pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 824));
            *(_QWORD *)(a1 + 176) = v60;
            *(CMTime *)(a1 + 232) = v192;
            pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 824));
            v61 = *(_QWORD *)(a1 + 728);
            if (v61)
            {
              v62 = *(__int128 **)(a1 + 448);
              v190 = *v62;
              v191 = *((_QWORD *)v62 + 2);
              v63 = *(__int128 **)(a1 + 456);
              v188 = *v63;
              v189 = *((_QWORD *)v63 + 2);
              v64 = *(_QWORD *)(a1 + 480);
              *(_OWORD *)target = *(_OWORD *)v64;
              v186 = *(_QWORD *)(v64 + 16);
              v65 = *(__int128 **)(a1 + 464);
              v183 = *v65;
              v66 = *((_QWORD *)v65 + 2);
            }
            else
            {
              v190 = *v59;
              v66 = *((_QWORD *)v59 + 2);
              v191 = v66;
              v188 = v190;
              v189 = v66;
              *(_OWORD *)target = v190;
              v186 = v66;
              v183 = v190;
            }
            v184 = v66;
            if (*(_QWORD *)(a1 + 744))
            {
              v67 = 3 * v61;
              v68 = *(_QWORD *)(a1 + 448) + 8 * v67;
              v181 = *(_OWORD *)v68;
              v182 = *(_QWORD *)(v68 + 16);
              v69 = *(_QWORD *)(a1 + 456) + 8 * v67;
              v179 = *(_OWORD *)v69;
              v70 = *(_QWORD *)(a1 + 480);
              v180 = *(_QWORD *)(v69 + 16);
              v71 = (__int128 *)(v70 + 8 * v67);
              v177 = *v71;
              v72 = *((_QWORD *)v71 + 2);
            }
            else
            {
              v181 = *v59;
              v72 = *((_QWORD *)v59 + 2);
              v182 = v72;
              v179 = v181;
              v180 = v72;
              v177 = v181;
            }
            v178 = v72;
            memset(v176, 0, sizeof(v176));
            -[BWQuickTimeMovieFileSinkNode _findWrittenStartingPTS](a1, (uint64_t)v176);
            if (!dword_1ECFE9510)
              goto LABEL_135;
            v175 = 0;
            v174 = OS_LOG_TYPE_DEFAULT;
            v73 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            v74 = dword_1ECFE9510;
            if (*(_QWORD *)(a1 + 968))
            {
              if (!dword_1ECFE9510)
                goto LABEL_135;
              v175 = 0;
              v174 = OS_LOG_TYPE_DEFAULT;
              v75 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              v76 = v175;
              if (os_log_type_enabled(v75, v174))
                v77 = v76;
              else
                v77 = v76 & 0xFFFFFFFE;
              if (v77)
              {
                v78 = *(_QWORD *)(a1 + 992);
                v79 = *(_QWORD *)(a1 + 968);
                LODWORD(rhs.value) = 136315650;
                *(CMTimeValue *)((char *)&rhs.value + 4) = (CMTimeValue)"-[BWQuickTimeMovieFileSinkNode _doEndRecordingAt"
                                                                        "Time:earlyTerminationErrCode:]";
                LOWORD(rhs.flags) = 2112;
                *(_QWORD *)((char *)&rhs.flags + 2) = v78;
                HIWORD(rhs.epoch) = 2112;
                v201 = v79;
                LODWORD(v155) = 32;
                sampleTimingArraya = (CMSampleTimingInfo *)&rhs;
                _os_log_send_and_compose_impl();
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              if (!dword_1ECFE9510)
                goto LABEL_135;
              v175 = 0;
              v174 = OS_LOG_TYPE_DEFAULT;
              v80 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              v81 = v175;
              if (os_log_type_enabled(v80, v174))
                v82 = v81;
              else
                v82 = v81 & 0xFFFFFFFE;
              if (v82)
              {
                v83 = *(_QWORD *)(a1 + 992);
                v84 = *(_QWORD *)(a1 + 976);
                LODWORD(rhs.value) = 136315650;
                *(CMTimeValue *)((char *)&rhs.value + 4) = (CMTimeValue)"-[BWQuickTimeMovieFileSinkNode _doEndRecordingAt"
                                                                        "Time:earlyTerminationErrCode:]";
                LOWORD(rhs.flags) = 2112;
                *(_QWORD *)((char *)&rhs.flags + 2) = v83;
                HIWORD(rhs.epoch) = 2112;
                v201 = v84;
                LODWORD(v155) = 32;
                sampleTimingArraya = (CMSampleTimingInfo *)&rhs;
                _os_log_send_and_compose_impl();
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              v74 = dword_1ECFE9510;
            }
            if (v74)
            {
              v175 = 0;
              v174 = OS_LOG_TYPE_DEFAULT;
              v85 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              v86 = v175;
              if (os_log_type_enabled(v85, v174))
                v87 = v86;
              else
                v87 = v86 & 0xFFFFFFFE;
              if (v87)
              {
                v88 = *(_QWORD *)(a1 + 992);
                v89 = *(_QWORD *)(a1 + 984);
                LODWORD(rhs.value) = 136315650;
                *(CMTimeValue *)((char *)&rhs.value + 4) = (CMTimeValue)"-[BWQuickTimeMovieFileSinkNode _doEndRecordingAt"
                                                                        "Time:earlyTerminationErrCode:]";
                LOWORD(rhs.flags) = 2112;
                *(_QWORD *)((char *)&rhs.flags + 2) = v88;
                HIWORD(rhs.epoch) = 2112;
                v201 = v89;
                LODWORD(v155) = 32;
                sampleTimingArraya = (CMSampleTimingInfo *)&rhs;
                _os_log_send_and_compose_impl();
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              if (dword_1ECFE9510)
              {
                v175 = 0;
                v174 = OS_LOG_TYPE_DEFAULT;
                v90 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                v91 = v175;
                if (os_log_type_enabled(v90, v174))
                  v92 = v91;
                else
                  v92 = v91 & 0xFFFFFFFE;
                if (v92)
                {
                  v93 = *(_QWORD *)(a1 + 992);
                  v94 = *(_QWORD *)(a1 + 960);
                  LODWORD(rhs.value) = 136315650;
                  *(CMTimeValue *)((char *)&rhs.value + 4) = (CMTimeValue)"-[BWQuickTimeMovieFileSinkNode _doEndRecording"
                                                                          "AtTime:earlyTerminationErrCode:]";
                  LOWORD(rhs.flags) = 2112;
                  *(_QWORD *)((char *)&rhs.flags + 2) = v93;
                  HIWORD(rhs.epoch) = 2112;
                  v201 = v94;
                  LODWORD(v155) = 32;
                  sampleTimingArraya = (CMSampleTimingInfo *)&rhs;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
            }
LABEL_135:
            v11 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
            v12 = *(_QWORD *)(a1 + 592);
            v9 = 1;
            v7 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
            v8 = v163;
            goto LABEL_136;
          }
        }
        else
        {
          v58 = -12782;
        }
        v155 = v165;
        LODWORD(sampleTimingArraya) = v58;
        FigDebugAssert3();
        goto LABEL_97;
      }
      v44 = v43;
      v45 = 0;
      v46 = *MEMORY[0x1E0CC4550];
      while (1)
      {
        if (*(_BYTE *)(*(_QWORD *)(a1 + 616) + v45))
        {
          v47 = *(_QWORD *)(a1 + v11[962]);
          v48 = *(unsigned int *)(*(_QWORD *)(a1 + 608) + 4 * v45);
          v49 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 24);
          if (!v49)
          {
            v50 = -12782;
LABEL_84:
            v155 = v165;
            LODWORD(sampleTimingArraya) = v50;
            FigDebugAssert3();
            v11 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
            goto LABEL_85;
          }
          v50 = v49(v47, v48, v46, v44);
          v11 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
          if (v50)
            goto LABEL_84;
        }
LABEL_85:
        if ((unint64_t)++v45 >= *(_QWORD *)(a1 + 552))
          goto LABEL_86;
      }
    }
    v27 = 0;
    v161 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v158 = (const __CFString *)*MEMORY[0x1E0CA2690];
    v28 = 12;
    v29 = MEMORY[0x1E0CA2E90];
    v157 = (const void *)*MEMORY[0x1E0C9AE50];
    while (1)
    {
      if ((*(_BYTE *)(*(_QWORD *)(a1 + 456) + v28) & 1) == 0)
        goto LABEL_66;
      target[0] = 0;
      v30 = *(_OWORD *)(v29 + 48);
      *(_OWORD *)&time.presentationTimeStamp.timescale = *(_OWORD *)(v29 + 32);
      *(_OWORD *)&time.decodeTimeStamp.value = v30;
      time.decodeTimeStamp.epoch = *(_QWORD *)(v29 + 64);
      v31 = *(_OWORD *)(v29 + 16);
      *(_OWORD *)&time.duration.value = *(_OWORD *)v29;
      *(_OWORD *)&time.duration.epoch = v31;
      v192 = *a2;
      v190 = v195;
      v191 = v196;
      v188 = *(_OWORD *)type;
      v189 = v194;
      -[BWQuickTimeMovieFileSinkNode _endingPTSForTrack:endingPTS:writtenEndingPTS:validatedEndingPTS:isIrisMasterMovie:](a1, v27, (uint64_t)&v192, (uint64_t)&v190, (uint64_t)&v188, v20, (uint64_t)&rhs);
      time.presentationTimeStamp = rhs;
      time.decodeTimeStamp = rhs;
      v32 = CMSampleBufferCreate(v161, 0, 1u, 0, 0, 0, 0, 1, &time, 0, 0, (CMSampleBufferRef *)target);
      if (v32)
      {
        v155 = v165;
        LODWORD(sampleTimingArraya) = v32;
        FigDebugAssert3();
      }
      if (!target[0])
        goto LABEL_66;
      CMSetAttachment(target[0], v158, v157, 1u);
      if (*(_BYTE *)(*(_QWORD *)(a1 + v21[897]) + v27))
      {
        v33 = v21;
        v34 = *(_QWORD *)(a1 + v11[962]);
        v35 = *(unsigned int *)(*(_QWORD *)(a1 + 608) + 4 * v27);
        v36 = target[0];
        v37 = *(uint64_t (**)(uint64_t, uint64_t, CMAttachmentBearerRef))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                            + 16)
                                                                                + 32);
        if (!v37)
        {
          v38 = -12782;
LABEL_64:
          v155 = v165;
          LODWORD(sampleTimingArraya) = v38;
          FigDebugAssert3();
          v11 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
          v21 = v33;
          v20 = v166 & v162;
          goto LABEL_65;
        }
        v38 = v37(v34, v35, v36);
        v11 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
        v21 = v33;
        v20 = v166 & v162;
        if (v38)
          goto LABEL_64;
      }
LABEL_65:
      CFRelease(target[0]);
LABEL_66:
      ++v27;
      v28 += 24;
      if (v27 >= *(_QWORD *)(a1 + 560) + *(_QWORD *)(a1 + 552))
        goto LABEL_46;
    }
  }
LABEL_136:
  if (!v12)
    goto LABEL_146;
  if (v168)
  {
    v95 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterRemoveObserver(v95, (const void *)a1, 0, *(const void **)(a1 + 592));
  }
  FigBaseObject = FigFormatWriterGetFigBaseObject();
  if (!FigBaseObject)
  {
    v99 = -12780;
LABEL_145:
    v155 = v165;
    LODWORD(sampleTimingArraya) = v99;
    FigDebugAssert3();
    goto LABEL_146;
  }
  v97 = FigBaseObject;
  v98 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
  if (!v98)
  {
    v99 = -12782;
    goto LABEL_145;
  }
  v99 = v98(v97);
  if (v99)
    goto LABEL_145;
LABEL_146:
  if (*(_QWORD *)(a1 + 1528) && objc_msgSend(*(id *)(a1 + v5[951]), "usesVirtualCaptureCard"))
  {
    v100 = *(_QWORD *)(a1 + 1528);
    v101 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
    if (v101)
    {
      v102 = v101(v100);
      if (!v102)
        goto LABEL_153;
    }
    else
    {
      v102 = -12782;
    }
    v155 = v165;
    LODWORD(sampleTimingArraya) = v102;
    FigDebugAssert3();
  }
LABEL_153:
  -[BWQuickTimeMovieFileSinkNode _updateMovieFileMemoryAnalytics]((unsigned __int8 *)a1);
  if (v168)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", objc_msgSend(*(id *)(a1 + v5[951]), "outputURL"), 0);
    v9 = 0;
    goto LABEL_196;
  }
  if (*(_QWORD *)(a1 + 592))
  {
    v164 = v8;
    if ((v166 ^ 1 | v8) != 1)
    {
LABEL_190:
      if (*(_BYTE *)(a1 + 713))
      {
        v117 = *(_QWORD *)(a1 + 552);
        if (v117)
        {
          v118 = *(_QWORD **)(a1 + 640);
          while (!*v118)
          {
            ++v118;
            if (!--v117)
              goto LABEL_200;
          }
          -[BWQuickTimeMovieFileSinkNode _updateTrackFormatDescriptionsAtURL:]((_QWORD *)a1, objc_msgSend(*(id *)(a1 + v5[951]), "outputURL"));
        }
      }
LABEL_200:
      if (((v166 ^ 1 | v162) & 1) == 0)
      {
        v120 = (void *)objc_msgSend(*(id *)(a1 + 648), "masterMovieURL");
        v121 = (void *)objc_msgSend(*(id *)(a1 + v5[951]), "outputURL");
        v122 = (void *)objc_msgSend(*(id *)(a1 + 648), "outputMovieURL");
        if (objc_msgSend(v120, "isEqual:", v121))
        {
          if ((objc_msgSend(v121, "isEqual:", v122) & 1) == 0)
          {
            *(_QWORD *)&v195 = 0;
            MetadataSidecarFileURL = FigCaptureMetadataUtilitiesCreateMetadataSidecarFileURL(v121);
            v124 = FigCaptureMetadataUtilitiesCreateMetadataSidecarFileURL(v122);
            objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "moveItemAtURL:toURL:error:", MetadataSidecarFileURL, v124, &v195);

            *(_QWORD *)&v195 = 0;
            objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "moveItemAtURL:toURL:error:", v121, v122, &v195);
            objc_msgSend(*(id *)(a1 + 648), "setMasterMovieURL:", 0);
            objc_msgSend(*(id *)(a1 + 648), "setTemporaryMovieURL:", 0);
            memset(&time, 0, 24);
            v125 = *(void **)(a1 + 648);
            if (v125)
              objc_msgSend(v125, "movieStartTime");
            else
              memset(&lhs, 0, sizeof(lhs));
            rhs = *(CMTime *)(a1 + 232);
            CMTimeAdd(&time.duration, &lhs, &rhs);
            v7 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
            if ((objc_msgSend(*(id *)(a1 + 648), "containsTrims") & 1) == 0)
            {
              v171 = *(_OWORD *)&time.duration.value;
              epoch = time.duration.epoch;
              objc_msgSend(*(id *)(a1 + 648), "setMovieTrimEndTime:", &v171);
            }
            v169 = *(_OWORD *)&time.duration.value;
            v170 = time.duration.epoch;
            objc_msgSend(*(id *)(a1 + 648), "setMovieEndTime:", &v169, sampleTimingArraya, v155);
          }
        }
      }
      if ((v166 & 1) == 0)
      {
        v11 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
        if (!*(_QWORD *)(a1 + 944))
          -[BWQuickTimeMovieFileSinkNode _submitMovieFileCoreAnalyticsEvent](a1);
        v119 = 0;
        goto LABEL_222;
      }
      v13 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
      v11 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
      if (v164)
        goto LABEL_198;
LABEL_211:
      v126 = *(void **)(a1 + 664);
      if (v126)
      {
        v127 = v126;
        pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 824));
        objc_msgSend(*(id *)(a1 + 672), "addObject:", *(_QWORD *)(a1 + 664));
        if (dword_1ECFE9510)
        {
          v160 = a3;
          LODWORD(v195) = 0;
          type[0] = OS_LOG_TYPE_DEFAULT;
          v128 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v129 = v195;
          if (os_log_type_enabled(v128, type[0]))
            v130 = v129;
          else
            v130 = v129 & 0xFFFFFFFE;
          if (v130)
          {
            v131 = *(_QWORD *)(a1 + 992);
            v132 = *(_QWORD *)(a1 + 664);
            v133 = objc_msgSend(*(id *)(a1 + 672), "count");
            LODWORD(rhs.value) = 136315906;
            *(CMTimeValue *)((char *)&rhs.value + 4) = (CMTimeValue)"-[BWQuickTimeMovieFileSinkNode _doEndRecordingAtTime"
                                                                    ":earlyTerminationErrCode:]";
            LOWORD(rhs.flags) = 2112;
            *(_QWORD *)((char *)&rhs.flags + 2) = v131;
            HIWORD(rhs.epoch) = 2048;
            v201 = v132;
            v202 = 1024;
            v203 = v133;
            LODWORD(v155) = 38;
            sampleTimingArraya = (CMSampleTimingInfo *)&rhs;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          a3 = v160;
          v7 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
          v11 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
        }

        *(_QWORD *)(a1 + 664) = 0;
        pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 824));
        v13 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
        if (objc_msgSend(v127, "flushAsync"))
        {
          pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 824));
          objc_msgSend(*(id *)(a1 + 672), "removeObjectIdenticalTo:", v127);
          if (dword_1ECFE9510)
          {
            v134 = a3;
            LODWORD(v195) = 0;
            type[0] = OS_LOG_TYPE_DEFAULT;
            v135 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            v136 = v195;
            if (os_log_type_enabled(v135, type[0]))
              v137 = v136;
            else
              v137 = v136 & 0xFFFFFFFE;
            if (v137)
            {
              v138 = *(_QWORD *)(a1 + 992);
              v139 = objc_msgSend(*(id *)(a1 + 672), "count");
              LODWORD(rhs.value) = 136315906;
              *(CMTimeValue *)((char *)&rhs.value + 4) = (CMTimeValue)"-[BWQuickTimeMovieFileSinkNode _doEndRecordingAtTi"
                                                                      "me:earlyTerminationErrCode:]";
              LOWORD(rhs.flags) = 2112;
              *(_QWORD *)((char *)&rhs.flags + 2) = v138;
              HIWORD(rhs.epoch) = 2048;
              v201 = (uint64_t)v127;
              v202 = 1024;
              v203 = v139;
              LODWORD(v155) = 38;
              sampleTimingArraya = (CMSampleTimingInfo *)&rhs;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            a3 = v134;
            v7 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
            v13 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
            v11 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
          }
          pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 824));
        }

        goto LABEL_234;
      }
      v119 = 0;
LABEL_222:
      v13 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
      goto LABEL_235;
    }
    v103 = (void *)objc_msgSend((id)a1, "movieLevelMetadata");
    MovieLevelMetadataWithSpatialAggressorsSeenMetadata = v103;
    if (*(_BYTE *)(a1 + 1484))
    {
      MovieLevelMetadataWithSpatialAggressorsSeenMetadata = (id)FigCaptureMetadataUtilitiesCreateMovieLevelMetadataWithSpatialAggressorsSeenMetadata(v103, *(_DWORD *)(a1 + 1488) > 1u);
      v105 = MovieLevelMetadataWithSpatialAggressorsSeenMetadata;
    }
    if (v8)
    {
      if (objc_msgSend(*(id *)(a1 + 648), "isVitalityScoreValid"))
      {
        v106 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 648), "settings"), "movieLevelMetadata");
        if (*(_QWORD *)(a1 + 944)
          && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 648), "settings"), "spatialOverCaptureMovieURL"))
        {
          v106 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 648), "settings"), "spatialOverCaptureMovieLevelMetadata");
        }
        if ((objc_msgSend(MovieLevelMetadataWithSpatialAggressorsSeenMetadata, "isEqual:", v106, sampleTimingArraya, v155) & 1) == 0)-[BWQuickTimeMovieFileSinkNode _doEndRecordingAtTime:earlyTerminationErrCode:].cold.1();
        -[BWQuickTimeMovieFileSinkNode _fixVitalityScoreWithMotionAnalysis:](a1, *(void **)(a1 + 648));
        objc_msgSend(*(id *)(a1 + 648), "vitalityScore");
        MovieLevelMetadataWithSpatialAggressorsSeenMetadata = (id)FigCaptureMetadataUtilitiesCreateMovieLevelMetadataWithVitalityScore(MovieLevelMetadataWithSpatialAggressorsSeenMetadata, objc_msgSend(*(id *)(a1 + 648), "vitalityScoringVersion"), v107);
      }
      if (*(_QWORD *)(a1 + 888))
        MovieLevelMetadataWithSpatialAggressorsSeenMetadata = (id)FigCaptureMetadataUtilitiesCreateMovieLevelMetadataWithVitalityDisabledIfRequired(MovieLevelMetadataWithSpatialAggressorsSeenMetadata);
      if (objc_msgSend(*(id *)(a1 + 648), "limitStillImageTransformDuringVitalityPlayback", sampleTimingArraya))MovieLevelMetadataWithSpatialAggressorsSeenMetadata = (id)FigCaptureMetadataUtilitiesCreateMovieLevelMetadataWithLimitStillImageTransformFlagIfRequired(MovieLevelMetadataWithSpatialAggressorsSeenMetadata);
      if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 648), "subjectRelightingResult"), "relightingRequired"))
      {
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 648), "subjectRelightingResult"), "curveParameter");
        MovieLevelMetadataWithSpatialAggressorsSeenMetadata = (id)FigCaptureMetadataUtilitiesCreateMovieLevelMetadataWithSubjectRelightingAppliedCurveParameter(MovieLevelMetadataWithSpatialAggressorsSeenMetadata, v108);
      }
      has_internal_diagnostics = os_variant_has_internal_diagnostics();
      if (*(_QWORD *)(a1 + 848))
      {
        v110 = *(_QWORD *)(a1 + 840) ? has_internal_diagnostics : 0;
        if (v110 == 1)
          -[BWQuickTimeMovieFileSinkNode _computeTransitionVitalityScore:](a1, *(void **)(a1 + 648));
      }
      if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 648), "stillImageRequestSettings"), "smartStyle"))
        MovieLevelMetadataWithSpatialAggressorsSeenMetadata = (id)FigCaptureMetadataUtilitiesCreateMovieLevelMetadataWithSmartStyleMetadata(MovieLevelMetadataWithSpatialAggressorsSeenMetadata, (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 648), "stillImageRequestSettings"), "smartStyle"), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 648), "settings"), "smartStyleRenderingBypassed"));
    }
    v111 = *(void **)(a1 + 864);
    if (v111)
    {
      objc_msgSend(v111, "computeQualityScore");
      v113 = v112;
      MovieLevelMetadataWithSpatialAggressorsSeenMetadata = (id)FigCaptureMetadataUtilitiesCreateMovieLevelMetadataWithSpatialOverCaptureQualityScore(MovieLevelMetadataWithSpatialAggressorsSeenMetadata, objc_msgSend(*(id *)(a1 + 864), "qualityScoringVersion"), v113);
    }
    if (MovieLevelMetadataWithSpatialAggressorsSeenMetadata
      && (objc_msgSend(MovieLevelMetadataWithSpatialAggressorsSeenMetadata, "isEqual:", objc_msgSend(*(id *)(a1 + v5[951]), "movieLevelMetadata")) & 1) == 0)
    {
      v114 = (const void *)FigMetadataRewriterDictionaryCreateFromFigMetadataPropertyArray();
      objc_msgSend(*(id *)(a1 + v5[951]), "outputURL");
      v115 = FigRewriteMetadata();
      if (v115)
      {
        v155 = v165;
        LODWORD(sampleTimingArraya) = v115;
        FigDebugAssert3();
        if (!v114)
          goto LABEL_187;
        goto LABEL_186;
      }
      if (v114)
LABEL_186:
        CFRelease(v114);
    }
LABEL_187:
    v7 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
    if (*(_BYTE *)(a1 + 714))
    {
      objc_msgSend(*(id *)(a1 + v5[951]), "outputURL");
      v116 = FigConsolidateMovieFragments();
      if (v116)
      {
        v155 = v165;
        LODWORD(sampleTimingArraya) = v116;
        FigDebugAssert3();
      }
    }
    goto LABEL_190;
  }
LABEL_196:
  if (!v166)
  {
LABEL_234:
    v119 = 0;
    goto LABEL_235;
  }
  if (!v8)
    goto LABEL_211;
LABEL_198:
  v119 = *(id *)(a1 + 648);

  *(_QWORD *)(a1 + 648) = 0;
LABEL_235:
  v140 = *(const void **)(a1 + v11[962]);
  if (v140)
  {
    CFRelease(v140);
    *(_QWORD *)(a1 + v11[962]) = 0;
  }
  v141 = *(const void **)(a1 + 600);
  if (v141)
  {
    CFRelease(v141);
    *(_QWORD *)(a1 + 600) = 0;
  }
  bzero(*(void **)(a1 + 608), 4 * (*(_QWORD *)(a1 + 560) + *(_QWORD *)(a1 + 552)));
  objc_msgSend(*(id *)(a1 + 1056), "reset");
  *(_DWORD *)(a1 + 380) = 0;
  *(_QWORD *)(a1 + 1016) = 0;
  *(_QWORD *)(a1 + 1024) = 0;
  *(_QWORD *)(a1 + 1032) = 0;
  *(_QWORD *)(a1 + 1040) = 0;
  *(_QWORD *)(a1 + 1048) = 0;

  *(_QWORD *)(a1 + 968) = 0;
  *(_QWORD *)(a1 + 976) = 0;

  *(_QWORD *)(a1 + 984) = 0;
  *(_BYTE *)(a1 + 1280) = 0;
  objc_msgSend(*(id *)(a1 + 1504), "reset");
  *(_BYTE *)(a1 + 712) = 0;
  *(_BYTE *)(a1 + v13[910]) = 0;
  *(_BYTE *)(a1 + 716) = 0;
  *(_DWORD *)(a1 + 720) = 0;
  dispatch_sync(*(dispatch_queue_t *)(a1 + 568), &__block_literal_global_27);
  if (v119)
  {
    if (v9)
    {
      v142 = -[BWQuickTimeMovieFileSinkNode _verifyMovieTiming:](a1, v119);
      LOBYTE(v9) = v142 == 0;
      if (v142)
        a3 = v142;
      else
        a3 = a3;
    }
    -[BWQuickTimeMovieFileSinkNode _moveOrDeleteTemporaryIrisMovie:recordingSucceeded:](a1, v119, v9);
  }
  v143 = objc_msgSend((id)a1, "recordingStatusDelegate", sampleTimingArraya, v155);
  if (v143)
  {
    v144 = (void *)v143;
    v145 = qtmfsn_movieRecordingIsProRes(*(void **)(a1 + v5[951]));
    if (*(_BYTE *)(a1 + 1448) || v145)
    {
      v146 = *(_QWORD *)(a1 + 912);
      if (v146)
      {
        if (!(_DWORD)a3)
        {
          if (v146 == *(_QWORD *)(a1 + 920))
          {
            LODWORD(v195) = 0;
            type[0] = OS_LOG_TYPE_DEFAULT;
            v147 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            v148 = v195;
            if (os_log_type_enabled(v147, type[0]))
              v149 = v148;
            else
              v149 = v148 & 0xFFFFFFFE;
            if (v149)
            {
              v150 = objc_msgSend((id)a1, "name");
              LODWORD(rhs.value) = 136315906;
              *(CMTimeValue *)((char *)&rhs.value + 4) = (CMTimeValue)"-[BWQuickTimeMovieFileSinkNode _doEndRecordingAtTi"
                                                                      "me:earlyTerminationErrCode:]";
              LOWORD(rhs.flags) = 2048;
              *(_QWORD *)((char *)&rhs.flags + 2) = a1;
              HIWORD(rhs.epoch) = 2112;
              v201 = v150;
              v202 = 1024;
              v203 = -15437;
              LODWORD(v156) = 38;
              _os_log_send_and_compose_impl();
            }
            v7 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            a3 = 4294951859;
          }
          else if (FigDebugIsInternalBuild())
          {
            a3 = 4294951861;
          }
          else
          {
            a3 = 0;
          }
        }
      }
    }
    -[BWQuickTimeMovieFileSinkNode _initAnalyticsDataInIrisMovieInfo:](a1, v119);
    LOBYTE(v156) = v9;
    objc_msgSend(v144, "fileWriter:writerPipelineIndex:stoppedRecordingForSettings:withError:thumbnailSurface:irisMovieInfo:debugMetadataSidecarFileURL:recordingSucceeded:", a1, *(_QWORD *)(a1 + v7[924]), *(_QWORD *)(a1 + v5[951]), a3, *(_QWORD *)(a1 + 576), v119, 0, v156);
  }
  v151 = *(const void **)(a1 + 576);
  if (v151)
  {
    CFRelease(v151);
    *(_QWORD *)(a1 + 576) = 0;
  }
}

- (void)_finishIrisMovieGeneration
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 824));
    v1 = (void *)objc_msgSend(*(id *)(a1 + 672), "copy");
    objc_msgSend(*(id *)(a1 + 672), "removeAllObjects");
    v2 = v1;
    pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 824));
    if (v1)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v3)
      {
        v4 = v3;
        v5 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v4; ++i)
          {
            if (*(_QWORD *)v17 != v5)
              objc_enumerationMutation(v1);
            v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            if (objc_msgSend(v7, "suspended", v11, v13))
              objc_msgSend(v7, "setSuspended:", 0);
            if (dword_1ECFE9510)
            {
              os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            objc_msgSend(v7, "flush", v12, v14);
            if (dword_1ECFE9510)
            {
              v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
          }
          v2 = v1;
          v4 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v4);
      }

    }
    if (dword_1ECFE9510)
    {
      v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  opaqueCMSampleBuffer *v5;
  double v7;
  uint64_t v8;
  int *v9;
  void *v10;
  void *v11;
  id v12;
  BWMovieFileOutputAnalyticsPayload *analyticsPayload;
  opaqueCMSampleBuffer *v14;
  int v15;
  uint64_t v16;
  float v17;
  float v18;
  double v19;
  double v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  OpaqueCMClock *HostTimeClock;
  CMTimeValue value;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  unint64_t numInputs;
  uint64_t v41;
  id v42;
  int v43;
  int v44;
  uint64_t v45;
  int64_t timeOfLastSystemPressureChange;
  int v47;
  unint64_t v48;
  id v49;
  void *i;
  void *v51;
  void *v52;
  int v53;
  unint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  int recordingState;
  opaqueCMSampleBuffer *v59;
  char v60;
  CMTime v61;
  CMTime v62;
  CMTime v63;
  CMTime time;

  if (!a3)
    return;
  v5 = a3;
  memset(&v63, 0, sizeof(v63));
  v7 = BWGetOriginalPresentationTimeStampFromBuffer(a3, (uint64_t)&v63);
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    -[BWQuickTimeMovieFileSinkNode pipelineTraceID](self, "pipelineTraceID", v7);
    time = v63;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  v8 = objc_msgSend(a4, "index");
  v9 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
  if (BWSampleBufferIsMarkerBuffer(v5))
  {
    if ((CMGetAttachment(v5, CFSTR("IrisMovieRequest"), 0)
       || qtmfsn_bufferSpecifiesFileWriterAction(v5, CFSTR("StreamForcedOff"))
       || qtmfsn_bufferSpecifiesFileWriterAction(v5, CFSTR("SpatialAggressorsSeen")))
      && v8 != self->_masterInputIndex)
    {
      return;
    }
    if (objc_msgSend(a4, "index") == self->_masterInputIndex)
    {
      v10 = (void *)CMGetAttachment(v5, CFSTR("RecordingFrameDropsCountDueToISP"), 0);
      if (v10)
      {
        v11 = v10;
        v12 = a4;
        analyticsPayload = self->_analyticsPayload;
        v14 = v5;
        v15 = objc_msgSend(v10, "intValue");
        v16 = -[BWMovieFileOutputAnalyticsPayload numberOfISPFrames](analyticsPayload, "numberOfISPFrames") + v15;
        v5 = v14;
        -[BWMovieFileOutputAnalyticsPayload setNumberOfISPFrames:](analyticsPayload, "setNumberOfISPFrames:", v16);
        a4 = v12;
        v9 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
        -[BWMovieFileOutputAnalyticsPayload setNumberOfISPFramesDropped:](self->_analyticsPayload, "setNumberOfISPFramesDropped:", -[BWMovieFileOutputAnalyticsPayload numberOfISPFramesDropped](self->_analyticsPayload, "numberOfISPFramesDropped")+ (int)objc_msgSend(v11, "intValue"));
        CMRemoveAttachment(v5, CFSTR("RecordingFrameDropsCountDueToISP"));
      }
    }
  }
  v57 = a4;
  if (self->_numVideoTracks
    && objc_msgSend(a4, "index") == self->_masterInputIndex
    && !BWSampleBufferIsMarkerBuffer(v5))
  {
    -[BWMovieFileOutputAnalyticsPayload setNumberOfISPFrames:](self->_analyticsPayload, "setNumberOfISPFrames:", -[BWMovieFileOutputAnalyticsPayload numberOfISPFrames](self->_analyticsPayload, "numberOfISPFrames") + 1);
    objc_msgSend((id)CMGetAttachment(v5, CFSTR("UIZoomFactor"), 0), "floatValue");
    v18 = v17;
    -[BWMovieFileOutputAnalyticsPayload minUIZoomDuringVideoRecording](self->_analyticsPayload, "minUIZoomDuringVideoRecording");
    if (v18 < *(float *)&v19)
    {
      *(float *)&v19 = v18;
      -[BWMovieFileOutputAnalyticsPayload setMinUIZoomDuringVideoRecording:](self->_analyticsPayload, "setMinUIZoomDuringVideoRecording:", v19);
    }
    -[BWMovieFileOutputAnalyticsPayload maxUIZoomDuringVideoRecording](self->_analyticsPayload, "maxUIZoomDuringVideoRecording");
    if (v18 > *(float *)&v20)
    {
      *(float *)&v20 = v18;
      -[BWMovieFileOutputAnalyticsPayload setMaxUIZoomDuringVideoRecording:](self->_analyticsPayload, "setMaxUIZoomDuringVideoRecording:", v20);
    }
    if (self->_capturePipelineLatencyStats)
    {
      v21 = (unint64_t)CMGetAttachment(v5, CFSTR("IrisStagingNodeEmissionTimeStamp"), 0);
      v22 = (unint64_t)CMGetAttachment(v5, CFSTR("FileCoordinatorEmissionTimeStamp"), 0);
      if (v21 | v22)
      {
        v23 = (void *)v22;
        HostTimeClock = CMClockGetHostTimeClock();
        CMClockGetTime(&v62, HostTimeClock);
        CMTimeConvertScale(&v61, &v62, 1000000000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
        value = v61.value;
        if (v21)
        {
          v26 = (double)(value - objc_msgSend((id)v21, "longLongValue"));
          -[BWStats addDataPoint:](self->_irisVideoLatencyStats, "addDataPoint:", v26);
          -[BWMovingWindowStats addDataPoint:](self->_recentIrisVideoLatencyStats, "addDataPoint:", v26);
        }
        if (v23)
        {
          v27 = (double)(value - objc_msgSend(v23, "longLongValue"));
          -[BWMovingWindowStats addDataPoint:](self->_capturePipelineLatencyStats, "addDataPoint:", v27);
          -[BWStats addDataPoint:](self->_videoLatencyStats, "addDataPoint:", v27);
        }
      }
    }
    v28 = (void *)CMGetAttachment(v5, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v29 = v28;
    if (self->_irisVideoFrameDurationStats)
    {
      objc_msgSend((id)objc_msgSend(v28, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D18]), "doubleValue");
      if (v30 > 0.0)
        -[BWStats addDataPoint:](self->_irisVideoFrameDurationStats, "addDataPoint:");
    }
    v31 = (void *)objc_msgSend(v29, "objectForKeyedSubscript:", 0x1E4928E58);
    if ((int)objc_msgSend(v31, "intValue") >= 1 && !self->_irisRetimingRecipeIdentifier)
      self->_irisRetimingRecipeIdentifier = (NSNumber *)v31;
    if (self->_cinematicVideoEnabled && self->_recordingState == 1)
    {
      v32 = (void *)CMGetAttachment(v5, CFSTR("CinematicVideoMovieFileRecordingStats"), 0);
      if (v32)
      {
        v33 = v32;
        self->_cinematicVideoMovieRecordingStats.countOfSoftFocusRequests += objc_msgSend((id)objc_msgSend(v32, "objectForKeyedSubscript:", 0x1E4959F58), "unsignedIntValue");
        self->_cinematicVideoMovieRecordingStats.countOfHardFocusRequests += objc_msgSend((id)objc_msgSend(v33, "objectForKeyedSubscript:", 0x1E4959F38), "unsignedIntValue");
        self->_cinematicVideoMovieRecordingStats.countOfFixedPlaneFocusRequests += objc_msgSend((id)objc_msgSend(v33, "objectForKeyedSubscript:", 0x1E4959F18), "unsignedIntValue");
        self->_cinematicVideoMovieRecordingStats.countOfTapToTrackFailures += objc_msgSend((id)objc_msgSend(v33, "objectForKeyedSubscript:", 0x1E4959F78), "unsignedIntValue");
        self->_cinematicVideoMovieRecordingStats.countOfFixedTaxonomyFocusDecisions += objc_msgSend((id)objc_msgSend(v33, "objectForKeyedSubscript:", 0x1E4959F98), "unsignedIntValue");
        self->_cinematicVideoMovieRecordingStats.countOfNonTaxonomyFocusDecisions += objc_msgSend((id)objc_msgSend(v33, "objectForKeyedSubscript:", 0x1E4959FB8), "unsignedIntValue");
        self->_cinematicVideoMovieRecordingStats.countOfCustomFocusDecisions += objc_msgSend((id)objc_msgSend(v33, "objectForKeyedSubscript:", 0x1E4959FD8), "unsignedIntValue");
        self->_cinematicVideoMovieRecordingStats.countOfAutoFocusDecisions += objc_msgSend((id)objc_msgSend(v33, "objectForKeyedSubscript:", 0x1E4959FF8), "unsignedIntValue");
        CMRemoveAttachment(v5, CFSTR("CinematicVideoMovieFileRecordingStats"));
      }
    }
  }
  v60 = 0;
  v59 = v5;
  do
  {
    recordingState = self->_recordingState;
    if (!-[BWQuickTimeMovieFileSinkNode _driveStateMachineWithBuffer:forInputIndex:sampleBufferAlreadyAtHeadOfQueue:]((uint64_t)self, v59, v8, v60 & 1))
    {
      v34 = 0;
      continue;
    }
    if (!self->_numInputs)
    {
      v34 = 0;
LABEL_56:
      v41 = v9[893];
      v42 = -[NSArray objectAtIndex:](self->_stagingQueues, "objectAtIndex:", *(Class *)((char *)&self->super.super.super.super.isa + v41));
      v8 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v41);
      v59 = (opaqueCMSampleBuffer *)objc_msgSend(v42, "firstObject");
      v60 = 1;
      continue;
    }
    v34 = 0;
    v35 = 0;
    do
    {
      v36 = -[NSArray objectAtIndex:](self->_stagingQueues, "objectAtIndex:", v35);
      v37 = v36;
      while (objc_msgSend(v36, "count"))
      {
        v38 = (void *)objc_msgSend(v37, "firstObject");
        if (BWSampleBufferIsMarkerBuffer(v38))
        {
          v39 = (void *)CMGetAttachment(v38, CFSTR("IrisMovieRequest"), 0);
          if (v39)
          {
            -[BWQuickTimeMovieFileSinkNode _handleIrisMovieRequest:]((uint64_t)self, v39);
          }
          else if (qtmfsn_bufferSpecifiesFileWriterAction(v38, CFSTR("StreamForcedOff")))
          {
            -[BWQuickTimeMovieFileSinkNode _handleStreamForcedOffMarkerBuffer:]((uint64_t)self);
          }
          else
          {
            if (!qtmfsn_bufferSpecifiesFileWriterAction(v38, CFSTR("SpatialAggressorsSeen")))
            {
              ++v34;
              break;
            }
            -[BWQuickTimeMovieFileSinkNode _handleSpatialAggressorsSeenMarkerBuffer:](self, v38);
          }
        }
        else
        {
          -[BWQuickTimeMovieFileSinkNode _writeBuffer:forInputIndex:]((unint64_t)self, (opaqueCMSampleBuffer *)v38, v35);
        }
        objc_msgSend(v37, "removeObjectAtIndex:", 0);
        v36 = v37;
      }
      ++v35;
      numInputs = self->_numInputs;
    }
    while (v35 < numInputs);
    v9 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
    if (v34 == numInputs)
      goto LABEL_56;
  }
  while (v34 == self->_numInputs);
  if (self->_numVideoTracks
    && (Class)objc_msgSend(v57, "index") == *(Class *)((char *)&self->super.super.super.super.isa + v9[893])
    && !BWSampleBufferIsMarkerBuffer(v5))
  {
    v43 = objc_msgSend((id)CMGetAttachment(v5, (CFStringRef)*MEMORY[0x1E0D088E8], 0), "intValue");
    v44 = v43;
    if (v43 >= self->_maxSystemPressureLevel)
    {
      self->_maxSystemPressureLevel = v43;
      self->_factorsContributingToMaxSystemPressureLevel |= objc_msgSend((id)CMGetAttachment(v5, (CFStringRef)*MEMORY[0x1E0D088F0], 0), "intValue");
    }
    if (v44 >= 3 && self->_timeToCriticalSystemPressureInMS == -1)
    {
      mach_absolute_time();
      self->_timeToCriticalSystemPressureInMS = FigHostTimeToNanoseconds() / 0xF4240uLL;
    }
    if (v44 != self->_currentSystemPressureLevel)
    {
      v45 = mach_absolute_time();
      timeOfLastSystemPressureChange = self->_timeOfLastSystemPressureChange;
      if (!timeOfLastSystemPressureChange)
        timeOfLastSystemPressureChange = self->_recordingStartTime;
      self->_timeOfLastSystemPressureChange = timeOfLastSystemPressureChange;
      self->_accumulatedSystemPressureLevel += FigHostTimeToNanoseconds() / 0xF4240uLL * v44;
      self->_timeOfLastSystemPressureChange = v45;
      self->_currentSystemPressureLevel = v44;
    }
  }
  v47 = self->_recordingState;
  if ((!v47 && recordingState || v47 == 2 && recordingState != 2) && self->_numInputs)
  {
    v48 = 0;
    do
    {
      v49 = -[NSArray objectAtIndex:](self->_stagingQueues, "objectAtIndex:", v48);
      for (i = v49; objc_msgSend(v49, "count"); v49 = i)
      {
        v51 = (void *)objc_msgSend(i, "firstObject");
        v52 = v51;
        v53 = self->_recordingState;
        if (!v53)
        {
          if ((qtmfsn_bufferSpecifiesFileWriterAction(v51, CFSTR("Start")) & 1) != 0)
            break;
          v53 = self->_recordingState;
        }
        if (v53 == 2 && (qtmfsn_bufferSpecifiesFileWriterAction(v52, CFSTR("Resume")) & 1) != 0)
          break;
        -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)self, (CMSampleBufferRef)v52);
        objc_msgSend(i, "removeObjectAtIndex:", 0);
      }
      ++v48;
      v54 = self->_numInputs;
    }
    while (v48 < v54);
    if (v54)
    {
      v55 = 0;
      while (1)
      {
        v56 = -[NSArray objectAtIndex:](self->_stagingQueues, "objectAtIndex:", v55);
        if (objc_msgSend(v56, "count"))
          break;
        if (++v55 >= self->_numInputs)
          return;
      }
      -[BWQuickTimeMovieFileSinkNode _driveStateMachineWithBuffer:forInputIndex:sampleBufferAlreadyAtHeadOfQueue:]((uint64_t)self, (opaqueCMSampleBuffer *)objc_msgSend(v56, "firstObject"), v55, 1);
    }
  }
}

- (uint64_t)_driveStateMachineWithBuffer:(uint64_t)a3 forInputIndex:(int)a4 sampleBufferAlreadyAtHeadOfQueue:
{
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v11;
  NSObject *v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  CFTypeRef v16;
  uint64_t v17;
  const void *v18;
  NSObject *v19;
  unsigned int v20;
  unsigned int v21;
  void *v22;
  uint64_t v23;
  CFTypeRef v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  opaqueCMSampleBuffer *v29;
  __CFString *v30;
  uint64_t v31;
  uint64_t v32;
  int *v33;
  uint64_t v34;
  uint64_t v35;
  os_log_type_t type;
  unsigned int v37;
  int v38;
  const char *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v7 = result;
    v8 = (void *)objc_msgSend(*(id *)(result + 392), "objectAtIndex:");
    if (!BWSampleBufferIsMarkerBuffer(a2))
    {
      if (!*(_BYTE *)(v7 + 716))
        -[BWQuickTimeMovieFileSinkNode _driveStateMachineWithMediaBuffer:forInputIndex:inputStagingQueue:sampleBufferAlreadyAtHeadOfQueue:]((CMTime *)v7, a2, a3, v8, a4);
      return 0;
    }
    v9 = (void *)CMGetAttachment(a2, CFSTR("RecordingSettings"), 0);
    if (v9)
      v35 = objc_msgSend(v9, "settingsID");
    else
      v35 = 0;
    if (a4)
    {
      if (!dword_1ECFE9510)
        goto LABEL_13;
    }
    else if (!dword_1ECFE9510)
    {
      goto LABEL_13;
    }
    v37 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_13:
    if ((qtmfsn_bufferSpecifiesFileWriterAction(a2, CFSTR("Stop")) & 1) != 0
      || qtmfsn_bufferSpecifiesFileWriterAction(a2, CFSTR("Flush")))
    {
      v11 = objc_msgSend((id)CMGetAttachment(a2, CFSTR("FramesDroppedDueToFormatWriterQueueFull"), 0), "unsignedLongLongValue");
      *(_QWORD *)(v7 + 920) = v11;
      if (v11)
      {
        v37 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v13 = v37;
        if (os_log_type_enabled(v12, type))
          v14 = v13;
        else
          v14 = v13 & 0xFFFFFFFE;
        if (v14)
        {
          v15 = objc_msgSend((id)v7, "name");
          v38 = 136315650;
          v39 = "-[BWQuickTimeMovieFileSinkNode _driveStateMachineWithBuffer:forInputIndex:sampleBufferAlreadyAtHeadOfQueue:]";
          v40 = 2048;
          v41 = v7;
          v42 = 2112;
          v43 = v15;
          LODWORD(v34) = 32;
          v33 = &v38;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    if (qtmfsn_bufferSpecifiesFileWriterAction(a2, CFSTR("Stop")))
    {
      v16 = CMGetAttachment(a2, CFSTR("TrackFormatDescription"), 0);
      if (v16)
      {
        v17 = *(_QWORD *)(v7 + 640);
        v18 = *(const void **)(v17 + 8 * a3);
        *(_QWORD *)(v17 + 8 * a3) = v16;
        CFRetain(v16);
        if (v18)
          CFRelease(v18);
      }
    }
    if ((a4 & 1) == 0 && objc_msgSend(v8, "count"))
    {
      if (dword_1ECFE9510)
      {
        v37 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v20 = v37;
        if (os_log_type_enabled(v19, type))
          v21 = v20;
        else
          v21 = v20 & 0xFFFFFFFE;
        if (v21)
        {
          v22 = v8;
          v23 = *(_QWORD *)(v7 + 992);
          v24 = CMGetAttachment(a2, CFSTR("FileWriterAction"), 0);
          v38 = 136316162;
          v39 = "-[BWQuickTimeMovieFileSinkNode _driveStateMachineWithBuffer:forInputIndex:sampleBufferAlreadyAtHeadOfQueue:]";
          v40 = 2112;
          v41 = v23;
          v8 = v22;
          v42 = 2112;
          v43 = (uint64_t)v24;
          v44 = 2048;
          v45 = v35;
          v46 = 1024;
          v47 = a3;
          LODWORD(v34) = 48;
          v33 = &v38;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      objc_msgSend(v8, "addObject:", a2, v33, v34);
      return 0;
    }
    v25 = (void *)CMGetAttachment(a2, CFSTR("IrisMovieRequest"), 0);
    if (v25)
    {
      -[BWQuickTimeMovieFileSinkNode _handleIrisMovieRequest:](v7, v25);
      return 0;
    }
    if (qtmfsn_bufferSpecifiesFileWriterAction(a2, CFSTR("Start")))
      return -[BWQuickTimeMovieFileSinkNode _driveStateMachineWithStartMarkerBuffer:forInputIndex:inputStagingQueue:sampleBufferAlreadyAtHeadOfQueue:](v7, a2, v26, v8, a4);
    if (qtmfsn_bufferSpecifiesFileWriterAction(a2, CFSTR("Stop")))
    {
      v28 = v7;
      v29 = a2;
      v30 = CFSTR("Stop");
    }
    else
    {
      if (!qtmfsn_bufferSpecifiesFileWriterAction(a2, CFSTR("Flush")))
      {
        if (qtmfsn_bufferSpecifiesFileWriterAction(a2, CFSTR("Pause")))
          return -[BWQuickTimeMovieFileSinkNode _driveStateMachineWithPauseMarkerBuffer:forInputIndex:inputStagingQueue:sampleBufferAlreadyAtHeadOfQueue:](v7, a2, v31, v8, a4);
        if (qtmfsn_bufferSpecifiesFileWriterAction(a2, CFSTR("Resume")))
          return -[BWQuickTimeMovieFileSinkNode _driveStateMachineWithResumeMarkerBuffer:forInputIndex:inputStagingQueue:sampleBufferAlreadyAtHeadOfQueue:](v7, a2, v32, v8, a4);
        if (!qtmfsn_bufferSpecifiesFileWriterAction(a2, CFSTR("Terminate")))
        {
          if (qtmfsn_bufferSpecifiesFileWriterAction(a2, CFSTR("StreamForcedOff")))
          {
            -[BWQuickTimeMovieFileSinkNode _handleStreamForcedOffMarkerBuffer:](v7);
            return 0;
          }
          if (qtmfsn_bufferSpecifiesFileWriterAction(a2, CFSTR("SpatialAggressorsSeen")))
          {
            -[BWQuickTimeMovieFileSinkNode _handleSpatialAggressorsSeenMarkerBuffer:]((_DWORD *)v7, a2);
            return 0;
          }
        }
        -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)v7, a2);
        return 0;
      }
      v28 = v7;
      v29 = a2;
      v30 = CFSTR("Flush");
    }
    return -[BWQuickTimeMovieFileSinkNode _driveStateMachineWithStopOrFlushMarkerBuffer:requiredAction:forInputIndex:inputStagingQueue:sampleBufferAlreadyAtHeadOfQueue:](v28, v29, v30, v27, v8, a4);
  }
  return result;
}

- (void)_handleIrisMovieRequest:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  if (objc_msgSend(a2, "requestedSDOFVariants"))
  {
    if ((int)objc_msgSend(a2, "numberOfRequestedVariants") >= 2)
    {
      v4 = (void *)objc_msgSend(a2, "copyMovieInfosForRequestedSDOFVariants");
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v15 != v7)
              objc_enumerationMutation(v4);
            -[BWQuickTimeMovieFileSinkNode _handleIrisMovieRequest:](a1, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v6);
      }

      return;
    }
    if (objc_msgSend(a2, "isFinalEnqueuedIrisRequest"))
      objc_msgSend(a2, "setFinalReferenceMovie:", 1);
  }
  if (*(_BYTE *)(a1 + 716) || !*(_DWORD *)(a1 + 584))
  {
    v9 = objc_msgSend((id)a1, "recordingStatusDelegate");
    if (v9)
    {
      v10 = (void *)v9;
      v11 = a2;
      if (*(_QWORD *)(a1 + 944))
      {
        v11 = a2;
        if (objc_msgSend((id)objc_msgSend(a2, "settings"), "spatialOverCaptureMovieURL"))
          v11 = (id)objc_msgSend(a2, "copySpatialOverCaptureVariant");
      }
      if (*(_BYTE *)(a1 + 716))
        v12 = *(unsigned int *)(a1 + 720);
      else
        v12 = 4294951860;
      -[BWQuickTimeMovieFileSinkNode _initAnalyticsDataInIrisMovieInfo:](a1, v11);
      LOBYTE(v13) = 0;
      objc_msgSend(v10, "fileWriter:writerPipelineIndex:stoppedRecordingForSettings:withError:thumbnailSurface:irisMovieInfo:debugMetadataSidecarFileURL:recordingSucceeded:", a1, *(_QWORD *)(a1 + 944), objc_msgSend(a2, "settings"), v12, 0, v11, 0, v13);
    }
  }
  else
  {
    -[BWQuickTimeMovieFileSinkNode _processIrisRequest:](a1, a2);
  }
}

- (uint64_t)_handleStreamForcedOffMarkerBuffer:(uint64_t)result
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *i;
  const void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if (*(_DWORD *)(result + 584))
    {
      *(_BYTE *)(result + 716) = 1;
      *(_DWORD *)(result + 720) = -15431;
      objc_msgSend(*(id *)(result + 664), "setStreamForcedOffErrorCode:", *(unsigned int *)(result + 720));
      objc_msgSend(*(id *)(v1 + 664), "setVitalInputStreamHasBeenForcedOff:", 1);
      v10 = 0u;
      v11 = 0u;
      v8 = 0u;
      v9 = 0u;
      v2 = *(void **)(v1 + 392);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (result)
      {
        v3 = result;
        v4 = *(_QWORD *)v9;
        do
        {
          v5 = 0;
          do
          {
            if (*(_QWORD *)v9 != v4)
              objc_enumerationMutation(v2);
            for (i = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v5); ; objc_msgSend(i, "removeObjectAtIndex:", 0))
            {
              v7 = (const void *)objc_msgSend(i, "firstObject");
              if (!v7 || BWSampleBufferIsMarkerBuffer(v7))
                break;
            }
            ++v5;
          }
          while (v5 != v3);
          result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
          v3 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (_DWORD)_handleSpatialAggressorsSeenMarkerBuffer:(_DWORD *)result
{
  _DWORD *v2;
  int v4;
  int v5;
  int v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  os_log_type_t type;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = result;
    if (result[146])
    {
      result[372] |= objc_msgSend((id)CMGetAttachment(target, CFSTR("StereoVideoCaptureStatus"), 0), "intValue");
      objc_msgSend((id)CMGetAttachment(target, CFSTR("StereoVideoCaptureDuration"), 0), "floatValue");
      v2[373] = v4;
      objc_msgSend((id)CMGetAttachment(target, CFSTR("StereoVideoCaptureStatusPercentageOfFramesWithAggressiveLuxLevel"), 0), "floatValue");
      v2[374] = v5;
      result = (_DWORD *)objc_msgSend((id)CMGetAttachment(target, CFSTR("StereoVideoCaptureStatusPercentageOfFramesWithAggressiveFocusDistance"), 0), "floatValue");
      v2[375] = v6;
      if (dword_1ECFE9510)
      {
        v9 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        return (_DWORD *)fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
  }
  return result;
}

- (void)_writeBuffer:(uint64_t)a3 forInputIndex:
{
  uint64_t v3;
  int v7;
  int v8;
  uint64_t v9;
  const __CFDictionary *MetadataAttachments;
  const __CFDictionary *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFAllocator *v15;
  __CFDictionary *Mutable;
  const void *v17;
  const void *v18;
  const void *v19;
  CFLocaleRef v20;
  const void *v21;
  const void *v22;
  __CFDictionary *v23;
  CFArrayRef v24;
  __CFDictionary *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t, _QWORD, __CFDictionary *);
  int v29;
  int *v30;
  const __CFDictionary *v31;
  int32_t v32;
  id v33;
  CMTimeValue v34;
  uint64_t v35;
  _BOOL4 v36;
  BOOL v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  BOOL v42;
  void *v43;
  void *v44;
  double v45;
  uint64_t v46;
  _BOOL4 v47;
  CFTypeRef v48;
  CFTypeRef v49;
  void *v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t, opaqueCMSampleBuffer *);
  uint64_t v56;
  _BOOL4 v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v60;
  CMTimeEpoch epoch;
  void *v62;
  uint64_t v63;
  __int128 v64;
  int32_t v65;
  uint64_t v66;
  _QWORD *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  __int128 v71;
  uint64_t v72;
  CMTimeEpoch v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  __int128 v78;
  uint64_t v79;
  CMTimeEpoch v80;
  __int128 v81;
  uint64_t v82;
  __int128 v83;
  uint64_t v84;
  __int128 v85;
  uint64_t v86;
  CMTimeEpoch v87;
  OpaqueCMClock *HostTimeClock;
  uint64_t v89;
  uint64_t v90;
  __int128 v91;
  NSObject *v92;
  unint64_t v93;
  uint64_t FigBaseObject;
  void (*v95)(uint64_t, _QWORD, _QWORD, id *);
  id v96;
  uint64_t v97;
  uint64_t v98;
  char v99[8];
  uint64_t v100;
  const __CFAllocator *allocator;
  const __CFString *value;
  const __CFString *v103;
  const __CFDictionary *v104;
  opaqueCMSampleBuffer *v105;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v107;
  NSObject *v108;
  CMTime v109;
  id v110;
  CMTime v111;
  os_log_type_t type;
  CMTime v113;
  CMTime rhs;
  CMTime v115;
  CMTime v116;
  CMTime v117;
  CMTime lhs;
  CMTime values[5];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "inputs"), "objectAtIndex:", a3), "mediaType");
  if (!*(_DWORD *)(*(_QWORD *)(a1 + 608) + 4 * a3))
    return;
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 624);
  if (!*(_BYTE *)(v9 + a3))
  {
    if (v7 != 1986618469)
    {
      *(_BYTE *)(v9 + a3) = 1;
      switch(v7)
      {
        case 1936684398:
          -[BWQuickTimeMovieFileSinkNode _preprocessingForFirstAudioBuffer:forInputIndex:](a1, a2, a3);
          break;
        case 1835365473:
          -[BWQuickTimeMovieFileSinkNode _preprocessingForFirstMetadataBuffer:forInputIndex:]((_QWORD *)a1, a2, a3);
          break;
        case 1635088502:
          -[BWQuickTimeMovieFileSinkNode _preprocessingForFirstAuxiliaryBuffer:forInputIndex:](a1, a2, a3);
          break;
      }
      goto LABEL_26;
    }
    MetadataAttachments = FigCaptureMetadataUtilitiesCreateMetadataAttachments(a2, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                            objc_msgSend((id)objc_msgSend((id)a1, "graph"), "clientExpectsCameraMountedInLandscapeOrientation"));
    v105 = a2;
    v104 = MetadataAttachments;
    if (MetadataAttachments
      && (MetadataAttachments = (const __CFDictionary *)CFDictionaryGetValue(MetadataAttachments, (const void *)*MEMORY[0x1E0CBCB50])) != 0)
    {
      v11 = MetadataAttachments;
      v12 = (const __CFString *)CFDictionaryGetValue(MetadataAttachments, (const void *)*MEMORY[0x1E0CBCBE0]);
      MetadataAttachments = (const __CFDictionary *)CFDictionaryGetValue(v11, (const void *)*MEMORY[0x1E0CBCB98]);
    }
    else
    {
      v12 = 0;
    }
    v13 = CFSTR("Unknown");
    if (v12)
      v14 = v12;
    else
      v14 = CFSTR("Unknown");
    if (MetadataAttachments)
      v13 = (const __CFString *)MetadataAttachments;
    value = v14;
    v103 = v13;
    v15 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 4, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v17 = (const void *)*MEMORY[0x1E0CC47B0];
    v18 = (const void *)*MEMORY[0x1E0CC5C28];
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CC47B0], (const void *)*MEMORY[0x1E0CC5C28]);
    v19 = (const void *)*MEMORY[0x1E0CC47A8];
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CC47A8], CFSTR("com.apple.quicktime.camera.lens_model"));
    v20 = CFLocaleCopyCurrent();
    v21 = (const void *)*MEMORY[0x1E0CC47C0];
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CC47C0], v20);
    v22 = (const void *)*MEMORY[0x1E0CC47E8];
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CC47E8], value);
    v23 = CFDictionaryCreateMutable(v15, 4, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    CFDictionarySetValue(v23, v17, v18);
    CFDictionarySetValue(v23, v19, CFSTR("com.apple.quicktime.camera.focal_length.35mm_equivalent"));
    CFDictionarySetValue(v23, v21, v20);
    CFRelease(v20);
    CFDictionarySetValue(v23, v22, v103);
    values[0].value = (CMTimeValue)Mutable;
    *(_QWORD *)&values[0].timescale = v23;
    v24 = CFArrayCreate(allocator, (const void **)values, 2, MEMORY[0x1E0C9B378]);
    CFRelease(Mutable);
    CFRelease(v23);
    v25 = CFDictionaryCreateMutable(allocator, 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    CFDictionaryAddValue(v25, (const void *)*MEMORY[0x1E0CC47F8], v24);
    CFRelease(v24);
    CFDictionaryAddValue(v25, (const void *)*MEMORY[0x1E0CC47F0], (const void *)*MEMORY[0x1E0CC4758]);
    v26 = *(_QWORD *)(a1 + 592);
    v27 = *(unsigned int *)(*(_QWORD *)(a1 + 608) + 4 * a3);
    v28 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, __CFDictionary *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                               + 24);
    if (v28)
    {
      v29 = v28(v26, v27, *MEMORY[0x1E0CC4600], v25);
      a2 = v105;
      v8 = 1986618469;
      v30 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
      v31 = v104;
      if (!v29)
      {
LABEL_23:
        CFRelease(v25);
        if (v31)
          CFRelease(v31);
        *(_BYTE *)(*(_QWORD *)(a1 + v30[896]) + a3) = 1;
        -[BWQuickTimeMovieFileSinkNode _preprocessingForFirstVideoBuffer:forInputIndex:](a1, a2, a3);
LABEL_26:
        if (*(_QWORD *)(a1 + 704) == a3)
        {
          if (*(_DWORD *)(a1 + 376))
            v32 = *(_DWORD *)(a1 + 376);
          else
            v32 = 600;
          -[BWQuickTimeMovieFileSinkNode _adjustMaxFileDurationForMovieTimeScale:](a1, v32);
        }
        goto LABEL_31;
      }
    }
    else
    {
      v29 = -12782;
      v30 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
      v31 = v104;
    }
    v100 = v3;
    *(_DWORD *)v99 = v29;
    FigDebugAssert3();
    a2 = v105;
    v8 = 1986618469;
    goto LABEL_23;
  }
LABEL_31:
  memset(&v117, 0, sizeof(v117));
  CMSampleBufferGetOutputPresentationTimeStamp(&v117, a2);
  memset(&v116, 0, sizeof(v116));
  CMSampleBufferGetOutputDuration(&v116, a2);
  if (v8 != 1835365473)
  {
    v36 = v8 == 1986618469;
    if (*(_QWORD *)(a1 + 856))
      v37 = v8 == 1986618469;
    else
      v37 = 0;
    if (v37)
    {
      v38 = +[BWVideoQualityMetrics filterMetadata:](BWVideoQualityMetrics, "filterMetadata:", CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0));
      objc_msgSend(*(id *)(a1 + 864), "processMetadata:", v38);
      v39 = *(void **)(a1 + 856);
      values[0] = v117;
      objc_msgSend(v39, "appendObject:forTime:", v38, values);
      pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 824));
      v40 = *(void **)(a1 + 664);
      if (v40)
      {
        v41 = *(_QWORD *)(a1 + 856);
        values[0] = v117;
        objc_msgSend(v40, "updateOverCaptureQualityScoresForMoviesEndingBefore:fromMetadataRingBuffer:", values, v41);
      }
      pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 824));
      v36 = 1;
    }
    if (*(_QWORD *)(a1 + 944))
      v42 = !v36;
    else
      v42 = 1;
    if (!v42)
    {
      v43 = (void *)CMGetAttachment(a2, CFSTR("TotalZoomFactor"), 0);
      if (v43)
      {
        v44 = v43;
        objc_msgSend(v43, "doubleValue");
        if (v45 > *(double *)(a1 + 872))
        {
          objc_msgSend(v44, "doubleValue");
          *(_QWORD *)(a1 + 872) = v46;
        }
      }
    }
    if (*(_QWORD *)(a1 + 848))
      v47 = v36;
    else
      v47 = 0;
    if (v47)
    {
      v48 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D08898], 0);
      if (v48)
      {
        v49 = v48;
        v50 = *(void **)(a1 + 848);
        values[0] = v117;
        objc_msgSend(v50, "appendObject:forTime:", v49, values);
      }
    }
LABEL_57:
    v115 = *(CMTime *)(a1 + 232);
    if (*(_QWORD *)(a1 + 704) == a3)
    {
      if ((*(_BYTE *)(a1 + 436) & 1) == 0)
        *(CMTime *)(a1 + 424) = v117;
      values[0] = v117;
      if ((v116.flags & 1) != 0)
      {
        lhs = v117;
        rhs = v116;
        CMTimeAdd(values, &lhs, &rhs);
      }
      lhs = values[0];
      rhs = *(CMTime *)(a1 + 424);
      if (CMTimeCompare(&lhs, &rhs) >= 1)
      {
        lhs = values[0];
        rhs = *(CMTime *)(a1 + 424);
        CMTimeSubtract(&v115, &lhs, &rhs);
      }
      if ((*(_BYTE *)(a1 + 340) & 1) != 0)
      {
        lhs = v115;
        rhs = *(CMTime *)(a1 + 328);
        if ((CMTimeCompare(&lhs, &rhs) & 0x80000000) == 0)
        {
          v51 = 0;
          v115 = *(CMTime *)(a1 + 232);
          v52 = 4294950883;
          goto LABEL_100;
        }
      }
    }
    -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, a2);
    v53 = *(_QWORD *)(a1 + 592);
    v54 = *(unsigned int *)(*(_QWORD *)(a1 + 608) + 4 * a3);
    v55 = *(uint64_t (**)(uint64_t, uint64_t, opaqueCMSampleBuffer *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 32);
    if (v55)
    {
      v56 = v55(v53, v54, a2);
      if (!(_DWORD)v56)
      {
        *(_BYTE *)(*(_QWORD *)(a1 + 632) + a3) = (v116.flags & 1) == 0;
        if (*(_QWORD *)(a1 + 944) | a3)
          v57 = 0;
        else
          v57 = v36;
        if (v57)
          -[BWQuickTimeMovieFileSinkNode _collectCoreAnalyticsData:](a1, a2);
        v58 = *(_QWORD *)(a1 + 448) + 24 * a3;
        values[0] = v117;
        v59 = *(_OWORD *)v58;
        lhs.epoch = *(_QWORD *)(v58 + 16);
        *(_OWORD *)&lhs.value = v59;
        if (CMTimeCompare(values, &lhs) < 0)
        {
          v60 = *(_QWORD *)(a1 + 448) + 24 * a3;
          epoch = v117.epoch;
          *(_OWORD *)v60 = *(_OWORD *)&v117.value;
          *(_QWORD *)(v60 + 16) = epoch;
          if (*(_QWORD *)(a1 + 704) == a3)
          {
            pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 824));
            v62 = *(void **)(a1 + 664);
            if (v62)
            {
              v113 = v117;
              objc_msgSend(v62, "setActualMovieStartTime:", &v113);
            }
            pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 824));
          }
        }
        if (v8 != 1986618469)
        {
          if (v8 == 1936684398)
          {
            v70 = *(_QWORD *)(a1 + 456) + 24 * a3;
            values[0] = v117;
            v71 = *(_OWORD *)v70;
            lhs.epoch = *(_QWORD *)(v70 + 16);
            *(_OWORD *)&lhs.value = v71;
            if (CMTimeCompare(values, &lhs) >= 1)
            {
              v72 = *(_QWORD *)(a1 + 480) + 24 * a3;
              v73 = v116.epoch;
              *(_OWORD *)v72 = *(_OWORD *)&v116.value;
              *(_QWORD *)(v72 + 16) = v73;
              if ((*(_BYTE *)(*(_QWORD *)(a1 + 480) + 24 * a3 + 12) & 1) == 0)
              {
                v74 = *(_QWORD *)(a1 + 456) + 24 * a3;
                v75 = *(_QWORD *)(v74 + 16);
                v76 = *(_QWORD *)(a1 + 472) + 24 * a3;
                *(_OWORD *)v76 = *(_OWORD *)v74;
                *(_QWORD *)(v76 + 16) = v75;
              }
              v52 = 0;
              v90 = *(_QWORD *)(a1 + 456) + 24 * a3;
              v91 = *(_OWORD *)&v117.value;
              *(_QWORD *)(v90 + 16) = v117.epoch;
              *(_OWORD *)v90 = v91;
              goto LABEL_99;
            }
            goto LABEL_98;
          }
          if (v8 != 1635088502)
          {
            v77 = *(_QWORD *)(a1 + 456) + 24 * a3;
            values[0] = v117;
            v78 = *(_OWORD *)v77;
            lhs.epoch = *(_QWORD *)(v77 + 16);
            *(_OWORD *)&lhs.value = v78;
            if (CMTimeCompare(values, &lhs) >= 1)
            {
              v52 = 0;
              v79 = *(_QWORD *)(a1 + 456) + 24 * a3;
              v80 = v117.epoch;
              *(_OWORD *)v79 = *(_OWORD *)&v117.value;
              *(_QWORD *)(v79 + 16) = v80;
LABEL_99:
              v51 = 1;
LABEL_100:
              memset(&rhs, 0, sizeof(rhs));
              HostTimeClock = CMClockGetHostTimeClock();
              CMClockGetTime(&rhs, HostTimeClock);
              values[0] = rhs;
              v89 = -[BWQuickTimeMovieFileSinkNode _getCurrentFileSize:currentHostTime:](a1, 0, values);
              pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 824));
              *(_QWORD *)(a1 + 176) = v89;
              *(CMTime *)(a1 + 232) = v115;
              if (v51)
                v52 = *(unsigned int *)(a1 + 724);
              pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 824));
              if (!*(_QWORD *)(a1 + 984)
                || *(_QWORD *)(a1 + 704) != a3
                || (values[0] = *(CMTime *)(a1 + 280), lhs = rhs, CMTimeCompare(values, &lhs) > 0))
              {
                if ((_DWORD)v52)
                {
LABEL_106:
                  -[BWQuickTimeMovieFileSinkNode _forceEarlyTerminationWithErrorCode:](a1, v52);
                  goto LABEL_107;
                }
LABEL_124:
                values[0] = *(CMTime *)(a1 + 256);
                lhs = *(CMTime *)(a1 + 232);
                if (CMTimeCompare(values, &lhs) > 0)
                  goto LABEL_125;
                v110 = 0;
                FigBaseObject = FigFormatWriterGetFigBaseObject();
                v95 = *(void (**)(uint64_t, _QWORD, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
                if (v95)
                {
                  v95(FigBaseObject, *MEMORY[0x1E0CC44D0], *MEMORY[0x1E0C9AE00], &v110);
                  v96 = v110;
                }
                else
                {
                  v96 = 0;
                }
                *(_QWORD *)(a1 + 208) = objc_msgSend(v96, "longLongValue", *(_QWORD *)v99, v100);

                if (!*(_QWORD *)(a1 + 208))
                {
                  *(_QWORD *)(a1 + 208) = (uint64_t)((double)(unint64_t)v89 * 0.1);
                  if ((qtmfsn_movieRecordingIsProRes(*(void **)(a1 + 400)) & 1) != 0)
                  {
                    values[0] = *(CMTime *)(a1 + 232);
                    v97 = vcvtd_n_s64_f64(CMTimeGetSeconds(values), 0xAuLL);
                    *(_QWORD *)(a1 + 208) = v97;
                  }
                  else
                  {
                    v97 = *(_QWORD *)(a1 + 208);
                  }
                  if (v97 < 1000000)
                    *(_QWORD *)(a1 + 208) = 1000000;
                }
                if ((qtmfsn_movieRecordingIsProRes(*(void **)(a1 + 400)) & 1) != 0)
                {
                  v98 = *(_QWORD *)(a1 + 208) + *(_QWORD *)(a1 + 1544);
                  *(_QWORD *)(a1 + 208) = v98;
                }
                else
                {
                  v98 = *(_QWORD *)(a1 + 208);
                }
                *(_QWORD *)(a1 + 208) = v98 + 2 * (v89 - *(_QWORD *)(a1 + 224));
                *(_QWORD *)(a1 + 224) = v89;
                v52 = -[BWQuickTimeMovieFileSinkNode _checkFreeSpaceForEstimatedMovieSizeOverhead:](a1, *(_QWORD *)(a1 + 208));
                CMTimeMake(&v109, *(int *)(a1 + 240), *(_DWORD *)(a1 + 240));
                lhs = *(CMTime *)(a1 + 256);
                CMTimeAdd(values, &lhs, &v109);
                *(CMTime *)(a1 + 256) = values[0];
                if (!(_DWORD)v52)
                {
LABEL_125:
                  v93 = *(_QWORD *)(a1 + 184);
                  if (!v93 || *(_QWORD *)(a1 + 208) + v89 < v93)
                  {
LABEL_108:
                    if (*(_BYTE *)(a1 + 737))
                    {
                      if (*(_QWORD *)(a1 + 704) == a3)
                        -[BWQuickTimeMovieFileSinkNode _debugAudioUsingSampleBuffer:](a1, a2);
                    }
                    return;
                  }
                  v52 = 4294950884;
                }
                goto LABEL_106;
              }
              if (*(_QWORD *)(a1 + 968))
              {
                if (!dword_1ECFE9510)
                  goto LABEL_123;
                LODWORD(v110) = 0;
                type = OS_LOG_TYPE_DEFAULT;
                os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
                if (!dword_1ECFE9510)
                  goto LABEL_123;
                LODWORD(v110) = 0;
                type = OS_LOG_TYPE_DEFAULT;
                v107 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              if (dword_1ECFE9510)
              {
                LODWORD(v110) = 0;
                type = OS_LOG_TYPE_DEFAULT;
                v108 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
                if (dword_1ECFE9510)
                {
                  LODWORD(v110) = 0;
                  type = OS_LOG_TYPE_DEFAULT;
                  v92 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT);
                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                }
              }
LABEL_123:
              CMTimeMake(&v111, 5 * rhs.timescale, rhs.timescale);
              lhs = rhs;
              CMTimeAdd(values, &lhs, &v111);
              *(CMTime *)(a1 + 280) = values[0];
              if ((_DWORD)v52)
                goto LABEL_106;
              goto LABEL_124;
            }
LABEL_98:
            v52 = 0;
            goto LABEL_99;
          }
        }
        v63 = *(_QWORD *)(a1 + 456) + 24 * a3;
        values[0] = v117;
        v64 = *(_OWORD *)v63;
        lhs.epoch = *(_QWORD *)(v63 + 16);
        *(_OWORD *)&lhs.value = v64;
        v65 = CMTimeCompare(values, &lhs);
        v66 = *(_QWORD *)(a1 + 472) + 24 * a3;
        if (v65 < 1)
        {
          values[0] = v117;
          v81 = *(_OWORD *)v66;
          lhs.epoch = *(_QWORD *)(v66 + 16);
          *(_OWORD *)&lhs.value = v81;
          if (CMTimeCompare(values, &lhs) < 1)
          {
LABEL_94:
            memset(values, 0, 24);
            CMSampleBufferGetDecodeTimeStamp(values, a2);
            if ((values[0].flags & 1) == 0)
              values[0] = v117;
            v84 = *(_QWORD *)(a1 + 464) + 24 * a3;
            lhs = values[0];
            v85 = *(_OWORD *)v84;
            rhs.epoch = *(_QWORD *)(v84 + 16);
            *(_OWORD *)&rhs.value = v85;
            if (CMTimeCompare(&lhs, &rhs) >= 1)
            {
              v86 = *(_QWORD *)(a1 + 464) + 24 * a3;
              v87 = values[0].epoch;
              *(_OWORD *)v86 = *(_OWORD *)&values[0].value;
              *(_QWORD *)(v86 + 16) = v87;
            }
            goto LABEL_98;
          }
          v67 = (_QWORD *)(a1 + 472);
        }
        else
        {
          v67 = (_QWORD *)(a1 + 456);
          v68 = *(_QWORD *)(a1 + 456) + 24 * a3;
          v69 = *(_QWORD *)(v68 + 16);
          *(_OWORD *)v66 = *(_OWORD *)v68;
          *(_QWORD *)(v66 + 16) = v69;
        }
        v82 = *v67 + 24 * a3;
        v83 = *(_OWORD *)&v117.value;
        *(_QWORD *)(v82 + 16) = v117.epoch;
        *(_OWORD *)v82 = v83;
        goto LABEL_94;
      }
      v52 = v56;
    }
    else
    {
      v52 = 4294954514;
    }
    v100 = v3;
    FigDebugAssert3();
LABEL_107:
    objc_msgSend(*(id *)(a1 + 1000), "logErrorNumber:errorString:", v52, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("when writing media for index %d"), a3, v100));
    goto LABEL_108;
  }
  v33 = *(id *)(a1 + 1536);
  if (!v33)
  {
    v33 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *(_QWORD *)(a1 + 1536) = v33;
  }
  v34 = objc_msgSend((id)objc_msgSend(v33, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3, *(_QWORD *)v99, v100)), "longLongValue");
  if (v117.value > v34)
  {
    v35 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
    objc_msgSend(*(id *)(a1 + 1536), "setObject:forKeyedSubscript:", v35, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3));
    v36 = 0;
    goto LABEL_57;
  }
}

- (CMTime)_printBufferEvent:(CMTime *)result forNodeInputIndex:(CMSampleBufferRef)sbuf eventName:
{
  uint64_t v3;
  const opaqueCMFormatDescription *FormatDescription;
  CMTime v5;
  CMTime lhs;
  CMTime v7;
  size_t sizeArrayOut;
  CMItemCount sizeArrayEntriesNeededOut;
  CMTime v10;
  CMTime v11;
  CMTime v12;

  if (result && (byte_1ECFE9500 & 0x20) != 0)
  {
    v3 = (uint64_t)result;
    FormatDescription = CMSampleBufferGetFormatDescription(sbuf);
    CMFormatDescriptionGetMediaType(FormatDescription);
    memset(&v12, 0, sizeof(v12));
    CMSampleBufferGetDecodeTimeStamp(&v12, sbuf);
    memset(&v11, 0, sizeof(v11));
    CMSampleBufferGetPresentationTimeStamp(&v11, sbuf);
    memset(&v10, 0, sizeof(v10));
    CMSampleBufferGetDuration(&v10, sbuf);
    sizeArrayOut = 0;
    sizeArrayEntriesNeededOut = 0;
    if (!BWSampleBufferIsMarkerBuffer(sbuf)
      && !CMSampleBufferGetSampleSizeArray(sbuf, 0, 0, &sizeArrayEntriesNeededOut)
      && sizeArrayEntriesNeededOut == 1)
    {
      CMSampleBufferGetSampleSizeArray(sbuf, 1, &sizeArrayOut, 0);
    }
    result = (CMTime *)qtmfsn_stringForRecordingState(*(unsigned int *)(v3 + 584));
    if ((v10.flags & 1) != 0)
    {
      memset(&v7, 0, sizeof(v7));
      lhs = v11;
      v5 = v10;
      return CMTimeAdd(&v7, &lhs, &v5);
    }
  }
  return result;
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  uint64_t v6;
  BWNodeFileWriterStatusDelegate *v7;
  BWNodeFileWriterStatusDelegate *v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (!objc_msgSend(a4, "index") && self->_numVideoTracks)
  {
    if (*MEMORY[0x1E0CA1FC0] == 1)
      kdebug_trace();
    if (objc_msgSend(a3, "reason") != 0x1E494EF78
      && (__CFString *)objc_msgSend(a3, "reason") != CFSTR("VideoDeviceDiscontinuity")
      && (__CFString *)objc_msgSend(a3, "reason") != CFSTR("HighFrameRateAutoFocusDiscontinuity"))
    {
      -[BWMovieFileOutputAnalyticsPayload setNumberOfISPFrames:](self->_analyticsPayload, "setNumberOfISPFrames:", -[BWMovieFileOutputAnalyticsPayload numberOfISPFrames](self->_analyticsPayload, "numberOfISPFrames") + 1);
      ++self->_totalNumberOfFramesDropped;
    }
    if (qtmfsn_movieRecordingIsProRes(self->_settings))
    {
      if (objc_msgSend(a3, "reason") == 0x1E494F198)
        v6 = 4294951859;
      else
        v6 = 4294951861;
      v7 = -[BWFileSinkNode recordingStatusDelegate](self, "recordingStatusDelegate");
      if (v7)
      {
        v8 = v7;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        -[BWNodeFileWriterStatusDelegate fileWriter:frameDroppedForSettingsID:withError:](v8, "fileWriter:frameDroppedForSettingsID:withError:", self, -[FigCaptureRecordingSettings settingsID](self->_settings, "settingsID"), v6);
      }
    }
  }
}

- (void)_processIrisRequest:(uint64_t)a1
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  char v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  int v9;
  int v10;
  NSObject *v11;
  int v12;
  int v14;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;

  if (!a1)
    return;
  if (dword_1ECFE9510)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!*(_QWORD *)(a1 + 944))
    goto LABEL_19;
  if (!*(_QWORD *)(a1 + 648) && !*(_QWORD *)(a1 + 664))
  {
    v5 = 0;
LABEL_13:
    if (objc_msgSend((id)objc_msgSend(a2, "settings", v17, v18), "spatialOverCaptureMovieURL"))
    {
      a2 = (id)objc_msgSend(a2, "copySpatialOverCaptureVariant");
      if (!dword_1ECFE9510)
      {
LABEL_19:
        v8 = 0;
        goto LABEL_20;
      }
    }
    else if ((v5 & 1) != 0 || (objc_msgSend(a2, "spatialOverCaptureExpected") & 1) != 0)
    {
      goto LABEL_19;
    }
    v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_19;
  }
  if ((objc_msgSend(a2, "spatialOverCaptureExpected", v17, v18) & 1) != 0)
  {
    v5 = 1;
    goto LABEL_13;
  }
  if (dword_1ECFE9510)
  {
    v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    v8 = 1;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    v8 = 1;
  }
LABEL_20:
  if (*(_QWORD *)(a1 + 664))
  {
    if ((v8 & 1) != 0)
      return;
    goto LABEL_41;
  }
  if (*(_QWORD *)(a1 + 648))
  {
    v9 = v8 ^ 1;
  }
  else
  {
    *(_QWORD *)(a1 + 648) = a2;
    v10 = objc_msgSend(a2, "requestedSDOFVariants");
    if (objc_msgSend(a2, "isMomentCaptureMovieRecording")
      && (objc_msgSend(a2, "isFinalEnqueuedIrisRequest") & 1) == 0)
    {
      if (dword_1ECFE9510)
      {
        v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    else if (!v10)
    {
      return;
    }
    v9 = 0;
  }
  if (!*(_QWORD *)(a1 + 664))
  {
    v12 = *(_DWORD *)(a1 + 584);
    if (v12 == 4 || v12 == 1)
      -[BWQuickTimeMovieFileSinkNode _buildIrisRefMovieGeneratorAndWriteFirstIrisAsRefMovie](a1);
  }
  if (v9)
  {
    if (*(_QWORD *)(a1 + 664))
    {
LABEL_41:
      -[BWQuickTimeMovieFileSinkNode _writeIrisRefMovieWithInfo:]((_QWORD *)a1, a2);
      return;
    }
    v14 = *(_DWORD *)(a1 + 584);
    if (v14 == 3 || v14 == 0)
    {
      objc_msgSend(*(id *)(a1 + 656), "addObject:", a2);
      if (dword_1ECFE9510)
        goto LABEL_51;
    }
    else if (dword_1ECFE9510)
    {
LABEL_51:
      v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

- (unint64_t)lastFileSize
{
  unint64_t currFileSize;

  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  currFileSize = self->_currFileSize;
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
  return currFileSize;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastFileDuration
{
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = self->_currFileDuration;
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
}

- (NSArray)movieLevelMetadata
{
  NSArray *v3;

  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  if (self->_movieLevelMetadata)
    v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:");
  else
    v3 = 0;
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
  return v3;
}

- (void)setMovieLevelMetadata:(id)a3
{
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);

  self->_movieLevelMetadata = (NSArray *)objc_msgSend(a3, "copy");
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
}

- (NSArray)trackReferenceListForMetadataInputs
{
  NSArray *v3;

  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  if (self->_trackReferenceListForMetadataInputs)
    v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:");
  else
    v3 = 0;
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
  return v3;
}

- (uint64_t)_validateTrackReferenceListForInputs:(uint64_t)a3 ofType:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    if (objc_msgSend(a2, "count") && (objc_msgSend(a2, "count") & 1) == 0)
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (!result)
        return result;
      v6 = result;
      v7 = *(_QWORD *)v13;
      while (1)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(a2);
          if (*(_QWORD *)(v5 + 552) <= (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "unsignedIntValue"))
          {
            v9 = (void *)MEMORY[0x1E0C99DA0];
            v10 = *MEMORY[0x1E0C99778];
            v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid input index in track reference list for %@ inputs"), a3);
            goto LABEL_14;
          }
          ++v8;
        }
        while (v6 != v8);
        result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        v6 = result;
        if (!result)
          return result;
      }
    }
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid track reference list for %@ inputs"), a3);
LABEL_14:
    objc_exception_throw((id)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v11, 0));
  }
  return result;
}

- (uint64_t)_setTrackReferenceListForMetadataInputs:(id *)a3 inOutTrackReferenceListForMetadataInputs:
{
  uint64_t v5;
  uint64_t v6;

  if (result)
  {
    v5 = result;
    -[BWQuickTimeMovieFileSinkNode _validateTrackReferenceListForInputs:ofType:](result, a2, (uint64_t)CFSTR("metadata"));
    pthread_mutex_lock(*(pthread_mutex_t **)(v5 + 824));

    v6 = objc_msgSend(a2, "count");
    if (v6)
      v6 = objc_msgSend(a2, "copy");
    *a3 = (id)v6;
    return pthread_mutex_unlock(*(pthread_mutex_t **)(v5 + 824));
  }
  return result;
}

- (NSArray)structuralDependentTrackReferenceListForMetadataInputs
{
  NSArray *v3;

  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  if (self->_structuralDependentTrackReferenceListForMetadataInputs)
    v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:");
  else
    v3 = 0;
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
  return v3;
}

- (NSArray)trackReferenceListForRenderMetadataInputs
{
  NSArray *v3;

  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  if (self->_trackReferenceListForRenderMetadataInputs)
    v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:");
  else
    v3 = 0;
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
  return v3;
}

- (void)setTrackReferenceListForRenderMetadataInputs:(id)a3
{
  -[BWQuickTimeMovieFileSinkNode _setTrackReferenceListForMetadataInputs:inOutTrackReferenceListForMetadataInputs:]((uint64_t)self, a3, (id *)&self->_trackReferenceListForRenderMetadataInputs);
}

- (NSArray)trackReferenceListForVideoInputs
{
  NSArray *v3;

  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  if (self->_trackReferenceListForVideoInputs)
    v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:");
  else
    v3 = 0;
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
  return v3;
}

- (void)setTrackReferenceListForVideoInputs:(id)a3
{
  -[BWQuickTimeMovieFileSinkNode _validateTrackReferenceListForInputs:ofType:]((uint64_t)self, a3, (uint64_t)CFSTR("video"));
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);

  self->_trackReferenceListForVideoInputs = (NSArray *)objc_msgSend(a3, "copy");
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
}

- (NSArray)trackReferenceListForAudioInputs
{
  NSArray *v3;

  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  if (self->_trackReferenceListForAudioInputs)
    v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:");
  else
    v3 = 0;
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
  return v3;
}

- (void)setTrackReferenceListForAudioInputs:(id)a3
{
  -[BWQuickTimeMovieFileSinkNode _validateTrackReferenceListForInputs:ofType:]((uint64_t)self, a3, (uint64_t)CFSTR("audio"));
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);

  self->_trackReferenceListForAudioInputs = (NSArray *)objc_msgSend(a3, "copy");
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
}

- (void)setTrackReferenceListForAudioRemixInputs:(id)a3
{
  -[BWQuickTimeMovieFileSinkNode _validateTrackReferenceListForInputs:ofType:]((uint64_t)self, a3, (uint64_t)CFSTR("audio remix"));
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);

  self->_trackReferenceListForAudioRemixInputs = (NSArray *)objc_msgSend(a3, "copy");
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
}

- (NSArray)taggedMediaCharacteristicsForInputs
{
  NSArray *v3;

  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  if (self->_taggedMediaCharacteristicsForInputs)
    v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:");
  else
    v3 = 0;
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
  return v3;
}

- (void)setTaggedMediaCharacteristicsForInputs:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;

  if (!objc_msgSend(a3, "count") || (objc_msgSend(a3, "count") & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    v9 = CFSTR("invalid tagged characteristics list for inputs");
    goto LABEL_11;
  }
  if (objc_msgSend(a3, "count"))
  {
    v5 = 0;
    while (1)
    {
      if (self->_numInputs <= objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "unsignedIntValue"))
      {
        v7 = (void *)MEMORY[0x1E0C99DA0];
        v8 = *MEMORY[0x1E0C99778];
        v9 = CFSTR("invalid input index in tagged characteristics list for inputs");
        goto LABEL_11;
      }
      v6 = v5 + 1;
      if (!objc_msgSend(a3, "objectAtIndexedSubscript:", v6))
        break;
      v5 = v6 + 1;
      if (v5 >= objc_msgSend(a3, "count"))
        goto LABEL_8;
    }
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    v9 = CFSTR("invalid value %@ in tagged characteristics list for inputs");
LABEL_11:
    objc_exception_throw((id)objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0));
  }
LABEL_8:
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);

  self->_taggedMediaCharacteristicsForInputs = (NSArray *)objc_msgSend(a3, "copy");
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
}

- (BOOL)irisMovieProcessingSuspended
{
  return self->_irisMovieProcessingSuspended;
}

- (void)setIrisMovieProcessingSuspended:(BOOL)a3
{
  _BOOL8 v3;
  BWIrisMovieGenerator *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  if (self->_irisMovieProcessingSuspended == v3)
  {
    pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
  }
  else
  {
    self->_irisMovieProcessingSuspended = v3;
    v5 = self->_irisMovieGenerator;
    v6 = (void *)-[NSMutableArray copy](self->_flushingIrisMovieGenerators, "copy");
    pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
    if (v6)
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v14 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
            objc_msgSend(v11, "setSuspended:", v3);
            if (!v3)
              objc_msgSend(v11, "flushAsync");
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v8);
      }

      if (dword_1ECFE9510)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    if (v5)
    {
      -[BWIrisMovieGenerator setSuspended:](v5, "setSuspended:", v3);

    }
  }
}

- (id)clientApplicationID
{
  return self->_clientApplicationID;
}

- (int)pipelineTraceID
{
  return self->_pipelineTraceID;
}

- (int64_t)maximumAllowedInFlightCompressedBytes
{
  return self->_maximumAllowedInFlightCompressedBytes;
}

- (void)_findStartMarkersWithMatchedStagedSetting:(_QWORD *)a3@<X2> sensorVideoPort:(_QWORD *)a4@<X3> captureDeviceType:(_QWORD *)a5@<X8>
{
  _QWORD *v6;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  CFTypeRef v14;
  CFTypeRef v15;
  void *v16;
  unint64_t v17;
  BOOL v18;
  uint64_t v19;
  CMTimeEpoch epoch;
  const void *v21;
  void *v22;
  int v23;
  void *v24;
  unint64_t v25;
  void *v26;
  CFTypeRef v27;
  uint64_t v28;
  const void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  CMTime v39;

  if (!a1)
  {
    *a5 = 0;
    a5[1] = 0;
    a5[2] = 0;
    return;
  }
  v6 = a4;
  memset(&v39, 0, sizeof(v39));
  if (!*(_QWORD *)(a1 + 552))
  {
    v10 = 0;
    goto LABEL_25;
  }
  v9 = 0;
  v10 = 0;
  v11 = 0;
  do
  {
    v12 = (void *)objc_msgSend(*(id *)(a1 + 392), "objectAtIndex:", v11, v32, v33);
    if (!objc_msgSend(v12, "count"))
      goto LABEL_15;
    v13 = (void *)objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    if (!BWSampleBufferIsMarkerBuffer(v13)
      || (qtmfsn_bufferSpecifiesFileWriterAction(v13, CFSTR("Start")) & 1) == 0)
    {
      v33 = v34;
      LODWORD(v32) = 0;
LABEL_21:
      FigDebugAssert3();
      goto LABEL_15;
    }
    v14 = CMGetAttachment(v13, CFSTR("RecordingSettings"), 0);
    if (!v14)
    {
      v33 = v34;
      LODWORD(v32) = 0;
      goto LABEL_21;
    }
    v15 = v14;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v33 = v34;
      LODWORD(v32) = 0;
      goto LABEL_21;
    }
    if (v10)
    {
      if ((objc_msgSend(v10, "isEqual:", v15) & 1) != 0)
      {
        ++v9;
        goto LABEL_15;
      }
      v33 = v34;
      LODWORD(v32) = 0;
      goto LABEL_21;
    }

    *(_QWORD *)(a1 + 928) = 0;
    v16 = (void *)CMGetAttachment(v13, CFSTR("TemporalScalabilityProperties"), 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      *(_QWORD *)(a1 + 928) = v16;
    ++v9;
    CMSampleBufferGetPresentationTimeStamp(&v39, (CMSampleBufferRef)v13);
    v10 = (void *)v15;
LABEL_15:
    ++v11;
    v17 = *(_QWORD *)(a1 + 552);
  }
  while (v11 < v17);
  v18 = v9 == v17;
  v6 = a4;
  a3 = v35;
  if (!v18)
  {

    *(_QWORD *)(a1 + 928) = 0;
    v19 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)a5 = *MEMORY[0x1E0CA2E18];
    epoch = *(_QWORD *)(v19 + 16);
    goto LABEL_44;
  }
LABEL_25:
  v21 = (const void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 392), "objectAtIndex:", *(_QWORD *)(a1 + 704), v32), "firstObject");
  v22 = (void *)CMGetAttachment(v21, CFSTR("RecordingMaxVideoFrameRate"), 0);
  if (v22)
  {
    objc_msgSend(v22, "floatValue");
    goto LABEL_29;
  }
  if (*(_QWORD *)(a1 + 728))
  {
    v23 = 1131413504;
LABEL_29:
    *(_DWORD *)(a1 + 384) = v23;
  }
  v24 = (void *)CMGetAttachment(v21, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  *a3 = (id)objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
  *v6 = (id)objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0D069B8]);
  -[BWQuickTimeMovieFileSinkNode _determineWhichInputsWeExpectToSeeSamplesFor](a1);
  if (*(_QWORD *)(a1 + 552))
  {
    v25 = 0;
    do
    {
      v26 = (void *)objc_msgSend(*(id *)(a1 + 392), "objectAtIndex:", v25);
      v27 = CMGetAttachment((CMAttachmentBearerRef)objc_msgSend(v26, "firstObject"), CFSTR("TrackFormatDescription"), 0);
      v28 = *(_QWORD *)(a1 + 640);
      v29 = *(const void **)(v28 + 8 * v25);
      *(_QWORD *)(v28 + 8 * v25) = v27;
      if (v27)
        CFRetain(v27);
      if (v29)
        CFRelease(v29);
      objc_msgSend(v26, "removeObjectAtIndex:", 0);
      ++v25;
    }
    while (v25 < *(_QWORD *)(a1 + 552));
  }
  v30 = (id)objc_msgSend(v10, "copy");
  *a2 = v30;
  if (*(_QWORD *)(a1 + 944))
  {
    v31 = objc_msgSend(v30, "spatialOverCaptureMovieURL");
    v30 = *a2;
    if (v31)
    {
      objc_msgSend(*a2, "setOutputURL:", objc_msgSend(v30, "spatialOverCaptureMovieURL"));
      objc_msgSend(*a2, "setMovieLevelMetadata:", objc_msgSend(*a2, "spatialOverCaptureMovieLevelMetadata"));
      v30 = *a2;
    }
  }
  objc_msgSend(v30, "setSpatialOverCaptureMovieURL:", 0);
  objc_msgSend(*a2, "setSpatialOverCaptureMovieLevelMetadata:", 0);
  if (*(_BYTE *)(a1 + 1484))
  {
    -[BWQuickTimeMovieFileSinkNode _addStereoMovieLevelMetadataToSettingsMovieLevelMetadata:](a1, *a2);
    if (!*(_QWORD *)(a1 + 1504))
      *(_QWORD *)(a1 + 1504) = objc_alloc_init(BWStereoVideoCaptureAnalyticsPayload);
  }
  *(_OWORD *)a5 = *(_OWORD *)&v39.value;
  epoch = v39.epoch;
LABEL_44:
  a5[2] = epoch;
}

- (void)_determineWhichInputsWeExpectToSeeSamplesFor
{
  unint64_t v2;
  CFTypeRef v3;

  if (a1)
  {
    bzero(*(void **)(a1 + 616), *(_QWORD *)(a1 + 552));
    if (*(_QWORD *)(a1 + 552))
    {
      v2 = 0;
      v3 = (CFTypeRef)*MEMORY[0x1E0C9AE50];
      do
      {
        *(_BYTE *)(*(_QWORD *)(a1 + 616) + v2) = CMGetAttachment((CMAttachmentBearerRef)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 392), "objectAtIndexedSubscript:", v2), "objectAtIndexedSubscript:", 0), CFSTR("FileWriterStartActionModifier_NoDataWillBeProvidedForThisRecording"), 0) != v3;
        ++v2;
      }
      while (v2 < *(_QWORD *)(a1 + 552));
    }
  }
}

- (void)_addStereoMovieLevelMetadataToSettingsMovieLevelMetadata:(uint64_t)a1
{
  id MovieLevelMetadataWithSpatialVersionMetadata;

  if (a1)
  {
    MovieLevelMetadataWithSpatialVersionMetadata = (id)FigCaptureMetadataUtilitiesCreateMovieLevelMetadataWithSpatialVersionMetadata((void *)objc_msgSend(a2, "movieLevelMetadata"), (uint64_t)CFSTR("1.0"));
    objc_msgSend(a2, "setMovieLevelMetadata:", MovieLevelMetadataWithSpatialVersionMetadata);

  }
}

- (uint64_t)_findMarkers:(uint64_t)a3@<X8>
{
  uint64_t v4;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  opaqueCMSampleBuffer *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CMTime time2;
  CMTime time1;
  CMTime v20;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!result)
  {
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
    return result;
  }
  v4 = result;
  value = *MEMORY[0x1E0CA2E18];
  flags = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 12);
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
  epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  if (!*(_QWORD *)(result + 552))
    goto LABEL_20;
  v8 = 0;
  v9 = 0;
  do
  {
    v10 = (void *)objc_msgSend(*(id *)(v4 + 392), "objectAtIndex:", v9, v14, v15);
    result = objc_msgSend(v10, "count");
    if (!result)
      goto LABEL_11;
    v11 = (opaqueCMSampleBuffer *)objc_msgSend(v10, "firstObject");
    if (BWSampleBufferIsMarkerBuffer(v11)
      && (qtmfsn_bufferSpecifiesFileWriterAction(v11, a2) & 1) != 0)
    {
      memset(&v20, 0, sizeof(v20));
      result = (uint64_t)CMSampleBufferGetPresentationTimeStamp(&v20, v11);
      if ((flags & 1) == 0)
      {
        value = v20.value;
        flags = v20.flags;
        timescale = v20.timescale;
        epoch = v20.epoch;
LABEL_10:
        ++v8;
        goto LABEL_11;
      }
      time1.timescale = timescale;
      time1.flags = flags;
      time1.epoch = epoch;
      time2 = v20;
      time1.value = value;
      result = CMTimeCompare(&time1, &time2);
      if (!(_DWORD)result)
        goto LABEL_10;
      v15 = v16;
      LODWORD(v14) = 0;
    }
    else
    {
      v15 = v16;
      LODWORD(v14) = 0;
    }
    result = FigDebugAssert3();
LABEL_11:
    ++v9;
    v12 = *(_QWORD *)(v4 + 552);
  }
  while (v9 < v12);
  if (v8 == v12)
  {
    if (v12)
    {
      v13 = 0;
      do
        result = objc_msgSend((id)objc_msgSend(*(id *)(v4 + 392), "objectAtIndex:", v13++, v14), "removeObjectAtIndex:", 0);
      while (v13 < *(_QWORD *)(v4 + 552));
    }
LABEL_20:
    *(_QWORD *)a3 = value;
    *(_DWORD *)(a3 + 8) = timescale;
    *(_DWORD *)(a3 + 12) = flags;
    *(_QWORD *)(a3 + 16) = epoch;
  }
  else
  {
    *(_OWORD *)a3 = *MEMORY[0x1E0CA2E18];
    *(_QWORD *)(a3 + 16) = v17;
  }
  return result;
}

- (uint64_t)_handleFormatWriterErrorOccurredCallback:(void *)a3 userInfo:
{
  uint64_t v4;

  if (result)
  {
    v4 = result;
    pthread_mutex_lock(*(pthread_mutex_t **)(result + 824));
    *(_DWORD *)(v4 + 724) = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CC4360]), "integerValue");
    if (!*(_DWORD *)(v4 + 724))
      *(_DWORD *)(v4 + 724) = -1;
    return pthread_mutex_unlock(*(pthread_mutex_t **)(v4 + 824));
  }
  return result;
}

- (uint64_t)_isLastFallbackAudioTrack:(void *)a1
{
  uint64_t v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  _BOOL8 v7;

  if (!a1)
    return 0;
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", (a2 - 1));
  v4 = (void *)objc_msgSend(a1, "trackReferenceListForAudioInputs");
  if ((unint64_t)objc_msgSend(v4, "count") < 2
    || (objc_msgSend(v4, "count") & 1) != 0
    || !objc_msgSend(v4, "count"))
  {
    return 1;
  }
  v5 = 0;
  do
  {
    v6 = objc_msgSend(v4, "objectAtIndex:", v5);
    v7 = v6 != v3;
    if (v6 == v3)
      break;
    v5 += 2;
  }
  while (objc_msgSend(v4, "count") > v5);
  return v7;
}

- (uint64_t)_startUpFormatWriterAtTime:(void *)a3 withSettings:
{
  uint64_t v3;
  __int128 *v6;
  CMTimeEpoch v7;
  __int128 v8;
  OpaqueCMClock *HostTimeClock;
  uint64_t v10;
  uint64_t v11;
  uint64_t FigBaseObject;
  uint64_t (*v13)(uint64_t, _QWORD);
  uint64_t v14;
  const void *Value;
  _QWORD *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, _QWORD, void *);
  uint64_t v19;
  uint64_t (*v20)(uint64_t, _QWORD, void *);
  CFDictionaryRef v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, _QWORD, CFDictionaryRef);
  int IsFileOnExternalStorageDevice;
  _QWORD *v25;
  CFDictionaryRef v26;
  CFDictionaryRef v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, _QWORD, CFDictionaryRef);
  int v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, const __CFString *, _QWORD);
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, _QWORD, uint64_t);
  uint64_t v39;
  void *v40;
  void *v41;
  unsigned int *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t, _QWORD, uint64_t);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v64;
  const void *v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t (*v95)(uint64_t, uint64_t, uint64_t, uint64_t);
  CFDictionaryRef v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, uint64_t, uint64_t, CFDictionaryRef);
  uint64_t v100;
  uint64_t v101;
  uint64_t (*v102)(uint64_t, uint64_t, uint64_t, void *);
  uint64_t v103;
  int v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t (*v107)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t (*v112)(uint64_t, uint64_t, uint64_t, const __CFString *);
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t (*v116)(uint64_t, uint64_t, uint64_t, const __CFString *);
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t (*v120)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t (*v124)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v125;
  int v126;
  unsigned int *v127;
  uint64_t v128;
  uint64_t (*v129)(uint64_t, uint64_t, _QWORD, uint64_t);
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t (*v134)(uint64_t, uint64_t, _QWORD, uint64_t);
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t (*v138)(uint64_t, uint64_t, _QWORD, _QWORD);
  uint64_t v139;
  void *v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  uint64_t v147;
  void *v148;
  BOOL v149;
  BOOL v150;
  void *v152;
  void *v153;
  int *v154;
  void *v155;
  void *v156;
  uint64_t v157;
  void *v158;
  void *v159;
  uint64_t v160;
  uint64_t (*v161)(uint64_t, _QWORD, void *);
  int v162;
  void *v163;
  void *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t i;
  void *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t (*v171)(uint64_t, uint64_t, uint64_t, const __CFAllocator *, CMTime *);
  int v172;
  const void *v173;
  const void *v174;
  void *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t j;
  uint64_t v180;
  uint64_t (*v181)(const void *, uint64_t, uint64_t, uint64_t, _QWORD);
  int v182;
  uint64_t v183;
  uint64_t (*v184)(uint64_t, CMTime *);
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  __int128 *v188;
  uint64_t v189;
  unint64_t v190;
  __int128 v191;
  uint64_t v192;
  __int128 v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  unint64_t v198;
  __int128 v199;
  uint64_t v200;
  uint64_t v201;
  unint64_t v202;
  uint64_t v203;
  unint64_t v204;
  __int128 v205;
  uint64_t v206;
  __int128 v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  int32_t v211;
  opaqueCMSampleBuffer *QuickTimeMovieStillImageTimeSampleBuffer;
  opaqueCMSampleBuffer *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t (*v217)(uint64_t, uint64_t, _QWORD, uint64_t);
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  CMTimeEpoch v232;
  uint64_t v233;
  uint64_t v234;
  unsigned int *v235;
  void *v236;
  void *key;
  void *keya;
  __int128 v239;
  uint64_t v240;
  const __CFAllocator *allocator;
  uint64_t v242;
  int obj;
  id obja;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  CMTime v260;
  CMTime time2;
  CMTime v262;
  CFDictionaryRef theDict;
  CMTime time;
  _BYTE v265[128];
  _BYTE v266[128];
  CMFormatDescriptionRef FormatDescription;
  uint64_t v268;
  _QWORD v269[3];

  v3 = a1;
  v269[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return v3;
  theDict = 0;
  bzero(*(void **)(a1 + 624), *(_QWORD *)(a1 + 552));
  bzero(*(void **)(v3 + 632), *(_QWORD *)(v3 + 560) + *(_QWORD *)(v3 + 552));
  *(_BYTE *)(v3 + 714) = 0;
  *(_BYTE *)(v3 + 715) = 0;
  *(_QWORD *)(v3 + 176) = 0;
  v6 = (__int128 *)MEMORY[0x1E0CA2E68];
  v7 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  *(_QWORD *)(v3 + 248) = v7;
  v8 = *v6;
  *(_OWORD *)(v3 + 232) = *v6;
  v239 = v8;
  *(_OWORD *)(v3 + 256) = v8;
  *(_QWORD *)(v3 + 272) = v7;
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&time, HostTimeClock);
  *(CMTime *)(v3 + 352) = time;
  v10 = *(_QWORD *)(v3 + 368);
  *(_OWORD *)(v3 + 280) = *(_OWORD *)(v3 + 352);
  *(_QWORD *)(v3 + 296) = v10;
  *(_DWORD *)(v3 + 376) = 600;
  *(_DWORD *)(v3 + 688) = 0;
  *(_DWORD *)(v3 + 692) = 0;
  objc_msgSend((id)v3, "setMovieLevelMetadata:", 0);
  *(_QWORD *)(v3 + 192) = 0;
  *(_QWORD *)(v3 + 200) = 0;
  if (qtmfsn_movieRecordingIsProRes(a3))
    BWGetCurrentTotalNANDReadAndWriteBytes((uint64_t *)(v3 + 192), (uint64_t *)(v3 + 200));
  CMTimeMake(&time, 0, 1);
  *(CMTime *)(v3 + 304) = time;
  if (!*(_QWORD *)(v3 + 304))
  {
    v11 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)(v3 + 304) = *MEMORY[0x1E0CA2E18];
    *(_QWORD *)(v3 + 320) = *(_QWORD *)(v11 + 16);
  }
  *(_QWORD *)(v3 + 184) = 0;
  *(_QWORD *)(v3 + 216) = 0;
  v242 = v3;
  FigBaseObject = FigFormatWriterGetFigBaseObject();
  v13 = *(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (!v13)
  {
    v3 = 4294954514;
LABEL_13:
    v221 = v251;
    LODWORD(v219) = v3;
    goto LABEL_159;
  }
  allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v14 = v13(FigBaseObject, *MEMORY[0x1E0CC4478]);
  if ((_DWORD)v14)
  {
    v3 = v14;
    goto LABEL_13;
  }
  if (theDict)
  {
    Value = CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E0CC4760]);
    v16 = (_QWORD *)MEMORY[0x1E0CC4808];
    if (Value)
    {
      v17 = FigMetadataWriterGetFigBaseObject();
      v18 = *(uint64_t (**)(uint64_t, _QWORD, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
      if (v18)
        v3 = v18(v17, *v16, &unk_1E49F88C8);
      else
        v3 = 4294954514;
    }
    else
    {
      v3 = 0;
    }
    if (CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E0CC4758]))
    {
      v19 = FigMetadataWriterGetFigBaseObject();
      v20 = *(uint64_t (**)(uint64_t, _QWORD, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
      if (v20)
        v3 = v20(v19, *v16, &unk_1E49F88C8);
      else
        v3 = 4294954514;
    }
  }
  else
  {
    v3 = 0;
  }
  memset(&v262, 0, sizeof(v262));
  if (a3)
  {
    objc_msgSend(a3, "movieFragmentInterval");
    if ((v262.flags & 1) != 0)
    {
      time = v262;
      v21 = CMTimeCopyAsDictionary(&time, allocator);
      v22 = FigFormatWriterGetFigBaseObject();
      v23 = *(uint64_t (**)(uint64_t, _QWORD, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
      v3 = v23 ? v23(v22, *MEMORY[0x1E0CC4488], v21) : 4294954514;
      *(_BYTE *)(v242 + 714) = (_DWORD)v3 == 0;
      if (v21)
        CFRelease(v21);
    }
  }
  objc_msgSend(a3, "outputURL");
  IsFileOnExternalStorageDevice = FigFileIsFileOnExternalStorageDevice();
  v25 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if (IsFileOnExternalStorageDevice)
  {
    memset(&time, 0, sizeof(time));
    CMTimeMakeWithSeconds(&time, 1.0, 1);
    time2 = time;
    v26 = CMTimeCopyAsDictionary(&time2, allocator);
    if (!v26)
      goto LABEL_36;
    v27 = v26;
    v28 = FigFormatWriterGetFigBaseObject();
    v29 = *(uint64_t (**)(uint64_t, _QWORD, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v29)
    {
      v30 = v29(v28, *MEMORY[0x1E0CC4450], v27);
      if (!v30)
      {
LABEL_35:
        CFRelease(v27);
LABEL_36:
        v31 = FigFormatWriterGetFigBaseObject();
        v32 = *(uint64_t (**)(uint64_t, const __CFString *, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                            + 56);
        if (v32)
        {
          v33 = v32(v31, CFSTR("JoinWritingThreadToNewWorkgroup"), *v25);
          if (!v33)
          {
LABEL_41:
            v3 = 0;
            goto LABEL_42;
          }
        }
        else
        {
          v33 = -12782;
        }
        v220 = v251;
        LODWORD(v219) = v33;
        FigDebugAssert3();
        goto LABEL_41;
      }
    }
    else
    {
      v30 = -12782;
    }
    v220 = v251;
    LODWORD(v219) = v30;
    FigDebugAssert3();
    goto LABEL_35;
  }
LABEL_42:
  v232 = v7;
  v34 = v242;
  if ((*(_BYTE *)(v242 + 316) & 1) == 0)
  {
    if (a3)
      objc_msgSend(a3, "maxDuration");
    else
      memset(&time, 0, sizeof(time));
    *(CMTime *)(v242 + 304) = time;
    v34 = v242;
    if ((*(_BYTE *)(v242 + 316) & 1) != 0)
    {
      time = *(CMTime *)(v242 + 304);
      *(_OWORD *)&time2.value = v239;
      time2.epoch = v232;
      if (!CMTimeCompare(&time, &time2))
      {
        v35 = MEMORY[0x1E0CA2E18];
        *(_OWORD *)(v242 + 304) = *MEMORY[0x1E0CA2E18];
        *(_QWORD *)(v242 + 320) = *(_QWORD *)(v35 + 16);
      }
    }
  }
  if (!*(_QWORD *)(v34 + 184))
  {
    *(_QWORD *)(v34 + 184) = objc_msgSend(a3, "maxFileSize");
    objc_msgSend(a3, "outputURL");
    if (FigFileIsFileOnExternalStorageDevice())
    {
      v44 = (void *)objc_msgSend(a3, "outputURL");
      v45 = *MEMORY[0x1E0C99C30];
      v269[0] = *MEMORY[0x1E0C99C30];
      v46 = (void *)objc_msgSend(v44, "resourceValuesForKeys:error:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v269, 1), 0);
      if (v46)
      {
        v47 = (void *)objc_msgSend(v46, "objectForKeyedSubscript:", v45);
        if (v47)
        {
          v48 = v47;
          v49 = *(_QWORD *)(v34 + 184);
          v50 = objc_msgSend(v47, "longLongValue");
          if (v49)
          {
            if (v49 >= v50)
              v50 = objc_msgSend(v48, "longLongValue");
            else
              v50 = *(_QWORD *)(v242 + 184);
          }
          v34 = v242;
          *(_QWORD *)(v242 + 184) = v50;
        }
      }
    }
  }
  if (!*(_QWORD *)(v34 + 216))
    *(_QWORD *)(v34 + 216) = objc_msgSend(a3, "minFreeDiskSpaceLimit");
  v36 = objc_msgSend(a3, "movieLevelMetadata", v219, v220);
  objc_msgSend((id)v34, "setMovieLevelMetadata:", v36);
  if (v36)
  {
    v37 = FigFormatWriterGetFigBaseObject();
    v38 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v38)
    {
      v3 = v38(v37, *MEMORY[0x1E0CC4470], v36);
      if (!(_DWORD)v3)
      {
        v34 = v242;
        goto LABEL_56;
      }
    }
    else
    {
      v3 = 4294954514;
    }
    v221 = v251;
    LODWORD(v219) = v3;
LABEL_159:
    FigDebugAssert3();
    v127 = 0;
    v53 = v242;
    goto LABEL_297;
  }
LABEL_56:
  v231 = a2;
  v39 = *(_QWORD *)(v34 + 320);
  *(_OWORD *)(v34 + 328) = *(_OWORD *)(v34 + 304);
  *(_QWORD *)(v34 + 344) = v39;
  *(_QWORD *)(v34 + 208) = 1000000;
  *(_QWORD *)(v34 + 224) = 0;
  v40 = (void *)objc_msgSend((id)v34, "trackReferenceListForMetadataInputs");
  v41 = v40;
  if (*(_QWORD *)(v34 + 728))
  {
    v42 = (unsigned int *)objc_msgSend(v40, "count");
    if (v42)
    {
      v43 = v242;
      v42 = (unsigned int *)malloc_type_calloc(*(_QWORD *)(v242 + 728), 4uLL, 0x100004052888210uLL);
      goto LABEL_67;
    }
  }
  else
  {
    v42 = 0;
  }
  v43 = v242;
LABEL_67:
  v235 = v42;
  v236 = a3;
  if (!*(_QWORD *)(v43 + 552))
  {
    v53 = v242;
LABEL_145:
    if (!objc_msgSend(a3, "isIrisRecording"))
    {
      v127 = v235;
      goto LABEL_161;
    }
    v127 = v235;
    if (v235 && (int)*v235 >= 1 && (objc_msgSend(v236, "isIrisMovieRecording") & 1) == 0)
    {
      v128 = *(_QWORD *)(v53 + 592);
      v129 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                         + 8);
      if (v129)
      {
        v130 = v129(v128, 1835365473, 0, v53 + 688);
        if (!(_DWORD)v130)
        {
          qtmfsn_setTrackProperties(*(_QWORD *)(v53 + 592), *(unsigned int *)(v53 + 688), 1835365473, v236);
          *(_DWORD *)(v53 + 692) = *v235;
          v131 = *(_QWORD *)(v53 + 592);
          v132 = *(unsigned int *)(v53 + 688);
          v133 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(v53 + 692));
          v134 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 24);
          if (v134)
          {
            v135 = v134(v131, v132, *MEMORY[0x1E0CC45F0], v133);
            if (!(_DWORD)v135)
            {
              v136 = *(_QWORD *)(v53 + 592);
              v137 = *(unsigned int *)(v53 + 688);
              v138 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                            + 16)
                                                                                + 24);
              if (v138)
              {
                v139 = v138(v136, v137, *MEMORY[0x1E0CC45B0], *MEMORY[0x1E0C9AE40]);
                if (!(_DWORD)v139)
                {
                  if (*(_QWORD *)(v53 + 888))
                    v140 = (void *)objc_msgSend(MEMORY[0x1E0C99D50], "data");
                  else
                    v140 = 0;
                  v211 = *(_DWORD *)(v53 + 692);
                  *(_OWORD *)&time.value = v239;
                  time.epoch = v232;
                  QuickTimeMovieStillImageTimeSampleBuffer = FigCaptureMetadataUtilitiesCreateQuickTimeMovieStillImageTimeSampleBuffer((uint64_t)&time, v140, *(_QWORD *)(v53 + 896), v211);
                  if (!QuickTimeMovieStillImageTimeSampleBuffer)
                  {
                    LODWORD(v219) = 0;
                    FigDebugAssert3();
                    v3 = 4294954586;
                    objc_msgSend(*(id *)(v53 + 1000), "logErrorNumber:errorString:", 4294954586, CFSTR("starting format writer"), v219, v251);
                    goto LABEL_298;
                  }
                  v213 = QuickTimeMovieStillImageTimeSampleBuffer;
                  v214 = *(_QWORD *)(v53 + 592);
                  v215 = *(unsigned int *)(v53 + 688);
                  FormatDescription = CMSampleBufferGetFormatDescription(QuickTimeMovieStillImageTimeSampleBuffer);
                  v216 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &FormatDescription, 1);
                  v217 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                 + 16)
                                                                                     + 24);
                  if (!v217)
                  {
                    CFRelease(v213);
                    v3 = 4294954514;
LABEL_295:
                    v221 = v251;
                    LODWORD(v219) = v3;
                    goto LABEL_296;
                  }
                  v3 = v217(v214, v215, *MEMORY[0x1E0CC4590], v216);
                  CFRelease(v213);
                  if ((_DWORD)v3)
                    goto LABEL_295;
                  goto LABEL_161;
                }
                v3 = v139;
              }
              else
              {
                v3 = 4294954514;
              }
              v221 = v251;
              LODWORD(v219) = v3;
              goto LABEL_296;
            }
            v3 = v135;
          }
          else
          {
            v3 = 4294954514;
          }
          v221 = v251;
          LODWORD(v219) = v3;
          goto LABEL_296;
        }
        v3 = v130;
      }
      else
      {
        v3 = 4294954514;
      }
      v221 = v251;
      LODWORD(v219) = v3;
      goto LABEL_296;
    }
LABEL_161:
    if ((objc_msgSend(v236, "isIrisRecording") & 1) == 0)
    {
      v141 = -[BWQuickTimeMovieFileSinkNode _addMovieSegmentMetadataTrackUsingMovieSettings:withVideoTimeScales:](v53, v236, v127);
      v3 = v141;
      if ((_DWORD)v141)
      {
        v221 = v251;
        LODWORD(v219) = v141;
        goto LABEL_296;
      }
    }
    v142 = v53;
    v143 = (void *)objc_msgSend((id)v53, "structuralDependentTrackReferenceListForMetadataInputs");
    v144 = (void *)objc_msgSend((id)v142, "trackReferenceListForRenderMetadataInputs");
    v145 = (void *)objc_msgSend((id)v142, "trackReferenceListForVideoInputs");
    v146 = (void *)objc_msgSend((id)v142, "trackReferenceListForAudioInputs");
    v147 = objc_msgSend((id)v142, "trackReferenceListForAudioRemixInputs");
    v148 = (void *)v147;
    if (!v41)
    {
      v149 = *(int *)(v142 + 688) <= 0 && v145 == 0;
      v150 = v149 && v146 == 0;
      if (v150 && v147 == 0)
      {
        v53 = v142;
        v157 = v231;
        v154 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
LABEL_202:
        v163 = (void *)objc_msgSend((id)v53, "taggedMediaCharacteristicsForInputs", v219, v222);
        if (objc_msgSend(v163, "count"))
        {
          v164 = -[BWQuickTimeMovieFileSinkNode _validateTaggedMediaCharacteristicsForInputIndexes:](v53, v163);
          v256 = 0u;
          v257 = 0u;
          v258 = 0u;
          v259 = 0u;
          obja = v164;
          v248 = objc_msgSend(v164, "countByEnumeratingWithState:objects:count:", &v256, v266, 16);
          if (v248)
          {
            v246 = *(_QWORD *)v257;
            v240 = *MEMORY[0x1E0CC4608];
            keya = (void *)*MEMORY[0x1E0CC4760];
            v165 = *MEMORY[0x1E0CC6288];
            v166 = *MEMORY[0x1E0CC6280];
            while (1)
            {
              for (i = 0; i != v248; ++i)
              {
                if (*(_QWORD *)v257 != v246)
                  objc_enumerationMutation(obja);
                v168 = *(void **)(*((_QWORD *)&v256 + 1) + 8 * i);
                time.value = 0;
                v169 = *(_QWORD *)(v53 + 592);
                v170 = objc_msgSend(v168, "unsignedIntValue", v219, v221);
                v171 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, const __CFAllocator *, CMTime *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
                if (!v171)
                {
                  v172 = -12782;
LABEL_212:
                  v221 = v251;
                  LODWORD(v219) = v172;
                  FigDebugAssert3();
                  goto LABEL_213;
                }
                v172 = v171(v169, v170, v240, allocator, &time);
                if (v172)
                  goto LABEL_212;
LABEL_213:
                if (!time.value)
                  continue;
                v250 = i;
                v173 = CFDictionaryGetValue((CFDictionaryRef)time.value, keya);
                if (!v173)
                  goto LABEL_227;
                v174 = v173;
                v254 = 0u;
                v255 = 0u;
                v252 = 0u;
                v253 = 0u;
                v175 = (void *)objc_msgSend(obja, "objectForKeyedSubscript:", v168);
                v176 = objc_msgSend(v175, "countByEnumeratingWithState:objects:count:", &v252, v265, 16);
                if (!v176)
                  goto LABEL_227;
                v177 = v176;
                v178 = *(_QWORD *)v253;
                do
                {
                  for (j = 0; j != v177; ++j)
                  {
                    if (*(_QWORD *)v253 != v178)
                      objc_enumerationMutation(v175);
                    v180 = *(_QWORD *)(*((_QWORD *)&v252 + 1) + 8 * j);
                    v181 = *(uint64_t (**)(const void *, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
                    if (v181)
                    {
                      v182 = v181(v174, v165, v166, v180, 0);
                      if (!v182)
                        continue;
                    }
                    else
                    {
                      v182 = -12782;
                    }
                    v221 = v251;
                    LODWORD(v219) = v182;
                    FigDebugAssert3();
                  }
                  v177 = objc_msgSend(v175, "countByEnumeratingWithState:objects:count:", &v252, v265, 16);
                }
                while (v177);
LABEL_227:
                v53 = v242;
                i = v250;
                if (time.value)
                  CFRelease((CFTypeRef)time.value);
              }
              v248 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v256, v266, 16);
              if (!v248)
              {
                v3 = 0;
                v127 = v235;
                v157 = v231;
                v154 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
                break;
              }
            }
          }
        }
        if ((*(_BYTE *)(v157 + 12) & 1) == 0)
        {
LABEL_236:
          v185 = *(_QWORD *)(v157 + 16);
          *(_OWORD *)(v53 + 424) = *(_OWORD *)v157;
          *(_QWORD *)(v53 + 440) = v185;
          if ((objc_msgSend(v236, "isIrisRecording", v219) & 1) == 0)
          {
            v186 = *(_QWORD *)(v53 + 440);
            *(_OWORD *)(v53 + 1576) = *(_OWORD *)(v53 + 424);
            *(_QWORD *)(v53 + 1592) = v186;
          }
          v187 = v154[908];
          v188 = (__int128 *)MEMORY[0x1E0CA2E28];
          if (*(_QWORD *)(v53 + v187) + *(_QWORD *)(v53 + 552))
          {
            v189 = 0;
            v190 = 0;
            v191 = *MEMORY[0x1E0CA2E30];
            v192 = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16);
            v193 = *MEMORY[0x1E0CA2E28];
            v194 = *(_QWORD *)(MEMORY[0x1E0CA2E28] + 16);
            do
            {
              v195 = *(_QWORD *)(v53 + 448) + v189;
              *(_OWORD *)v195 = v191;
              *(_QWORD *)(v195 + 16) = v192;
              v196 = *(_QWORD *)(v53 + 456) + v189;
              *(_OWORD *)v196 = v193;
              *(_QWORD *)(v196 + 16) = v194;
              ++v190;
              v189 += 24;
            }
            while (v190 < *(_QWORD *)(v53 + v187) + *(_QWORD *)(v53 + 552));
          }
          if (*(_QWORD *)(v53 + 728))
          {
            v197 = 0;
            v198 = 0;
            v199 = *v188;
            v200 = *((_QWORD *)v188 + 2);
            do
            {
              v201 = *(_QWORD *)(v53 + 464) + v197;
              *(_OWORD *)v201 = v199;
              *(_QWORD *)(v201 + 16) = v200;
              ++v198;
              v202 = *(_QWORD *)(v53 + 728);
              v197 += 24;
            }
            while (v198 < v202);
          }
          else
          {
            v202 = 0;
          }
          if (*(_QWORD *)(v53 + 744) + v202)
          {
            v203 = 0;
            v204 = 0;
            v205 = *v188;
            v206 = *((_QWORD *)v188 + 2);
            v207 = *MEMORY[0x1E0CA2E18];
            v208 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
            do
            {
              v209 = *(_QWORD *)(v53 + 472) + v203;
              *(_OWORD *)v209 = v205;
              *(_QWORD *)(v209 + 16) = v206;
              v210 = *(_QWORD *)(v53 + 480) + v203;
              *(_OWORD *)v210 = v207;
              *(_QWORD *)(v210 + 16) = v208;
              ++v204;
              v203 += 24;
            }
            while (v204 < *(_QWORD *)(v53 + 744) + *(_QWORD *)(v53 + 728));
          }
          *(_BYTE *)(v53 + 713) = 1;
          *(_QWORD *)(v53 + 912) = 0;
          *(_QWORD *)(v53 + 920) = 0;
          objc_msgSend(*(id *)(v53 + 1536), "removeAllObjects");
          if ((_DWORD)v3)
            goto LABEL_297;
          goto LABEL_298;
        }
        v183 = *(_QWORD *)(v53 + 592);
        time2 = *(CMTime *)v157;
        v184 = *(uint64_t (**)(uint64_t, CMTime *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 56);
        if (v184)
        {
          time = time2;
          v3 = v184(v183, &time);
          if (!(_DWORD)v3)
          {
            *(_BYTE *)(v53 + 712) = 1;
            goto LABEL_236;
          }
        }
        else
        {
          v3 = 4294954514;
        }
        v221 = v251;
        LODWORD(v219) = v3;
LABEL_296:
        FigDebugAssert3();
        goto LABEL_297;
      }
    }
    v152 = -[BWQuickTimeMovieFileSinkNode _validTrackReferencesForReferenceInputIndexes:](v142, v41);
    if (*(int *)(v142 + 688) >= 1)
    {
      objc_msgSend(v152, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"));
      objc_msgSend(v152, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", **(unsigned int **)(v142 + 608)));
    }
    if (objc_msgSend(v148, "count"))
      objc_msgSend(v152, "addObjectsFromArray:", -[BWQuickTimeMovieFileSinkNode _validTrackReferencesForReferenceInputIndexes:](v242, v148));
    v153 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
    v154 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
    if (objc_msgSend(v152, "count"))
    {
      objc_msgSend(v153, "setObject:forKeyedSubscript:", v152, *MEMORY[0x1E0CC6268]);
      if (objc_msgSend(v143, "count"))
      {
        v155 = -[BWQuickTimeMovieFileSinkNode _validTrackReferencesForReferenceInputIndexes:](v242, v143);
        if (objc_msgSend(v155, "count"))
          objc_msgSend(v153, "setObject:forKeyedSubscript:", v155, *MEMORY[0x1E0CC6278]);
      }
    }
    v53 = v242;
    if (objc_msgSend(v144, "count"))
    {
      v156 = -[BWQuickTimeMovieFileSinkNode _validTrackReferencesForReferenceInputIndexes:](v242, v144);
      if (objc_msgSend(v156, "count"))
        objc_msgSend(v153, "setObject:forKeyedSubscript:", v156, *MEMORY[0x1E0CC6270]);
    }
    v157 = v231;
    if (objc_msgSend(v145, "count"))
    {
      v158 = -[BWQuickTimeMovieFileSinkNode _validTrackReferencesForReferenceInputIndexes:](v242, v145);
      if (objc_msgSend(v158, "count"))
        objc_msgSend(v153, "setObject:forKeyedSubscript:", v158, CFSTR("vmap"));
    }
    if (objc_msgSend(v146, "count"))
    {
      v159 = -[BWQuickTimeMovieFileSinkNode _validTrackReferencesForReferenceInputIndexes:](v242, v146);
      if (objc_msgSend(v159, "count"))
        objc_msgSend(v153, "setObject:forKeyedSubscript:", v159, CFSTR("fall"));
    }
    if (!objc_msgSend(v153, "count"))
      goto LABEL_202;
    v160 = FigFormatWriterGetFigBaseObject();
    v161 = *(uint64_t (**)(uint64_t, _QWORD, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v161)
    {
      v162 = v161(v160, *MEMORY[0x1E0CC44D8], v153);
      if (!v162)
      {
LABEL_200:
        v3 = 0;
        goto LABEL_202;
      }
    }
    else
    {
      v162 = -12782;
    }
    v222 = v251;
    LODWORD(v219) = v162;
    FigDebugAssert3();
    goto LABEL_200;
  }
  v51 = 0;
  obj = 0;
  v52 = 0;
  v249 = *MEMORY[0x1E0CC4590];
  v245 = *MEMORY[0x1E0CC45F0];
  v233 = *MEMORY[0x1E0CC45B0];
  v247 = *MEMORY[0x1E0C9AE40];
  v223 = *MEMORY[0x1E0CC4628];
  v226 = *v25;
  v227 = *MEMORY[0x1E0CC4530];
  v228 = *MEMORY[0x1E0CC4560];
  v225 = *MEMORY[0x1E0CC45D0];
  v224 = *MEMORY[0x1E0CC4580];
  key = (void *)*MEMORY[0x1E0CED010];
  v234 = *MEMORY[0x1E0CED018];
  v230 = *MEMORY[0x1E0CC4598];
  v229 = *MEMORY[0x1E0CC45A0];
  v53 = v242;
  while (1)
  {
    if (!*(_BYTE *)(*(_QWORD *)(v53 + 616) + v51))
      goto LABEL_139;
    v54 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v53, "inputs"), "objectAtIndex:", v51), "mediaType");
    v55 = *(_QWORD *)(v53 + 592);
    v56 = *(_QWORD *)(v53 + 608);
    v57 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
    if (!v57)
    {
      v3 = 4294954514;
LABEL_196:
      v221 = v251;
      LODWORD(v219) = v3;
      goto LABEL_197;
    }
    v58 = v57(v55, v54, 0, v56 + 4 * v51);
    if ((_DWORD)v58)
    {
      v3 = v58;
      goto LABEL_196;
    }
    qtmfsn_setTrackProperties(*(_QWORD *)(v53 + 592), *(unsigned int *)(*(_QWORD *)(v53 + 608) + 4 * v51), v54, a3);
    v59 = *(_QWORD *)(*(_QWORD *)(v53 + 640) + 8 * v51);
    if (!v59)
      goto LABEL_77;
    v60 = *(_QWORD *)(v53 + 592);
    v61 = *(unsigned int *)(*(_QWORD *)(v53 + 608) + 4 * v51);
    v268 = v59;
    v62 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v268, 1);
    v63 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
    if (!v63)
    {
      v3 = 4294954514;
LABEL_254:
      v221 = v251;
      LODWORD(v219) = v3;
      goto LABEL_277;
    }
    v64 = v63(v60, v61, v249, v62);
    if ((_DWORD)v64)
    {
      v3 = v64;
      goto LABEL_254;
    }
    v53 = v242;
    v65 = *(const void **)(*(_QWORD *)(v242 + 640) + 8 * v51);
    if (v65)
    {
      CFRelease(v65);
      *(_QWORD *)(*(_QWORD *)(v242 + 640) + 8 * v51) = 0;
    }
LABEL_77:
    v3 = 0;
    if ((int)v54 > 1936684397)
    {
      if ((_DWORD)v54 == 1936684398)
      {
        if (objc_msgSend(a3, "isIrisRecording"))
        {
          CMTimeMake(&v260, 10, 1);
          v96 = CMTimeCopyAsDictionary(&v260, allocator);
          v97 = *(_QWORD *)(v53 + 592);
          v98 = *(unsigned int *)(*(_QWORD *)(v53 + 608) + 4 * v51);
          v99 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                 + 16)
                                                                                     + 24);
          if (!v99)
          {
            CFRelease(v96);
            v3 = 4294954514;
LABEL_286:
            v221 = v251;
            LODWORD(v219) = v3;
            goto LABEL_197;
          }
          v3 = v99(v97, v98, v223, v96);
          CFRelease(v96);
          if ((_DWORD)v3)
            goto LABEL_286;
        }
        ++obj;
        if (!objc_msgSend(*(id *)(v53 + 528), "count"))
        {
LABEL_138:
          v3 = 0;
          goto LABEL_139;
        }
        v100 = *(_QWORD *)(v53 + 592);
        v101 = *(unsigned int *)(*(_QWORD *)(v53 + 608) + 4 * v51);
        v102 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                           + 24);
        if (v102)
        {
          v103 = v102(v100, v101, v227, &unk_1E49F88E0);
          if (!(_DWORD)v103)
          {
            v104 = -[BWQuickTimeMovieFileSinkNode _isLastFallbackAudioTrack:]((void *)v53, obj);
            v105 = *(_QWORD *)(v53 + 592);
            v106 = *(unsigned int *)(*(_QWORD *)(v53 + 608) + 4 * v51);
            v107 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                            + 16)
                                                                                + 24);
            if (v107)
            {
              if (v104)
                v108 = v226;
              else
                v108 = v247;
              v109 = v107(v105, v106, v228, v108);
              if (!(_DWORD)v109)
              {
                v53 = v242;
                v110 = *(_QWORD *)(v242 + 592);
                v111 = *(unsigned int *)(*(_QWORD *)(v242 + 608) + 4 * v51);
                v112 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, const __CFString *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                               + 24);
                if (v112)
                {
                  v113 = v112(v110, v111, v225, CFSTR("und"));
                  if (!(_DWORD)v113)
                  {
                    v114 = *(_QWORD *)(v242 + 592);
                    v115 = *(unsigned int *)(*(_QWORD *)(v242 + 608) + 4 * v51);
                    v116 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, const __CFString *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
                    if (v116)
                    {
                      v3 = v116(v114, v115, v224, CFSTR("und"));
                      if ((_DWORD)v3)
                        goto LABEL_282;
                      goto LABEL_139;
                    }
                    v3 = 4294954514;
LABEL_282:
                    v221 = v251;
                    LODWORD(v219) = v3;
                    goto LABEL_197;
                  }
                  v3 = v113;
                }
                else
                {
                  v3 = 4294954514;
                }
                v221 = v251;
                LODWORD(v219) = v3;
                goto LABEL_197;
              }
              v3 = v109;
            }
            else
            {
              v3 = 4294954514;
            }
            v221 = v251;
            LODWORD(v219) = v3;
            goto LABEL_277;
          }
          v3 = v103;
        }
        else
        {
          v3 = 4294954514;
        }
        v221 = v251;
        LODWORD(v219) = v3;
        goto LABEL_197;
      }
      if ((_DWORD)v54 != 1986618469)
        goto LABEL_139;
LABEL_90:
      if (*(float *)(v53 + 384) < 120.0)
        v73 = 600;
      else
        v73 = 2400;
      v74 = *(_QWORD *)(v53 + 592);
      v75 = *(unsigned int *)(*(_QWORD *)(v53 + 608) + 4 * v51);
      v76 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v73);
      v77 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                         + 24);
      if (v77)
      {
        v78 = v77(v74, v75, v245, v76);
        if (!(_DWORD)v78)
        {
          v53 = v242;
          if (v235)
            v235[v51] = v73;
          if (v51 == *(_QWORD *)(v242 + 704))
            *(_DWORD *)(v242 + 376) = v73;
          if (objc_msgSend(a3, "isIrisRecording"))
          {
            v79 = *(_QWORD *)(v242 + 592);
            v80 = *(unsigned int *)(*(_QWORD *)(v242 + 608) + 4 * v51);
            v81 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                               + 24);
            if (v81)
            {
              v82 = v81(v79, v80, v233, v247);
              if (!(_DWORD)v82)
                goto LABEL_102;
              v3 = v82;
            }
            else
            {
              v3 = 4294954514;
            }
            v221 = v251;
            LODWORD(v219) = v3;
            goto LABEL_197;
          }
LABEL_102:
          if ((v52 & 1) != 0 && objc_msgSend(a3, "isIrisRecording"))
          {
            v83 = *(_QWORD *)(v242 + 592);
            v84 = *(unsigned int *)(*(_QWORD *)(v242 + 608) + 4 * v51);
            v85 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                               + 24);
            if (v85)
            {
              v86 = v85(v83, v84, v228, v247);
              if (!(_DWORD)v86)
                goto LABEL_106;
              v3 = v86;
            }
            else
            {
              v3 = 4294954514;
            }
            v221 = v251;
            LODWORD(v219) = v3;
            goto LABEL_197;
          }
LABEL_106:
          v87 = objc_msgSend(*(id *)(v242 + 928), "objectForKeyedSubscript:", key);
          v88 = objc_msgSend(*(id *)(v242 + 928), "objectForKeyedSubscript:", v234);
          if (!v87)
            goto LABEL_109;
          v89 = *(_QWORD *)(v242 + 592);
          v90 = *(unsigned int *)(*(_QWORD *)(v242 + 608) + 4 * v51);
          v91 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 24);
          if (v91)
          {
            v92 = v91(v89, v90, v230, v87);
            v53 = v242;
            if (!(_DWORD)v92)
            {
LABEL_109:
              if (v88)
              {
                v93 = *(_QWORD *)(v53 + 592);
                v94 = *(unsigned int *)(*(_QWORD *)(v53 + 608) + 4 * v51);
                v95 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 16)
                                                                                   + 24);
                if (!v95)
                {
                  v3 = 4294954514;
LABEL_264:
                  v221 = v251;
                  LODWORD(v219) = v3;
                  goto LABEL_197;
                }
                v3 = v95(v93, v94, v229, v88);
                if ((_DWORD)v3)
                  goto LABEL_264;
              }
              else
              {
                v3 = 0;
              }
              v52 = 1;
              goto LABEL_139;
            }
            v3 = v92;
          }
          else
          {
            v3 = 4294954514;
          }
          v221 = v251;
          LODWORD(v219) = v3;
          goto LABEL_277;
        }
        v3 = v78;
      }
      else
      {
        v3 = 4294954514;
      }
      v221 = v251;
      LODWORD(v219) = v3;
      goto LABEL_277;
    }
    if ((_DWORD)v54 == 1635088502)
      goto LABEL_90;
    if ((_DWORD)v54 == 1835365473)
      break;
LABEL_139:
    if ((unint64_t)++v51 >= *(_QWORD *)(v53 + 552))
      goto LABEL_145;
  }
  if (v235)
  {
    v66 = *(_QWORD *)(v53 + 728);
    v67 = objc_msgSend(v41, "count");
    if (v67 < 2)
    {
LABEL_86:
      v72 = 10000;
    }
    else
    {
      v68 = v67 >> 1;
      v69 = 1;
      while (1)
      {
        v70 = (void *)objc_msgSend(v41, "objectAtIndexedSubscript:", v69 - 1);
        v71 = (void *)objc_msgSend(v41, "objectAtIndexedSubscript:", v69);
        if (v51 == objc_msgSend(v70, "unsignedIntValue")
          && v66 > objc_msgSend(v71, "unsignedIntValue"))
        {
          break;
        }
        v69 += 2;
        if (!--v68)
          goto LABEL_86;
      }
      v126 = v235[objc_msgSend(v71, "unsignedIntValue")];
      if (v126 <= 0)
        v72 = 10000;
      else
        v72 = v126;
    }
    v53 = v242;
  }
  else
  {
    v72 = 10000;
  }
  v117 = *(_QWORD *)(v53 + 592);
  v118 = *(unsigned int *)(*(_QWORD *)(v53 + 608) + 4 * v51);
  v119 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v72);
  v120 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (!v120)
  {
    v3 = 4294954514;
    goto LABEL_266;
  }
  v121 = v120(v117, v118, v245, v119);
  if (!(_DWORD)v121)
  {
    v53 = v242;
    v122 = *(_QWORD *)(v242 + 592);
    v123 = *(unsigned int *)(*(_QWORD *)(v242 + 608) + 4 * v51);
    v124 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                        + 24);
    if (v124)
    {
      v125 = v124(v122, v123, v233, v247);
      if (!(_DWORD)v125)
      {
        if (v51 != *(_QWORD *)(v242 + 704))
          goto LABEL_138;
        v3 = 0;
        *(_DWORD *)(v242 + 376) = v72;
        goto LABEL_139;
      }
      v3 = v125;
    }
    else
    {
      v3 = 4294954514;
    }
    v221 = v251;
    LODWORD(v219) = v3;
LABEL_197:
    FigDebugAssert3();
    goto LABEL_278;
  }
  v3 = v121;
LABEL_266:
  v221 = v251;
  LODWORD(v219) = v3;
LABEL_277:
  FigDebugAssert3();
  v53 = v242;
LABEL_278:
  v127 = v235;
LABEL_297:
  objc_msgSend(*(id *)(v53 + 1000), "logErrorNumber:errorString:", v3, CFSTR("starting format writer"), v219, v221);
LABEL_298:
  if (theDict)
    CFRelease(theDict);
  free(v127);
  return v3;
}

- (uint64_t)_addMovieSegmentMetadataTrackUsingMovieSettings:(unsigned int *)a3 withVideoTimeScales:
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const __CFArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t, _QWORD, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t, _QWORD, uint64_t);
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t, _QWORD, _QWORD);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t, _QWORD, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[3];
  _QWORD v38[4];

  v38[3] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (!*(_QWORD *)(a1 + 1552))
  {
    v6 = *MEMORY[0x1E0CA2528];
    v7 = *MEMORY[0x1E0CA2588];
    v8 = *MEMORY[0x1E0CA2518];
    v37[0] = *MEMORY[0x1E0CA2528];
    v37[1] = v8;
    v9 = *MEMORY[0x1E0CA24D0];
    v38[0] = v7;
    v38[1] = v9;
    v37[2] = *MEMORY[0x1E0CA2538];
    v35 = *MEMORY[0x1E0CA2540];
    v36 = *MEMORY[0x1E0C9AE40];
    v38[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
    v11 = (const __CFArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", v10, 0);
    v12 = CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0x6D656278u, v11, (CMMetadataFormatDescriptionRef *)(a1 + 1552));
    if ((_DWORD)v12)
    {
      v24 = v12;
      goto LABEL_21;
    }
    objc_msgSend(v10, "objectForKeyedSubscript:", v6);
    objc_msgSend(v10, "objectForKeyedSubscript:", v8);
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CA2520]);
    *(_DWORD *)(a1 + 1560) = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
  }
  v13 = *(_QWORD *)(a1 + 592);
  v14 = *(_QWORD *)(a1 + 608);
  v15 = *(_QWORD *)(a1 + 1568);
  v16 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v16)
  {
    v24 = 4294954514;
LABEL_21:
    FigDebugAssert3();
    return v24;
  }
  v17 = v16(v13, 1835365473, 0, v14 + 4 * v15);
  if ((_DWORD)v17)
  {
    v24 = v17;
    goto LABEL_21;
  }
  qtmfsn_setTrackProperties(*(_QWORD *)(a1 + 592), *(unsigned int *)(*(_QWORD *)(a1 + 608) + 4 * *(_QWORD *)(a1 + 1568)), 1835365473, a2);
  if (a3)
  {
    v18 = *(_QWORD *)(a1 + 592);
    v19 = *(unsigned int *)(*(_QWORD *)(a1 + 608) + 4 * *(_QWORD *)(a1 + 1568));
    v20 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *a3);
    v21 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
    if (!v21)
    {
      v24 = 4294954514;
      goto LABEL_21;
    }
    v22 = v21(v18, v19, *MEMORY[0x1E0CC45F0], v20);
    if ((_DWORD)v22)
    {
      v24 = v22;
      goto LABEL_21;
    }
    v23 = *a3;
  }
  else
  {
    v23 = 0;
  }
  *(_DWORD *)(a1 + 1564) = v23;
  v25 = *(_QWORD *)(a1 + 592);
  v26 = *(unsigned int *)(*(_QWORD *)(a1 + 608) + 4 * *(_QWORD *)(a1 + 1568));
  v27 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (!v27)
  {
    v24 = 4294954514;
    goto LABEL_21;
  }
  v28 = v27(v25, v26, *MEMORY[0x1E0CC45B0], *MEMORY[0x1E0C9AE40]);
  if ((_DWORD)v28)
  {
    v24 = v28;
    goto LABEL_21;
  }
  v29 = *(_QWORD *)(a1 + 592);
  v30 = *(unsigned int *)(*(_QWORD *)(a1 + 608) + 4 * *(_QWORD *)(a1 + 1568));
  v34 = *(_QWORD *)(a1 + 1552);
  v31 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v32 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (!v32)
  {
    v24 = 4294954514;
    goto LABEL_21;
  }
  v24 = v32(v29, v30, *MEMORY[0x1E0CC4590], v31);
  if ((_DWORD)v24)
    goto LABEL_21;
  return v24;
}

- (void)_validTrackReferencesForReferenceInputIndexes:(uint64_t)a1
{
  void *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;

  if (!a1)
    return 0;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = objc_msgSend(a2, "count");
  if (v5 >= 2)
  {
    v6 = v5 >> 1;
    v7 = 1;
    do
    {
      v8 = objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", v7 - 1), "unsignedIntValue");
      v9 = objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", v7), "unsignedIntValue");
      v10 = *(_QWORD *)(a1 + 616);
      if (*(_BYTE *)(v10 + v8))
      {
        v11 = v9;
        if (*(_BYTE *)(v10 + v9))
        {
          objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(a1 + 608) + 4 * v8)));
          objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(a1 + 608) + 4 * v11)));
        }
      }
      v7 += 2;
      --v6;
    }
    while (v6);
  }
  return v4;
}

- (void)_validateTaggedMediaCharacteristicsForInputIndexes:(uint64_t)a1
{
  void *v4;
  unint64_t v5;
  unsigned int v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!a1)
    return 0;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if (objc_msgSend(a2, "count"))
  {
    v5 = 0;
    do
    {
      v6 = objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", v5), "unsignedIntValue");
      v7 = v5 + 1;
      v8 = objc_msgSend(a2, "objectAtIndexedSubscript:", v7);
      if (*(_BYTE *)(*(_QWORD *)(a1 + 616) + v6))
      {
        v9 = v8;
        v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(a1 + 608) + 4 * v6));
        if (!objc_msgSend(v4, "objectForKeyedSubscript:", v10))
          objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1), v10);
        objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", v10), "addObject:", v9);
      }
      v5 = v7 + 1;
    }
    while (v5 < objc_msgSend(a2, "count"));
  }
  return v4;
}

- (uint64_t)_preAllocateIfNeededForURL:(void *)a3 settings:
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t (*v18)(uint64_t, uint64_t, uint64_t, uint64_t *);
  uint64_t v20;
  uint64_t v21;

  if (!a1)
    return 0;
  v5 = (void *)objc_msgSend(a3, "videoSettings");
  v6 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AVVideoWidthKey")), "unsignedIntegerValue");
  v7 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AVVideoHeightKey")), "unsignedIntegerValue");
  if (v6 != 3840 || v7 != 2160)
  {
    FigFileIsFileOnExternalStorageDevice();
    return 0;
  }
  v8 = *(float *)(a1 + 384);
  v9 = 0;
  if (FigFileIsFileOnExternalStorageDevice() && v8 >= 100.0)
  {
    v21 = 0;
    v10 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "URLByDeletingLastPathComponent"), "URLByDeletingLastPathComponent"), "URLByDeletingLastPathComponent");
    v11 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "attributesOfFileSystemForPath:error:", objc_msgSend(v10, "path"), &v21);
    v12 = 0;
    if (v11)
    {
      if (!v21)
      {
        v12 = (void *)objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0CB2B00]);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          FigDebugAssert3();
          return FigSignalErrorAt();
        }
      }
    }
    if (objc_msgSend(v12, "longLongValue") <= 0x8000000001)
    {
      v14 = objc_msgSend(v12, "longLongValue");
      if (v14 >= 0)
        v15 = v14;
      else
        v15 = v14 + 1;
      v13 = v15 >> 1;
    }
    else
    {
      v13 = 0x4000000000;
    }
    v20 = 0;
    v16 = *(_QWORD *)(a1 + 600);
    v17 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
    if (*v17 < 3uLL || (v18 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t *))v17[6]) == 0)
    {
      v9 = 4294954514;
LABEL_22:
      FigDebugAssert3();
      return v9;
    }
    v9 = v18(v16, v13, 2, &v20);
    if ((_DWORD)v9)
      goto LABEL_22;
  }
  return v9;
}

- (uint64_t)_doStartRecordingAtTime:(void *)a3 withSettings:(void *)a4 sensorVideoPort:(void *)a5 captureDeviceType:
{
  uint64_t v5;
  char v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t CMBaseObject;
  uint64_t (*v19)(uint64_t, _QWORD, _QWORD, void **);
  uint64_t v20;
  const __CFAllocator *v21;
  uint64_t v22;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _BOOL4 v24;
  id v25;
  uint64_t v26;
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *v28;
  uint64_t v29;
  _BYTE *v30;
  void *v31;
  const __CFURL *PathComponent;
  int v33;
  _BOOL4 v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  NSObject *v42;
  unsigned int v43;
  unsigned int v44;
  uint64_t v45;
  const void *v46;
  const void *v47;
  int *v49;
  uint64_t v50;
  uint64_t v51;
  __int128 *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  os_log_type_t type;
  unsigned int v58;
  void *v59;
  _BYTE v60[128];
  int v61;
  const char *v62;
  __int16 v63;
  uint64_t v64;
  __int128 v65;
  uint64_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if ((objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0D05A38]) & 1) != 0)
    v11 = 1;
  else
    v11 = objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0D05A50]);
  *(_BYTE *)(a1 + 696) = v11;
  *(_BYTE *)(a1 + 697) = BWDeviceTypeIsExtensionDeviceType(objc_msgSend(a5, "integerValue"));
  v12 = (void *)objc_msgSend(a3, "outputFileType");
  if ((objc_msgSend(v12, "isEqual:", *MEMORY[0x1E0CC4288]) & 1) == 0)
  {
LABEL_68:
    FigDebugAssert3();
    return 0;
  }
  v13 = objc_msgSend(a3, "isIrisRecording");
  v59 = (void *)objc_msgSend(a3, "outputURL");
  v52 = a2;
  if (*(_QWORD *)(a1 + 1528) && objc_msgSend(a3, "usesVirtualCaptureCard"))
  {
    v14 = *(_QWORD *)(a1 + 1528);
    v15 = objc_msgSend(a3, "outputURL");
    v16 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
    if (v16)
    {
      v17 = v16(v14, v15);
      if (!(_DWORD)v17)
      {
        CMBaseObject = FigVirtualCaptureCardGetCMBaseObject();
        v19 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                         + 48);
        if (v19)
        {
          v20 = v19(CMBaseObject, *MEMORY[0x1E0CA5480], 0, &v59);
          if (!(_DWORD)v20)
            goto LABEL_12;
          v35 = v20;
        }
        else
        {
          v35 = 4294954514;
        }
        v51 = v5;
        LODWORD(v49) = 0;
LABEL_39:
        FigDebugAssert3();
        goto LABEL_59;
      }
      v35 = v17;
    }
    else
    {
      v35 = 4294954514;
    }
    v51 = v5;
    LODWORD(v49) = 0;
    goto LABEL_39;
  }
LABEL_12:
  v21 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v22 = CMByteStreamCreateForFileURL();
  if ((_DWORD)v22)
  {
    v35 = v22;
    v51 = v5;
    LODWORD(v49) = v22;
    goto LABEL_39;
  }
  if (-[BWQuickTimeMovieFileSinkNode _preAllocateIfNeededForURL:settings:](a1, v59, a3))
  {
    v58 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v24 = +[BWAudioFormat compressionOptionTrimSampleBufferDurationsIsRequiredForAudioSettings:](BWAudioFormat, "compressionOptionTrimSampleBufferDurationsIsRequiredForAudioSettings:", objc_msgSend(a3, "audioSettings", v49, v50));
  v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v25, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CC4420]);
  if (v24)
    objc_msgSend(v25, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CC4390], *MEMORY[0x1E0CC4388]);
  v26 = FigMovieFormatWriterCreateWithByteStream();
  if ((_DWORD)v26)
  {
    v35 = v26;
    v51 = v5;
    LODWORD(v49) = v26;
    goto LABEL_39;
  }
  *(_DWORD *)(a1 + 724) = 0;
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, (const void *)a1, (CFNotificationCallback)qtmfsn_formatWriterErrorOccurredCallback, (CFStringRef)*MEMORY[0x1E0CC4378], *(const void **)(a1 + 592), CFNotificationSuspensionBehaviorDeliverImmediately);
  if (v13)
  {
    v28 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(v28, (const void *)a1, (CFNotificationCallback)qtmfsn_formatWriterDidWriteFragment, (CFStringRef)*MEMORY[0x1E0CC4380], *(const void **)(a1 + 592), CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  v65 = *v52;
  v66 = *((_QWORD *)v52 + 2);
  v29 = -[BWQuickTimeMovieFileSinkNode _startUpFormatWriterAtTime:withSettings:](a1, (uint64_t)&v65, a3);
  if ((_DWORD)v29)
  {
    v35 = v29;
    v51 = v5;
    LODWORD(v49) = v29;
    goto LABEL_39;
  }
  v30 = *(_BYTE **)(a1 + 416);
  if (v30)
  {
    *v30 = 0;
    goto LABEL_24;
  }
  v31 = malloc_type_malloc(0x400uLL, 0xD73EFC30uLL);
  *(_QWORD *)(a1 + 416) = v31;
  if (!v31)
    goto LABEL_68;
LABEL_24:
  PathComponent = CFURLCreateCopyDeletingLastPathComponent(v21, (CFURLRef)objc_msgSend(a3, "outputURL"));
  v33 = CFURLGetFileSystemRepresentation(PathComponent, 1u, *(UInt8 **)(a1 + 416), 1024);
  if (!v33)
  {
    v35 = 4294966296;
    goto LABEL_55;
  }

  *(_QWORD *)(a1 + 400) = a3;
  if (objc_msgSend(*(id *)(a1 + 656), "count"))
    v34 = 1;
  else
    v34 = objc_msgSend(*(id *)(a1 + 648), "requestedSDOFVariants") != 0;
  if (objc_msgSend(*(id *)(a1 + 648), "isMomentCaptureMovieRecording")
    && (objc_msgSend(*(id *)(a1 + 648), "isFinalEnqueuedIrisRequest") & 1) == 0)
  {
    if (dword_1ECFE9510)
    {
      v58 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v36 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else if (!v34)
  {
    v35 = 0;
    goto LABEL_55;
  }
  -[BWQuickTimeMovieFileSinkNode _buildIrisRefMovieGeneratorAndWriteFirstIrisAsRefMovie](a1);
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v37 = *(void **)(a1 + 656);
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v54 != v40)
          objc_enumerationMutation(v37);
        -[BWQuickTimeMovieFileSinkNode _writeIrisRefMovieWithInfo:]((_QWORD *)a1, *(void **)(*((_QWORD *)&v53 + 1) + 8 * i));
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    }
    while (v39);
  }
  objc_msgSend(*(id *)(a1 + 656), "removeAllObjects", v49, v51);
  if (dword_1ECFE9510)
  {
    v58 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v42 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v43 = v58;
    if (os_log_type_enabled(v42, type))
      v44 = v43;
    else
      v44 = v43 & 0xFFFFFFFE;
    if (v44)
    {
      v45 = *(_QWORD *)(a1 + 992);
      v61 = 136315394;
      v62 = "-[BWQuickTimeMovieFileSinkNode _doStartRecordingAtTime:withSettings:sensorVideoPort:captureDeviceType:]";
      v63 = 2112;
      v64 = v45;
      LODWORD(v51) = 22;
      v49 = &v61;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v35 = 0;
LABEL_55:
  if (PathComponent)
    CFRelease(PathComponent);
  if (v33)
    return 0;
LABEL_59:
  objc_msgSend(*(id *)(a1 + 1000), "logErrorNumber:errorString:", v35, CFSTR("starting recording"), v49, v51);
  v46 = *(const void **)(a1 + 592);
  if (v46)
  {
    CFRelease(v46);
    *(_QWORD *)(a1 + 592) = 0;
  }
  bzero(*(void **)(a1 + 608), 4 * (*(_QWORD *)(a1 + 560) + *(_QWORD *)(a1 + 552)));
  v47 = *(const void **)(a1 + 600);
  if (v47)
  {
    CFRelease(v47);
    *(_QWORD *)(a1 + 600) = 0;
  }
  return v35;
}

- (void)_buildIrisRefMovieGeneratorAndWriteFirstIrisAsRefMovie
{
  __assert_rtn("-[BWQuickTimeMovieFileSinkNode _buildIrisRefMovieGeneratorAndWriteFirstIrisAsRefMovie]", "BWQuickTimeMovieFileSinkNode.m", 6725, "_irisMovieGenerator == nil");
}

- (void)_writeIrisRefMovieWithInfo:(_QWORD *)a1
{
  int has_internal_diagnostics;
  int v5;
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  if (a1)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3052000000;
    v11 = __Block_byref_object_copy__10;
    v12 = __Block_byref_object_dispose__10;
    v13 = a1[83];
    -[BWQuickTimeMovieFileSinkNode _fixVitalityScoreWithMotionAnalysis:]((unint64_t)a1, a2);
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    if (a1[106])
    {
      if (a1[105])
        v5 = has_internal_diagnostics;
      else
        v5 = 0;
      if (v5 == 1)
        -[BWQuickTimeMovieFileSinkNode _computeTransitionVitalityScore:]((unint64_t)a1, a2);
    }
    -[BWQuickTimeMovieFileSinkNode _initAnalyticsDataInIrisMovieInfo:]((uint64_t)a1, a2);
    v6 = (void *)v9[5];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__BWQuickTimeMovieFileSinkNode__writeIrisRefMovieWithInfo___block_invoke;
    v7[3] = &unk_1E491FA40;
    v7[4] = a1;
    v7[5] = &v8;
    objc_msgSend(v6, "writeMovieWithInfo:completionHandler:", a2, v7);
    _Block_object_dispose(&v8, 8);
  }
}

- (void)_generateThumbnailSurfaceFromPixelBuffer:(char)a3 physicallyMirroredHorizontallyUpstream:
{
  void *v6;
  int v7;
  int v8;
  int v9;
  NSObject *v10;
  _QWORD v11[6];
  int v12;
  int v13;
  int v14;
  char v15;

  if (a1)
  {
    v6 = (void *)objc_msgSend((id)objc_msgSend((id)a1, "inputs"), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 704));
    v7 = objc_msgSend((id)objc_msgSend(v6, "format"), "width");
    v8 = objc_msgSend((id)objc_msgSend(v6, "format"), "height");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = objc_msgSend(*(id *)(a1 + 400), "videoOrientation");
    else
      v9 = 0;
    CFRetain(a2);
    v10 = *(NSObject **)(a1 + 568);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __112__BWQuickTimeMovieFileSinkNode__generateThumbnailSurfaceFromPixelBuffer_physicallyMirroredHorizontallyUpstream___block_invoke;
    v11[3] = &unk_1E491F9A0;
    v11[4] = a1;
    v11[5] = a2;
    v15 = a3;
    v12 = v9;
    v13 = v7;
    v14 = v8;
    dispatch_async(v10, v11);
  }
}

void __112__BWQuickTimeMovieFileSinkNode__generateThumbnailSurfaceFromPixelBuffer_physicallyMirroredHorizontallyUpstream___block_invoke(uint64_t a1)
{
  unsigned __int8 *v2;
  __CVBuffer *v3;
  uint64_t v4;
  int v5;
  unsigned int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  BOOL v14;
  int Width;
  int Height;
  int v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  CFDictionaryRef DictionaryRepresentation;
  uint64_t v35;
  uint64_t v36;
  const void *IOSurface;
  uint64_t v38;
  VTPixelTransferSessionRef pixelTransferSessionOut;
  CVPixelBufferRef pixelBuffer;
  CGRect v41;
  CGRect v42;

  v4 = a1 + 32;
  v2 = *(unsigned __int8 **)(a1 + 32);
  v3 = *(__CVBuffer **)(v4 + 8);
  v5 = v2[696];
  v6 = *(_DWORD *)(a1 + 48);
  v7 = v2[697];
  v8 = *(unsigned __int8 *)(a1 + 60);
  objc_msgSend((id)objc_msgSend(v2, "graph"), "clientExpectsCameraMountedInLandscapeOrientation");
  v38 = *(_QWORD *)(a1 + 32);
  v9 = *(unsigned int *)(a1 + 52);
  v10 = *(unsigned int *)(a1 + 56);
  pixelBuffer = 0;
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = FigCapturePlatformMountsCamerasInLandscapeOrientation();
  v13 = 0;
  if (v6 && v12)
  {
    if (FigCaptureCameraRequires180DegreesRotation(v5 != 0, v7 != 0))
    {
      if (v6 - 3 >= 2)
        v13 = 0;
      else
        v13 = 180;
    }
    else
    {
      if (v7)
        v14 = 1;
      else
        v14 = v6 >= 3;
      if (v14 || v5 == 0)
        v13 = 0;
      else
        v13 = 180;
    }
  }
  Width = CVPixelBufferGetWidth(v3);
  Height = CVPixelBufferGetHeight(v3);
  v18 = MGGetSInt32Answer();
  v19 = MGGetSInt32Answer();
  if (v18 < (int)v9 || (int)v19 < (int)v10)
  {
    FigCaptureMakeRectWithAspectRatioInsideDimensions(v18 | (unint64_t)(v19 << 32), 1, (float)(int)v9 / (float)(int)v10);
    v9 = (int)v20;
    v10 = (int)v21;
  }
  v22 = BWCreateIOSurfaceBackedCVPixelBuffer(v9, v10, 875704422, &pixelBuffer, CFSTR("MovieFileSink: Scaled Thumbnail"));
  if ((_DWORD)v22)
  {
    v36 = v22;
LABEL_58:
    FigDebugAssert3();
    goto LABEL_49;
  }
  v23 = *MEMORY[0x1E0CED7F8];
  objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CED7F8]);
  if (BWPixelBufferIsHDR(v3))
  {
    v24 = +[BWVideoFormat pixelBufferAttachmentsForColorSpaceProperties:](BWVideoFormat, "pixelBufferAttachmentsForColorSpaceProperties:", 3);
    v25 = objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8EE8]);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0CED7E0]);
    v26 = objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8D68]);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0CED7C0]);
    v27 = objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8E98]);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0CED7D8]);
    v28 = MEMORY[0x1E0C9AAB0];
    v29 = v11;
    v30 = v23;
LABEL_26:
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, v30);
    goto LABEL_27;
  }
  v31 = CVBufferCopyAttachments(v3, kCVAttachmentMode_ShouldPropagate);
  if (v31)
    v31 = (void *)CFAutorelease(v31);
  v32 = (void *)objc_msgSend(v31, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8EE8]);
  if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x1E0CA8F18]))
  {
    v28 = *MEMORY[0x1E0CA8F10];
    v30 = *MEMORY[0x1E0CED7E0];
    v29 = v11;
    goto LABEL_26;
  }
LABEL_27:
  CVPixelBufferGetWidth(pixelBuffer);
  CVPixelBufferGetHeight(pixelBuffer);
  if (!v8 && !v13)
  {
    pixelTransferSessionOut = 0;
    v33 = VTPixelTransferSessionCreate(0, &pixelTransferSessionOut);
    if (pixelTransferSessionOut)
    {
      v41.origin.x = 0.0;
      v41.origin.y = 0.0;
      v41.size.width = (double)Width;
      v41.size.height = (double)Height;
      if (CGRectIsNull(v41))
      {
        DictionaryRepresentation = 0;
      }
      else
      {
        v42.origin.x = 0.0;
        v42.origin.y = 0.0;
        v42.size.width = (double)Width;
        v42.size.height = (double)Height;
        DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v42);
      }
      objc_msgSend(v11, "setObject:forKeyedSubscript:", DictionaryRepresentation, *MEMORY[0x1E0CED850]);
      v36 = VTSessionSetProperties(pixelTransferSessionOut, (CFDictionaryRef)v11);
      if (DictionaryRepresentation)
        CFRelease(DictionaryRepresentation);
      if ((_DWORD)v36)
        goto LABEL_58;
      v36 = VTPixelTransferSessionTransferImage(pixelTransferSessionOut, v3, pixelBuffer);
      VTPixelTransferSessionInvalidate(pixelTransferSessionOut);
      goto LABEL_44;
    }
LABEL_38:
    v36 = v33;
    goto LABEL_45;
  }
  pixelTransferSessionOut = 0;
  v33 = VTPixelRotationSessionCreate(0, &pixelTransferSessionOut);
  if (!pixelTransferSessionOut)
    goto LABEL_38;
  objc_msgSend(v11, "setObject:forKeyedSubscript:", FigCaptureVTRotationFromDegrees(v13), *MEMORY[0x1E0CED7A0]);
  if (v8)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CED778]);
  if (objc_msgSend(v11, "count"))
  {
    v35 = VTSessionSetProperties(pixelTransferSessionOut, (CFDictionaryRef)v11);
    if ((_DWORD)v35)
    {
      v36 = v35;
      goto LABEL_58;
    }
  }
  v36 = VTPixelRotationSessionRotateSubImage();
  VTPixelRotationSessionInvalidate(pixelTransferSessionOut);
LABEL_44:
  CFRelease(pixelTransferSessionOut);
LABEL_45:
  if ((_DWORD)v36)
    goto LABEL_58;
  IOSurface = CVPixelBufferGetIOSurface(pixelBuffer);
  if (IOSurface)
    IOSurface = CFRetain(IOSurface);
  v36 = 0;
  *(_QWORD *)(v38 + 576) = IOSurface;
LABEL_49:
  if (pixelBuffer)
    CFRelease(pixelBuffer);
  if ((_DWORD)v36)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1000), "logErrorNumber:errorString:", v36, CFSTR("creating thumbnail"));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

- (uint64_t)_verifyMovieTiming:(uint64_t)result
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CMTime v4;
  CMTime v5;
  CMTime time2;
  CMTime time1;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (a2)
    {
      objc_msgSend(a2, "stillImageCaptureTime");
      objc_msgSend(a2, "movieEndTime");
      if (CMTimeCompare(&time1, &time2) > 0)
        goto LABEL_8;
      objc_msgSend(a2, "stillImageCaptureTime");
      objc_msgSend(a2, "movieStartTime");
    }
    else
    {
      memset(&time1, 0, sizeof(time1));
      memset(&time2, 0, sizeof(time2));
      if (CMTimeCompare(&time1, &time2) > 0)
        goto LABEL_8;
      memset(&v5, 0, sizeof(v5));
      memset(&v4, 0, sizeof(v4));
    }
    if ((CMTimeCompare(&v5, &v4) & 0x80000000) == 0)
      return 0;
LABEL_8:
    if (!objc_msgSend(a2, "isMomentCaptureMovieRecording"))
      return 4294950346;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return 0;
  }
  return result;
}

- (uint64_t)_moveOrDeleteTemporaryIrisMovie:(char)a3 recordingSucceeded:
{
  uint64_t v5;

  if (result)
  {
    result = objc_msgSend(a2, "temporaryMovieURL");
    if (result)
    {
      if ((a3 & 1) != 0)
      {
        v5 = 0;
        return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "moveItemAtURL:toURL:error:", objc_msgSend(a2, "temporaryMovieURL"), objc_msgSend(a2, "outputMovieURL"), &v5);
      }
      else
      {
        return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", objc_msgSend(a2, "temporaryMovieURL"), 0);
      }
    }
  }
  return result;
}

- (uint64_t)_findWrittenStartingPTS
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  __int128 *v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  CMTime v11;
  CMTime time1;

  if (result)
  {
    v3 = result;
    v4 = MEMORY[0x1E0CA2E30];
    *(_OWORD *)a2 = *MEMORY[0x1E0CA2E30];
    *(_QWORD *)(a2 + 16) = *(_QWORD *)(v4 + 16);
    if (*(_QWORD *)(result + 552))
    {
      v5 = 0;
      v6 = 0;
      do
      {
        v7 = (__int128 *)(*(_QWORD *)(v3 + 448) + v5);
        time1 = *(CMTime *)a2;
        v8 = *v7;
        v11.epoch = *((_QWORD *)v7 + 2);
        *(_OWORD *)&v11.value = v8;
        result = CMTimeCompare(&time1, &v11);
        if ((int)result >= 1)
        {
          v9 = *(_QWORD *)(v3 + 448) + v5;
          *(_OWORD *)a2 = *(_OWORD *)v9;
          *(_QWORD *)(a2 + 16) = *(_QWORD *)(v9 + 16);
        }
        ++v6;
        v5 += 24;
      }
      while (v6 < *(_QWORD *)(v3 + 552));
    }
    if ((~*(_DWORD *)(a2 + 12) & 5) == 0)
    {
      v10 = MEMORY[0x1E0CA2E18];
      *(_OWORD *)a2 = *MEMORY[0x1E0CA2E18];
      *(_QWORD *)(a2 + 16) = *(_QWORD *)(v10 + 16);
    }
  }
  else
  {
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
  }
  return result;
}

- (CMTime)_finalizeAudioVideoDurationsAndFindWrittenEndingPTSFromEndingPTS:(uint64_t)a3@<X8>
{
  uint64_t v4;
  CMTime *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  int *v13;
  int v14;
  int *v15;
  uint64_t v16;
  CMTimeValue value;
  __int128 *v18;
  int *v19;
  int *v20;
  int *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 *v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  unint64_t v30;
  __int128 *v31;
  __int128 v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  int32_t v40;
  int64_t v41;
  __int128 v42;
  CMTime v44;
  CMTime rhs;
  CMTime lhs;
  CMTime time1;

  if (result)
  {
    v4 = a2;
    v5 = result;
    if ((*(_DWORD *)(a2 + 12) & 5) == 1)
    {
      *(_OWORD *)a3 = *(_OWORD *)a2;
      v6 = *(_QWORD *)(a2 + 16);
    }
    else
    {
      v7 = MEMORY[0x1E0CA2E28];
      *(_OWORD *)a3 = *MEMORY[0x1E0CA2E28];
      v6 = *(_QWORD *)(v7 + 16);
    }
    *(_QWORD *)(a3 + 16) = v6;
    v8 = *(_QWORD *)&result[30].timescale;
    v9 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
    v10 = 744;
    if (result[31].value + v8)
    {
      v11 = 0;
      v12 = 0;
      v13 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
      v14 = 480;
      v15 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
      while (1)
      {
        v16 = *(CMTimeValue *)((char *)&v5->value + v14);
        if ((*(_BYTE *)(v16 + v11 + 12) & 1) != 0)
          goto LABEL_11;
        value = v5[19].value;
        if ((~*(_DWORD *)(value + v11 + 12) & 9) != 0)
        {
          v18 = (__int128 *)(*(CMTimeValue *)((char *)&v5->value + v15[917]) + v11);
          if ((~*((_DWORD *)v18 + 3) & 9) != 0)
            break;
        }
LABEL_14:
        v8 = *(_QWORD *)&v5[30].timescale;
        ++v12;
        v11 += 24;
        if (v12 >= *(CMTimeValue *)((char *)&v5->value + v10) + v8)
        {
          v4 = a2;
          goto LABEL_16;
        }
      }
      v19 = v13;
      v20 = v9;
      v21 = v15;
      v22 = v16 + v11;
      v23 = *(_OWORD *)(value + v11);
      lhs.epoch = *(_QWORD *)(value + v11 + 16);
      *(_OWORD *)&lhs.value = v23;
      v24 = *v18;
      rhs.epoch = *((_QWORD *)v18 + 2);
      *(_OWORD *)&rhs.value = v24;
      CMTimeSubtract(&time1, &lhs, &rhs);
      v25 = *(_OWORD *)&time1.value;
      *(_QWORD *)(v22 + 16) = time1.epoch;
      *(_OWORD *)v22 = v25;
      v15 = v21;
      v9 = v20;
      v13 = v19;
      v16 = *(CMTimeValue *)((char *)&v5->value + v19[918]);
LABEL_11:
      memset(&time1, 0, sizeof(time1));
      v26 = (__int128 *)(v5[19].value + v11);
      v27 = *v26;
      lhs.epoch = *((_QWORD *)v26 + 2);
      *(_OWORD *)&lhs.value = v27;
      v28 = *(_OWORD *)(v16 + v11);
      rhs.epoch = *(_QWORD *)(v16 + v11 + 16);
      *(_OWORD *)&rhs.value = v28;
      CMTimeAdd(&time1, &lhs, &rhs);
      lhs = *(CMTime *)a3;
      rhs = time1;
      result = (CMTime *)CMTimeCompare(&lhs, &rhs);
      v14 = v13[918];
      if ((result & 0x80000000) != 0)
        *(CMTime *)a3 = time1;
      v10 = v9[901];
      goto LABEL_14;
    }
LABEL_16:
    if (v8)
    {
      v29 = 0;
      v30 = 0;
      do
      {
        v31 = (__int128 *)(*(_QWORD *)&v5[19].timescale + v29);
        time1 = *(CMTime *)a3;
        v32 = *v31;
        lhs.epoch = *((_QWORD *)v31 + 2);
        *(_OWORD *)&lhs.value = v32;
        result = (CMTime *)CMTimeCompare(&time1, &lhs);
        if ((result & 0x80000000) != 0)
        {
          v33 = *(_QWORD *)&v5[19].timescale + v29;
          *(_OWORD *)a3 = *(_OWORD *)v33;
          *(_QWORD *)(a3 + 16) = *(_QWORD *)(v33 + 16);
        }
        ++v30;
        v34 = *(_QWORD *)&v5[30].timescale;
        v29 += 24;
      }
      while (v30 < v34);
      v10 = v9[901];
    }
    else
    {
      v34 = 0;
    }
    v35 = *(CMTimeValue *)((char *)&v5->value + v10) + v34;
    if (v35 < v5[23].value)
    {
      v36 = 24 * v35;
      do
      {
        v37 = v5[19].value + v36;
        time1 = *(CMTime *)a3;
        v38 = *(_OWORD *)v37;
        lhs.epoch = *(_QWORD *)(v37 + 16);
        *(_OWORD *)&lhs.value = v38;
        result = (CMTime *)CMTimeCompare(&time1, &lhs);
        if ((result & 0x80000000) != 0)
        {
          v39 = v5[19].value + v36;
          v40 = *(_DWORD *)(v39 + 8);
          if (v40 <= 999)
            v41 = 1;
          else
            v41 = v40 / 0x3E8u;
          CMTimeMake(&v44, v41, v40);
          v42 = *(_OWORD *)v39;
          lhs.epoch = *(_QWORD *)(v39 + 16);
          *(_OWORD *)&lhs.value = v42;
          result = CMTimeAdd(&time1, &lhs, &v44);
          *(CMTime *)a3 = time1;
        }
        ++v35;
        v36 += 24;
      }
      while (v35 < v5[23].value);
    }
    if ((~*(_DWORD *)(a3 + 12) & 9) == 0)
    {
      *(_OWORD *)a3 = *(_OWORD *)v4;
      *(_QWORD *)(a3 + 16) = *(_QWORD *)(v4 + 16);
    }
  }
  else
  {
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
  }
  return result;
}

- (uint64_t)_validatedEndingPTSFromEndingPTS:(uint64_t)a3@<X8>
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  __int128 *v10;
  __int128 *v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  CMTime v15;
  CMTime lhs;
  CMTime v17;

  if (!result)
  {
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
    return result;
  }
  if ((*(_DWORD *)(a2 + 12) & 5) == 1)
  {
    *(_OWORD *)a3 = *(_OWORD *)a2;
    v4 = *(_QWORD *)(a2 + 16);
LABEL_13:
    *(_QWORD *)(a3 + 16) = v4;
    return result;
  }
  v5 = result;
  v6 = MEMORY[0x1E0CA2E30];
  *(_OWORD *)a3 = *MEMORY[0x1E0CA2E30];
  v7 = *(_QWORD *)(result + 728);
  *(_QWORD *)(a3 + 16) = *(_QWORD *)(v6 + 16);
  if (*(_QWORD *)(result + 744) + v7)
  {
    v8 = 0;
    v9 = 0;
    do
    {
      result = objc_msgSend(*(id *)(v5 + 1600), "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9));
      if ((result & 1) == 0)
      {
        v10 = (__int128 *)(*(_QWORD *)(v5 + 480) + v8);
        if ((*((_BYTE *)v10 + 12) & 1) != 0)
        {
          memset(&v17, 0, sizeof(v17));
          v11 = (__int128 *)(*(_QWORD *)(v5 + 456) + v8);
          v12 = *v11;
          lhs.epoch = *((_QWORD *)v11 + 2);
          *(_OWORD *)&lhs.value = v12;
          v13 = *v10;
          v15.epoch = *((_QWORD *)v10 + 2);
          *(_OWORD *)&v15.value = v13;
          CMTimeAdd(&v17, &lhs, &v15);
          lhs = *(CMTime *)a3;
          v15 = v17;
          result = CMTimeCompare(&lhs, &v15);
          if ((int)result >= 1)
            *(CMTime *)a3 = v17;
        }
      }
      ++v9;
      v8 += 24;
    }
    while (v9 < *(_QWORD *)(v5 + 744) + *(_QWORD *)(v5 + 728));
  }
  if ((~*(_DWORD *)(a3 + 12) & 5) == 0)
  {
    v14 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)a3 = *MEMORY[0x1E0CA2E18];
    v4 = *(_QWORD *)(v14 + 16);
    goto LABEL_13;
  }
  return result;
}

- (uint64_t)_endingPTSForTrack:(uint64_t)a3@<X2> endingPTS:(uint64_t)a4@<X3> writtenEndingPTS:(uint64_t)a5@<X4> validatedEndingPTS:(int)a6@<W5> isIrisMasterMovie:(uint64_t)a7@<X8>
{
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  __int128 *v14;
  __int128 v15;
  uint64_t v16;
  CMTime v17;
  CMTime time1;

  if (result)
  {
    v10 = result;
    *(_OWORD *)a7 = *(_OWORD *)a4;
    *(_QWORD *)(a7 + 16) = *(_QWORD *)(a4 + 16);
    if (((*(_BYTE *)(a3 + 12) & 1) != 0 || a6) && (*(_BYTE *)(a5 + 12) & 1) != 0)
    {
      v11 = *(_QWORD *)(result + 456) + 24 * a2;
      time1 = *(CMTime *)a5;
      v12 = *(_OWORD *)v11;
      v17.epoch = *(_QWORD *)(v11 + 16);
      *(_OWORD *)&v17.value = v12;
      result = CMTimeCompare(&time1, &v17);
      if ((int)result >= 1)
      {
        *(_OWORD *)a7 = *(_OWORD *)a5;
        *(_QWORD *)(a7 + 16) = *(_QWORD *)(a5 + 16);
      }
    }
    if (*(_QWORD *)(v10 + 728) > a2)
    {
      v13 = *(_QWORD *)(v10 + 464);
      if ((*(_BYTE *)(v13 + 24 * a2 + 12) & 1) != 0)
      {
        v14 = (__int128 *)(v13 + 24 * a2);
        time1 = *(CMTime *)a7;
        v15 = *v14;
        v17.epoch = *((_QWORD *)v14 + 2);
        *(_OWORD *)&v17.value = v15;
        result = CMTimeCompare(&time1, &v17);
        if ((result & 0x80000000) != 0)
        {
          v16 = *(_QWORD *)(v10 + 464) + 24 * a2;
          *(_OWORD *)a7 = *(_OWORD *)v16;
          *(_QWORD *)(a7 + 16) = *(_QWORD *)(v16 + 16);
        }
      }
    }
  }
  else
  {
    *(_QWORD *)a7 = 0;
    *(_QWORD *)(a7 + 8) = 0;
    *(_QWORD *)(a7 + 16) = 0;
  }
  return result;
}

- (unint64_t)_computeMotionAnalysisStatisticFromRange:(uint64_t)a3 calculation:
{
  unint64_t v4;
  void *v5;
  void *v6;
  unint64_t i;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  float v13;
  float v14;
  _QWORD v15[3];
  CMTime rhs;
  CMTime lhs;
  CMTime v18;
  CMTime v19;

  if (result)
  {
    v4 = result;
    v19 = *a2;
    memset(&v18, 0, sizeof(v18));
    lhs = *a2;
    rhs = a2[1];
    CMTimeAdd(&v18, &lhs, &rhs);
    v5 = *(void **)(v4 + 840);
    lhs = v19;
    rhs = v18;
    v6 = (void *)objc_msgSend(v5, "retrieveInferencesForType:beginning:until:", 2001, &lhs, &rhs);
    result = objc_msgSend(v6, "count");
    if (result >= 2)
    {
      for (i = 1; i < result; ++i)
      {
        v8 = (void *)objc_msgSend(v6, "objectAtIndexedSubscript:", i);
        v9 = (void *)objc_msgSend((id)objc_msgSend(v8, "inferences"), "objectForKeyedSubscript:", getVCPCaptureAnalysisSubjectMotionScoreKey());
        v10 = (void *)objc_msgSend((id)objc_msgSend(v8, "inferences"), "objectForKeyedSubscript:", getVCPCaptureAnalysisMotionDivScoreKey());
        v11 = -1.0;
        v12 = -1.0;
        if (v9)
        {
          objc_msgSend(v9, "floatValue");
          v12 = v13;
        }
        if (v10)
        {
          objc_msgSend(v10, "floatValue");
          v11 = v14;
        }
        if (v8)
          objc_msgSend(v8, "timestamp");
        else
          memset(v15, 0, sizeof(v15));
        (*(void (**)(uint64_t, _QWORD *, float, float))(a3 + 16))(a3, v15, v12, v11);
        result = objc_msgSend(v6, "count");
      }
    }
  }
  return result;
}

- (void)_fixVitalityScoreWithMotionAnalysis:(unint64_t)a1
{
  float v4;
  double v5;
  unint64_t v6;
  _QWORD v7[6];
  CMTime end;
  CMTime rhs;
  CMTime lhs;
  CMTime start;
  CMTimeRange v12;
  uint64_t v13;
  float *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  CMTime time;
  CMTime v22;
  CMTime v23;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 840))
    {
      if (objc_msgSend(a2, "isVitalityScoreValid"))
      {
        objc_msgSend(a2, "vitalityScore");
        if (v4 < 0.5)
        {
          memset(&v23, 0, sizeof(v23));
          if (a2)
            objc_msgSend(a2, "movieTrimStartTime");
          memset(&v22, 0, sizeof(v22));
          CMTimeMake(&time, 5, 1000);
          CMTimeConvertScale(&v22, &time, v23.timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
          v17 = 0;
          v18 = &v17;
          v19 = 0x2020000000;
          v20 = 0;
          v13 = 0;
          v14 = (float *)&v13;
          v15 = 0x2020000000;
          v16 = 0;
          lhs = v23;
          rhs = v22;
          CMTimeSubtract(&start, &lhs, &rhs);
          if (a2)
            objc_msgSend(a2, "movieTrimEndTime");
          else
            memset(&end, 0, sizeof(end));
          CMTimeRangeFromTimeToTime(&v12, &start, &end);
          v7[0] = MEMORY[0x1E0C809B0];
          v7[1] = 3221225472;
          v7[2] = __68__BWQuickTimeMovieFileSinkNode__fixVitalityScoreWithMotionAnalysis___block_invoke;
          v7[3] = &unk_1E491F9C8;
          v7[4] = &v13;
          v7[5] = &v17;
          -[BWQuickTimeMovieFileSinkNode _computeMotionAnalysisStatisticFromRange:calculation:](a1, &v12.start, (uint64_t)v7);
          v6 = v18[3];
          if (!v6 || (v5 = sqrtf(v14[6] / (float)v6), v5 >= 0.23))
          {
            LODWORD(v5) = 1.0;
            objc_msgSend(a2, "setVitalityScore:", v5);
          }
          _Block_object_dispose(&v13, 8);
          _Block_object_dispose(&v17, 8);
        }
      }
    }
  }
}

float __68__BWQuickTimeMovieFileSinkNode__fixVitalityScoreWithMotionAnalysis___block_invoke(uint64_t a1, float result)
{
  uint64_t v2;

  if (result >= 0.0)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    result = *(float *)(v2 + 24) + (float)(result * result);
    *(float *)(v2 + 24) = result;
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  return result;
}

- (unint64_t)_computeTransitionVitalityScore:(unint64_t)a1
{
  unint64_t v2;
  uint64_t v4;
  unint64_t v5;
  float v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  _QWORD v17[6];
  CMTime v18;
  CMTime v19;
  CMTime v20;
  _QWORD v21[6];
  CMTime end;
  CMTime v23;
  CMTime v24;
  CMTime start;
  CMTimeRange v26;
  CMTime rhs;
  int v28;
  CMTime lhs;
  uint64_t v30;
  CMTime v31;
  CMTime v32;
  CMTime time2;
  CMTime time1;
  CMTime v35;
  CMTime time;
  CMTime v37;
  CMTime v38;

  v2 = a1;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 840) && *(_QWORD *)(a1 + 848))
    {
      memset(&v38, 0, sizeof(v38));
      if (a2)
        objc_msgSend(a2, "stillImageCaptureTime");
      memset(&v37, 0, sizeof(v37));
      CMTimeMake(&time, 650, 1000);
      CMTimeConvertScale(&v37, &time, v38.timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
      memset(&v35, 0, sizeof(v35));
      lhs = v38;
      rhs = v37;
      CMTimeSubtract(&time1, &lhs, &rhs);
      if (a2)
        objc_msgSend(a2, "movieTrimStartTime");
      else
        memset(&time2, 0, sizeof(time2));
      CMTimeMaximum(&v35, &time1, &time2);
      memset(&v32, 0, sizeof(v32));
      CMTimeMake(&v31, 5, 1000);
      CMTimeConvertScale(&v32, &v31, v35.timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
      lhs.value = 0;
      *(_QWORD *)&lhs.timescale = &lhs;
      lhs.epoch = 0x2020000000;
      v30 = 0;
      rhs.value = 0;
      *(_QWORD *)&rhs.timescale = &rhs;
      rhs.epoch = 0x2020000000;
      v28 = 0;
      v24 = v35;
      v23 = v32;
      CMTimeSubtract(&start, &v24, &v23);
      v24 = v38;
      v23 = v32;
      CMTimeAdd(&end, &v24, &v23);
      CMTimeRangeFromTimeToTime(&v26, &start, &end);
      v4 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __64__BWQuickTimeMovieFileSinkNode__computeTransitionVitalityScore___block_invoke;
      v21[3] = &unk_1E491F9C8;
      v21[4] = &rhs;
      v21[5] = &lhs;
      -[BWQuickTimeMovieFileSinkNode _computeMotionAnalysisStatisticFromRange:calculation:](v2, &v26.start, (uint64_t)v21);
      v5 = *(_QWORD *)(*(_QWORD *)&lhs.timescale + 24);
      if (v5)
        v6 = sqrtf(*(float *)(*(_QWORD *)&rhs.timescale + 24) / (float)v5);
      else
        v6 = 0.0;
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
      v8 = objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v9 = *(void **)(v2 + 848);
      v24 = v35;
      v23 = v32;
      CMTimeSubtract(&v20, &v24, &v23);
      v17[0] = v4;
      v17[1] = 3221225472;
      v17[2] = __64__BWQuickTimeMovieFileSinkNode__computeTransitionVitalityScore___block_invoke_2;
      v17[3] = &unk_1E491F9F0;
      v18 = v38;
      v19 = v32;
      v17[4] = v7;
      v17[5] = v8;
      objc_msgSend(v9, "enumerateObjectsStartingAt:usingBlock:", &v20, v17);
      objc_msgSend(v7, "count");
      v24.value = 0x7FF8000000000000;
      v23.value = 0x7FF8000000000000;
      FigDisplayedVitalityClassify(v7, objc_msgSend(*(id *)(v2 + 1056), "width"), (double *)(int)objc_msgSend(*(id *)(v2 + 1056), "height"), (double *)&v24.value, (double *)&v23.value, v6);
      v11 = v10;
      v12 = (void *)MEMORY[0x1E0C99D80];
      v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(HIDWORD(v23.value), LODWORD(v6))));
      v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v24.value);
      objc_msgSend(a2, "setTransitionVitalityFeatures:", objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", v13, CFSTR("motionAnalysisRMS"), v14, CFSTR("thetaMax"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v23.value), CFSTR("deltaF"), 0));
      v2 = 1;
      *(float *)&v15 = v11;
      objc_msgSend(a2, "setTransitionVitalityScoreV1:", v15);
      objc_msgSend(a2, "setTransitionVitalityScoreValid:", 1);

      _Block_object_dispose(&rhs, 8);
      _Block_object_dispose(&lhs, 8);
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

uint64_t __64__BWQuickTimeMovieFileSinkNode__computeTransitionVitalityScore___block_invoke(uint64_t result, double a2, float a3)
{
  if (a3 >= 0.0)
  {
    *(float *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(float *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 24)
                                                                   + (float)(a3 * a3);
    if (a3 > 0.0)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
  }
  return result;
}

uint64_t __64__BWQuickTimeMovieFileSinkNode__computeTransitionVitalityScore___block_invoke_2(uint64_t a1, uint64_t a2, CMTime *a3)
{
  uint64_t result;
  CMTime v7;
  CMTime lhs;
  CMTime time2;

  lhs = *(CMTime *)(a1 + 48);
  v7 = *(CMTime *)(a1 + 72);
  CMTimeAdd(&time2, &lhs, &v7);
  lhs = *a3;
  result = CMTimeCompare(&lhs, &time2);
  if ((int)result <= 0)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return result;
}

- (uint64_t)_writeStillImageTimeMetadataSampleForCaptureTime:(void *)a3 stillImageTransformData:(uint64_t)a4 referenceDimensions:(uint64_t)a5 toTrackWithID:(int32_t)a6 usingTrackTimeScale:
{
  uint64_t v6;
  CMSampleBufferRef QuickTimeMovieStillImageTimeSampleBuffer;
  opaqueCMSampleBuffer *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, opaqueCMSampleBuffer *);
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  CMSampleBufferRef v18;
  uint64_t (*v19)(uint64_t, uint64_t, CMSampleBufferRef);
  uint64_t v20;
  CMSampleTimingInfo *sampleTimingArray;
  uint64_t v23;
  CMTime rhs;
  CMSampleTimingInfo v25;
  CMTime v26;
  CMTime v27;
  CMTime lhs;
  CMSampleBufferRef v29;

  if (!a1)
    return 0;
  lhs = *a2;
  v29 = 0;
  QuickTimeMovieStillImageTimeSampleBuffer = FigCaptureMetadataUtilitiesCreateQuickTimeMovieStillImageTimeSampleBuffer((uint64_t)&lhs, a3, a4, a6);
  if (!QuickTimeMovieStillImageTimeSampleBuffer)
  {
    LODWORD(sampleTimingArray) = 0;
    FigDebugAssert3();
    v20 = 4294954586;
    objc_msgSend(*(id *)(a1 + 1000), "logErrorNumber:errorString:", 4294954586, CFSTR("writing still image metadata"), sampleTimingArray, v6);
    return v20;
  }
  v10 = QuickTimeMovieStillImageTimeSampleBuffer;
  v11 = *(_QWORD *)(a1 + 592);
  v12 = *(uint64_t (**)(uint64_t, uint64_t, opaqueCMSampleBuffer *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                           + 32);
  if (!v12)
  {
    v20 = 4294954514;
LABEL_11:
    v23 = v6;
    LODWORD(sampleTimingArray) = v20;
    goto LABEL_15;
  }
  v13 = v12(v11, a5, v10);
  if ((_DWORD)v13)
  {
    v20 = v13;
    goto LABEL_11;
  }
  memset(&v27, 0, sizeof(v27));
  CMSampleBufferGetPresentationTimeStamp(&v27, v10);
  memset(&v26, 0, sizeof(v26));
  CMSampleBufferGetDuration(&v26, v10);
  v14 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
  *(_OWORD *)&v25.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
  *(_OWORD *)&v25.decodeTimeStamp.value = v14;
  v25.decodeTimeStamp.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
  v15 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
  *(_OWORD *)&v25.duration.value = *MEMORY[0x1E0CA2E90];
  *(_OWORD *)&v25.duration.epoch = v15;
  lhs = v27;
  rhs = v26;
  CMTimeAdd(&v25.presentationTimeStamp, &lhs, &rhs);
  v25.decodeTimeStamp = v25.presentationTimeStamp;
  v16 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 1u, 0, 0, 0, 0, 1, &v25, 0, 0, &v29);
  if ((_DWORD)v16)
  {
    v20 = v16;
    v23 = v6;
    LODWORD(sampleTimingArray) = v16;
  }
  else
  {
    if (!v29)
    {
      v20 = 0;
      goto LABEL_16;
    }
    CMSetAttachment(v29, (CFStringRef)*MEMORY[0x1E0CA2690], (CFTypeRef)*MEMORY[0x1E0C9AE50], 1u);
    v17 = *(_QWORD *)(a1 + 592);
    v18 = v29;
    v19 = *(uint64_t (**)(uint64_t, uint64_t, CMSampleBufferRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                        + 32);
    if (v19)
    {
      v20 = v19(v17, a5, v18);
      if (!(_DWORD)v20)
        goto LABEL_16;
    }
    else
    {
      v20 = 4294954514;
    }
    v23 = v6;
    LODWORD(sampleTimingArray) = v20;
  }
LABEL_15:
  FigDebugAssert3();
  objc_msgSend(*(id *)(a1 + 1000), "logErrorNumber:errorString:", v20, CFSTR("writing still image metadata"), sampleTimingArray, v23);
LABEL_16:
  CFRelease(v10);
  if (v29)
    CFRelease(v29);
  return v20;
}

- (void)_writeMovieSegmentMetadataForSegmentStartPTS:(__int128 *)a3 segmentDuration:
{
  const __CFAllocator *v6;
  OpaqueCMBlockBuffer *BlockBuffer;
  __int128 v8;
  __int128 v9;
  CMTimeEpoch v10;
  uint64_t v11;
  uint64_t v12;
  CMSampleBufferRef v13;
  unsigned int (*v14)(uint64_t, uint64_t, CMSampleBufferRef);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  size_t sampleSizeArray;
  CMSampleTimingInfo sampleTimingArray;
  CMSampleBufferRef v23;
  CFTypeRef v24;

  if (a1)
  {
    v24 = 0;
    v23 = 0;
    v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    if (!FigBoxedMetadataCreateForConstruction())
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
      if (FigBoxedMetadataAppendCFTypedValue())
        FigDebugAssert3();
      if (!FigBoxedMetadataEndConstruction())
      {
        BlockBuffer = (OpaqueCMBlockBuffer *)FigBoxedMetadataGetBlockBuffer();
        v8 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
        v9 = *a3;
        *(_OWORD *)&sampleTimingArray.duration.epoch = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
        *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = v8;
        *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
        *(_OWORD *)&sampleTimingArray.presentationTimeStamp.value = *a2;
        v10 = *((_QWORD *)a2 + 2);
        sampleTimingArray.decodeTimeStamp.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
        sampleTimingArray.presentationTimeStamp.epoch = v10;
        *(_OWORD *)&sampleTimingArray.duration.value = v9;
        sampleTimingArray.duration.epoch = *((_QWORD *)a3 + 2);
        sampleSizeArray = CMBlockBufferGetDataLength(BlockBuffer);
        if (!CMSampleBufferCreate(v6, BlockBuffer, 1u, 0, 0, *(CMFormatDescriptionRef *)(a1 + 1552), 1, 1, &sampleTimingArray, 1, &sampleSizeArray, &v23))
        {
          -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, v23);
          v11 = *(_QWORD *)(a1 + 592);
          v12 = *(unsigned int *)(*(_QWORD *)(a1 + 608) + 4 * *(_QWORD *)(a1 + 1568));
          v13 = v23;
          v14 = *(unsigned int (**)(uint64_t, uint64_t, CMSampleBufferRef))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 16)
                                                                                   + 32);
          if (!v14 || v14(v11, v12, v13))
          {
            FigDebugAssert3();
          }
          else
          {
            v15 = *(_QWORD *)(a1 + 448);
            v16 = *(_QWORD *)(a1 + 1568);
            if ((*(_BYTE *)(v15 + 24 * v16 + 12) & 1) == 0)
            {
              v17 = v15 + 24 * v16;
              v18 = *a2;
              *(_QWORD *)(v17 + 16) = *((_QWORD *)a2 + 2);
              *(_OWORD *)v17 = v18;
              v16 = *(_QWORD *)(a1 + 1568);
            }
            v19 = *(_QWORD *)(a1 + 456) + 24 * v16;
            v20 = *((_QWORD *)a2 + 2);
            *(_OWORD *)v19 = *a2;
            *(_QWORD *)(v19 + 16) = v20;
          }
        }
      }
    }
    if (v23)
      CFRelease(v23);
    if (v24)
      CFRelease(v24);
  }
}

- (uint64_t)_getCurrentFileSize:(CMTime *)a3 currentHostTime:
{
  uint64_t v5;
  uint64_t FigBaseObject;
  unsigned int (*v7)(uint64_t, _QWORD, _QWORD, CFNumberRef *);
  CMTime rhs;
  CFNumberRef number;
  CMTime time2;
  CMTime time1;
  uint64_t valuePtr;

  if (!a1)
    return 0;
  v5 = *(_QWORD *)(a1 + 176);
  valuePtr = v5;
  if ((a2 & 1) != 0 || (time1 = *(CMTime *)(a1 + 352), time2 = *a3, CMTimeCompare(&time1, &time2) <= 0))
  {
    number = 0;
    if (*(_QWORD *)(a1 + 592))
    {
      FigBaseObject = FigFormatWriterGetFigBaseObject();
      v7 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFNumberRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                             + 8)
                                                                                 + 48);
      if (!v7 || v7(FigBaseObject, *MEMORY[0x1E0CC4448], *MEMORY[0x1E0C9AE00], &number))
      {
        FigDebugAssert3();
      }
      else
      {
        CFNumberGetValue(number, kCFNumberSInt64Type, &valuePtr);
        CFRelease(number);
      }
    }
    CMTimeMake(&rhs, a3->timescale / 3, a3->timescale);
    time2 = *a3;
    CMTimeAdd(&time1, &time2, &rhs);
    *(CMTime *)(a1 + 352) = time1;
    return valuePtr;
  }
  return v5;
}

- (unsigned)_updateMovieFileMemoryAnalytics
{
  unsigned __int8 *v1;
  void *v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;

  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend((id)objc_msgSend(result, "graph"), "memoryAnalyticsPayload");
    objc_msgSend(v2, "setQuickTakeVideo:", objc_msgSend(*((id *)v1 + 50), "isIrisMovieRecording"));
    if (objc_msgSend(*((id *)v1 + 50), "isIrisRecording"))
      v3 = objc_msgSend(*((id *)v1 + 50), "isIrisMovieRecording") ^ 1;
    else
      v3 = 0;
    objc_msgSend(v2, "setLivePhoto:", v3);
    objc_msgSend(v2, "setCinematicVideo:", v1[1448]);
    v4 = *((_DWORD *)v1 + 224);
    v5 = *((_DWORD *)v1 + 225);
    if ((int)v5 >= (int)v4)
      v6 = v4;
    else
      v6 = v5;
    objc_msgSend(v2, "setVideoMinDimension:", v6);
    LODWORD(v7) = vcvtas_u32_f32(*((float *)v1 + 96));
    objc_msgSend(v2, "setVideoMaxFrameRate:", v7);
    objc_msgSend(v2, "setHdrVideo:", objc_msgSend(*((id *)v1 + 132), "hdrVideo"));
    objc_msgSend(v2, "setColorSpace:", objc_msgSend(*((id *)v1 + 132), "colorSpace"));
    objc_msgSend(v2, "setProResVideo:", qtmfsn_movieRecordingIsProRes(*((void **)v1 + 50)));
    return (unsigned __int8 *)objc_msgSend(v2, "setVideoRecordingCount:", objc_msgSend(v2, "videoRecordingCount") + 1);
  }
  return result;
}

- (void)_updateTrackFormatDescriptionsAtURL:(_QWORD *)a1
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CFTypeRef v10;
  unsigned int (*v11)(CFTypeRef, uint64_t, uint64_t, uint64_t, CFArrayRef *);
  CFIndex Count;
  CFIndex v13;
  CFIndex i;
  CFTypeRef v15;
  uint64_t v16;
  unsigned int (*v17)(CFTypeRef, uint64_t, uint64_t, uint64_t);
  const void *v18;
  CFTypeRef v19;
  unsigned int (*v20)(CFTypeRef, uint64_t, uint64_t, _QWORD, _QWORD);
  uint64_t FigBaseObject;
  uint64_t v22;
  void (*v23)(uint64_t);
  uint64_t v24;
  CFArrayRef theArray;
  CFTypeRef cf;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  cf = 0;
  v4 = *MEMORY[0x1E0C9AE00];
  v5 = *MEMORY[0x1E0CC4288];
  if (FigMutableMovieCreateWithURL())
  {
LABEL_22:
    FigDebugAssert3();
    goto LABEL_23;
  }
  v24 = v5;
  if (!a1[69])
  {
LABEL_20:
    v19 = cf;
    v20 = *(unsigned int (**)(CFTypeRef, uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                 + 16)
                                                                                     + 16);
    if (v20 && !v20(v19, v24, a2, 0, 0))
      goto LABEL_23;
    goto LABEL_22;
  }
  v6 = 0;
  v7 = *MEMORY[0x1E0CC4908];
  while (1)
  {
    v8 = *(_QWORD *)(a1[80] + 8 * v6);
    if (!v8)
      goto LABEL_19;
    v9 = *(unsigned int *)(a1[76] + 4 * v6);
    theArray = 0;
    v10 = cf;
    v11 = *(unsigned int (**)(CFTypeRef, uint64_t, uint64_t, uint64_t, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                            + 48);
    if (!v11 || v11(v10, v9, v7, v4, &theArray))
      goto LABEL_22;
    if (!theArray)
      goto LABEL_23;
    Count = CFArrayGetCount(theArray);
    if (!Count)
      break;
    v13 = Count;
    if (Count >= 1)
    {
      for (i = 0; i != v13; ++i)
        CFArrayGetValueAtIndex(theArray, i);
    }
    v15 = cf;
    v27[0] = v8;
    v16 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v17 = *(unsigned int (**)(CFTypeRef, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                              + 56);
    if (!v17 || v17(v15, v9, v7, v16))
      goto LABEL_22;
    if (theArray)
      CFRelease(theArray);
    v18 = *(const void **)(a1[80] + 8 * v6);
    if (v18)
    {
      CFRelease(v18);
      *(_QWORD *)(a1[80] + 8 * v6) = 0;
    }
LABEL_19:
    if (a1[69] <= (unint64_t)++v6)
      goto LABEL_20;
  }
  if (theArray)
    CFRelease(theArray);
LABEL_23:
  if (cf)
  {
    FigBaseObject = FigMutableMovieGetFigBaseObject();
    if (FigBaseObject)
    {
      v22 = FigBaseObject;
      v23 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
      if (v23)
        v23(v22);
    }
    CFRelease(cf);
  }
}

- (void)_submitMovieFileCoreAnalyticsEvent
{
  uint64_t v0;
  void *v1;

  v1 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "io_service_t BWDADiskCopyIOMedia(DADiskRef)");
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BWQuickTimeMovieFileSinkNode.m"), 105, CFSTR("%s"), OUTLINED_FUNCTION_0());
  __break(1u);
}

- (__CFString)_computeMovieRecordingVideoSTFStatistics
{
  __CFString *v1;
  int info_high;
  uint64_t data_low;

  if (result)
  {
    v1 = result;
    result = (__CFString *)objc_msgSend(result[12].data, "videoSTFEnabled");
    LOBYTE(v1[43].length) = (_BYTE)result;
    if (LOBYTE(v1[43].length))
    {
      info_high = HIDWORD(v1[43].info);
      if (info_high >= 1)
      {
        *(float *)&v1[44].info = (float)((float)SLODWORD(v1[43].info) / (float)info_high) * 100.0;
        info_high = HIDWORD(v1[43].info);
      }
      if (SLODWORD(v1[43].info) < info_high)
      {
        data_low = SLODWORD(v1[43].data);
        if (data_low >= 4)
          result = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), SLODWORD(v1[43].data));
        else
          result = off_1E491FAB0[data_low];
        v1[44].isa = result;
      }
    }
  }
  return result;
}

- (void)_debugAudioUsingSampleBuffer:(uint64_t)a1
{
  const opaqueCMFormatDescription *FormatDescription;
  const AudioStreamBasicDescription *StreamBasicDescription;
  uint64_t v6;
  __int128 v7;
  _DWORD *v9;
  _DWORD *v10;
  unint64_t v11;
  uint64_t v12;
  OpaqueCMBlockBuffer *DataBuffer;
  _DWORD *v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  size_t totalLengthOut;

  if (a1)
  {
    if (!*(_BYTE *)(a1 + 738))
    {
      FormatDescription = CMSampleBufferGetFormatDescription(sbuf);
      StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription);
      if (StreamBasicDescription)
      {
        v6 = *(_QWORD *)&StreamBasicDescription->mBitsPerChannel;
        v7 = *(_OWORD *)&StreamBasicDescription->mBytesPerPacket;
        *(_OWORD *)(a1 + 752) = *(_OWORD *)&StreamBasicDescription->mSampleRate;
        *(_OWORD *)(a1 + 768) = v7;
        *(_QWORD *)(a1 + 784) = v6;
        *(_BYTE *)(a1 + 738) = 1;
        free(*(void **)(a1 + 792));
        *(_QWORD *)(a1 + 792) = 0;
      }
    }
    if (*(_BYTE *)(a1 + 738)
      && *(_DWORD *)(a1 + 760) == 1819304813
      && ((~*(_DWORD *)(a1 + 764) & 9) == 0 || (*(_DWORD *)(a1 + 764) & 0xC) == 12))
    {
      if (!*(_QWORD *)(a1 + 792))
      {
        v9 = malloc_type_calloc(1uLL, 16 * (*(_DWORD *)(a1 + 780) - 1) + 24, 0xAAC19306uLL);
        *(_QWORD *)(a1 + 792) = v9;
        *v9 = *(_DWORD *)(a1 + 780);
        v10 = *(_DWORD **)(a1 + 792);
        if (*v10)
        {
          v11 = 0;
          v12 = 2;
          do
          {
            v10[v12] = 1;
            ++v11;
            v10 = *(_DWORD **)(a1 + 792);
            v12 += 4;
          }
          while (v11 < *v10);
        }
      }
      DataBuffer = CMSampleBufferGetDataBuffer(sbuf);
      v19 = 0;
      totalLengthOut = 0;
      if (!CMBlockBufferGetDataPointer(DataBuffer, 0, 0, &totalLengthOut, &v19))
      {
        v14 = *(_DWORD **)(a1 + 792);
        if (*v14)
        {
          v15 = 0;
          v16 = 0;
          v17 = v19;
          v18 = totalLengthOut / *v14;
          do
          {
            v14[v15 + 3] = v18;
            *(_QWORD *)(*(_QWORD *)(a1 + 792) + v15 * 4 + 16) = v17;
            v17 = &v19[v18];
            v19 += v18;
            ++v16;
            v14 = *(_DWORD **)(a1 + 792);
            v15 += 4;
          }
          while (v16 < *v14);
        }
      }
    }
  }
}

- (uint64_t)_preprocessingForFirstVideoBuffer:(uint64_t)a3 forInputIndex:
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const opaqueCMFormatDescription *FormatDescription;
  CMVideoDimensions Dimensions;
  void *v14;
  __CVBuffer *v15;
  __CVBuffer *v16;
  BWStats *v17;
  BWMovingWindowStats *v18;
  BWStats *v19;
  BWStats *v20;

  if (!result)
    return result;
  v5 = result;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = *(void **)(v5 + 400);
    if (v6)
    {
      v7 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      v8 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
      if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D05A38]) & 1) != 0)
      {
        v9 = 2;
      }
      else if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D05A50]))
      {
        v9 = 2;
      }
      else
      {
        v9 = 1;
      }
      *(_OWORD *)(v5 + 1064) = 0u;
      *(_OWORD *)(v5 + 1080) = 0u;
      *(_OWORD *)(v5 + 1096) = 0u;
      *(_OWORD *)(v5 + 1112) = 0u;
      *(_OWORD *)(v5 + 1128) = 0u;
      *(_OWORD *)(v5 + 1144) = 0u;
      *(_OWORD *)(v5 + 1160) = 0u;
      *(_OWORD *)(v5 + 1176) = 0u;
      *(_OWORD *)(v5 + 1192) = 0u;
      *(_OWORD *)(v5 + 1208) = 0u;
      *(_OWORD *)(v5 + 1224) = 0u;
      *(_OWORD *)(v5 + 1240) = 0u;
      *(_QWORD *)(v5 + 1256) = 0;
      objc_msgSend(*(id *)(v5 + 1264), "removeAllObjects");
      objc_msgSend(*(id *)(v5 + 1272), "removeAllObjects");
      *(_QWORD *)(v5 + 1312) = mach_absolute_time();
      *(_QWORD *)(v5 + 1288) = 0;
      *(_QWORD *)(v5 + 1296) = 0;
      *(_DWORD *)(v5 + 1304) = 0;
      *(_QWORD *)(v5 + 1320) = -1;
      *(_DWORD *)(v5 + 1328) = 0;
      *(_DWORD *)(v5 + 1332) = 0;
      objc_msgSend(*(id *)(v5 + 1352), "removeAllObjects");
      objc_msgSend(*(id *)(v5 + 1360), "removeAllObjects");
      objc_msgSend(*(id *)(v5 + 1352), "setObject:forKeyedSubscript:", *(_QWORD *)(v5 + 1360), 0x1E495A5B8);
      v11 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", 0x1E495A558);
      objc_msgSend(*(id *)(v5 + 1352), "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", 0x1E495A598), 0x1E495A598);
      *(_DWORD *)(v5 + 1368) = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", 0x1E495A578), "intValue");
      objc_msgSend(*(id *)(v5 + 1512), "reset", -[BWQuickTimeMovieFileSinkNode _resetVideoSTFAnalytics](v5));
      *(_BYTE *)(v5 + 1520) = 0;
      FormatDescription = CMSampleBufferGetFormatDescription((CMSampleBufferRef)a2);
      Dimensions = CMVideoFormatDescriptionGetDimensions(FormatDescription);
      objc_msgSend(*(id *)(v5 + 1056), "setHeight:", HIDWORD(*(unint64_t *)&Dimensions));
      objc_msgSend(*(id *)(v5 + 1056), "setWidth:", Dimensions);
      *(CMVideoDimensions *)(v5 + 896) = Dimensions;
      objc_msgSend((id)CMGetAttachment(a2, CFSTR("UIZoomFactor"), 0), "floatValue");
      objc_msgSend(*(id *)(v5 + 1056), "setStartingUIZoom:");
      objc_msgSend(*(id *)(v5 + 1056), "setDevicePosition:", v9);
      objc_msgSend(*(id *)(v5 + 1056), "setVideoOrientation:", objc_msgSend(v6, "videoOrientation"));
      objc_msgSend(*(id *)(v5 + 1056), "setVideoMirrored:", objc_msgSend(v6, "videoMirrored"));
      v14 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D06940]);
      if (v14)
        objc_msgSend(*(id *)(v5 + 1056), "setCameraPosture:", objc_msgSend(v14, "intValue"));
      objc_msgSend(*(id *)(v5 + 1056), "setClientApplicationID:", *(_QWORD *)(v5 + 1008));
      v10 = -[BWQuickTimeMovieFileSinkNode _setTrackMatrixProperty:forInputIndex:fileSettings:metadata:]((_QWORD *)v5, (opaqueCMSampleBuffer *)a2, a3, v6, v7);
      v15 = (__CVBuffer *)CMGetAttachment(a2, CFSTR("FileCompletionScaledThumbnailSourcePixelBuffer"), 0);
      if (v15)
      {
        v16 = v15;
        -[BWQuickTimeMovieFileSinkNode _generateThumbnailSurfaceFromPixelBuffer:physicallyMirroredHorizontallyUpstream:](v5, v15, objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MirroredHorizontal")), "BOOLValue"));
        objc_msgSend(*(id *)(v5 + 1056), "setHdrVideo:", BWPixelBufferIsHDR(v16));
        objc_msgSend(*(id *)(v5 + 1056), "setColorSpace:", BWPixelBufferColorSpace(v16));
      }
      CMSetAttachment(a2, CFSTR("FileCompletionScaledThumbnailSourcePixelBuffer"), 0, 1u);
      goto LABEL_16;
    }
  }
  else
  {
    v6 = 0;
  }
  v10 = 0;
LABEL_16:

  *(_QWORD *)(v5 + 1336) = 0;
  *(_QWORD *)(v5 + 1344) = 0;
  if (objc_msgSend(v6, "isIrisRecording"))
  {
    v17 = objc_alloc_init(BWStats);
    *(_QWORD *)(v5 + 968) = v17;
    -[BWStats setMultiplier:](v17, "setMultiplier:", 0.000001);
    objc_msgSend(*(id *)(v5 + 968), "setUnitDesignator:", CFSTR("ms"));
    v18 = -[BWMovingWindowStats initWithWindowSize:]([BWMovingWindowStats alloc], "initWithWindowSize:", 128);
    *(_QWORD *)(v5 + 976) = v18;
    -[BWStats setMultiplier:](v18, "setMultiplier:", 0.000001);
    objc_msgSend(*(id *)(v5 + 976), "setUnitDesignator:", CFSTR("ms"));
    v19 = -[BWStats initWithMedianCalculationEnabled:maxNumberOfSamplesForMedianCalculation:]([BWStats alloc], "initWithMedianCalculationEnabled:maxNumberOfSamplesForMedianCalculation:", 1, 0);
    *(_QWORD *)(v5 + 1336) = v19;
    -[BWStats setMultiplier:](v19, "setMultiplier:", 1000.0);
    objc_msgSend(*(id *)(v5 + 1336), "setUnitDesignator:", CFSTR("ms"));
  }
  v20 = objc_alloc_init(BWStats);
  *(_QWORD *)(v5 + 984) = v20;
  -[BWStats setMultiplier:](v20, "setMultiplier:", 0.000001);
  result = objc_msgSend(*(id *)(v5 + 984), "setUnitDesignator:", CFSTR("ms"));
  if ((_DWORD)v10)
    return objc_msgSend(*(id *)(v5 + 1000), "logErrorNumber:errorString:", v10, CFSTR("preprocess video"));
  return result;
}

- (double)_resetVideoSTFAnalytics
{
  double result;

  if (a1)
  {
    *(_DWORD *)(a1 + 1388) = 0;
    *(_DWORD *)(a1 + 1384) = 0;
    *(_DWORD *)(a1 + 1392) = 3;
    result = 0.0;
    *(_OWORD *)(a1 + 1400) = 0u;
    *(_OWORD *)(a1 + 1416) = 0u;
    *(_OWORD *)(a1 + 1432) = 0u;
  }
  return result;
}

- (uint64_t)_setTrackMatrixProperty:(uint64_t)a3 forInputIndex:(void *)a4 fileSettings:(void *)a5 metadata:
{
  void *v10;
  int v11;
  _BOOL4 IsExtensionDeviceType;
  unsigned int v13;
  int v14;
  int v15;
  const opaqueCMFormatDescription *FormatDescription;
  uint64_t Dimensions;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t, _QWORD, uint64_t);
  uint64_t v23;

  if (!a1)
    return 0;
  v10 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
  v11 = (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D05A38]) & 1) != 0
      ? 1
      : objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D05A50]);
  IsExtensionDeviceType = BWDeviceTypeIsExtensionDeviceType(objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D069B8]), "integerValue"));
  v13 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("MirroredHorizontal")), "BOOLValue");
  v14 = (v13 & 1) != 0 ? 0 : objc_msgSend(a4, "videoMirrored");
  v15 = objc_msgSend(a4, "videoOrientation");
  FormatDescription = CMSampleBufferGetFormatDescription(a2);
  Dimensions = (uint64_t)CMVideoFormatDescriptionGetDimensions(FormatDescription);
  objc_msgSend((id)objc_msgSend(a1, "graph"), "clientExpectsCameraMountedInLandscapeOrientation");
  v18 = BWBuildVideoTrackMatrix(v15, v14, v13, v11, IsExtensionDeviceType, 0, Dimensions);
  if (!v18)
    return 0;
  v19 = v18;
  v20 = a1[74];
  v21 = *(unsigned int *)(a1[76] + 4 * a3);
  v22 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (!v22)
  {
    v23 = 4294954514;
LABEL_14:
    FigDebugAssert3();
    FigDebugAssert3();
    return v23;
  }
  v23 = v22(v20, v21, *MEMORY[0x1E0CC4688], v19);
  if ((_DWORD)v23)
    goto LABEL_14;
  return v23;
}

- (uint64_t)_preprocessingForFirstAuxiliaryBuffer:(uint64_t)a3 forInputIndex:
{
  uint64_t v5;
  void *v6;
  void *v7;

  if (result)
  {
    v5 = result;
    objc_opt_class();
    result = objc_opt_isKindOfClass();
    if ((result & 1) != 0)
    {
      v6 = *(void **)(v5 + 400);
      if (v6)
      {
        v7 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
        result = -[BWQuickTimeMovieFileSinkNode _setTrackMatrixProperty:forInputIndex:fileSettings:metadata:]((_QWORD *)v5, (opaqueCMSampleBuffer *)a2, a3, v6, v7);
        if ((_DWORD)result)
          return objc_msgSend(*(id *)(v5 + 1000), "logErrorNumber:errorString:", result, CFSTR("preprocess auxiliary"));
      }
    }
  }
  return result;
}

- (uint64_t)_preprocessingForFirstAudioBuffer:(uint64_t)a3 forInputIndex:
{
  uint64_t v4;
  const opaqueCMFormatDescription *FormatDescription;
  const AudioStreamBasicDescription *StreamBasicDescription;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t, uint64_t, uint64_t);

  if (!result)
    return result;
  v4 = result;
  FormatDescription = CMSampleBufferGetFormatDescription(sbuf);
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription);
  if (!StreamBasicDescription
    || (v7 = StreamBasicDescription->mSampleRate + 0.5, v8 = (int)v7, !(_DWORD)v8))
  {
    FigDebugAssert3();
    v14 = 0xFFFFFFFFLL;
    return objc_msgSend(*(id *)(v4 + 1000), "logErrorNumber:errorString:", v14, CFSTR("preprocess audio"));
  }
  v9 = *(_QWORD *)(v4 + 592);
  v10 = *(unsigned int *)(*(_QWORD *)(v4 + 608) + 4 * a3);
  v11 = *MEMORY[0x1E0CC45F0];
  v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)v7);
  v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (v13)
  {
    result = v13(v9, v10, v11, v12);
    v14 = result;
    if (!(_DWORD)result)
      goto LABEL_9;
  }
  else
  {
    v14 = 4294954514;
  }
  result = FigDebugAssert3();
LABEL_9:
  if (*(_DWORD *)(v4 + 1564))
    goto LABEL_16;
  v15 = *(_QWORD *)(v4 + 592);
  v16 = *(unsigned int *)(*(_QWORD *)(v4 + 608) + 4 * *(_QWORD *)(v4 + 1568));
  v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
  v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (!v18)
  {
    v14 = 4294954514;
LABEL_14:
    result = FigDebugAssert3();
    goto LABEL_15;
  }
  result = v18(v15, v16, v11, v17);
  v14 = result;
  if ((_DWORD)result)
    goto LABEL_14;
LABEL_15:
  *(_DWORD *)(v4 + 1564) = v8;
LABEL_16:
  if (*(_QWORD *)(v4 + 704) == a3)
    *(_DWORD *)(v4 + 376) = v8;
  if ((_DWORD)v14)
    return objc_msgSend(*(id *)(v4 + 1000), "logErrorNumber:errorString:", v14, CFSTR("preprocess audio"));
  return result;
}

- (_QWORD)_preprocessingForFirstMetadataBuffer:(uint64_t)a3 forInputIndex:
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, _QWORD, uint64_t);
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v4 = result;
    if (!*(_QWORD *)(result[80] + 8 * a3))
    {
      v5 = result[74];
      v6 = *(unsigned int *)(result[76] + 4 * a3);
      v11[0] = CMSampleBufferGetFormatDescription(sbuf);
      v7 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
      v8 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
      if (v8)
      {
        result = (_QWORD *)v8(v5, v6, *MEMORY[0x1E0CC4590], v7);
        if (!(_DWORD)result)
          return result;
        v9 = (uint64_t)result;
      }
      else
      {
        v9 = 4294954514;
      }
      LODWORD(v10) = v9;
      FigDebugAssert3();
      return (_QWORD *)objc_msgSend((id)v4[125], "logErrorNumber:errorString:", v9, CFSTR("preprocess metadata"), v10, v3);
    }
  }
  return result;
}

- (uint64_t)_checkFreeSpaceForEstimatedMovieSizeOverhead:(uint64_t)result
{
  uint64_t v3;
  uint64_t SInt64;
  uint64_t CMBaseObject;
  unsigned int (*v6)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  CFTypeRef cf;

  if (result)
  {
    v3 = result;
    SInt64 = BWGetFreeDiskSpaceAtPath(*(const char **)(result + 416));
    if (*(_QWORD *)(v3 + 1528) && objc_msgSend(*(id *)(v3 + 400), "usesVirtualCaptureCard"))
    {
      cf = 0;
      CMBaseObject = FigVirtualCaptureCardGetCMBaseObject();
      v6 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                               + 48);
      if (!v6 || v6(CMBaseObject, *MEMORY[0x1E0CA5478], 0, &cf))
      {
        FigDebugAssert3();
        SInt64 = 0;
      }
      else
      {
        SInt64 = FigCFNumberGetSInt64();
      }
      if (cf)
        CFRelease(cf);
    }
    if (SInt64 <= -[BWQuickTimeMovieFileSinkNode _adjustedMinFreeDiskSpaceLimitForEstimatedMovieSizeOverhead:](v3, a2))
      return 4294950885;
    else
      return 0;
  }
  return result;
}

- (uint64_t)_adjustedMinFreeDiskSpaceLimitForEstimatedMovieSizeOverhead:(uint64_t)result
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  if (result)
  {
    v3 = result;
    v4 = objc_msgSend(*(id *)(result + 664), "numberOfPendingReferenceMovies");
    if (qtmfsn_minFreeDiskSpaceLimit_onceToken != -1)
      dispatch_once(&qtmfsn_minFreeDiskSpaceLimit_onceToken, &__block_literal_global_512);
    v5 = qtmfsn_minFreeDiskSpaceLimit_sMinFreeDiskSpaceLimit + 10485760 * v4;
    if (*(_QWORD *)(v3 + 216))
      v6 = *(_QWORD *)(v3 + 216);
    else
      v6 = qtmfsn_minFreeDiskSpaceLimit_sMinFreeDiskSpaceLimit + 10485760 * v4;
    if (v6 > v5)
      v5 = v6;
    return v5 + a2;
  }
  return result;
}

- (uint64_t)_adjustMaxFileDurationForMovieTimeScale:(uint64_t)a1
{
  CMTime *v3;
  uint64_t v4;
  CMTime v6;
  CMTime time1;

  if (a1)
  {
    *(_BYTE *)(a1 + 736) = 0;
    v3 = (CMTime *)(a1 + 328);
    CMTimeMakeWithSeconds(&time1, 2147483650.0 / (double)preferredTimescale + -60.0, preferredTimescale);
    *v3 = time1;
    if ((*(_DWORD *)(a1 + 316) & 0x1D) == 1)
    {
      time1 = *(CMTime *)(a1 + 304);
      v6 = *(CMTime *)(a1 + 328);
      if (CMTimeCompare(&time1, &v6) < 0)
      {
        v4 = *(_QWORD *)(a1 + 320);
        *(_OWORD *)(a1 + 328) = *(_OWORD *)(a1 + 304);
        *(_QWORD *)(a1 + 344) = v4;
      }
    }
  }
  return 0;
}

- (void)_collectCoreAnalyticsData:(uint64_t)a1
{
  CMAttachmentBearerRef v2;
  void *v4;
  void *v5;
  char v6;
  uint64_t *v7;
  int *v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  float v24;
  float v25;
  float v26;
  void *v27;
  void *v28;
  float v29;
  float v30;
  float v31;
  uint64_t v32;
  void *v33;
  void *v34;
  float v35;
  float v36;
  int v37;
  float v38;
  void *v39;
  float v40;
  void *v41;
  void *v42;
  float v43;
  float v44;
  float v45;
  float v46;
  void *v47;
  float v48;
  void *v49;
  float v50;
  float v51;
  float v52;
  void *v53;
  void *v54;
  float v55;
  float v56;
  int v57;
  void *v58;
  float v59;
  void *v60;
  float v61;
  void *v62;
  float v63;
  float v64;
  float v65;
  float v66;
  void *v67;
  float v68;
  void *v69;
  void *v70;
  float v71;
  float v72;
  float v73;
  float v74;
  void *v75;
  float v76;
  void *v77;
  float v78;
  float v79;
  float v80;
  void *v81;
  void *v82;
  float v83;
  float v84;
  int v85;
  void *v86;
  float v87;
  void *v88;
  float v89;
  void *v90;
  float v91;
  float v92;
  float v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  float v98;
  float v99;
  float v100;
  float v101;
  void *v102;
  float v103;
  float v104;
  float v105;
  void *v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  void *v114;
  int v115;
  const __CFString *v116;
  void *v117;
  void *v118;
  float v119;
  void *v120;
  float v121;
  void *v122;
  void *v123;
  float v124;
  float v125;
  int v126;
  CMAttachmentBearerRef v127;
  CMAttachmentBearerRef v128;
  uint64_t v129;
  uint64_t v130;

  if (!a1)
    return;
  v2 = target;
  v4 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v5 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D05A38]))
    ++*(_QWORD *)(a1 + 1016);
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D05A50]);
  v7 = (uint64_t *)MEMORY[0x1E0D05A18];
  if ((v6 & 1) != 0)
  {
    v8 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__numVideoFramesPortTypeFront;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D05A18]) & 1) != 0)
  {
    v8 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__numVideoFramesPortTypeBack;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D05A30]) & 1) != 0)
  {
    v8 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__numVideoFramesPortTypeTelephoto;
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D05A28]))
      goto LABEL_13;
    v8 = &OBJC_IVAR___BWQuickTimeMovieFileSinkNode__numVideoFramesPortTypeSuperWide;
  }
  ++*(_QWORD *)(a1 + *v8);
LABEL_13:
  v9 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D069B0]);
  if (v9)
  {
    v10 = v9;
    v11 = *(float *)(a1 + 1064);
    v12 = (float)*(unsigned int *)(a1 + 1180);
    objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06500]), "floatValue");
    *(float *)(a1 + 1064) = (float)(v13 + (float)(v11 * v12)) / (float)(*(_DWORD *)(a1 + 1180) + 1);
    v14 = *(float *)(a1 + 1068);
    v15 = (float)*(unsigned int *)(a1 + 1180);
    objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D06508]), "floatValue");
    *(float *)(a1 + 1068) = (float)(v16 + (float)(v14 * v15)) / (float)++*(_DWORD *)(a1 + 1180);
  }
  v17 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06E48]);
  v18 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D068A0]);
  v19 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06E70]);
  v20 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06E78]);
  v21 = *v7;
  if (objc_msgSend(v5, "isEqualToString:", v21))
  {
    if (v17 && v18)
    {
      v127 = v2;
      v22 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D079A8]);
      if (v22)
      {
        v23 = v22;
        v24 = *(float *)(a1 + 1072);
        objc_msgSend(v22, "floatValue");
        if (v24 <= (float)(v25 * 0.0039062))
        {
          objc_msgSend(v23, "floatValue");
          v26 = v38 * 0.0039062;
        }
        else
        {
          v26 = *(float *)(a1 + 1072);
        }
        *(float *)(a1 + 1072) = v26;
      }
      v39 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D079E8]);
      if (v39)
      {
        objc_msgSend(v39, "floatValue");
        *(float *)(a1 + 1080) = *(float *)(a1 + 1080) + (float)((float)(v40 * 0.0039062) * (float)(v40 * 0.0039062));
      }
      v41 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D079C0]);
      if (v41)
      {
        v42 = v41;
        if (*(_DWORD *)(a1 + 1184)
          && (v43 = *(float *)(a1 + 1112), objc_msgSend(v41, "floatValue"), v43 < (float)(v44 * 0.0039062)))
        {
          v45 = *(float *)(a1 + 1112);
        }
        else
        {
          objc_msgSend(v42, "floatValue");
          v45 = v46 * 0.0039062;
        }
        *(float *)(a1 + 1112) = v45;
      }
      v47 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D079E0]);
      if (v47)
      {
        objc_msgSend(v47, "floatValue");
        *(float *)(a1 + 1120) = v48 + *(float *)(a1 + 1120);
      }
      v49 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D079D0]);
      if (v49)
      {
        objc_msgSend(v49, "floatValue");
        v51 = v50;
        v52 = *(float *)(a1 + 1128);
        if (v52 <= v51)
          v52 = v51;
        *(float *)(a1 + 1128) = v52;
      }
      else
      {
        v51 = 0.0;
      }
      v53 = (void *)objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D06270]);
      if (v53)
      {
        v54 = v53;
        v55 = *(float *)(a1 + 1088);
        objc_msgSend(v53, "floatValue");
        if (v55 <= v56)
          objc_msgSend(v54, "floatValue");
        else
          v57 = *(_DWORD *)(a1 + 1088);
        *(_DWORD *)(a1 + 1088) = v57;
      }
      v58 = (void *)objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D062A8]);
      if (v58)
      {
        objc_msgSend(v58, "floatValue");
        *(float *)(a1 + 1100) = *(float *)(a1 + 1100) + (float)(v59 * v59);
      }
      v60 = (void *)objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D06290]);
      v2 = v127;
      if (v60)
      {
        objc_msgSend(v60, "floatValue");
        *(float *)(a1 + 1140) = v61 + *(float *)(a1 + 1140);
      }
      v62 = (void *)objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D06280]);
      if (v62)
      {
        objc_msgSend(v62, "floatValue");
        v64 = *(float *)(a1 + 1152);
        if (v64 <= v63)
          v64 = v63;
        *(float *)(a1 + 1152) = v64;
      }
      else
      {
        v63 = 0.0;
      }
      v65 = v51 + v63;
      if (*(float *)(a1 + 1168) > v65)
        v65 = *(float *)(a1 + 1168);
      *(float *)(a1 + 1168) = v65;
      ++*(_DWORD *)(a1 + 1184);
    }
    if (v20)
    {
      *(_BYTE *)(a1 + 1196) = 1;
      v129 = 0;
      v130 = 0;
      objc_msgSend(v20, "getBytes:length:", &v129, 16);
      if (!(_WORD)v129)
      {
        *(_DWORD *)(a1 + 1200) += WORD1(v129);
        *(_DWORD *)(a1 + 1204) += WORD2(v129);
        *(_DWORD *)(a1 + 1208) += HIWORD(v129);
        *(_DWORD *)(a1 + 1212) += (unsigned __int16)v130;
        *(_DWORD *)(a1 + 1216) += WORD1(v130);
        *(_DWORD *)(a1 + 1224) += WORD2(v130);
        *(_DWORD *)(a1 + 1228) += HIWORD(v130);
      }
    }
    else if (v19)
    {
      *(_BYTE *)(a1 + 1196) = 0;
      LODWORD(v130) = 0;
      v129 = 0;
      objc_msgSend(v19, "getBytes:length:", &v129, 12);
      *(_DWORD *)(a1 + 1200) += (unsigned __int16)v129;
      *(_DWORD *)(a1 + 1204) += WORD1(v129);
      *(_DWORD *)(a1 + 1208) += WORD2(v129);
      *(_DWORD *)(a1 + 1212) += HIWORD(v129);
      *(_DWORD *)(a1 + 1216) += (unsigned __int16)v130;
      *(_DWORD *)(a1 + 1220) += WORD1(v130);
    }
  }
  else
  {
    v21 = *MEMORY[0x1E0D05A30];
    if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D05A30]))
    {
      v32 = *MEMORY[0x1E0D05A28];
      if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D05A28]))
        goto LABEL_115;
      if (v18)
      {
        v33 = (void *)objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D06270]);
        if (v33)
        {
          v34 = v33;
          v35 = *(float *)(a1 + 1096);
          objc_msgSend(v33, "floatValue");
          if (v35 <= v36)
            objc_msgSend(v34, "floatValue");
          else
            v37 = *(_DWORD *)(a1 + 1096);
          *(_DWORD *)(a1 + 1096) = v37;
        }
        v118 = (void *)objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D062A8]);
        if (v118)
        {
          objc_msgSend(v118, "floatValue");
          *(float *)(a1 + 1108) = *(float *)(a1 + 1108) + (float)(v119 * v119);
        }
        v120 = (void *)objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D06290]);
        if (v120)
        {
          objc_msgSend(v120, "floatValue");
          *(float *)(a1 + 1148) = v121 + *(float *)(a1 + 1148);
        }
        v122 = (void *)objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D06280]);
        if (v122)
        {
          v123 = v122;
          v124 = *(float *)(a1 + 1160);
          objc_msgSend(v122, "floatValue");
          if (v124 <= v125)
            objc_msgSend(v123, "floatValue");
          else
            v126 = *(_DWORD *)(a1 + 1160);
          *(_DWORD *)(a1 + 1160) = v126;
        }
        ++*(_DWORD *)(a1 + 1192);
      }
      if (objc_msgSend(*(id *)(a1 + 1272), "objectForKeyedSubscript:", v32))
        goto LABEL_115;
      v94 = objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D068B0]);
      v95 = *(void **)(a1 + 1272);
      v96 = v32;
      goto LABEL_114;
    }
    if (v17 && v18)
    {
      v128 = v2;
      v27 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D079A8]);
      if (v27)
      {
        v28 = v27;
        v29 = *(float *)(a1 + 1076);
        objc_msgSend(v27, "floatValue");
        if (v29 <= (float)(v30 * 0.0039062))
        {
          objc_msgSend(v28, "floatValue");
          v31 = v66 * 0.0039062;
        }
        else
        {
          v31 = *(float *)(a1 + 1076);
        }
        *(float *)(a1 + 1076) = v31;
      }
      v67 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D079E8]);
      if (v67)
      {
        objc_msgSend(v67, "floatValue");
        *(float *)(a1 + 1084) = *(float *)(a1 + 1084) + (float)((float)(v68 * 0.0039062) * (float)(v68 * 0.0039062));
      }
      v69 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D079C0]);
      if (v69)
      {
        v70 = v69;
        if (*(_DWORD *)(a1 + 1188)
          && (v71 = *(float *)(a1 + 1116), objc_msgSend(v69, "floatValue"), v71 < (float)(v72 * 0.0039062)))
        {
          v73 = *(float *)(a1 + 1116);
        }
        else
        {
          objc_msgSend(v70, "floatValue");
          v73 = v74 * 0.0039062;
        }
        *(float *)(a1 + 1116) = v73;
      }
      v75 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D079E0]);
      if (v75)
      {
        objc_msgSend(v75, "floatValue");
        *(float *)(a1 + 1124) = v76 + *(float *)(a1 + 1124);
      }
      v77 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D079D0]);
      if (v77)
      {
        objc_msgSend(v77, "floatValue");
        v79 = v78;
        v80 = *(float *)(a1 + 1132);
        if (v80 <= v79)
          v80 = v79;
        *(float *)(a1 + 1132) = v80;
      }
      else
      {
        v79 = 0.0;
      }
      v81 = (void *)objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D06270]);
      if (v81)
      {
        v82 = v81;
        v83 = *(float *)(a1 + 1092);
        objc_msgSend(v81, "floatValue");
        if (v83 <= v84)
          objc_msgSend(v82, "floatValue");
        else
          v85 = *(_DWORD *)(a1 + 1092);
        *(_DWORD *)(a1 + 1092) = v85;
      }
      v86 = (void *)objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D062A8]);
      if (v86)
      {
        objc_msgSend(v86, "floatValue");
        *(float *)(a1 + 1104) = *(float *)(a1 + 1104) + (float)(v87 * v87);
      }
      v88 = (void *)objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D06290]);
      v2 = v128;
      if (v88)
      {
        objc_msgSend(v88, "floatValue");
        *(float *)(a1 + 1144) = v89 + *(float *)(a1 + 1144);
      }
      v90 = (void *)objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D06280]);
      if (v90)
      {
        objc_msgSend(v90, "floatValue");
        v92 = *(float *)(a1 + 1156);
        if (v92 <= v91)
          v92 = v91;
        *(float *)(a1 + 1156) = v92;
      }
      else
      {
        v91 = 0.0;
      }
      v93 = v79 + v91;
      if (*(float *)(a1 + 1172) > v93)
        v93 = *(float *)(a1 + 1172);
      *(float *)(a1 + 1172) = v93;
      ++*(_DWORD *)(a1 + 1188);
    }
    if (v20)
    {
      *(_BYTE *)(a1 + 1196) = 1;
      v129 = 0;
      v130 = 0;
      objc_msgSend(v20, "getBytes:length:", &v129, 16);
      if (!(_WORD)v129)
      {
        *(_DWORD *)(a1 + 1232) += WORD1(v129);
        *(_DWORD *)(a1 + 1236) += WORD2(v129);
        *(_DWORD *)(a1 + 1240) += HIWORD(v129);
        *(_DWORD *)(a1 + 1244) += (unsigned __int16)v130;
        *(_DWORD *)(a1 + 1248) += WORD1(v130);
        *(_DWORD *)(a1 + 1256) += WORD2(v130);
        *(_DWORD *)(a1 + 1260) += HIWORD(v130);
      }
    }
    else if (v19)
    {
      *(_BYTE *)(a1 + 1196) = 0;
      LODWORD(v130) = 0;
      v129 = 0;
      objc_msgSend(v19, "getBytes:length:", &v129, 12);
      *(_DWORD *)(a1 + 1232) += (unsigned __int16)v129;
      *(_DWORD *)(a1 + 1236) += WORD1(v129);
      *(_DWORD *)(a1 + 1240) += WORD2(v129);
      *(_DWORD *)(a1 + 1244) += HIWORD(v129);
      *(_DWORD *)(a1 + 1248) += (unsigned __int16)v130;
      *(_DWORD *)(a1 + 1252) += WORD1(v130);
    }
  }
  if (!objc_msgSend(*(id *)(a1 + 1264), "objectForKeyedSubscript:", v21))
    objc_msgSend(*(id *)(a1 + 1264), "setObject:forKeyedSubscript:", objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06E58]), v21);
  if (objc_msgSend(*(id *)(a1 + 1272), "objectForKeyedSubscript:", v21))
    goto LABEL_115;
  v94 = objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D068B0]);
  v95 = *(void **)(a1 + 1272);
  v96 = v21;
LABEL_114:
  objc_msgSend(v95, "setObject:forKeyedSubscript:", v94, v96);
LABEL_115:
  if (v17 && v18)
  {
    v97 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D079D8]);
    v98 = 0.0;
    v99 = 0.0;
    if (v97)
    {
      objc_msgSend(v97, "floatValue");
      v99 = v100;
      v101 = *(float *)(a1 + 1136);
      if (v101 <= v99)
        v101 = v99;
      *(float *)(a1 + 1136) = v101;
    }
    v102 = (void *)objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D06288]);
    if (v102)
    {
      objc_msgSend(v102, "floatValue");
      v98 = v103;
      v104 = *(float *)(a1 + 1164);
      if (v104 <= v98)
        v104 = v98;
      *(float *)(a1 + 1164) = v104;
    }
    v105 = *(float *)(a1 + 1176);
    if (v105 <= (float)(v99 + v98))
      v105 = v99 + v98;
    *(float *)(a1 + 1176) = v105;
  }
  v106 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", 0x1E495A558);
  if (v106)
  {
    v107 = (void *)objc_msgSend(v106, "objectForKeyedSubscript:", 0x1E495A578);
    if (v107)
    {
      v108 = objc_msgSend(v107, "intValue");
      if ((_DWORD)v108 != *(_DWORD *)(a1 + 1368))
      {
        v109 = v108;
        v110 = (void *)objc_msgSend(*(id *)(a1 + 1360), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v108));
        if (v110)
          v111 = objc_msgSend(v110, "intValue") + 1;
        else
          v111 = 1;
        v112 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v111);
        objc_msgSend(*(id *)(a1 + 1360), "setObject:forKeyedSubscript:", v112, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v109));
        *(_DWORD *)(a1 + 1368) = v109;
      }
    }
  }
  if (!*(_BYTE *)(a1 + 1280))
    *(_BYTE *)(a1 + 1280) = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06898]), "BOOLValue");
  if (*(_QWORD *)(a1 + 1376))
  {
    v113 = (void *)CMGetAttachment(v2, CFSTR("LastPortType"), 0);
    if (v113)
    {
      v114 = v113;
      if ((objc_msgSend(v113, "isEqualToString:", v5) & 1) == 0)
      {
        if (!objc_msgSend(*(id *)(a1 + 1376), "objectForKeyedSubscript:", v114))
          objc_msgSend(*(id *)(a1 + 1376), "setObject:forKeyedSubscript:", objc_alloc_init(MEMORY[0x1E0C99E08]), v114);
        v115 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 1376), "objectForKeyedSubscript:", v114), "objectForKeyedSubscript:", v5), "intValue");
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 1376), "objectForKeyedSubscript:", v114), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v115 + 1)), v5);
      }
    }
  }
  if (objc_msgSend(*(id *)(a1 + 400), "videoSTFEnabled"))
    -[BWQuickTimeMovieFileSinkNode _collectVideoSTFAnalyticsFromSbuf:]((float *)a1, v2);
  v116 = (const __CFString *)*MEMORY[0x1E0D08878];
  v117 = (void *)CMGetAttachment(v2, (CFStringRef)*MEMORY[0x1E0D08878], 0);
  if (v117)
  {
    -[BWQuickTimeMovieFileSinkNode _collectVideoStabilizationAnalyticsFromDictionary:]((id *)a1, v117);
    CMRemoveAttachment(v2, v116);
  }
}

- (void)_forceEarlyTerminationWithErrorCode:(unint64_t)a1
{
  if (a1)
  {
    *(_DWORD *)(a1 + 584) = 0;
    -[BWQuickTimeMovieFileSinkNode _doEndRecordingAtTime:earlyTerminationErrCode:](a1, MEMORY[0x1E0CA2E18], a2);
    objc_msgSend(*(id *)(a1 + 1000), "resetCurrentLoggingCounter");

    *(_QWORD *)(a1 + 400) = 0;
    *(_QWORD *)(a1 + 408) = 0;
    -[BWQuickTimeMovieFileSinkNode _clearProvidedTrackFormatDescriptions](a1);
  }
}

- (float)_collectVideoSTFAnalyticsFromSbuf:(float *)result
{
  float *v2;
  float *v3;
  float v4;

  if (result)
  {
    if (target)
    {
      v2 = result;
      ++*((_DWORD *)result + 347);
      result = (float *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D088A0], 0);
      if (result)
      {
        v3 = result;
        if (!*((_DWORD *)v2 + 356))
          *((_DWORD *)v2 + 356) = objc_msgSend((id)objc_msgSend(result, "objectForKeyedSubscript:", *MEMORY[0x1E0D082A8]), "intValue");
        if (*((_DWORD *)v2 + 348) == 3)
          *((_DWORD *)v2 + 348) = objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D082B0]), "longValue");
        result = (float *)objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D082C8]), "BOOLValue");
        if ((_DWORD)result)
        {
          ++*((_DWORD *)v2 + 346);
          switch(objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D082C0]), "intValue"))
          {
            case 0u:
              ++*((_DWORD *)v2 + 357);
              break;
            case 1u:
              ++*((_DWORD *)v2 + 358);
              break;
            case 2u:
              ++*((_DWORD *)v2 + 359);
              break;
            case 3u:
              ++*((_DWORD *)v2 + 360);
              break;
            case 4u:
              ++*((_DWORD *)v2 + 361);
              break;
            default:
              break;
          }
          result = (float *)objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D082B8]), "floatValue");
          if (v2[355] < v4)
            v2[355] = v4;
        }
      }
    }
  }
  return result;
}

- (id)_collectVideoStabilizationAnalyticsFromDictionary:(id *)result
{
  id *v3;
  id *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  int v10;
  uint64_t v11;

  if (result)
  {
    if (a2)
    {
      v3 = result;
      objc_msgSend(result[189], "setAverageLuxValue:", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D082F0]), "intValue"));
      objc_msgSend(v3[189], "setVideoType:", objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D08320]));
      result = (id *)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D08318]);
      if (result)
      {
        objc_msgSend(v3[189], "setSigmaHistogram:", result);
        result = (id *)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D082F8]);
        if (result)
        {
          v4 = result;
          if (objc_msgSend(result, "count"))
          {
            v5 = 0;
            v6 = *MEMORY[0x1E0D08308];
            v7 = *MEMORY[0x1E0D08310];
            v8 = *MEMORY[0x1E0D08300];
            while (1)
            {
              result = (id *)objc_msgSend(v4, "objectAtIndex:", v5);
              if (!result)
                break;
              v9 = result;
              v10 = objc_msgSend((id)objc_msgSend(result, "objectForKeyedSubscript:", v6), "intValue");
              v11 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v7), "intValue");
              result = (id *)objc_msgSend(v9, "objectForKeyedSubscript:", v8);
              if (!result)
                break;
              objc_msgSend(v3[189], "setOverscanHistogram:BinningFactor:Histogram:", off_1E491FA10[v10], v11, result);
              if (objc_msgSend(v4, "count") <= (unint64_t)++v5)
                goto LABEL_10;
            }
          }
          else
          {
LABEL_10:
            result = (id *)objc_msgSend(v4, "count");
            if (result)
              *((_BYTE *)v3 + 1520) = 1;
          }
        }
      }
    }
  }
  return result;
}

- (uint64_t)_driveStateMachineWithStartMarkerBuffer:(uint64_t)a3 forInputIndex:(void *)a4 inputStagingQueue:(int)a5 sampleBufferAlreadyAtHeadOfQueue:
{
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  unsigned int v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    switch(*(_DWORD *)(a1 + 584))
    {
      case 0:
        *(_DWORD *)(a1 + 584) = 3;
        objc_msgSend(*(id *)(a1 + 1000), "resetCurrentLoggingCounter");
        v10 = (void *)CMGetAttachment(sbuf, CFSTR("RecordingSettings"), 0);
        if (v10)
          *(_QWORD *)(a1 + 408) = objc_msgSend(v10, "settingsID");
        goto LABEL_13;
      case 1:
      case 2:
        -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, sbuf);
        if (!a5)
          return 0;
        goto LABEL_6;
      case 3:
LABEL_13:
        *(_QWORD *)(a1 + 872) = 0;
        *(_DWORD *)(a1 + 1488) = *(_BYTE *)(a1 + 1484) == 0;
        *(_DWORD *)(a1 + 1492) = 0;
        *(_DWORD *)(a1 + 1496) = 0;
        *(_DWORD *)(a1 + 1500) = 0;
        if ((a5 & 1) == 0)
          objc_msgSend(a4, "addObject:", sbuf);
        -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, sbuf);
        v11 = (void *)objc_msgSend((id)a1, "recordingStatusDelegate");
        v37 = 0;
        v38 = 0;
        v35 = 0;
        v36 = 0;
        v34 = 0uLL;
        -[BWQuickTimeMovieFileSinkNode _findStartMarkersWithMatchedStagedSetting:sensorVideoPort:captureDeviceType:](a1, &v38, &v37, &v36, &v34);
        v9 = BYTE12(v34) & 1;
        v12 = v37;
        v13 = v38;
        v14 = v36;
        if ((BYTE12(v34) & 1) != 0)
        {
          v32 = v34;
          v33 = v35;
          v15 = -[BWQuickTimeMovieFileSinkNode _doStartRecordingAtTime:withSettings:sensorVideoPort:captureDeviceType:](a1, &v32, v38, v37, v36);
          if ((_DWORD)v15)
          {
            v16 = v15;
            *(_DWORD *)(a1 + 584) = 0;
            objc_msgSend(*(id *)(a1 + 1000), "resetCurrentLoggingCounter");
            if (v11)
            {
              objc_msgSend(v11, "fileWriter:writerPipelineIndex:stoppedRecordingSampleDataForSettingsID:", a1, *(_QWORD *)(a1 + 944), objc_msgSend(v13, "settingsID"));
              v17 = *(void **)(a1 + 648);
              if (v17)
              {
                objc_msgSend(v17, "setMasterMovieURL:", 0);
                LOBYTE(v24) = 0;
                objc_msgSend(v11, "fileWriter:writerPipelineIndex:stoppedRecordingForSettings:withError:thumbnailSurface:irisMovieInfo:debugMetadataSidecarFileURL:recordingSucceeded:", a1, *(_QWORD *)(a1 + 944), objc_msgSend(*(id *)(a1 + 648), "settings"), v16, 0, *(_QWORD *)(a1 + 648), 0, v24);

                *(_QWORD *)(a1 + 648) = 0;
              }
              else if (objc_msgSend(*(id *)(a1 + 656), "count"))
              {
                v25 = v12;
                v26 = v14;
                v27 = v9;
                v30 = 0u;
                v31 = 0u;
                v28 = 0u;
                v29 = 0u;
                v18 = *(void **)(a1 + 656);
                v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
                if (v19)
                {
                  v20 = v19;
                  v21 = *(_QWORD *)v29;
                  do
                  {
                    for (i = 0; i != v20; ++i)
                    {
                      if (*(_QWORD *)v29 != v21)
                        objc_enumerationMutation(v18);
                      LOBYTE(v24) = 0;
                      objc_msgSend(v11, "fileWriter:writerPipelineIndex:stoppedRecordingForSettings:withError:thumbnailSurface:irisMovieInfo:debugMetadataSidecarFileURL:recordingSucceeded:", a1, *(_QWORD *)(a1 + 944), objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "settings"), v16, 0, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), 0, v24);
                    }
                    v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
                  }
                  while (v20);
                }
                objc_msgSend(*(id *)(a1 + 656), "removeAllObjects");
                v9 = v27;
                v12 = v25;
                v14 = v26;
              }
              else
              {
                LOBYTE(v24) = 0;
                objc_msgSend(v11, "fileWriter:writerPipelineIndex:stoppedRecordingForSettings:withError:thumbnailSurface:irisMovieInfo:debugMetadataSidecarFileURL:recordingSucceeded:", a1, *(_QWORD *)(a1 + 944), v13, v16, 0, 0, 0, v24);
              }
            }
            *(_QWORD *)(a1 + 408) = 0;
          }
          else
          {
            *(_DWORD *)(a1 + 584) = 1;
            objc_msgSend(*(id *)(a1 + 864), "reset");
            if (v11)
              objc_msgSend(v11, "fileWriter:startedRecordingForSettings:writerPipelineIndex:", a1, *(_QWORD *)(a1 + 400), *(_QWORD *)(a1 + 944));
          }
        }

        return v9;
      case 4:
      case 5:
      case 6:
        if ((a5 & 1) != 0)
        {
          -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, sbuf);
LABEL_6:
          objc_msgSend(a4, "removeObjectAtIndex:", 0);
        }
        else
        {
          if (objc_msgSend(a4, "count"))
            objc_msgSend(a4, "addObject:", sbuf);
          -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, sbuf);
        }
        return 0;
      default:
        return 0;
    }
  }
  return 0;
}

- (uint64_t)_driveStateMachineWithStopOrFlushMarkerBuffer:(const void *)a3 requiredAction:(uint64_t)a4 forInputIndex:(void *)a5 inputStagingQueue:(int)a6 sampleBufferAlreadyAtHeadOfQueue:
{
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v19;
  void *v20;
  void *v21;
  const void *v22;
  uint64_t v23;
  CMTime v24;
  CMTime v25;

  if (a1)
  {
    v11 = (void *)CMGetAttachment(target, CFSTR("FileWriterStopErrorCode"), 0);
    if (v11)
    {
      v12 = objc_msgSend(v11, "intValue");
      if ((_DWORD)v12 == -16418)
      {
        if (!*(_DWORD *)(a1 + 584))
        {
          *(_DWORD *)(a1 + 584) = 4;
          v13 = (void *)CMGetAttachment(target, CFSTR("RecordingSettings"), 0);
          *(_QWORD *)(a1 + 400) = v13;
          v14 = v13;
        }
        v15 = 1;
        v16 = 4294950878;
LABEL_10:
        switch(*(_DWORD *)(a1 + 584))
        {
          case 0:
          case 2:
            -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, (CMSampleBufferRef)target);
            if (!a6)
              return 0;
            goto LABEL_14;
          case 1:
            *(_DWORD *)(a1 + 584) = 4;
            goto LABEL_21;
          case 3:
          case 5:
          case 6:
            if ((a6 & 1) != 0)
            {
              -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, (CMSampleBufferRef)target);
LABEL_14:
              objc_msgSend(a5, "removeObjectAtIndex:", 0);
            }
            else
            {
              if (objc_msgSend(a5, "count"))
                objc_msgSend(a5, "addObject:", target);
              -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, (CMSampleBufferRef)target);
            }
            return 0;
          case 4:
LABEL_21:
            if ((a6 & 1) != 0)
            {
              v19 = CFSTR("reusing already staged %@ marker");
            }
            else
            {
              objc_msgSend(a5, "addObject:", target);
              v19 = CFSTR("staging %@ marker");
            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v19, a3);
            -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, (CMSampleBufferRef)target);
            memset(&v25, 0, sizeof(v25));
            -[BWQuickTimeMovieFileSinkNode _findMarkers:](a1, a3, (uint64_t)&v25);
            v17 = v25.flags & 1;
            if ((v25.flags & 1) != 0)
            {
              *(_DWORD *)(a1 + 584) = 0;
              objc_msgSend(*(id *)(a1 + 1000), "resetCurrentLoggingCounter");
              if ((v15 & 1) != 0)
              {
                v20 = (void *)objc_msgSend((id)a1, "recordingStatusDelegate");
                if (v20)
                {
                  v21 = v20;
                  objc_msgSend(v20, "fileWriter:writerPipelineIndex:stoppedRecordingSampleDataForSettingsID:", a1, *(_QWORD *)(a1 + 944), objc_msgSend(*(id *)(a1 + 400), "settingsID"));
                  LOBYTE(v23) = 0;
                  objc_msgSend(v21, "fileWriter:writerPipelineIndex:stoppedRecordingForSettings:withError:thumbnailSurface:irisMovieInfo:debugMetadataSidecarFileURL:recordingSucceeded:", a1, *(_QWORD *)(a1 + 944), *(_QWORD *)(a1 + 400), 4294950878, 0, 0, 0, v23);
                }
                v22 = *(const void **)(a1 + 576);
                if (v22)
                {
                  CFRelease(v22);
                  *(_QWORD *)(a1 + 576) = 0;
                }
              }
              else
              {
                if (CFEqual(a3, CFSTR("Flush")))
                  v25 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
                v24 = v25;
                -[BWQuickTimeMovieFileSinkNode _doEndRecordingAtTime:earlyTerminationErrCode:](a1, &v24, v16);
              }

              *(_QWORD *)(a1 + 400) = 0;
              *(_QWORD *)(a1 + 408) = 0;
              -[BWQuickTimeMovieFileSinkNode _clearProvidedTrackFormatDescriptions](a1);
            }
            return v17;
          default:
            return 0;
        }
      }
      v16 = v12;
    }
    else
    {
      v16 = 0;
    }
    v15 = 0;
    goto LABEL_10;
  }
  return 0;
}

- (uint64_t)_driveStateMachineWithPauseMarkerBuffer:(uint64_t)a3 forInputIndex:(void *)a4 inputStagingQueue:(int)a5 sampleBufferAlreadyAtHeadOfQueue:
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int value;
  unsigned int v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, _QWORD);
  int v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, _QWORD);
  int v24;
  void *v25;
  NSObject *v26;
  unsigned int v27;
  unsigned int v28;
  CMTime *p_lhs;
  uint64_t v30;
  CMTime rhs;
  CMTime v32;
  CMTime v33;
  CMTime lhs;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  switch(*(_DWORD *)(a1 + 584))
  {
    case 0:
    case 2:
      -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, sbuf);
      if (!a5)
        return 0;
      goto LABEL_6;
    case 1:
      *(_DWORD *)(a1 + 584) = 5;
      ++*(_DWORD *)(a1 + 380);
      goto LABEL_13;
    case 3:
    case 4:
    case 6:
      if ((a5 & 1) != 0)
      {
        -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, sbuf);
LABEL_6:
        objc_msgSend(a4, "removeObjectAtIndex:", 0);
      }
      else
      {
        if (objc_msgSend(a4, "count"))
          objc_msgSend(a4, "addObject:", sbuf);
        -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, sbuf);
      }
      return 0;
    case 5:
LABEL_13:
      if ((a5 & 1) == 0)
        objc_msgSend(a4, "addObject:", sbuf);
      -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, sbuf);
      memset(&v32, 0, sizeof(v32));
      -[BWQuickTimeMovieFileSinkNode _findMarkers:](a1, CFSTR("Pause"), (uint64_t)&v32);
      v10 = v32.flags & 1;
      if ((v32.flags & 1) == 0)
        return v10;
      *(_DWORD *)(a1 + 584) = 2;
      if ((*(_BYTE *)(a1 + 1588) & 1) != 0)
      {
        memset(&v33, 0, sizeof(v33));
        lhs = v32;
        rhs = *(CMTime *)(a1 + 1576);
        CMTimeSubtract(&v33, &lhs, &rhs);
        lhs = *(CMTime *)(a1 + 1576);
        rhs = v33;
        -[BWQuickTimeMovieFileSinkNode _writeMovieSegmentMetadataForSegmentStartPTS:segmentDuration:](a1, (__int128 *)&lhs.value, (__int128 *)&rhs.value);
        v12 = MEMORY[0x1E0CA2E18];
        *(_OWORD *)(a1 + 1576) = *MEMORY[0x1E0CA2E18];
        *(_QWORD *)(a1 + 1592) = *(_QWORD *)(v12 + 16);
      }
      v13 = *(_QWORD *)(a1 + 744);
      if (!v13)
        goto LABEL_24;
      v14 = *(_QWORD *)(a1 + 728);
      if (v14 >= v14 + v13)
        goto LABEL_24;
      v15 = 24 * v14 + 12;
      break;
    default:
      return 0;
  }
  while (!*(_BYTE *)(*(_QWORD *)(a1 + 616) + v14) || (~*(_DWORD *)(*(_QWORD *)(a1 + 448) + v15) & 5) != 0)
  {
    ++v14;
    v15 += 24;
    if (!--v13)
    {
LABEL_24:
      if (dword_1ECFE9510)
      {
        LODWORD(rhs.value) = 0;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        value = rhs.value;
        if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT))
          v18 = value;
        else
          v18 = value & 0xFFFFFFFE;
        if (v18)
        {
          LODWORD(lhs.value) = 136315138;
          *(CMTimeValue *)((char *)&lhs.value + 4) = (CMTimeValue)"-[BWQuickTimeMovieFileSinkNode _driveStateMachineWithP"
                                                                  "auseMarkerBuffer:forInputIndex:inputStagingQueue:sampl"
                                                                  "eBufferAlreadyAtHeadOfQueue:]";
          LODWORD(v30) = 12;
          p_lhs = &lhs;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v19 = *(_QWORD *)(a1 + 592);
      v20 = *(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
      if (v20)
      {
        v21 = v20(v19, 0);
        if (!v21)
        {
          v22 = *(_QWORD *)(a1 + 592);
          v23 = *(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
          if (v23)
          {
            v24 = v23(v22, 0);
            if (!v24)
              goto LABEL_41;
          }
          else
          {
            v24 = -12782;
          }
          v30 = v5;
          LODWORD(p_lhs) = v24;
          goto LABEL_40;
        }
      }
      else
      {
        v21 = -12782;
      }
      v30 = v5;
      LODWORD(p_lhs) = v21;
LABEL_40:
      FigDebugAssert3();
      goto LABEL_41;
    }
  }
  if (dword_1ECFE9510)
  {
    LODWORD(rhs.value) = 0;
    v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v27 = rhs.value;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      v28 = v27;
    else
      v28 = v27 & 0xFFFFFFFE;
    if (v28)
    {
      LODWORD(lhs.value) = 136315394;
      *(CMTimeValue *)((char *)&lhs.value + 4) = (CMTimeValue)"-[BWQuickTimeMovieFileSinkNode _driveStateMachineWithPause"
                                                              "MarkerBuffer:forInputIndex:inputStagingQueue:sampleBufferA"
                                                              "lreadyAtHeadOfQueue:]";
      LOWORD(lhs.flags) = 1024;
      *(CMTimeFlags *)((char *)&lhs.flags + 2) = v14;
      LODWORD(v30) = 18;
      p_lhs = &lhs;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_41:
  v25 = (void *)objc_msgSend((id)a1, "recordingStatusDelegate", p_lhs, v30);
  if (v25)
    objc_msgSend(v25, "fileWriter:pausedRecordingForSettingsID:", a1, objc_msgSend(*(id *)(a1 + 400), "settingsID"));
  return v10;
}

- (uint64_t)_driveStateMachineWithResumeMarkerBuffer:(uint64_t)a3 forInputIndex:(void *)a4 inputStagingQueue:(int)a5 sampleBufferAlreadyAtHeadOfQueue:
{
  uint64_t v9;
  void *v11;
  void *v12;
  __int128 v13;
  uint64_t v14;

  if (a1)
  {
    switch(*(_DWORD *)(a1 + 584))
    {
      case 0:
      case 1:
        -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, sbuf);
        if (!a5)
          return 0;
        goto LABEL_6;
      case 2:
        *(_DWORD *)(a1 + 584) = 6;
        goto LABEL_13;
      case 3:
      case 4:
      case 5:
        if ((a5 & 1) != 0)
        {
          -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, sbuf);
LABEL_6:
          objc_msgSend(a4, "removeObjectAtIndex:", 0);
        }
        else
        {
          if (objc_msgSend(a4, "count"))
            objc_msgSend(a4, "addObject:", sbuf);
          -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, sbuf);
        }
        return 0;
      case 6:
LABEL_13:
        if ((a5 & 1) == 0)
          objc_msgSend(a4, "addObject:", sbuf);
        -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:]((CMTime *)a1, sbuf);
        v13 = 0uLL;
        v14 = 0;
        -[BWQuickTimeMovieFileSinkNode _findMarkers:](a1, CFSTR("Resume"), (uint64_t)&v13);
        v9 = BYTE12(v13) & 1;
        if ((BYTE12(v13) & 1) != 0)
        {
          v11 = (void *)CMGetAttachment(sbuf, CFSTR("FileWriterStopErrorCode"), 0);
          if (!v11 || !objc_msgSend(v11, "intValue"))
          {
            *(_OWORD *)(a1 + 1576) = v13;
            *(_QWORD *)(a1 + 1592) = v14;
          }
          *(_DWORD *)(a1 + 584) = 1;
          v12 = (void *)objc_msgSend((id)a1, "recordingStatusDelegate");
          if (v12)
            objc_msgSend(v12, "fileWriter:resumedRecordingForSettingsID:", a1, objc_msgSend(*(id *)(a1 + 400), "settingsID"));
        }
        return v9;
      default:
        return 0;
    }
  }
  return 0;
}

- (void)_driveStateMachineWithMediaBuffer:(uint64_t)a3 forInputIndex:(void *)a4 inputStagingQueue:(char)a5 sampleBufferAlreadyAtHeadOfQueue:
{
  if (a1)
  {
    if ((a5 & 1) != 0)
    {
      -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:](a1, sbuf);
      objc_msgSend(a4, "removeObjectAtIndex:", 0);
    }
    else
    {
      switch(a1[24].timescale)
      {
        case 0:
        case 2:
          goto LABEL_9;
        case 1:
          goto LABEL_12;
        case 3:
        case 6:
          if (!objc_msgSend(a4, "count"))
            goto LABEL_9;
          goto LABEL_8;
        case 4:
        case 5:
          if (objc_msgSend(a4, "count"))
          {
LABEL_8:
            objc_msgSend(a4, "addObject:", sbuf);
LABEL_9:
            -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:](a1, sbuf);
          }
          else
          {
            -[BWQuickTimeMovieFileSinkNode _printBufferEvent:forNodeInputIndex:eventName:](a1, sbuf);
LABEL_12:
            -[BWQuickTimeMovieFileSinkNode _writeBuffer:forInputIndex:]((unint64_t)a1, sbuf, a3);
          }
          break;
        default:
          return;
      }
    }
  }
}

uint64_t __59__BWQuickTimeMovieFileSinkNode__writeIrisRefMovieWithInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  char v6;
  void *v7;
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;

  v3 = a3;
  v6 = (_DWORD)a3 == 0;
  if (a2)
  {
    if ((_DWORD)a3)
    {
      v6 = 0;
    }
    else
    {
      v3 = -[BWQuickTimeMovieFileSinkNode _verifyMovieTiming:](*(_QWORD *)(a1 + 32), a2);
      v6 = (_DWORD)v3 == 0;
    }
    -[BWQuickTimeMovieFileSinkNode _moveOrDeleteTemporaryIrisMovie:recordingSucceeded:](*(_QWORD *)(a1 + 32), a2, v6);
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 832))
    {
      if (objc_msgSend(a2, "isFinalReferenceMovie"))
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", objc_msgSend(a2, "masterMovieURL"), 0);
    }
  }
  v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "recordingStatusDelegate");
  if (v7)
  {
    LOBYTE(v10) = v6;
    objc_msgSend(v7, "fileWriter:writerPipelineIndex:stoppedRecordingForSettings:withError:thumbnailSurface:irisMovieInfo:debugMetadataSidecarFileURL:recordingSucceeded:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 944), objc_msgSend(a2, "settings"), v3, 0, a2, 0, v10);
  }
  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "numberOfPendingReferenceMovies");
  if (!(_DWORD)result)
  {
    pthread_mutex_lock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 824));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "removeObjectIdenticalTo:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    if (dword_1ECFE9510)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return pthread_mutex_unlock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 824));
  }
  return result;
}

- (BOOL)cinematicVideoEnabled
{
  return self->_cinematicVideoEnabled;
}

- (BOOL)stereoVideoCaptureEnabled
{
  return self->_stereoVideoCaptureEnabled;
}

- (NSArray)nonCriticalAudioVideoTrackInputIndices
{
  return self->_nonCriticalAudioVideoTrackInputIndices;
}

- (void)setNonCriticalAudioVideoTrackInputIndices:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1600);
}

- (NSArray)trackReferenceListForAudioRemixInputs
{
  return self->_trackReferenceListForAudioRemixInputs;
}

- (void)setupRingBufferForStabilizedTrajectoryHomographies:.cold.1()
{
  __assert_rtn("-[BWQuickTimeMovieFileSinkNode setupRingBufferForStabilizedTrajectoryHomographies:]", "BWQuickTimeMovieFileSinkNode.m", 826, "_irisStabilizedTrajectoryHomographyRingBuffer == nil");
}

- (void)_doEndRecordingAtTime:earlyTerminationErrCode:.cold.1()
{
  __assert_rtn("-[BWQuickTimeMovieFileSinkNode _doEndRecordingAtTime:earlyTerminationErrCode:]", "BWQuickTimeMovieFileSinkNode.m", 3789, "[movieLevelMetadata isEqual:firstIrisMovieLevelMetadata]");
}

@end

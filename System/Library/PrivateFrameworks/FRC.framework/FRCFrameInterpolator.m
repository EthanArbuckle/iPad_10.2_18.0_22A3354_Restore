@implementation FRCFrameInterpolator

- (FRCFrameInterpolator)init
{
  return -[FRCFrameInterpolator initWithMode:](self, "initWithMode:", 1);
}

- (FRCFrameInterpolator)initWithMode:(int64_t)a3
{
  FRCFrameInterpolator *v4;
  FRCFrameInterpolator *v5;
  uint64_t v6;
  __int128 v7;
  dispatch_semaphore_t v8;
  OS_dispatch_semaphore *completion_semaphore;
  dispatch_semaphore_t v10;
  OS_dispatch_semaphore *postProcessingComletionSemaphore;
  dispatch_semaphore_t v12;
  OS_dispatch_semaphore *initializationSemaphore;
  dispatch_group_t v14;
  OS_dispatch_group *dispatchGroup;
  dispatch_queue_t v16;
  OS_dispatch_queue *concurrentQueue;
  os_log_t v18;
  OS_os_log *logger;
  FRCFrameInterpolator *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)FRCFrameInterpolator;
  v4 = -[FRCFrameInterpolator init](&v22, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_usage = a3;
    v6 = MEMORY[0x1E0C9BAA8];
    v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v4->_preferredTransform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v4->_preferredTransform.c = v7;
    *(_OWORD *)&v4->_preferredTransform.tx = *(_OWORD *)(v6 + 32);
    v4->_RGBAFormat = 1111970369;
    FRCGetInputFrameSizeForUsage(a3, (uint64_t *)&v4->_width, (uint64_t *)&v4->_height);
    v8 = dispatch_semaphore_create(0);
    completion_semaphore = v5->_completion_semaphore;
    v5->_completion_semaphore = (OS_dispatch_semaphore *)v8;

    v10 = dispatch_semaphore_create(0);
    postProcessingComletionSemaphore = v5->_postProcessingComletionSemaphore;
    v5->_postProcessingComletionSemaphore = (OS_dispatch_semaphore *)v10;

    v12 = dispatch_semaphore_create(0);
    initializationSemaphore = v5->_initializationSemaphore;
    v5->_initializationSemaphore = (OS_dispatch_semaphore *)v12;

    v5->_state = 0;
    v14 = dispatch_group_create();
    dispatchGroup = v5->_dispatchGroup;
    v5->_dispatchGroup = (OS_dispatch_group *)v14;

    v16 = dispatch_queue_create("Concurrent Task Queue", MEMORY[0x1E0C80D50]);
    concurrentQueue = v5->_concurrentQueue;
    v5->_concurrentQueue = (OS_dispatch_queue *)v16;

    v5->_synthesisTemporalSmoothing = 1;
    v5->_opticalFlowRevision = 1;
    v18 = os_log_create("com.apple.FRC", "FrameInterpolator");
    logger = v5->_logger;
    v5->_logger = (OS_os_log *)v18;

    NSLog(CFSTR("Initializing FRC"));
    -[FRCFrameInterpolator initSubModules](v5, "initSubModules");
    v20 = v5;
  }

  return v5;
}

- (void)initSubModules
{
  OpticalFlow *v3;
  OpticalFlow *opticalFlow;
  Synthesis *v5;
  Synthesis *deepSynthesis;
  FRCScaler *v7;
  FRCScaler *scaler;
  int64_t v9;

  kdebug_trace();
  v3 = objc_alloc_init(OpticalFlow);
  opticalFlow = self->_opticalFlow;
  self->_opticalFlow = v3;

  v5 = -[Synthesis initWithMode:]([Synthesis alloc], "initWithMode:", self->_usage);
  deepSynthesis = self->_deepSynthesis;
  self->_deepSynthesis = v5;

  v7 = objc_alloc_init(FRCScaler);
  scaler = self->_scaler;
  self->_scaler = v7;

  if (self->_opticalFlow && self->_deepSynthesis && self->_scaler)
    v9 = 1;
  else
    v9 = 3;
  self->_state = v9;
  kdebug_trace();
}

- (int64_t)getFrameRotation:(int64_t)a3
{
  __int128 v4;
  float v5;
  float v6;
  CGAffineTransform v8;

  if ((a3 & 0x1000) != 0)
    return 2;
  v4 = *(_OWORD *)&self->_preferredTransform.c;
  *(_OWORD *)&v8.a = *(_OWORD *)&self->_preferredTransform.a;
  *(_OWORD *)&v8.c = v4;
  *(_OWORD *)&v8.tx = *(_OWORD *)&self->_preferredTransform.tx;
  if (!CGAffineTransformIsIdentity(&v8)
    && (v5 = atan2(self->_preferredTransform.b, self->_preferredTransform.a),
        v6 = (float)(v5 * 180.0) / 3.14159265,
        v6 == 180.0))
  {
    return 3;
  }
  else
  {
    return 0;
  }
}

- (int64_t)adjustUsage:(int64_t)a3
{
  int64_t QuarterSizeUsage;
  uint64_t v7;
  uint64_t v8;

  -[OpticalFlow setTwoStageFlow:](self->_opticalFlow, "setTwoStageFlow:", -[FRCFrameInterpolator twoStageFlow](self, "twoStageFlow"));
  -[OpticalFlow setDownsampling:](self->_opticalFlow, "setDownsampling:", -[FRCFrameInterpolator opticalFlowDownsampling](self, "opticalFlowDownsampling"));
  self->_inputRotation = -[FRCFrameInterpolator getFrameRotation:](self, "getFrameRotation:", a3);
  QuarterSizeUsage = a3 & 0xFFF;
  if (QuarterSizeUsage == 7)
    goto LABEL_39;
  if (QuarterSizeUsage == 6)
  {
    *(_WORD *)&self->_secondLevelFlow = 0;
    goto LABEL_21;
  }
  if (QuarterSizeUsage)
  {
    v7 = 0;
    v8 = 0;
    FRCGetInputFrameSizeForUsage(QuarterSizeUsage, &v8, &v7);
    if ((unint64_t)(v7 * v8) >> 10 < 0x7E9)
      goto LABEL_17;
    if (self->_qualityMode || self->_useCase)
    {
      if (!self->_inputScaling)
      {
        -[OpticalFlow setDownsampling:](self->_opticalFlow, "setDownsampling:", 1);
        goto LABEL_17;
      }
    }
    else
    {
      self->_inputScaling = 1;
      -[FRCFrameInterpolator setTilingEnabled:](self, "setTilingEnabled:", 1);
    }
  }
  else
  {
LABEL_39:
    if (self->_qualityMode || self->_useCase)
    {
      if (!self->_inputScaling)
      {
        -[OpticalFlow setTwoStageFlow:](self->_opticalFlow, "setTwoStageFlow:", 1);
        goto LABEL_17;
      }
    }
    else
    {
      self->_inputScaling = 1;
    }
  }
  QuarterSizeUsage = getQuarterSizeUsage(QuarterSizeUsage);
LABEL_17:
  if ((self->_secondLevelFlow || self->_inputScaling) && QuarterSizeUsage != 2)
    -[FRCFrameInterpolator setTilingEnabled:](self, "setTilingEnabled:", 0);
LABEL_21:
  if (-[OpticalFlow twoStageFlow](self->_opticalFlow, "twoStageFlow"))
    -[OpticalFlow setDownsampling:](self->_opticalFlow, "setDownsampling:", 0);
  v7 = 0;
  v8 = 0;
  FRCGetInputFrameSizeForUsage(QuarterSizeUsage, &v8, &v7);
  if ((unint64_t)(v7 * v8) >> 12 <= 0xE0)
  {
    self->_secondLevelFlow = 0;
    if (self->_synthesisMode == 1)
      self->_synthesisMode = 0;
  }
  if ((unint64_t)(self->_qualityMode - 3) > 1)
  {
    if (self->_synthesisMode == 10)
      *(_WORD *)&self->_tilingEnabled = 0;
  }
  else
  {
    self->_synthesisMode = 3;
  }
  -[Synthesis setTilingEnabled:](self->_deepSynthesis, "setTilingEnabled:", self->_tilingEnabled);
  v7 = 0;
  v8 = 0;
  FRCGetInputFrameSizeForUsage(QuarterSizeUsage, &v8, &v7);
  if ((unint64_t)(v7 * v8) >= 0x7E9000)
  {
    if (!self->_synthesisMode)
    {
      NSLog(CFSTR("Error: High Quality Mode does not support resolution >= 4K, use LowLatencyMode, etc"));
      return -1;
    }
    -[OpticalFlow setTwoStageFlow:](self->_opticalFlow, "setTwoStageFlow:", 1);
  }
  if (self->_forceSingleStageFlow)
    -[OpticalFlow setTwoStageFlow:](self->_opticalFlow, "setTwoStageFlow:", 0);
  return QuarterSizeUsage;
}

- (int64_t)startSessionWithUsage:(int64_t)a3
{
  int64_t state;
  int64_t qualityMode;
  int64_t v8;
  _BOOL4 legacyNormalizationMode;
  FRCImageProcessor *v10;
  int64_t usage;
  FRCImageProcessor *v12;
  FRCImageProcessor *imageProcessor;
  FRCFrameDropDetector *v14;
  FRCFrameDropDetector *frameDropDetector;
  int64_t gatingLevel;
  NSObject *logger;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  __int128 v35;
  int64_t v36;
  unint64_t synthesisMode;
  BOOL v38;
  NSObject *v39;
  unint64_t useCase;
  NSObject *v41;
  NSDate *v42;
  NSDate *startTime;
  NSDictionary *sessionStatistics;
  uint64_t v45;
  uint8_t buf[4];
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  -[FRCFrameInterpolator overwriteQualityModeFromDefaults](self, "overwriteQualityModeFromDefaults");
  state = self->_state;
  if (!state)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_initializationSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    state = self->_state;
  }
  if (state == 3)
    return -22007;
  if (a3 == -1)
  {
    NSLog(CFSTR("Error Invalid Usage\n"));
    return -22002;
  }
  if (state == 2)
  {
    NSLog(CFSTR("Error Session is still active. End session first before call this method"));
    return -22004;
  }
  qualityMode = self->_qualityMode;
  if (qualityMode == 2)
  {
    self->_synthesisMode = 1;
  }
  else if ((unint64_t)(qualityMode - 3) <= 1)
  {
    self->_opticalFlowAdaptationLayer = 1;
  }
  if (self->_useCase == 1)
    self->_lowMemoryMode = 1;
  v8 = -[FRCFrameInterpolator adjustUsage:](self, "adjustUsage:", a3);
  self->_usage = v8;
  if (v8 == -1)
    return -22002;
  legacyNormalizationMode = self->_legacyNormalizationMode;
  v10 = [FRCImageProcessor alloc];
  usage = self->_usage;
  if (legacyNormalizationMode)
    v12 = -[FRCImageProcessor initLegacyModeWithUsage:](v10, "initLegacyModeWithUsage:", usage);
  else
    v12 = -[FRCImageProcessor initWithUsage:](v10, "initWithUsage:", usage);
  imageProcessor = self->_imageProcessor;
  self->_imageProcessor = v12;

  -[FRCImageProcessor setInputRotation:](self->_imageProcessor, "setInputRotation:", self->_inputRotation);
  FRCGetInputFrameSizeForUsage(self->_usage, (uint64_t *)&self->_width, (uint64_t *)&self->_height);
  if (!self->_qualityMode && self->_useCase == 1 || self->_opticalFlowAdaptationLayer)
    -[OpticalFlow setUseAdaptationLayer:](self->_opticalFlow, "setUseAdaptationLayer:", 1);
  -[OpticalFlow setRevision:](self->_opticalFlow, "setRevision:", self->_opticalFlowRevision);
  -[OpticalFlow setWaitForCompletion:](self->_opticalFlow, "setWaitForCompletion:", self->_lowMemoryMode);
  if (!-[OpticalFlow switchUsageTo:](self->_opticalFlow, "switchUsageTo:", self->_usage))
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
      -[FRCFrameInterpolator startSessionWithUsage:].cold.2(logger, v18, v19, v20, v21, v22, v23, v24);
    return -22007;
  }
  if (!-[FRCFrameInterpolator configureSynthesis](self, "configureSynthesis"))
  {
    v25 = self->_logger;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[FRCFrameInterpolator startSessionWithUsage:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);
    return -22007;
  }
  -[OpticalFlow setSkipLastLevel:](self->_opticalFlow, "setSkipLastLevel:", self->_secondLevelFlow);
  v14 = objc_alloc_init(FRCFrameDropDetector);
  frameDropDetector = self->_frameDropDetector;
  self->_frameDropDetector = v14;

  gatingLevel = self->_gatingLevel;
  switch(gatingLevel)
  {
    case 2:
      self->_gatingEnabled = 1;
      self->_forceFrameOutput = 1;
      break;
    case 1:
      self->_gatingEnabled = 0;
      break;
    case 0:
      self->_gatingEnabled = self->_useCase != 2;
      break;
  }
  -[FRCFrameInterpolator allocateInternalBuffers](self, "allocateInternalBuffers");
  v33 = 1;
  self->_enableCrossFlowAnalysis = 1;
  v34 = MEMORY[0x1E0CA2E18];
  v35 = *MEMORY[0x1E0CA2E18];
  *(_OWORD *)&self->_lastFramePts.value = *MEMORY[0x1E0CA2E18];
  v36 = *(_QWORD *)(v34 + 16);
  self->_lastFramePts.epoch = v36;
  *(_OWORD *)&self->_lastFrameDuration.value = v35;
  self->_lastFrameDuration.epoch = v36;
  self->_lastFramesToInterpolate = 0;
  *(_OWORD *)&self->_ptsForLiteDebugging.value = v35;
  self->_ptsForLiteDebugging.epoch = v36;
  self->_concurrentOpticalFlow = 1;
  *(_WORD *)&self->_onDemandOpticalFlowBuffersAllocation = 257;
  self->_state = 2;
  -[FRCFrameInterpolator setPropertiesFromDefaults](self, "setPropertiesFromDefaults");
  -[FRCFrameInterpolator configureGating](self, "configureGating");
  if (!self->_qualityMode)
  {
    self->_concurrentOpticalFlow = 1;
LABEL_42:
    self->_onDemandOpticalFlowBuffersAllocation = v33;
    goto LABEL_43;
  }
  synthesisMode = self->_synthesisMode;
  if (synthesisMode != 10)
  {
    if (synthesisMode == 3)
    {
      v33 = 0;
      self->_concurrentOpticalFlow = 1;
    }
    else
    {
      self->_concurrentOpticalFlow = 1;
      v33 = (unint64_t)FRCGetNumberOfPixelsForUsage(a3) > 0x1FA400;
    }
    goto LABEL_42;
  }
LABEL_43:
  self->_onDemandSynthesisBufferAllocation = v33;
  if (self->_lowMemoryMode)
  {
    v38 = self->_gatingLevel == 0;
    self->_onDemandOpticalFlowBuffersAllocation = v38;
    self->_onDemandSynthesisBufferAllocation = v38;
    -[FRCSynthesis setFramePipeline:](self->_synthesis, "setFramePipeline:", 0);
  }
  -[OpticalFlow setConcurrentDualFlowProcessing:](self->_opticalFlow, "setConcurrentDualFlowProcessing:", self->_concurrentOpticalFlow);
  if (self->_onDemandOpticalFlowBuffersAllocation)
    self->_streamingMode = 0;
  else
    -[OpticalFlow allocateResources](self->_opticalFlow, "allocateResources");
  if (!self->_onDemandSynthesisBufferAllocation)
    -[FRCSynthesis allocateResources](self->_synthesis, "allocateResources");
  NSLog(CFSTR("[FRC] Session started successfully [usage:%d (%ldx%ld), quality:%d, tiling:%d, 1/4 flow:%d, synthesis:%d, concurrent flow:%d, twoStage:%d, self Norm: %d, temporal filtering: %d, linear splatting: %d, flow adaptation: %d, flow revision: %d]\n"), self->_usage, self->_width, self->_height, self->_qualityMode, self->_tilingEnabled, -[OpticalFlow downsampling](self->_opticalFlow, "downsampling"), self->_synthesisMode, self->_concurrentOpticalFlow, -[OpticalFlow twoStageFlow](self->_opticalFlow, "twoStageFlow"), -[FRCImageProcessor selfNormalization](self->_imageProcessor, "selfNormalization"), -[FRCSynthesis temporalFiltering](self->_synthesis, "temporalFiltering"), -[FRCSynthesis linearSplatting](self->_synthesis, "linearSplatting"), -[OpticalFlow useAdaptationLayer](self->_opticalFlow, "useAdaptationLayer"), -[OpticalFlow revision](self->_opticalFlow, "revision"));
  v39 = self->_logger;
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    useCase = self->_useCase;
    *(_DWORD *)buf = 67109120;
    v47 = useCase;
    _os_log_impl(&dword_1D425A000, v39, OS_LOG_TYPE_DEFAULT, "Use case: %d", buf, 8u);
  }
  if (self->_lowMemoryMode)
  {
    v41 = self->_logger;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D425A000, v41, OS_LOG_TYPE_DEFAULT, "Low Memory Mode", buf, 2u);
    }
  }
  if (self->_streamingMode)
    NSLog(CFSTR("[FRC] Streaming Mode enabled."));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v42 = (NSDate *)objc_claimAutoreleasedReturnValue();
  startTime = self->_startTime;
  self->_startTime = v42;

  self->_gated = 0;
  self->_totalFramesInterpolated = 0;
  self->_totalFramePairsProcessed = 0;
  sessionStatistics = self->_sessionStatistics;
  self->_sessionStatistics = 0;

  self->_sessionResult = -1;
  v45 = MEMORY[0x1E0CA2E68];
  *(_OWORD *)&self->_maxTimeGap.value = *MEMORY[0x1E0CA2E68];
  self->_maxTimeGap.epoch = *(_QWORD *)(v45 + 16);
  self->_recommendation = 0;
  self->_shouldGatedForInteractive = 0;
  *(_QWORD *)&self->_maxPixelMeanDiff = 0;
  self->_firstPairInSession = 1;
  kdebug_trace();
  return -22000;
}

- (BOOL)configureSynthesis
{
  FRCSynthesis **p_synthesis;
  int64_t usage;
  LiteSynthesis *deepSynthesis;
  LiteSynthesis *liteSynthesis;
  int64_t qualityMode;
  BOOL v8;

  p_synthesis = &self->_synthesis;
  usage = self->_usage;
  -[FRCSynthesis setFramePipeline:](self->_synthesis, "setFramePipeline:", 1);
  if (p_synthesis[67] == (FRCSynthesis *)10)
  {
    deepSynthesis = -[LiteSynthesis initWithMode:]([LiteSynthesis alloc], "initWithMode:", -[FRCFrameInterpolator usage](self, "usage"));
    liteSynthesis = self->_liteSynthesis;
    self->_liteSynthesis = deepSynthesis;

  }
  else
  {
    deepSynthesis = (LiteSynthesis *)self->_deepSynthesis;
  }
  objc_storeStrong((id *)p_synthesis, deepSynthesis);
  qualityMode = self->_qualityMode;
  if (qualityMode == 3)
  {
    v8 = 0;
    goto LABEL_8;
  }
  if (qualityMode == 4)
  {
    v8 = 1;
LABEL_8:
    self->_synthesisMode = 3;
    self->_useFlowConsistencyMap = v8;
    self->_twoLayerSynthesis = v8;
  }
  -[FRCFrameInterpolator setSynthesisOptionsFromDefaults](self, "setSynthesisOptionsFromDefaults");
  if (self->_qualityMode || self->_useCase != 1)
  {
    if (self->_synthesisMode == 10)
      goto LABEL_17;
  }
  else
  {
    self->_synthesisMode = 3;
  }
  -[FRCSynthesis setSynthesisMode:](self->_synthesis, "setSynthesisMode:");
  -[FRCSynthesis setFlowLevel:](self->_synthesis, "setFlowLevel:", 1);
  -[FRCSynthesis setLinearSplatting:](self->_synthesis, "setLinearSplatting:", self->_linearSplatting);
  if (self->_secondLevelFlow)
  {
    -[FRCFrameInterpolator setTilingEnabled:](self, "setTilingEnabled:", 0);
    if (self->_synthesisMode != 3 && (-[FRCSynthesis linearSplatting](*p_synthesis, "linearSplatting") & 1) == 0)
      usage = getQuarterSizeUsage(self->_usage);
  }
LABEL_17:
  if (self->_qualityMode == 2)
    -[FRCSynthesis setTemporalFiltering:](self->_synthesis, "setTemporalFiltering:", self->_synthesisTemporalSmoothing);
  if (self->_synthesisMode == 3)
  {
    -[FRCSynthesis setUseFlowConsistencyMap:](self->_synthesis, "setUseFlowConsistencyMap:", self->_useFlowConsistencyMap);
    -[FRCSynthesis setTwoLayerFlowSplatting:](self->_synthesis, "setTwoLayerFlowSplatting:", self->_twoLayerSynthesis);
    -[FRCSynthesis setTwoLayerQuarterSizeDC:](self->_synthesis, "setTwoLayerQuarterSizeDC:", self->_twoLayerSynthesisQuarterSizeDC);
  }
  return -[FRCSynthesis switchUsageTo:](*p_synthesis, "switchUsageTo:", usage);
}

- (int64_t)endSession
{
  unint64_t totalFramePairsProcessed;
  int64_t v4;
  void *v6;
  double v7;
  double v8;
  FRCFrameDropDetector *frameDropDetector;
  FRCImageProcessor *imageProcessor;
  OpticalFlowAnalyzer *flowAnalyzer;
  float v12;
  OpticalFlowAnalyzer *v13;
  unint64_t totalFramesInterpolated;
  double sessionConfidence;

  if (self->_state == 2)
  {
    if (!self->_gated)
    {
      if (-[FRCFrameDropDetector numberOfInsertionPoints](self->_frameDropDetector, "numberOfInsertionPoints")
        && (totalFramePairsProcessed = self->_totalFramePairsProcessed,
            totalFramePairsProcessed < -[FRCFrameDropDetector numberOfInsertionPoints](self->_frameDropDetector, "numberOfInsertionPoints")))
      {
        v4 = 3;
      }
      else
      {
        v4 = 0;
      }
      self->_sessionResult = v4;
    }
    -[FRCFrameInterpolator updateRecommendation](self, "updateRecommendation");
    -[OpticalFlow releaseResources](self->_opticalFlow, "releaseResources");
    -[FRCSynthesis releaseResources](self->_synthesis, "releaseResources");
    -[FRCFrameInterpolator releaseInternalBuffers](self, "releaseInternalBuffers");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", self->_startTime);
    v8 = v7;

    -[FRCFrameInterpolator constructSessionStatisticsWithSessionDuration:](self, "constructSessionStatisticsWithSessionDuration:", v8);
    frameDropDetector = self->_frameDropDetector;
    self->_frameDropDetector = 0;

    self->_state = 1;
    imageProcessor = self->_imageProcessor;
    self->_imageProcessor = 0;

    self->_sessionConfidence = 1.0;
    flowAnalyzer = self->_flowAnalyzer;
    if (flowAnalyzer)
    {
      if (self->_gatingLevel == 2)
        -[OpticalFlowAnalyzer confidenceScoreOnDemand](flowAnalyzer, "confidenceScoreOnDemand");
      else
        -[OpticalFlowAnalyzer confidenceScore](flowAnalyzer, "confidenceScore");
      self->_sessionConfidence = v12;
    }
    v13 = self->_flowAnalyzer;
    self->_flowAnalyzer = 0;

    self->_gatingPaused = 0;
    totalFramesInterpolated = self->_totalFramesInterpolated;
    sessionConfidence = self->_sessionConfidence;
    if (self->_gated)
      NSLog(CFSTR("Session ended. Gated after %ld frames processed. Duration: %.3f seconds. Confidence: %.2f"), totalFramesInterpolated, *(_QWORD *)&v8, *(_QWORD *)&sessionConfidence);
    else
      NSLog(CFSTR("Session ended. %ld frames interpolated. Duration: %.3f seconds. Confidence: %.2f"), totalFramesInterpolated, *(_QWORD *)&v8, *(_QWORD *)&sessionConfidence);
    return -22000;
  }
  else
  {
    NSLog(CFSTR("Error Session. Session is not started yet.\n"), a2);
    return -22003;
  }
}

- (void)dealloc
{
  OpticalFlow *opticalFlow;
  Synthesis *deepSynthesis;
  LiteSynthesis *liteSynthesis;
  FRCSynthesis *synthesis;
  FRCImageProcessor *imageProcessor;
  FRCScaler *scaler;
  objc_super v9;

  -[FRCFrameInterpolator releaseInternalBuffers](self, "releaseInternalBuffers");
  opticalFlow = self->_opticalFlow;
  self->_opticalFlow = 0;

  deepSynthesis = self->_deepSynthesis;
  self->_deepSynthesis = 0;

  liteSynthesis = self->_liteSynthesis;
  self->_liteSynthesis = 0;

  synthesis = self->_synthesis;
  self->_synthesis = 0;

  imageProcessor = self->_imageProcessor;
  self->_imageProcessor = 0;

  scaler = self->_scaler;
  self->_scaler = 0;

  v9.receiver = self;
  v9.super_class = (Class)FRCFrameInterpolator;
  -[FRCFrameInterpolator dealloc](&v9, sel_dealloc);
}

- (void)allocateInternalBuffers
{
  size_t width;
  size_t height;
  __int16 QuarterSizeUsage;
  __CVBuffer *PixelBuffer;
  size_t v7;
  size_t v8;
  size_t v9;

  width = self->_width;
  height = self->_height;
  v8 = height;
  v9 = width;
  if (self->_secondLevelFlow)
  {
    QuarterSizeUsage = getQuarterSizeUsage(self->_usage);
    FRCGetInputFrameSizeForUsage(QuarterSizeUsage, (uint64_t *)&v9, (uint64_t *)&v8);
    width = v9;
    height = (v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  }
  self->_flowForward = createPixelBuffer(width >> 1, height, 0x4C303068u, 0);
  PixelBuffer = createPixelBuffer(width >> 1, height, 0x4C303068u, 0);
  self->_flowBackward = PixelBuffer;
  if (self->_gatingEnabled)
  {
    if (self->_inputScaling)
    {
      height *= 2;
      self->_flowForwardGating = createPixelBuffer(width, height, 0x4C303068u, 0);
      self->_flowBackwardGating = createPixelBuffer(width, height, 0x4C303068u, 0);
      v7 = width;
    }
    else
    {
      self->_flowForwardGating = self->_flowForward;
      self->_flowBackwardGating = PixelBuffer;
      v7 = width >> 1;
    }
    self->_prevFlowBackwardGating = createPixelBuffer(v7, height, 0x4C303068u, 0);
  }
}

- (void)releaseInternalBuffers
{
  __CVBuffer *flowForward;
  __CVBuffer **p_flowForward;
  __CVBuffer *flowBackward;
  __CVBuffer *prevFlowBackwardGating;
  __CVPixelBufferPool *outputPixelBufferPool;
  __CVBuffer *quarterResRGB;

  p_flowForward = &self->_flowForward;
  flowForward = self->_flowForward;
  if (flowForward)
    CVPixelBufferRelease(flowForward);
  flowBackward = self->_flowBackward;
  if (flowBackward)
    CVPixelBufferRelease(flowBackward);
  if (self->_gatingEnabled && self->_inputScaling)
  {
    CVPixelBufferRelease(self->_flowForwardGating);
    CVPixelBufferRelease(self->_flowBackwardGating);
  }
  prevFlowBackwardGating = self->_prevFlowBackwardGating;
  if (prevFlowBackwardGating)
    CVPixelBufferRelease(prevFlowBackwardGating);
  p_flowForward[4] = 0;
  *(_OWORD *)p_flowForward = 0u;
  *((_OWORD *)p_flowForward + 1) = 0u;
  outputPixelBufferPool = self->_outputPixelBufferPool;
  if (outputPixelBufferPool)
  {
    CFRelease(outputPixelBufferPool);
    self->_outputPixelBufferPool = 0;
  }
  quarterResRGB = self->_quarterResRGB;
  if (quarterResRGB)
  {
    CVPixelBufferRelease(quarterResRGB);
    self->_quarterResRGB = 0;
  }
}

- (void)getPixelAttributesForBuffer:(__CVBuffer *)a3
{
  OSType PixelFormatType;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  BOOL v10;
  void *v11;
  int v12;
  unint64_t bitDepth;
  unsigned int v14;
  CFDictionaryRef v15;

  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v15 = CVPixelFormatDescriptionCreateWithPixelFormatType((CFAllocatorRef)*MEMORY[0x1E0C9AE00], PixelFormatType);
  -[__CFDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9120]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_fullRange = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CA9128]);
  -[__CFDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CA90F0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_bitDepth = (int)objc_msgSend(v7, "intValue");

  -[__CFDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9188]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isYUV = objc_msgSend(v8, "BOOLValue");

  v9 = !self->_inputScaling && self->_inputRotation == 0;
  if (self->_isYUV)
  {
    if (!self->_fullRange)
      v9 = 1;
    v10 = !v9 || self->_bitDepth == 16;
  }
  else
  {
    v10 = 0;
  }
  self->_removeCMAttachment = v10;
  -[__CFDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9180]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if (self->_isYUV)
  {
    bitDepth = self->_bitDepth;
    if (bitDepth == 10)
    {
      v14 = 1999843442;
    }
    else if (bitDepth == 8)
    {
      if (self->_qualityMode == 4)
        v14 = 759318337;
      else
        v14 = 1111970369;
    }
    else
    {
      v14 = 1380411457;
    }
    self->_RGBAFormat = v14;
  }
  else if (v12)
  {
    self->_RGBAFormat = CVPixelBufferGetPixelFormatType(a3);
  }

}

- (id)createOutputFramesWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 numberOframes:(unint64_t)a6
{
  id v9;
  __CVBuffer *PixelBuffer;
  FRCFrame *v11;
  FRCFrame *v12;
  CMTime v14;

  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  PixelBuffer = createPixelBuffer(a3, a4, a5, 0);
  v11 = [FRCFrame alloc];
  CMTimeMake(&v14, 0, 0);
  v12 = -[FRCFrame initWithBuffer:presentationTimeStamp:](v11, "initWithBuffer:presentationTimeStamp:", PixelBuffer, &v14);
  CVPixelBufferRelease(PixelBuffer);
  objc_msgSend(v9, "addObject:", v12);

  return v9;
}

- (id)interpolateBetweenFirstFrame:(id)a3 secondFrame:(id)a4 numberOfFrames:(unint64_t)a5 withError:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a4;
  v11 = a3;
  uniformTimeScales(a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FRCFrameInterpolator interpolateBetweenFirstFrame:secondFrame:timeScales:withError:](self, "interpolateBetweenFirstFrame:secondFrame:timeScales:withError:", v11, v10, v12, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)interpolateBetweenFirstFrame:(id)a3 secondFrame:(id)a4 timeScales:(id)a5 withError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  unint64_t synthesisMode;
  uint64_t v14;
  uint64_t PixelFormatType;
  size_t Width;
  void *v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  synthesisMode = self->_synthesisMode;
  if ((unint64_t)objc_msgSend(v12, "count") < 0xA || synthesisMode)
  {
    PixelFormatType = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)objc_msgSend(v10, "buffer"));
    Width = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v10, "buffer"));
    -[FRCFrameInterpolator interpolateBetweenFirstFrame:secondFrame:timeScales:outputSize:outputPixelFormat:withError:](self, "interpolateBetweenFirstFrame:secondFrame:timeScales:outputSize:outputPixelFormat:withError:", v10, v11, v12, PixelFormatType, a6, (double)Width, (double)CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v10, "buffer")));
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[FRCFrameInterpolator interpolateRecursiveFirstFrame:secondFrame:timeScale:withError:](self, "interpolateRecursiveFirstFrame:secondFrame:timeScale:withError:", v10, v11, v12, a6);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v14;

  return v17;
}

- (id)errorWithErrorCode:(int64_t)a3
{
  const __CFString *v4;
  void *v5;
  void *v6;

  if ((unint64_t)(a3 + 22009) > 6)
    v4 = &stru_1E97885E0;
  else
    v4 = off_1E9786A98[a3 + 22009];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v4, *MEMORY[0x1E0CB2D50]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.FRC"), a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)interpolateBetweenFirstFrame:(id)a3 secondFrame:(id)a4 timeScales:(id)a5 outputFrames:(id)a6 withError:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  NSArray *outputFrameListFromClient;
  BOOL v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = -[FRCFrameInterpolator checkFrameFormatConsistencyFirstFrame:secondFrame:outputFrames:](self, "checkFrameFormatConsistencyFirstFrame:secondFrame:outputFrames:", v12, v13, v15);
  v17 = objc_msgSend(v14, "count");
  if (v17 == objc_msgSend(v15, "count"))
  {
    if (v16)
    {
      objc_storeStrong((id *)&self->_outputFrameListFromClient, a6);
      -[FRCFrameInterpolator interpolateBetweenFirstFrame:secondFrame:timeScales:withError:](self, "interpolateBetweenFirstFrame:secondFrame:timeScales:withError:", v12, v13, v14, a7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      outputFrameListFromClient = self->_outputFrameListFromClient;
      self->_outputFrameListFromClient = 0;

      v20 = v18 != 0;
      goto LABEL_8;
    }
  }
  else
  {
    NSLog(CFSTR("Error! the number of timeScales and outputFrames are not matching"));
  }
  if (a7)
  {
    -[FRCFrameInterpolator errorWithErrorCode:](self, "errorWithErrorCode:", -22005);
    v20 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
LABEL_8:

  return v20;
}

- (id)interpolateBetweenFirstFrame:(id)a3 secondFrame:(id)a4 timeScales:(id)a5 outputSize:(CGSize)a6 outputPixelFormat:(unsigned int)a7 withError:(id *)a8
{
  double height;
  double width;
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  FRCFrameInterpolator *v19;
  uint64_t v20;
  id v21;
  _BOOL4 gatingEnabled;
  _BOOL4 v24;
  OpticalFlowAnalyzer *flowAnalyzer;
  FRCFrameDropDetector *frameDropDetector;
  int32_t v27;
  _BOOL4 v28;
  _BOOL8 v29;
  unint64_t v30;
  BOOL v31;
  char v32;
  NSObject *dispatchGroup;
  NSObject *concurrentQueue;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  id v38;
  NSObject *v39;
  NSObject *v40;
  $5977BF93EC93D818C841C7E270588E2B *v41;
  CVPixelBufferRef v42;
  CVPixelBufferRef v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  uint64_t v48;
  id v49;
  NSObject *v50;
  NSObject *v51;
  BOOL v53;
  unint64_t v54;
  _BOOL4 v55;
  CMTime v56;
  _QWORD v57[3];
  _QWORD v58[7];
  _QWORD v59[5];
  id v60;
  id v61;
  id v62;
  CMTime *p_lastFramePts;
  double v64;
  double v65;
  unsigned int v66;
  BOOL v67;
  CMTime lastFramePts;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  _QWORD v72[7];
  _QWORD v73[5];
  id v74;
  id v75;
  _QWORD v76[5];
  id v77;
  CMTime time2;
  uint64_t v79;
  CMTime time1;
  uint64_t v81;
  _QWORD block[5];
  char v83;
  BOOL v84;
  _QWORD v85[3];
  _QWORD v86[3];
  CMTime v87;
  CMTime rhs;
  CMTime lhs;
  CMTime v90;

  height = a6.height;
  width = a6.width;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  if (self->_state == 2)
  {
    if (objc_msgSend(v15, "buffer") && objc_msgSend(v16, "buffer"))
    {
      if (v17)
      {
        if (self->_streamingMode
          && !-[FRCFrameInterpolator checkStreamingBufferConsistencyFirstFrame:secondFrame:](self, "checkStreamingBufferConsistencyFirstFrame:secondFrame:", v15, v16))
        {
          self->_streamingMode = 0;
        }
        -[FRCFrameInterpolator getPixelAttributesForBuffer:](self, "getPixelAttributesForBuffer:", objc_msgSend(v15, "buffer"));
        if (!self->_outputPixelBufferPool)
          self->_outputPixelBufferPool = createPixelBufferPool((unint64_t)width, (unint64_t)height, a7, 0);
        v18 = objc_msgSend(v17, "count");
        ++self->_totalFramePairsProcessed;
        memset(&v90, 0, sizeof(v90));
        if (v16)
          objc_msgSend(v16, "presentationTimeStamp");
        else
          memset(&lhs, 0, sizeof(lhs));
        if (v15)
          objc_msgSend(v15, "presentationTimeStamp");
        else
          memset(&rhs, 0, sizeof(rhs));
        CMTimeSubtract(&v90, &lhs, &rhs);
        time1 = (CMTime)self->_maxTimeGap;
        time2 = v90;
        CMTimeMaximum(&lastFramePts, &time1, &time2);
        self->_maxTimeGap = ($95D729B680665BEAEFA1D6FCA8238556)lastFramePts;
        gatingEnabled = self->_gatingEnabled;
        if (self->_gatingEnabled)
          gatingEnabled = !self->_gatingPaused;
        v24 = (self->_gatingLevel != 2 || v18 > 3) && gatingEnabled;
        if (self->_useCase)
        {
          self->_cleanRectFirst = CVImageBufferGetCleanRect((CVImageBufferRef)objc_msgSend(v15, "buffer"));
          self->_cleanRectSecond = CVImageBufferGetCleanRect((CVImageBufferRef)objc_msgSend(v16, "buffer"));
        }
        v54 = v18;
        if (v24)
        {
          flowAnalyzer = self->_flowAnalyzer;
          frameDropDetector = self->_frameDropDetector;
          if (v15)
            objc_msgSend(v15, "presentationTimeStamp");
          else
            memset(&v87, 0, sizeof(v87));
          lastFramePts = (CMTime)self->_lastFramePts;
          v27 = CMTimeCompare(&lastFramePts, &v87);
          v28 = self->_gatingEnabled;
          v29 = self->_gatingEnabled && self->_enableCrossFlowAnalysis;
          lastFramePts = v90;
          -[OpticalFlowAnalyzer prepareGatingFrameDropDetector:numberOfFrames:timeGap:isContinuousDrops:enableFlowAnalysis:enableCrossFlowAnalysis:cleanRectFirst:cleanRectSecond:](flowAnalyzer, "prepareGatingFrameDropDetector:numberOfFrames:timeGap:isContinuousDrops:enableFlowAnalysis:enableCrossFlowAnalysis:cleanRectFirst:cleanRectSecond:", frameDropDetector, v54, &lastFramePts, v27 == 0, v28, v29, self->_cleanRectFirst.origin.x, self->_cleanRectFirst.origin.y, self->_cleanRectFirst.size.width, self->_cleanRectFirst.size.height, self->_cleanRectSecond.origin.x, self->_cleanRectSecond.origin.y, self->_cleanRectSecond.size.width, self->_cleanRectSecond.size.height);
        }
        kdebug_trace();
        v30 = self->_width;
        v53 = v30 != CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v15, "buffer")) || self->_isYUV;
        -[FRCFrameInterpolator preserveCMAttachmentFirstFrame:secondFrame:](self, "preserveCMAttachmentFirstFrame:secondFrame:", v15, v16);
        if (v15)
        {
          objc_msgSend(v15, "presentationTimeStamp");
          if (v16)
          {
LABEL_47:
            objc_msgSend(v16, "presentationTimeStamp");
LABEL_50:
            v31 = -[FRCFrameInterpolator shallReusePreviousFlowPts0:Pts1:](self, "shallReusePreviousFlowPts0:Pts1:", v86, v85);
            if (self->_streamingMode && !self->_firstPairInSession)
            {
              -[FRCImageProcessor preProcessFirstInput:secondInput:waitForCompletion:](self->_imageProcessor, "preProcessFirstInput:secondInput:waitForCompletion:", 0, objc_msgSend(v16, "buffer"), 0);
              v32 = 1;
            }
            else
            {
              -[FRCImageProcessor preProcessFirstInput:secondInput:waitForCompletion:](self->_imageProcessor, "preProcessFirstInput:secondInput:waitForCompletion:", objc_msgSend(v15, "buffer"), objc_msgSend(v16, "buffer"), 0);
              v32 = 0;
            }
            dispatchGroup = self->_dispatchGroup;
            concurrentQueue = self->_concurrentQueue;
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __115__FRCFrameInterpolator_interpolateBetweenFirstFrame_secondFrame_timeScales_outputSize_outputPixelFormat_withError___block_invoke;
            block[3] = &unk_1E97869D8;
            block[4] = self;
            v83 = v32;
            v84 = v31;
            v35 = MEMORY[0x1E0C809B0];
            dispatch_group_async(dispatchGroup, concurrentQueue, block);
            time1.value = 0;
            *(_QWORD *)&time1.timescale = &time1;
            time1.epoch = 0x2020000000;
            v81 = 0;
            time2.value = 0;
            *(_QWORD *)&time2.timescale = &time2;
            time2.epoch = 0x2020000000;
            v79 = 0;
            v55 = v24;
            if (v24)
            {
              v36 = self->_dispatchGroup;
              v37 = self->_concurrentQueue;
              v76[0] = v35;
              v76[1] = 3221225472;
              v76[2] = __115__FRCFrameInterpolator_interpolateBetweenFirstFrame_secondFrame_timeScales_outputSize_outputPixelFormat_withError___block_invoke_2;
              v76[3] = &unk_1E9786A00;
              v76[4] = self;
              v38 = v15;
              v77 = v38;
              dispatch_group_async(v36, v37, v76);
              if (!self->_gatingLevel)
              {
                v39 = self->_dispatchGroup;
                v40 = self->_concurrentQueue;
                v73[0] = MEMORY[0x1E0C809B0];
                v73[1] = 3221225472;
                v73[2] = __115__FRCFrameInterpolator_interpolateBetweenFirstFrame_secondFrame_timeScales_outputSize_outputPixelFormat_withError___block_invoke_3;
                v73[3] = &unk_1E9786A28;
                v73[4] = self;
                v74 = v38;
                v75 = v16;
                dispatch_group_async(v39, v40, v73);

              }
              v41 = -[OpticalFlow imageFeatures](self->_opticalFlow, "imageFeatures");
              v35 = MEMORY[0x1E0C809B0];
              if (v41->var2 && (_QWORD)-[OpticalFlow imageFeatures](self->_opticalFlow, "imageFeatures")[944])
              {
                v42 = CVPixelBufferRetain((CVPixelBufferRef)-[OpticalFlow imageFeatures](self->_opticalFlow, "imageFeatures")[464]);
                *(_QWORD *)(*(_QWORD *)&time1.timescale + 24) = v42;
                v43 = CVPixelBufferRetain((CVPixelBufferRef)-[OpticalFlow imageFeatures](self->_opticalFlow, "imageFeatures")[944]);
                *(_QWORD *)(*(_QWORD *)&time2.timescale + 24) = v43;
              }
              else
              {
                v44 = self->_dispatchGroup;
                v45 = self->_concurrentQueue;
                v72[0] = v35;
                v72[1] = 3221225472;
                v72[2] = __115__FRCFrameInterpolator_interpolateBetweenFirstFrame_secondFrame_timeScales_outputSize_outputPixelFormat_withError___block_invoke_4;
                v72[3] = &unk_1E9786A50;
                v72[4] = self;
                v72[5] = &time1;
                v72[6] = &time2;
                dispatch_group_async(v44, v45, v72);
              }

            }
            dispatch_group_wait((dispatch_group_t)self->_dispatchGroup, 0xFFFFFFFFFFFFFFFFLL);
            lastFramePts.value = 0;
            *(_QWORD *)&lastFramePts.timescale = &lastFramePts;
            lastFramePts.epoch = 0x3032000000;
            v69 = __Block_byref_object_copy__0;
            v70 = __Block_byref_object_dispose__0;
            v71 = 0;
            v46 = self->_dispatchGroup;
            v47 = self->_concurrentQueue;
            v59[0] = v35;
            v59[1] = 3221225472;
            v59[2] = __115__FRCFrameInterpolator_interpolateBetweenFirstFrame_secondFrame_timeScales_outputSize_outputPixelFormat_withError___block_invoke_75;
            v59[3] = &unk_1E9786A78;
            p_lastFramePts = &lastFramePts;
            v59[4] = self;
            v60 = v15;
            v48 = v35;
            v49 = v16;
            v61 = v49;
            v62 = v17;
            v64 = width;
            v65 = height;
            v66 = a7;
            v67 = v53;
            dispatch_group_async(v46, v47, v59);
            if (v55)
            {
              v50 = self->_dispatchGroup;
              v51 = self->_concurrentQueue;
              v58[0] = v48;
              v58[1] = 3221225472;
              v58[2] = __115__FRCFrameInterpolator_interpolateBetweenFirstFrame_secondFrame_timeScales_outputSize_outputPixelFormat_withError___block_invoke_2_76;
              v58[3] = &unk_1E9786A50;
              v58[4] = self;
              v58[5] = &time1;
              v58[6] = &time2;
              dispatch_group_async(v50, v51, v58);
            }
            dispatch_group_wait((dispatch_group_t)self->_dispatchGroup, 0xFFFFFFFFFFFFFFFFLL);
            if (v16)
              objc_msgSend(v49, "presentationTimeStamp");
            else
              memset(v57, 0, sizeof(v57));
            v56 = v90;
            -[FRCFrameInterpolator updateLastFramePts:duration:toInterpolate:](self, "updateLastFramePts:duration:toInterpolate:", v57, &v56, v54);
            if (v55)
            {
              if (-[FRCFrameInterpolator updateGatingResult](self, "updateGatingResult"))
              {
                if (a8)
                {
                  -[FRCFrameInterpolator errorWithErrorCode:](self, "errorWithErrorCode:", -22006);
                  *a8 = (id)objc_claimAutoreleasedReturnValue();
                }
                if (!self->_forceFrameOutput)
                {
                  objc_msgSend(*(id *)(*(_QWORD *)&lastFramePts.timescale + 40), "removeAllObjects");
                  v21 = 0;
                  goto LABEL_74;
                }
              }
              -[FRCFrameInterpolator updateBackwardFlow](self, "updateBackwardFlow");
            }
            self->_firstPairInSession = 0;
            self->_gatingPaused = 0;
            kdebug_trace();
            v21 = *(id *)(*(_QWORD *)&lastFramePts.timescale + 40);
LABEL_74:

            _Block_object_dispose(&lastFramePts, 8);
            _Block_object_dispose(&time2, 8);
            _Block_object_dispose(&time1, 8);
            goto LABEL_75;
          }
        }
        else
        {
          memset(v86, 0, sizeof(v86));
          if (v16)
            goto LABEL_47;
        }
        memset(v85, 0, sizeof(v85));
        goto LABEL_50;
      }
      NSLog(CFSTR("timeScale is NULL"));
    }
    else
    {
      NSLog(CFSTR("Input buffer is NULL"));
    }
    if (a8)
    {
      v19 = self;
      v20 = -22009;
      goto LABEL_17;
    }
LABEL_18:
    v21 = 0;
    goto LABEL_75;
  }
  NSLog(CFSTR("Session is not started yet. Call startSessionWithUsage first"));
  if (!a8)
    goto LABEL_18;
  v19 = self;
  v20 = -22003;
LABEL_17:
  -[FRCFrameInterpolator errorWithErrorCode:](v19, "errorWithErrorCode:", v20);
  v21 = 0;
  *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_75:

  return v21;
}

uint64_t __115__FRCFrameInterpolator_interpolateBetweenFirstFrame_secondFrame_timeScales_outputSize_outputPixelFormat_withError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  if (*(_BYTE *)(a1 + 40))
  {
    v4 = 0;
  }
  else
  {
    v4 = objc_msgSend(*(id *)(v2 + 440), "normalizedFirst");
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(v3, "opticalFlowFirstFrame:secondFrame:flowForward:flowBackward:reUseFlow:", v4, objc_msgSend(*(id *)(v2 + 440), "normalizedSecond"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), *(unsigned __int8 *)(a1 + 41));
  return kdebug_trace();
}

uint64_t __115__FRCFrameInterpolator_interpolateBetweenFirstFrame_secondFrame_timeScales_outputSize_outputPixelFormat_withError___block_invoke_2(uint64_t a1)
{
  size_t Width;
  size_t Height;
  size_t v4;
  uint64_t v5;

  Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(*(_QWORD *)(a1 + 32) + 56));
  Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(*(_QWORD *)(a1 + 32) + 56));
  v4 = Height >> 1;
  v5 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v5 + 544) && *(_BYTE *)(v5 + 493))
  {
    Width *= 2;
    v4 = Height & 0xFFFFFFFFFFFFFFFELL;
  }
  if (!*(_QWORD *)(v5 + 464))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464) = createPixelBuffer(Width, v4, *(_DWORD *)(v5 + 432), 0);
    v5 = *(_QWORD *)(a1 + 32);
  }
  return objc_msgSend(*(id *)(v5 + 40), "downScaleFrameSource:destination:rotate:waitForCompletion:", objc_msgSend(*(id *)(a1 + 40), "buffer"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 296), 0);
}

uint64_t __115__FRCFrameInterpolator_interpolateBetweenFirstFrame_secondFrame_timeScales_outputSize_outputPixelFormat_withError___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "runDetectionFromFirstBuffer:secondBuffer:", objc_msgSend(*(id *)(a1 + 40), "buffer"), objc_msgSend(*(id *)(a1 + 48), "buffer"));
}

uint64_t __115__FRCFrameInterpolator_interpolateBetweenFirstFrame_secondFrame_timeScales_outputSize_outputPixelFormat_withError___block_invoke_4(_QWORD *a1)
{
  size_t Width;
  size_t v3;

  Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1[4] + 56));
  v3 = 3 * (CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1[4] + 56)) >> 1);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = createPixelBuffer(Width, v3, 0x4C303068u, 0);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = createPixelBuffer(Width, v3, 0x4C303068u, 0);
  objc_msgSend(*(id *)(a1[4] + 8), "subsampleInput:to:forUsage:", objc_msgSend(*(id *)(a1[4] + 440), "normalizedFirst"), *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24), getQuarterSizeUsage(*(_QWORD *)(a1[4] + 512)));
  return objc_msgSend(*(id *)(a1[4] + 8), "subsampleInput:to:forUsage:", objc_msgSend(*(id *)(a1[4] + 440), "normalizedSecond"), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24), getQuarterSizeUsage(*(_QWORD *)(a1[4] + 512)));
}

uint64_t __115__FRCFrameInterpolator_interpolateBetweenFirstFrame_secondFrame_timeScales_outputSize_outputPixelFormat_withError___block_invoke_75(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t result;
  uint64_t v11;

  v2 = *(id **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = objc_msgSend(v2[55], "normalizedFirst");
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "normalizedSecond");
  LOBYTE(v11) = *(_BYTE *)(a1 + 92);
  objc_msgSend(v2, "synthesizeInterpolatedFrames:second:normalizedFirst:normalizedSecond:timeScales:outputSize:outputPixelFormat:scalerEnabled:", v3, v4, v5, v6, *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 88), *(double *)(a1 + 72), *(double *)(a1 + 80), v11);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_msgSend(*(id *)(a1 + 32), "restoreCMAttachmentToFirstFrame:secondFrame:interpolatedFrames:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 360) += result;
  return result;
}

uint64_t __115__FRCFrameInterpolator_interpolateBetweenFirstFrame_secondFrame_timeScales_outputSize_outputPixelFormat_withError___block_invoke_2_76(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CVBuffer *v12;
  __CVBuffer *v13;
  __int128 v15;
  uint64_t v16;

  kdebug_trace();
  v2 = a1[4];
  if (*(_BYTE *)(v2 + 493))
  {
    objc_msgSend(*(id *)(v2 + 8), "upscaleInputFlow:outFlow:", *(_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 72));
    objc_msgSend(*(id *)(a1[4] + 8), "upscaleInputFlow:outFlow:", *(_QWORD *)(a1[4] + 64), *(_QWORD *)(a1[4] + 80));
  }
  else
  {
    *(_QWORD *)(v2 + 72) = *(_QWORD *)(v2 + 56);
    *(_QWORD *)(a1[4] + 80) = *(_QWORD *)(a1[4] + 64);
  }
  v3 = a1[4];
  v4 = *(void **)(v3 + 48);
  v6 = *(_QWORD *)(v3 + 80);
  v5 = *(_QWORD *)(v3 + 88);
  v7 = *(_QWORD *)(v3 + 72);
  v8 = *(_QWORD *)(v3 + 464);
  v9 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  v10 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  v15 = *(_OWORD *)(v3 + 216);
  v11 = *(_QWORD *)(v3 + 240);
  v16 = *(_QWORD *)(v3 + 232);
  objc_msgSend(v4, "runGatingWithPrevFlowBackward:flowForward:flowBackward:lastFrameDuration:lastNumberOfFrames:flowResFrame:flowResFirst:flowResSecond:", v5, v7, v6, &v15, v11, v8, v9, v10);
  v12 = *(__CVBuffer **)(*(_QWORD *)(a1[5] + 8) + 24);
  if (v12)
  {
    CVPixelBufferRelease(v12);
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
  }
  v13 = *(__CVBuffer **)(*(_QWORD *)(a1[6] + 8) + 24);
  if (v13)
  {
    CVPixelBufferRelease(v13);
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1[4] + 464));
  *(_QWORD *)(a1[4] + 464) = 0;
  objc_msgSend(*(id *)(a1[4] + 48), "updateGatingStats");
  return kdebug_trace();
}

- (BOOL)updateGatingResult
{
  BOOL v3;
  int64_t gatingLevel;
  char v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float maxPixelMeanChange;

  if (-[OpticalFlowAnalyzer isSafeToInterpolate](self->_flowAnalyzer, "isSafeToInterpolate"))
  {
    v3 = 0;
  }
  else
  {
    v3 = 1;
    self->_gated = 1;
    self->_sessionResult = 2;
    if (self->_useCase == 1)
    {
      if (-[OpticalFlowAnalyzer isSafeToInterpolateForInteractiveMode](self->_flowAnalyzer, "isSafeToInterpolateForInteractiveMode"))
      {
        gatingLevel = self->_gatingLevel;
        if (gatingLevel == 2)
        {
          v5 = 0;
          self->_gated = 0;
        }
        else
        {
          v5 = 1;
        }
      }
      else
      {
        v5 = 1;
        self->_shouldGatedForInteractive = 1;
        gatingLevel = self->_gatingLevel;
      }
      if (gatingLevel == 2)
        v3 = 0;
      else
        v3 = v5;
    }
  }
  if (self->_useCase == 1)
  {
    -[FRCImageProcessor secondFramePixelMean](self->_imageProcessor, "secondFramePixelMean");
    v7 = v6;
    -[FRCImageProcessor firstFramePixelMean](self->_imageProcessor, "firstFramePixelMean");
    v9 = v7 - v8;
    -[FRCImageProcessor firstFramePixelMean](self->_imageProcessor, "firstFramePixelMean");
    v11 = v9 / v10;
    maxPixelMeanChange = self->_maxPixelMeanChange;
    if (v11 > maxPixelMeanChange)
    {
      self->_maxPixelMeanDiff = v9;
      self->_maxPixelMeanChange = v11;
      maxPixelMeanChange = v11;
    }
    if (!self->_gatingLevel && maxPixelMeanChange > 0.09)
    {
      NSLog(CFSTR("[FrameInterpolator] Interpolation is gated (brightness)"));
      self->_gated = 1;
      self->_sessionResult = 4;
    }
  }
  return v3;
}

- (BOOL)checkFrameFormatConsistencyFirstFrame:(id)a3 secondFrame:(id)a4 outputFrames:(id)a5
{
  id v7;
  id v8;
  OSType PixelFormatType;
  size_t Width;
  size_t Height;
  OSType v12;
  size_t v13;
  size_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  OSType v21;
  size_t v22;
  size_t v23;
  BOOL v26;
  id v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v30 = a5;
  PixelFormatType = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)objc_msgSend(v7, "buffer"));
  Width = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v7, "buffer"));
  Height = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v7, "buffer"));
  v12 = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)objc_msgSend(v8, "buffer"));
  v13 = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v8, "buffer"));
  v14 = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v8, "buffer"));
  if (v12 == PixelFormatType && v13 == Width && v14 == Height)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v15 = v30;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v16)
    {
      v17 = v16;
      v28 = v8;
      v29 = v7;
      v18 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v32 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          v21 = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)objc_msgSend(v20, "buffer"));
          v22 = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v20, "buffer"));
          v23 = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v20, "buffer"));
          if (v21 != PixelFormatType || v22 != Width || v23 != Height)
          {
            NSLog(CFSTR("Error! : input and output buffers must have the same format and size"));
            v26 = 0;
            goto LABEL_21;
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v17);
      v26 = 1;
LABEL_21:
      v8 = v28;
      v7 = v29;
    }
    else
    {
      v26 = 1;
    }

  }
  else
  {
    NSLog(CFSTR("Error! : firstFrame and secondFrame must have the same format and size"));
    v26 = 0;
  }

  return v26;
}

- (__CVBuffer)synthesisFrameForTimeScale:(float)a3 outputSize:(CGSize)a4 outputPixelFormat:(unsigned int)a5 scalerEnabled:(BOOL)a6 frameIndex:(unint64_t)a7 lastFrame:(BOOL)a8
{
  double height;
  double width;
  __CVBuffer *v15;
  NSArray *outputFrameListFromClient;
  void *v17;
  __CVPixelBufferPool *outputPixelBufferPool;
  double v19;
  _BOOL8 lowMemoryMode;
  CVPixelBufferRef pixelBufferOut;

  height = a4.height;
  width = a4.width;
  v15 = (__CVBuffer *)-[FRCSynthesis synthesizeFrameForTimeScale:frameIndex:](self->_synthesis, "synthesizeFrameForTimeScale:frameIndex:", a7, a6);
  pixelBufferOut = 0;
  outputFrameListFromClient = self->_outputFrameListFromClient;
  if (outputFrameListFromClient)
  {
    -[NSArray objectAtIndexedSubscript:](outputFrameListFromClient, "objectAtIndexedSubscript:", a7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    pixelBufferOut = CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(v17, "buffer"));

  }
  else
  {
    outputPixelBufferPool = self->_outputPixelBufferPool;
    if (outputPixelBufferPool)
      CVPixelBufferPoolCreatePixelBuffer(0, outputPixelBufferPool, &pixelBufferOut);
    else
      pixelBufferOut = createPixelBuffer((unint64_t)width, (unint64_t)height, a5, 0);
  }
  if (self->_removeCMAttachment)
  {
    CMRemoveAllAttachments(pixelBufferOut);
    if (a8)
      goto LABEL_11;
  }
  else
  {
    CMSetAttachments(pixelBufferOut, self->_anchorFrameCMAttachment, 1u);
    if (a8)
      goto LABEL_11;
  }
  if ((-[FRCSynthesis frameSyncRequired](self->_synthesis, "frameSyncRequired") & 1) == 0)
  {
    lowMemoryMode = self->_lowMemoryMode;
    goto LABEL_13;
  }
LABEL_11:
  lowMemoryMode = 1;
LABEL_13:
  *(float *)&v19 = a3;
  -[FRCImageProcessor postProcessNormalizedFrame:output:timeScale:waitForCompletion:](self->_imageProcessor, "postProcessNormalizedFrame:output:timeScale:waitForCompletion:", v15, pixelBufferOut, lowMemoryMode, v19);
  CVPixelBufferRelease(v15);
  return pixelBufferOut;
}

- (int)closestNumIdxInArray:(id)a3 target:(double)a4
{
  id v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;

  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  v7 = v6 - 1;
  if (v6 < 3)
  {
    v8 = 0;
LABEL_12:
    objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v19 = vabdd_f64(a4, v18);
    objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    v22 = vabdd_f64(v21, a4);

    if (v19 <= v22)
      v10 = v8;
    else
      v10 = v7;
  }
  else
  {
    v8 = 0;
    while (1)
    {
      v9 = v7 - v8;
      if (v7 < v8)
        ++v9;
      v10 = v8 + (v9 >> 1);
      objc_msgSend(v5, "objectAtIndexedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v13 = v12;

      if (v13 == a4)
        break;
      objc_msgSend(v5, "objectAtIndexedSubscript:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      v16 = v15;

      if (v16 > a4)
        v7 = v10;
      else
        v8 = v10;
      if (v8 >= v7 - 1)
        goto LABEL_12;
    }
  }

  return v10;
}

- (id)normalizeTimingFromTimeScales:(id)a3 newBeginIdx:(int)a4 newEndIdx:(int)a5
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  id v15;
  double v16;
  uint64_t v17;
  int v18;
  void *v19;
  double v20;
  double v21;
  void *v22;

  v7 = a3;
  v8 = v7;
  if (a4 == -1)
  {
    v11 = 0.0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

  }
  v12 = 1.0;
  if (objc_msgSend(v8, "count") != a5)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v12 = v14;

  }
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a4 + 1 < a5)
  {
    v16 = v12 - v11;
    v17 = a4 + 1;
    v18 = ~a4 + a5;
    do
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValue");
      v21 = (v20 - v11) / v16;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v22);

      ++v17;
      --v18;
    }
    while (v18);
  }

  return v15;
}

- (id)interpolateRecursiveFirstFrame:(id)a3 secondFrame:(id)a4 timeScale:(id)a5 withError:(id *)a6
{
  objc_class *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  BOOL gatingEnabled;
  uint64_t v79;
  id v80;

  v10 = (objc_class *)MEMORY[0x1E0C99DE8];
  v11 = a5;
  v80 = a4;
  v12 = a3;
  v69 = objc_alloc_init(v10);
  v13 = -[FRCFrameInterpolator closestNumIdxInArray:target:](self, "closestNumIdxInArray:target:", v11, 0.5);
  LODWORD(a4) = v13;
  v75 = v13;
  v14 = -[FRCFrameInterpolator closestNumIdxInArray:target:](self, "closestNumIdxInArray:target:", v11, 0.25);
  LODWORD(v10) = v14;
  v72 = v14;
  v15 = -[FRCFrameInterpolator closestNumIdxInArray:target:](self, "closestNumIdxInArray:target:", v11, 0.75);
  v16 = v15;
  v79 = v15;
  v17 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(v11, "objectAtIndexedSubscript:", (int)a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "arrayWithObject:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[FRCFrameInterpolator interpolateBetweenFirstFrame:secondFrame:timeScales:withError:](self, "interpolateBetweenFirstFrame:secondFrame:timeScales:withError:", v12, v80, v19, a6);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v71, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "insertObject:atIndex:", v20, 0);

  gatingEnabled = self->_gatingEnabled;
  self->_gatingEnabled = 0;
  v73 = (int)v10;
  objc_msgSend(v11, "objectAtIndexedSubscript:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValue");
  v23 = v22;
  v74 = (int)a4;
  objc_msgSend(v11, "objectAtIndexedSubscript:", (int)a4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "doubleValue");
  v26 = v23 / v25;

  v76 = v16;
  objc_msgSend(v11, "objectAtIndexedSubscript:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "doubleValue");
  v29 = v28;
  objc_msgSend(v11, "objectAtIndexedSubscript:", (int)a4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "doubleValue");
  v32 = v29 - v31;
  v70 = v11;
  objc_msgSend(v11, "objectAtIndexedSubscript:", (int)a4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "doubleValue");
  v35 = v32 / (1.0 - v34);

  objc_msgSend(v69, "objectAtIndexedSubscript:", 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "arrayWithObject:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[FRCFrameInterpolator interpolateBetweenFirstFrame:secondFrame:timeScales:withError:](self, "interpolateBetweenFirstFrame:secondFrame:timeScales:withError:", v12, v36, v39, a6);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v40, "firstObject");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "insertObject:atIndex:", v41, 0);

  objc_msgSend(v69, "objectAtIndexedSubscript:", 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v35);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "arrayWithObject:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[FRCFrameInterpolator interpolateBetweenFirstFrame:secondFrame:timeScales:withError:](self, "interpolateBetweenFirstFrame:secondFrame:timeScales:withError:", v42, v80, v45, a6);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v46, "firstObject");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "insertObject:atIndex:", v47, 2);

  -[FRCFrameInterpolator normalizeTimingFromTimeScales:newBeginIdx:newEndIdx:](self, "normalizeTimingFromTimeScales:newBeginIdx:newEndIdx:", v11, 0xFFFFFFFFLL, v72);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "objectAtIndexedSubscript:", 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[FRCFrameInterpolator interpolateBetweenFirstFrame:secondFrame:timeScales:withError:](self, "interpolateBetweenFirstFrame:secondFrame:timeScales:withError:", v12, v49, v48, a6);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v50, "count"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "insertObjects:atIndexes:", v50, v51);

  -[FRCFrameInterpolator normalizeTimingFromTimeScales:newBeginIdx:newEndIdx:](self, "normalizeTimingFromTimeScales:newBeginIdx:newEndIdx:", v11, v72, v75);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v69, "objectAtIndexedSubscript:", v73);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (int)v72 + 1;
  objc_msgSend(v69, "objectAtIndexedSubscript:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[FRCFrameInterpolator interpolateBetweenFirstFrame:secondFrame:timeScales:withError:](self, "interpolateBetweenFirstFrame:secondFrame:timeScales:withError:", v53, v55, v52, a6);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v54, objc_msgSend(v56, "count"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "insertObjects:atIndexes:", v56, v57);

  -[FRCFrameInterpolator normalizeTimingFromTimeScales:newBeginIdx:newEndIdx:](self, "normalizeTimingFromTimeScales:newBeginIdx:newEndIdx:", v70, v75, v79);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v69, "objectAtIndexedSubscript:", v74);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (int)v75 + 1;
  objc_msgSend(v69, "objectAtIndexedSubscript:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[FRCFrameInterpolator interpolateBetweenFirstFrame:secondFrame:timeScales:withError:](self, "interpolateBetweenFirstFrame:secondFrame:timeScales:withError:", v59, v61, v58, a6);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v60, objc_msgSend(v62, "count"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "insertObjects:atIndexes:", v62, v63);

  -[FRCFrameInterpolator normalizeTimingFromTimeScales:newBeginIdx:newEndIdx:](self, "normalizeTimingFromTimeScales:newBeginIdx:newEndIdx:", v70, v79, objc_msgSend(v70, "count"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v69, "objectAtIndexedSubscript:", v76);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[FRCFrameInterpolator interpolateBetweenFirstFrame:secondFrame:timeScales:withError:](self, "interpolateBetweenFirstFrame:secondFrame:timeScales:withError:", v65, v80, v64, a6);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", (int)v79 + 1, objc_msgSend(v66, "count"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "insertObjects:atIndexes:", v66, v67);

  self->_gatingEnabled = gatingEnabled;
  return v69;
}

- (id)synthesizeInterpolatedFrames:(id)a3 second:(id)a4 normalizedFirst:(__CVBuffer *)a5 normalizedSecond:(__CVBuffer *)a6 timeScales:(id)a7 outputSize:(CGSize)a8 outputPixelFormat:(unsigned int)a9 scalerEnabled:(BOOL)a10
{
  double height;
  double width;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t i;
  void *v23;
  float v24;
  float v25;
  double v26;
  __CVBuffer *v27;
  int32_t v28;
  int32_t v29;
  FRCFrame *v30;
  FRCFrame *v31;
  NSArray *outputFrameListFromClient;
  void *v33;
  id v35;
  void *v36;
  CMTime v38;
  CMTime v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  CMTime v43;
  CMTime v44;
  CMTime v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  CMTime time;
  CMTime v50;
  CMTime v51;
  _QWORD v52[3];
  _QWORD v53[3];
  CMTime rhs;
  CMTime lhs;
  CMTime v56;
  CMTime v57;

  height = a8.height;
  width = a8.width;
  v17 = a3;
  v18 = a4;
  v19 = a7;
  kdebug_trace();
  if (self->_onDemandSynthesisBufferAllocation)
    -[FRCSynthesis allocateResources](self->_synthesis, "allocateResources");
  v20 = objc_msgSend(v19, "count");
  memset(&v57, 0, sizeof(v57));
  if (v17)
    objc_msgSend(v17, "presentationTimeStamp");
  memset(&v56, 0, sizeof(v56));
  if (v18)
  {
    objc_msgSend(v18, "presentationTimeStamp");
    if (v17)
    {
LABEL_7:
      objc_msgSend(v17, "presentationTimeStamp");
      CMTimeSubtract(&v56, &lhs, &rhs);
      objc_msgSend(v17, "presentationTimeStamp");
      goto LABEL_10;
    }
  }
  else
  {
    memset(&lhs, 0, sizeof(lhs));
    if (v17)
      goto LABEL_7;
  }
  memset(&rhs, 0, sizeof(rhs));
  CMTimeSubtract(&v56, &lhs, &rhs);
  memset(v53, 0, sizeof(v53));
LABEL_10:
  v35 = v18;
  if (v18)
    objc_msgSend(v18, "presentationTimeStamp", v18);
  else
    memset(v52, 0, sizeof(v52));
  -[LiteSynthesis setEnableMemDump:](self->_liteSynthesis, "setEnableMemDump:", -[FRCFrameInterpolator shallDumpDebugInfoForCurrPts:prevPts:](self, "shallDumpDebugInfoForCurrPts:prevPts:", v53, v52, v35));
  -[FRCSynthesis createFeaturesFromFirstImage:secondImage:flowForward:flowBackward:](self->_synthesis, "createFeaturesFromFirstImage:secondImage:flowForward:flowBackward:", a5, a6, self->_flowForward, self->_flowBackward);
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v20)
  {
    for (i = 0; i != v20; ++i)
    {
      objc_msgSend(v19, "objectAtIndexedSubscript:", i);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "floatValue");
      v25 = v24;

      *(float *)&v26 = v25;
      v27 = -[FRCFrameInterpolator synthesisFrameForTimeScale:outputSize:outputPixelFormat:scalerEnabled:frameIndex:lastFrame:](self, "synthesisFrameForTimeScale:outputSize:outputPixelFormat:scalerEnabled:frameIndex:lastFrame:", a9, a10, i, v20 - 1 == i, v26, width, height);
      memset(&v51, 0, sizeof(v51));
      time = v56;
      CMTimeMultiplyByFloat64(&v50, &time, v25);
      if (v17)
      {
        objc_msgSend(v17, "presentationTimeStamp");
        v28 = v47;
      }
      else
      {
        v28 = 0;
        v46 = 0;
        v47 = 0;
        v48 = 0;
      }
      CMTimeConvertScale(&v51, &v50, v28, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
      memset(&time, 0, sizeof(time));
      v44 = v57;
      v43 = v51;
      CMTimeAdd(&v45, &v44, &v43);
      if (v17)
      {
        objc_msgSend(v17, "presentationTimeStamp");
        v29 = v41;
      }
      else
      {
        v29 = 0;
        v40 = 0;
        v41 = 0;
        v42 = 0;
      }
      CMTimeConvertScale(&time, &v45, v29, kCMTimeRoundingMethod_QuickTime);
      v30 = [FRCFrame alloc];
      v44 = time;
      v31 = -[FRCFrame initWithBuffer:presentationTimeStamp:](v30, "initWithBuffer:presentationTimeStamp:", v27, &v44);
      CVPixelBufferRelease(v27);
      objc_msgSend(v21, "addObject:", v31);
      outputFrameListFromClient = self->_outputFrameListFromClient;
      if (outputFrameListFromClient)
      {
        v39 = time;
        -[NSArray objectAtIndexedSubscript:](outputFrameListFromClient, "objectAtIndexedSubscript:", i);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v39;
        objc_msgSend(v33, "setPresentationTimeStamp:", &v38);

      }
    }
  }
  -[FRCSynthesis releaseFeatures](self->_synthesis, "releaseFeatures");
  if (self->_onDemandSynthesisBufferAllocation)
    -[FRCSynthesis releaseResources](self->_synthesis, "releaseResources");
  kdebug_trace();

  return v21;
}

- (id)selectFrameInsertionPointsFromTimingList:(id)a3 preModifiedTimingList:(id)a4
{
  id v5;
  void *v6;

  v5 = a3;
  if (self->_state == 2)
  {
    -[FRCFrameDropDetector selectFrameInsertionPointsFromTimingList:metadataList:sloMo:withError:](self->_frameDropDetector, "selectFrameInsertionPointsFromTimingList:metadataList:sloMo:withError:", v5, 0, -[FRCFrameInterpolator useCase](self, "useCase") == 2, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      self->_gated = 1;
      self->_sessionResult = 1;
    }
  }
  else
  {
    NSLog(CFSTR("Session is not started yet.\n"));
    v6 = 0;
  }

  return v6;
}

- (id)selectFrameInsertionPointsFromTimingList:(id)a3 metadataList:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  if (self->_state == 2)
  {
    -[FRCFrameDropDetector selectFrameInsertionPointsFromTimingList:metadataList:sloMo:withError:](self->_frameDropDetector, "selectFrameInsertionPointsFromTimingList:metadataList:sloMo:withError:", v8, v9, -[FRCFrameInterpolator useCase](self, "useCase") == 2, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OpticalFlowAnalyzer setRetimingRecipe:](self->_flowAnalyzer, "setRetimingRecipe:", -[FRCFrameDropDetector retimingRecipe](self->_frameDropDetector, "retimingRecipe"));
    if (!v10)
    {
      self->_gated = 1;
      self->_sessionResult = 1;
    }
  }
  else
  {
    NSLog(CFSTR("Session is not started yet.\n"));
    if (a5)
    {
      -[FRCFrameInterpolator errorWithErrorCode:](self, "errorWithErrorCode:", -22003);
      v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (void)configureGating
{
  OpticalFlowAnalyzer *v3;
  OpticalFlowAnalyzer *flowAnalyzer;
  FRCFrameDropDetector *frameDropDetector;
  _BOOL8 v6;

  if (self->_gatingEnabled)
  {
    v3 = objc_alloc_init(OpticalFlowAnalyzer);
    flowAnalyzer = self->_flowAnalyzer;
    self->_flowAnalyzer = v3;

    -[OpticalFlowAnalyzer setScaler:](self->_flowAnalyzer, "setScaler:", self->_scaler);
    -[OpticalFlowAnalyzer setUsage:](self->_flowAnalyzer, "setUsage:", self->_usage);
    -[OpticalFlowAnalyzer setInputScaling:](self->_flowAnalyzer, "setInputScaling:", self->_inputScaling);
    -[OpticalFlowAnalyzer setOpticalFlowDownsampling:](self->_flowAnalyzer, "setOpticalFlowDownsampling:", -[OpticalFlow downsampling](self->_opticalFlow, "downsampling") != 0);
    -[OpticalFlowAnalyzer setInputRotation:](self->_flowAnalyzer, "setInputRotation:", self->_inputRotation);
    -[OpticalFlowAnalyzer setUseCase:](self->_flowAnalyzer, "setUseCase:", self->_useCase);
    -[OpticalFlowAnalyzer reset](self->_flowAnalyzer, "reset");
  }
  frameDropDetector = self->_frameDropDetector;
  if (frameDropDetector)
  {
    v6 = self->_gatingEnabled && !self->_forceFrameOutput;
    -[FRCFrameDropDetector setGatingEnabled:](frameDropDetector, "setGatingEnabled:", v6);
  }
}

- (void)setPropertiesFromDefaults
{
  -[FRCFrameInterpolator setFlowAnalysisFromDefaults](self, "setFlowAnalysisFromDefaults");
  -[FRCFrameInterpolator setLiteSynthesisDebugFromDefaults](self, "setLiteSynthesisDebugFromDefaults");
  -[FRCFrameInterpolator setNormalizationModeFromDefaults](self, "setNormalizationModeFromDefaults");
  -[FRCFrameInterpolator setCrossFlowAnalysisFromDefaults](self, "setCrossFlowAnalysisFromDefaults");
}

- (void)overwriteQualityModeFromDefaults
{
  void *v3;
  void *v4;
  NSObject *logger;
  int64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 lowMemoryMode;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.FRC"));
  objc_msgSend(v3, "objectForKey:", CFSTR("QualityMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_19;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_1D425A000, logger, OS_LOG_TYPE_DEFAULT, "Forcing to %@", (uint8_t *)&v11, 0xCu);
  }
  if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("kFRCHighPerformanceMode")))
  {
    if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("kFRCHighQualityMode")))
    {
      if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("kFRCLowLatencyMode")))
      {
        if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("kFRCHighPerformanceModeV2")))
        {
          if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("kFRCHighPerformanceModeV3")))
            goto LABEL_15;
          v6 = 4;
        }
        else
        {
          v6 = 3;
        }
      }
      else
      {
        v6 = 2;
      }
    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }
  self->_qualityMode = v6;
LABEL_15:
  objc_msgSend(v3, "objectForKey:", CFSTR("LowMemoryMode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    self->_lowMemoryMode = objc_msgSend(v7, "BOOLValue");
    v9 = self->_logger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      lowMemoryMode = self->_lowMemoryMode;
      v11 = 67109120;
      LODWORD(v12) = lowMemoryMode;
      _os_log_impl(&dword_1D425A000, v9, OS_LOG_TYPE_DEFAULT, "Setting lowMemoryMode to %d", (uint8_t *)&v11, 8u);
    }
  }

LABEL_19:
}

- (void)setFlowAnalysisFromDefaults
{
  int AppBooleanValue;
  NSObject *logger;
  int v5;
  uint8_t v6[15];
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 1;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("ForceFrameOutput"), CFSTR("com.apple.FRC"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    self->_forceFrameOutput = AppBooleanValue != 0;
    if (!AppBooleanValue)
      goto LABEL_7;
  }
  else if (!self->_forceFrameOutput)
  {
    goto LABEL_7;
  }
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D425A000, logger, OS_LOG_TYPE_DEFAULT, "Frame Output forced.", v6, 2u);
  }
LABEL_7:
  v5 = CFPreferencesGetAppBooleanValue(CFSTR("FlowAnalysis"), CFSTR("com.apple.FRC"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    self->_gatingEnabled = v5 != 0;
}

- (void)setCrossFlowAnalysisFromDefaults
{
  int AppBooleanValue;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 1;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("CrossFlowAnalysis"), CFSTR("com.apple.FRC"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    self->_enableCrossFlowAnalysis = AppBooleanValue != 0;
}

- (void)setLiteSynthesisDebugFromDefaults
{
  CFIndex AppIntegerValue;
  int v4;
  $95D729B680665BEAEFA1D6FCA8238556 *p_ptsForLiteDebugging;
  CMTimeEpoch epoch;
  uint64_t v7;
  CMTime v8;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 1;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("PtsForLiteDebug"), CFSTR("com.apple.FRC"), &keyExistsAndHasValidFormat);
  v4 = keyExistsAndHasValidFormat;
  p_ptsForLiteDebugging = &self->_ptsForLiteDebugging;
  if (keyExistsAndHasValidFormat)
  {
    CMTimeMake(&v8, AppIntegerValue, 9600);
    *(_OWORD *)&p_ptsForLiteDebugging->value = *(_OWORD *)&v8.value;
    epoch = v8.epoch;
  }
  else
  {
    v7 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&p_ptsForLiteDebugging->value = *MEMORY[0x1E0CA2E18];
    epoch = *(_QWORD *)(v7 + 16);
  }
  self->_ptsForLiteDebugging.epoch = epoch;
  -[LiteSynthesis setTextureFromCVPixelBuffer:](self->_liteSynthesis, "setTextureFromCVPixelBuffer:", v4 != 0);
}

- (void)setNormalizationModeFromDefaults
{
  int AppBooleanValue;
  BOOL v4;
  uint64_t v5;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 1;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("SelfNorm"), CFSTR("com.apple.FRC"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v4 = AppBooleanValue == 0;
  else
    v4 = 0;
  v5 = !v4;
  -[FRCImageProcessor setSelfNormalization:](self->_imageProcessor, "setSelfNormalization:", v5);
}

- (void)setSynthesisOptionsFromDefaults
{
  int AppBooleanValue;
  int v4;
  int v5;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 1;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("UseFlowConsistencyMap"), CFSTR("com.apple.FRC"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    self->_useFlowConsistencyMap = AppBooleanValue != 0;
  v4 = CFPreferencesGetAppBooleanValue(CFSTR("UseTwoLayerSynthesis"), CFSTR("com.apple.FRC"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    self->_twoLayerSynthesis = v4 != 0;
  v5 = CFPreferencesGetAppBooleanValue(CFSTR("TwoLayerSynthesisQuarterSizeDC"), CFSTR("com.apple.FRC"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    self->_twoLayerSynthesisQuarterSizeDC = v5 != 0;
}

- (BOOL)shallReusePreviousFlowPts0:(id *)a3 Pts1:(id *)a4
{
  int32_t var1;
  _BOOL4 v7;
  CMTime v9;
  CMTime time1;
  CMTime time;
  CMTime rhs;
  CMTime lhs;
  CMTime v14;

  var1 = a4->var1;
  memset(&v14, 0, sizeof(v14));
  lhs = *(CMTime *)a4;
  rhs = *(CMTime *)a3;
  CMTimeSubtract(&v14, &lhs, &rhs);
  memset(&lhs, 0, sizeof(lhs));
  rhs = v14;
  time1 = (CMTime)self->_lastFrameDuration;
  CMTimeSubtract(&time, &rhs, &time1);
  CMTimeAbsoluteValue(&lhs, &time);
  memset(&rhs, 0, sizeof(rhs));
  CMTimeMakeWithSeconds(&rhs, 0.000520833333, var1);
  if (self->_singleFlow && (time1 = (CMTime)self->_lastFramePts, v9 = (CMTime)*a3, !CMTimeCompare(&time1, &v9)))
  {
    time1 = lhs;
    v9 = rhs;
    return CMTimeCompare(&time1, &v9) >> 31;
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

+ (void)getInputFrameSizeForUsage:(int64_t)a3 width:(unint64_t *)a4 height:(unint64_t *)a5
{
  FRCGetInputFrameSizeForUsage(a3, (uint64_t *)a4, (uint64_t *)a5);
}

+ (int64_t)getUsageFromSizeWidth:(unint64_t)a3 height:(unint64_t)a4
{
  return FRCGetUsageFromSize(a3, a4);
}

- (void)preserveCMAttachmentFirstFrame:(id)a3 secondFrame:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  self->_anchorFrameCMAttachment = CMCopyDictionaryOfAttachments(0, (CMAttachmentBearerRef)objc_msgSend(v7, "buffer"), 1u);
  if (self->_removeCMAttachment)
  {
    CMRemoveAllAttachments((CMAttachmentBearerRef)objc_msgSend(v7, "buffer"));
    CMRemoveAllAttachments((CMAttachmentBearerRef)objc_msgSend(v6, "buffer"));
  }

}

- (void)restoreCMAttachmentToFirstFrame:(id)a3 secondFrame:(id)a4 interpolatedFrames:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (self->_removeCMAttachment)
  {
    CMSetAttachments((CMAttachmentBearerRef)objc_msgSend(a3, "buffer"), self->_anchorFrameCMAttachment, 1u);
    CMSetAttachments((CMAttachmentBearerRef)objc_msgSend(v8, "buffer"), self->_anchorFrameCMAttachment, 1u);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          CMSetAttachments((CMAttachmentBearerRef)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "buffer", (_QWORD)v15), self->_anchorFrameCMAttachment, 1u);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

  }
  CFRelease(self->_anchorFrameCMAttachment);

}

- (void)constructSessionStatisticsWithSessionDuration:(double)a3
{
  NSDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t sessionResult;
  void *v14;
  __CFString **v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  float v21;
  void *v22;
  void *v23;
  float v24;
  NSDictionary *sessionStatistics;
  $95D729B680665BEAEFA1D6FCA8238556 maxTimeGap;

  v5 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", LODWORD(self->_usage));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v6, CFSTR("FRCUsage"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", LODWORD(self->_qualityMode));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v7, CFSTR("FRCProcessingMode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", LODWORD(self->_totalFramesInterpolated));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v8, CFSTR("FRCTotalInterpolatedFrames"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v9, CFSTR("FRCProcessingTime"));

  if (self->_gatingEnabled)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", LODWORD(self->_sessionResult));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v10, CFSTR("FRCGatingStatus"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[FRCFrameDropDetector retimingRecipe](self->_frameDropDetector, "retimingRecipe"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11, CFSTR("FRCLivePhotoRetimingRecipe"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[FRCFrameDropDetector numberOfInsertionPoints](self->_frameDropDetector, "numberOfInsertionPoints"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v12, CFSTR("FRCLivePhotoNumberOfGaps"));

    sessionResult = self->_sessionResult;
    switch(sessionResult)
    {
      case 4:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v16, CFSTR("FRCGatingCause"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)(self->_maxPixelMeanDiff * 1000.0));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v17, CFSTR("FRCMaximumPixelMeanDiff"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)(self->_maxPixelMeanChange * 1000.0));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = &FRCMaximumPixelMeanChangeKey;
        goto LABEL_8;
      case 2:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[OpticalFlowAnalyzer gatingCause](self->_flowAnalyzer, "gatingCause"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v18, CFSTR("FRCGatingCause"));

        maxTimeGap = self->_maxTimeGap;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)(CMTimeGetSeconds((CMTime *)&maxTimeGap) * 1000.0));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v19, CFSTR("FRCLivePhotoBurstDropDuration"));

        v20 = (void *)MEMORY[0x1E0CB37E8];
        -[OpticalFlowAnalyzer flowConsistencyFrameScore](self->_flowAnalyzer, "flowConsistencyFrameScore");
        objc_msgSend(v20, "numberWithInt:", (int)v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v22, CFSTR("FRCFlowConsistencyFrameScore"));

        v23 = (void *)MEMORY[0x1E0CB37E8];
        -[OpticalFlowAnalyzer flowConsistencyROIScore](self->_flowAnalyzer, "flowConsistencyROIScore");
        objc_msgSend(v23, "numberWithInt:", (int)v24);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = &FRCFlowConsistencyRegionScoreKey;
        goto LABEL_8;
      case 1:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[FRCFrameDropDetector gatingCause](self->_frameDropDetector, "gatingCause"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = &FRCGatingCauseKey;
LABEL_8:
        -[NSDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v14, *v15);

        break;
    }
  }
  sessionStatistics = self->_sessionStatistics;
  self->_sessionStatistics = v5;

}

- (BOOL)shallDumpDebugInfoForCurrPts:(id *)a3 prevPts:(id *)a4
{
  int32_t v7;
  CMTime *p_ptsForLiteDebugging;
  __int128 v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;
  CMTime time1;

  time1 = (CMTime)self->_ptsForLiteDebugging;
  v11 = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  v7 = CMTimeCompare(&time1, (CMTime *)&v11);
  if (v7)
  {
    v9 = *(_OWORD *)&self->_ptsForLiteDebugging.value;
    p_ptsForLiteDebugging = (CMTime *)&self->_ptsForLiteDebugging;
    *(_OWORD *)&time1.value = v9;
    time1.epoch = p_ptsForLiteDebugging->epoch;
    v11 = *a3;
    if (CMTimeCompare(&time1, (CMTime *)&v11) < 1)
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      time1 = *p_ptsForLiteDebugging;
      v11 = *a4;
      LOBYTE(v7) = CMTimeCompare(&time1, (CMTime *)&v11) < 1;
    }
  }
  return v7;
}

- (void)updateLastFramePts:(id *)a3 duration:(id *)a4 toInterpolate:(unint64_t)a5
{
  __int128 v5;
  int64_t var3;

  v5 = *(_OWORD *)&a3->var0;
  self->_lastFramePts.epoch = a3->var3;
  *(_OWORD *)&self->_lastFramePts.value = v5;
  var3 = a4->var3;
  *(_OWORD *)&self->_lastFrameDuration.value = *(_OWORD *)&a4->var0;
  self->_lastFrameDuration.epoch = var3;
  self->_lastFramesToInterpolate = a5;
}

- (void)updateBackwardFlow
{
  __CVBuffer *prevFlowBackwardGating;
  __CVBuffer *flowBackwardGating;

  flowBackwardGating = self->_flowBackwardGating;
  prevFlowBackwardGating = self->_prevFlowBackwardGating;
  self->_flowBackwardGating = prevFlowBackwardGating;
  self->_prevFlowBackwardGating = flowBackwardGating;
  if (!self->_inputScaling)
    self->_flowBackward = prevFlowBackwardGating;
}

- (void)updateRecommendation
{
  int64_t v3;
  int64_t recommendation;
  __CFString *v5;
  int64_t gatingLevel;

  if (self->_useCase != 1)
  {
    self->_recommendation = 0;
    return;
  }
  if (self->_totalFramesInterpolated)
  {
    if (self->_shouldGatedForInteractive)
    {
      v3 = 4;
    }
    else
    {
      gatingLevel = self->_gatingLevel;
      if (gatingLevel)
      {
        if (gatingLevel != 2)
          goto LABEL_8;
        v3 = 3;
      }
      else if (self->_gated)
      {
        v3 = 2;
      }
      else
      {
        v3 = 1;
      }
    }
    self->_recommendation = v3;
  }
  else
  {
    self->_recommendation = 0;
  }
LABEL_8:
  NSLog(CFSTR("[FrameInterpolator] Max Pixel Mean Diff: %.3f, Max Pixel Mean Change: %.3f"), a2, self->_maxPixelMeanDiff, self->_maxPixelMeanChange);
  recommendation = self->_recommendation;
  if ((unint64_t)(recommendation - 1) > 3)
    v5 = CFSTR("Unknown");
  else
    v5 = off_1E9786AD0[recommendation - 1];
  NSLog(CFSTR("Recommendation Level %ld (%s)"), recommendation, -[__CFString UTF8String](v5, "UTF8String"));
}

- (id)synthesis
{
  return self->_synthesis;
}

- (BOOL)checkStreamingBufferConsistencyFirstFrame:(id)a3 secondFrame:(id)a4
{
  id v6;
  __IOSurface *IOSurface;
  uint64_t ID;
  uint64_t previousSecondIOSurfaceID;
  BOOL v10;
  __IOSurface *v11;

  v6 = a4;
  if (self->_firstPairInSession
    || (IOSurface = CVPixelBufferGetIOSurface((CVPixelBufferRef)objc_msgSend(a3, "buffer")),
        ID = IOSurfaceGetID(IOSurface),
        previousSecondIOSurfaceID = self->_previousSecondIOSurfaceID,
        (_DWORD)ID == (_DWORD)previousSecondIOSurfaceID))
  {
    v10 = 1;
  }
  else
  {
    NSLog(CFSTR("[FrameInterpolator] Error! In streaming mode, the first frame (IOSId %d) must be identical to the second frame (IOSId %d) of previous call"), ID, previousSecondIOSurfaceID);
    NSLog(CFSTR("[FrameInterpolator] Disabling streaming mode."));
    v10 = 0;
  }
  v11 = CVPixelBufferGetIOSurface((CVPixelBufferRef)objc_msgSend(v6, "buffer"));
  self->_previousSecondIOSurfaceID = IOSurfaceGetID(v11);

  return v10;
}

- (void)pauseGatingForNextPair
{
  self->_gatingPaused = 1;
}

- (int64_t)usage
{
  return self->_usage;
}

- (void)setUsage:(int64_t)a3
{
  self->_usage = a3;
}

- (int64_t)qualityMode
{
  return self->_qualityMode;
}

- (void)setQualityMode:(int64_t)a3
{
  self->_qualityMode = a3;
}

- (CGAffineTransform)preferredTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[12].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[12].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[13].a;
  return self;
}

- (void)setPreferredTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_preferredTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_preferredTransform.tx = v4;
  *(_OWORD *)&self->_preferredTransform.a = v3;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)gated
{
  return self->_gated;
}

- (float)sessionConfidence
{
  return self->_sessionConfidence;
}

- (NSDictionary)sessionStatistics
{
  return self->_sessionStatistics;
}

- (unint64_t)useCase
{
  return self->_useCase;
}

- (void)setUseCase:(unint64_t)a3
{
  self->_useCase = a3;
}

- (int64_t)gatingLevel
{
  return self->_gatingLevel;
}

- (void)setGatingLevel:(int64_t)a3
{
  self->_gatingLevel = a3;
}

- (int64_t)recommendation
{
  return self->_recommendation;
}

- (BOOL)streamingMode
{
  return self->_streamingMode;
}

- (void)setStreamingMode:(BOOL)a3
{
  self->_streamingMode = a3;
}

- (BOOL)tilingEnabled
{
  return self->_tilingEnabled;
}

- (void)setTilingEnabled:(BOOL)a3
{
  self->_tilingEnabled = a3;
}

- (BOOL)secondLevelFlow
{
  return self->_secondLevelFlow;
}

- (void)setSecondLevelFlow:(BOOL)a3
{
  self->_secondLevelFlow = a3;
}

- (unint64_t)synthesisMode
{
  return self->_synthesisMode;
}

- (void)setSynthesisMode:(unint64_t)a3
{
  self->_synthesisMode = a3;
}

- (BOOL)inputScaling
{
  return self->_inputScaling;
}

- (void)setInputScaling:(BOOL)a3
{
  self->_inputScaling = a3;
}

- (unint64_t)opticalFlowDownsampling
{
  return self->_opticalFlowDownsampling;
}

- (void)setOpticalFlowDownsampling:(unint64_t)a3
{
  self->_opticalFlowDownsampling = a3;
}

- (BOOL)singleFlow
{
  return self->_singleFlow;
}

- (void)setSingleFlow:(BOOL)a3
{
  self->_singleFlow = a3;
}

- (BOOL)twoStageFlow
{
  return self->_twoStageFlow;
}

- (void)setTwoStageFlow:(BOOL)a3
{
  self->_twoStageFlow = a3;
}

- (BOOL)opticalFlowAdaptationLayer
{
  return self->_opticalFlowAdaptationLayer;
}

- (void)setOpticalFlowAdaptationLayer:(BOOL)a3
{
  self->_opticalFlowAdaptationLayer = a3;
}

- (int64_t)opticalFlowRevision
{
  return self->_opticalFlowRevision;
}

- (void)setOpticalFlowRevision:(int64_t)a3
{
  self->_opticalFlowRevision = a3;
}

- (BOOL)forceFrameOutput
{
  return self->_forceFrameOutput;
}

- (void)setForceFrameOutput:(BOOL)a3
{
  self->_forceFrameOutput = a3;
}

- (BOOL)forceSingleStageFlow
{
  return self->_forceSingleStageFlow;
}

- (void)setForceSingleStageFlow:(BOOL)a3
{
  self->_forceSingleStageFlow = a3;
}

- (BOOL)synthesisTemporalSmoothing
{
  return self->_synthesisTemporalSmoothing;
}

- (void)setSynthesisTemporalSmoothing:(BOOL)a3
{
  self->_synthesisTemporalSmoothing = a3;
}

- (BOOL)linearSplatting
{
  return self->_linearSplatting;
}

- (void)setLinearSplatting:(BOOL)a3
{
  self->_linearSplatting = a3;
}

- (BOOL)lowMemoryMode
{
  return self->_lowMemoryMode;
}

- (void)setLowMemoryMode:(BOOL)a3
{
  self->_lowMemoryMode = a3;
}

- (BOOL)useFlowConsistencyMap
{
  return self->_useFlowConsistencyMap;
}

- (void)setUseFlowConsistencyMap:(BOOL)a3
{
  self->_useFlowConsistencyMap = a3;
}

- (BOOL)twoLayerSynthesis
{
  return self->_twoLayerSynthesis;
}

- (void)setTwoLayerSynthesis:(BOOL)a3
{
  self->_twoLayerSynthesis = a3;
}

- (BOOL)twoLayerSynthesisQuarterSizeDC
{
  return self->_twoLayerSynthesisQuarterSizeDC;
}

- (void)setTwoLayerSynthesisQuarterSizeDC:(BOOL)a3
{
  self->_twoLayerSynthesisQuarterSizeDC = a3;
}

- (void)setSynthesis:(id)a3
{
  objc_storeStrong((id *)&self->_synthesis, a3);
}

- (BOOL)legacyNormalizationMode
{
  return self->_legacyNormalizationMode;
}

- (void)setLegacyNormalizationMode:(BOOL)a3
{
  self->_legacyNormalizationMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionStatistics, 0);
  objc_storeStrong((id *)&self->_outputFrameListFromClient, 0);
  objc_storeStrong((id *)&self->_imageProcessor, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_concurrentQueue, 0);
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_initializationSemaphore, 0);
  objc_storeStrong((id *)&self->_postProcessingComletionSemaphore, 0);
  objc_storeStrong((id *)&self->_frameDropDetector, 0);
  objc_storeStrong((id *)&self->_completion_semaphore, 0);
  objc_storeStrong((id *)&self->_flowAnalyzer, 0);
  objc_storeStrong((id *)&self->_scaler, 0);
  objc_storeStrong((id *)&self->_synthesis, 0);
  objc_storeStrong((id *)&self->_liteSynthesis, 0);
  objc_storeStrong((id *)&self->_deepSynthesis, 0);
  objc_storeStrong((id *)&self->_opticalFlow, 0);
}

- (void)startSessionWithUsage:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D425A000, a1, a3, "Failed to initialize Synthesis", a5, a6, a7, a8, 0);
}

- (void)startSessionWithUsage:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D425A000, a1, a3, "Failed to initialize OpticalFlow", a5, a6, a7, a8, 0);
}

@end

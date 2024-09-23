@implementation BWSmartStyleLearningNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWSmartStyleLearningNode)initWithOutputs:(unint64_t)a3 masksRefinerEnabled:(BOOL)a4 propagateMasks:(BOOL)a5
{
  char v7;
  BWSmartStyleLearningNode *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  BWNodeInput *v15;
  BWNodeInputMediaConfiguration *v16;
  BWNodeInputMediaConfiguration *v17;
  BWNodeInput *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  BWNodeInputMediaConfiguration *v25;
  BWNodeOutput *v26;
  NSMutableArray *v27;
  NSMutableArray *v28;
  uint64_t v29;
  NSMutableDictionary *v30;
  NSMutableDictionary *v31;
  NSMutableDictionary *v32;
  NSMutableDictionary *v33;
  id v34;
  void *v35;
  uint64_t v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  double v42;
  double v43;
  double v44;
  FigCaptureSmartStyle *v45;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  objc_super v51;
  _BYTE v52[128];
  _QWORD v53[6];

  v7 = a3;
  v53[4] = *MEMORY[0x1E0C80C00];
  v51.receiver = self;
  v51.super_class = (Class)BWSmartStyleLearningNode;
  v8 = -[BWNode init](&v51, sel_init);
  if (v8)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0D08AC0], "configurationForVariant:", 0);
    v10 = (void *)objc_msgSend(MEMORY[0x1E0D08AC0], "tuningParametersForVariant:", 0);
    v11 = objc_msgSend(v10, "learningRate");
    if (v11 <= 2)
      v12 = 2;
    else
      v12 = v11;
    LODWORD(v8->_lastLearnedPortType) = v12;
    HIDWORD(v8->_lastLearnedPortType) = objc_msgSend(v9, "learningRateFramesPerSecond");
    v8->_learningRate = objc_msgSend(v9, "learningRateMaxFramesPerSecond");
    objc_msgSend(v10, "statsUpdateDeltaTimeThreshold");
    v8->_learningFramesPerSecondUnit = v13;
    objc_msgSend(v10, "anstMasksMatchingTimeInSecondsThreshold");
    v8->_learningMaxFramesPerSecond = v14;
    BYTE4(v8->_previousPTS.epoch) = v7 & 1;
    BYTE5(v8->_previousPTS.epoch) = (v7 & 2) != 0;
    BYTE6(v8->_previousPTS.epoch) = a4;
    HIBYTE(v8->_previousPTS.epoch) = a4;
    v8->_generateCoefficients = 1;
    v8->_propagateMasks = a5;
    v15 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v8);
    -[BWNodeInput setFormatRequirements:](v15, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeInput setPassthroughMode:](v15, "setPassthroughMode:", 1);
    -[BWNodeInput setIndefinitelyHeldBufferCount:](v15, "setIndefinitelyHeldBufferCount:", 3);
    if ((int)FigCapturePlatformIdentifier() >= 11)
    {
      v16 = objc_alloc_init(BWNodeInputMediaConfiguration);
      -[BWNodeInputMediaConfiguration setFormatRequirements:](v16, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
      -[BWNodeInputMediaConfiguration setPassthroughMode:](v16, "setPassthroughMode:", 1);
      -[BWNodeInputMediaConfiguration setIndefinitelyHeldBufferCount:](v16, "setIndefinitelyHeldBufferCount:", 3);
      -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v15, "setMediaConfiguration:forAttachedMediaKey:", v16, 0x1E494FBD8);
    }
    if ((int)FigCapturePlatformIdentifier() >= 11)
    {
      v17 = objc_alloc_init(BWNodeInputMediaConfiguration);
      -[BWNodeInputMediaConfiguration setFormatRequirements:](v17, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
      -[BWNodeInputMediaConfiguration setPassthroughMode:](v17, "setPassthroughMode:", 0);
      -[BWNodeInputMediaConfiguration setIndefinitelyHeldBufferCount:](v17, "setIndefinitelyHeldBufferCount:", 3);
      -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v15, "setMediaConfiguration:forAttachedMediaKey:", v17, 0x1E495B478);
    }
    -[BWNode addInput:](v8, "addInput:", v15);
    v18 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v8);
    -[BWNodeInput setFormatRequirements:](v18, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeInput setPassthroughMode:](v18, "setPassthroughMode:", 0);
    v53[0] = CFSTR("HumanFullBodiesMask");
    v53[1] = CFSTR("HumanSkinsMask");
    v53[2] = CFSTR("HumanHairMask");
    v53[3] = 0x1E495B218;
    v19 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 4);
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v48 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
          v25 = objc_alloc_init(BWNodeInputMediaConfiguration);
          -[BWNodeInputMediaConfiguration setFormatRequirements:](v25, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
          -[BWNodeInputMediaConfiguration setPassthroughMode:](v25, "setPassthroughMode:", 0);
          -[BWNodeInput setIndefinitelyHeldBufferCount:](v18, "setIndefinitelyHeldBufferCount:", 3);
          -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v18, "setMediaConfiguration:forAttachedMediaKey:", v25, v24);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      }
      while (v21);
    }
    -[BWNode addInput:](v8, "addInput:", v18);
    v26 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v8);
    -[BWNodeOutput setFormatRequirements:](v26, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeOutput setPassthroughMode:](v26, "setPassthroughMode:", 1);
    -[BWNode addOutput:](v8, "addOutput:", v26);
    if (-[BWSmartStyleLearningNode _loadAndConfigureSmartStyleBundle](v8, "_loadAndConfigureSmartStyleBundle"))
      goto LABEL_30;
    v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8->_inputStyleContainerSampleBufferQueue = v27;
    if (!v27)
      goto LABEL_30;
    v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8->_inputMasksSampleBufferQueue = v28;
    if (!v28)
      goto LABEL_30;
    v8->_styleUpdateLock._os_unfair_lock_opaque = 0;
    v8->_inputMasksSampleBufferQueueLock._os_unfair_lock_opaque = 0;
    v8->_inputStyleContainerSampleBufferQueueLock._os_unfair_lock_opaque = 0;
    LODWORD(v8->_workQueue) = 0;
    LODWORD(v8->_lastLearnedROI.size.height) = 0;
    v8->_statsUpdateDeltaTimeThreshold = 0.0;
    v29 = FigDispatchQueueCreateWithPriority();
    *(_QWORD *)&v8->_timeInSecondsUntilNextStatsUpdate = v29;
    if (!v29)
      goto LABEL_30;
    HIDWORD(v8->_workQueue) = 0;
    v8->_workQueueLock._os_unfair_lock_opaque = 0;
    if (BYTE6(v8->_previousPTS.epoch))
    {
      if (-[BWSmartStyleLearningNode _initVMRefinerInference](v8, "_initVMRefinerInference"))
        goto LABEL_30;
    }
    v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8->_refinedVideoFormatByAttachedMediaKey = v30;
    if (!v30)
      goto LABEL_30;
    v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8->_processorVideoFormatsByAttachedMediaKeys = v31;
    if (!v31)
      goto LABEL_30;
    v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8->_processorPixelBufferPoolsByAttachedMediaKeys = v32;
    if (!v32)
      goto LABEL_30;
    v33 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8->_intermediateVideoFormatsByAttachedMediaKeys = v33;
    if (!v33)
      goto LABEL_30;
    v34 = +[FigCaptureSmartStyle identityStyle](FigCaptureSmartStyle, "identityStyle");
    if (!v34)
      goto LABEL_30;
    v35 = v34;
    v36 = objc_msgSend(v34, "cast");
    objc_msgSend(v35, "intensity");
    v38 = v37;
    objc_msgSend(v35, "toneBias");
    v40 = v39;
    objc_msgSend(v35, "colorBias");
    LODWORD(v42) = v41;
    LODWORD(v43) = v38;
    LODWORD(v44) = v40;
    v45 = +[FigCaptureSmartStyle styleWithCast:intensity:toneBias:colorBias:](FigCaptureSmartStyle, "styleWithCast:intensity:toneBias:colorBias:", v36, v43, v44, v42);
    *(_QWORD *)&v8->_bypassStyleEngineForStandardStyle = v45;
    if (v45)
    {
      v8->_semanticStyleSceneLock._os_unfair_lock_opaque = 0;
      v8->_semanticStyleSceneType = 0;
      LOBYTE(v8->_mostRecentLearnedSkyMaskSampleBuffer) = 1;
    }
    else
    {
LABEL_30:
      fig_log_get_emitter();
      FigDebugAssert3();
      return 0;
    }
  }
  return v8;
}

- (void)setSubjectRelightingEnabled:(BOOL)a3
{
  BYTE2(self->_mostRecentLearnedSkyMaskSampleBuffer) = a3;
}

- (void)setDisableWaitForCoefficientsOnFirstFrame:(BOOL)a3
{
  BYTE1(self->_mostRecentLearnedSkyMaskSampleBuffer) = a3;
}

- (void)setSmartStyle:(id)a3
{
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  double v11;
  double v12;
  double v13;
  FigCaptureSmartStyle *v14;
  FigCaptureSmartStyle *v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  double v22;
  double v23;
  double v24;

  if (a3 && (objc_msgSend(a3, "isEqual:", *(_QWORD *)&self->_bypassStyleEngineForStandardStyle) & 1) == 0)
  {
    v5 = objc_msgSend(a3, "cast");
    objc_msgSend(a3, "intensity");
    v7 = v6;
    objc_msgSend(a3, "toneBias");
    v9 = v8;
    objc_msgSend(a3, "colorBias");
    LODWORD(v11) = v10;
    LODWORD(v12) = v7;
    LODWORD(v13) = v9;
    v14 = +[FigCaptureSmartStyle styleWithCast:intensity:toneBias:colorBias:](FigCaptureSmartStyle, "styleWithCast:intensity:toneBias:colorBias:", v5, v12, v13, v11);
    if (!v14)
      goto LABEL_6;
    v15 = v14;
    os_unfair_lock_lock(&self->_styleUpdateLock);

    v16 = -[FigCaptureSmartStyle cast](v15, "cast");
    -[FigCaptureSmartStyle intensity](v15, "intensity");
    v18 = v17;
    -[FigCaptureSmartStyle toneBias](v15, "toneBias");
    v20 = v19;
    -[FigCaptureSmartStyle colorBias](v15, "colorBias");
    LODWORD(v22) = v21;
    LODWORD(v23) = v18;
    LODWORD(v24) = v20;
    *(_QWORD *)&self->_bypassStyleEngineForStandardStyle = +[FigCaptureSmartStyle styleWithCast:intensity:toneBias:colorBias:](FigCaptureSmartStyle, "styleWithCast:intensity:toneBias:colorBias:", v16, v23, v24, v22);
    os_unfair_lock_unlock(&self->_styleUpdateLock);
    if (*(_QWORD *)&self->_bypassStyleEngineForStandardStyle)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&self->_statsUpdateDeltaTimeThreshold);
      LODWORD(self->_anstMasksMatchingTimeInSecondsThreshold) = self->_timingLock._os_unfair_lock_opaque;
      os_unfair_lock_unlock((os_unfair_lock_t)&self->_statsUpdateDeltaTimeThreshold);
    }
    else
    {
LABEL_6:
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
}

- (void)setCameraInfoByPortType:(id)a3
{
  NSMutableDictionary *intermediatePixelBufferPoolsByAttachedMediaKeys;

  intermediatePixelBufferPoolsByAttachedMediaKeys = self->_intermediatePixelBufferPoolsByAttachedMediaKeys;
  if (intermediatePixelBufferPoolsByAttachedMediaKeys)

  self->_intermediatePixelBufferPoolsByAttachedMediaKeys = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", a3);
}

- (NSDictionary)cameraInfoByPortType
{
  return &self->_intermediatePixelBufferPoolsByAttachedMediaKeys->super;
}

- (void)_releaseResources
{

  self->_smartStyleProcessor = 0;
  self->_inferenceScheduler = 0;

  self->_metalContext = 0;
}

- (void)dealloc
{
  __CVBuffer *identityCoefficientsPixelBuffer;
  opaqueCMSampleBuffer *learnedCoefficientsSampleBuffer;
  const void *v5;
  opaqueCMSampleBuffer *mostRecentLearnedPersonMaskSampleBuffer;
  opaqueCMSampleBuffer *mostRecentLearnedSkinMaskSampleBuffer;
  NSObject *v8;
  objc_super v9;

  dispatch_sync(*(dispatch_queue_t *)&self->_timeInSecondsUntilNextStatsUpdate, &__block_literal_global_43);
  -[BWSmartStyleLearningNode _releaseResources](self, "_releaseResources");

  identityCoefficientsPixelBuffer = self->_identityCoefficientsPixelBuffer;
  if (identityCoefficientsPixelBuffer)
    CFRelease(identityCoefficientsPixelBuffer);

  learnedCoefficientsSampleBuffer = self->_learnedCoefficientsSampleBuffer;
  if (learnedCoefficientsSampleBuffer)
    CFRelease(learnedCoefficientsSampleBuffer);
  v5 = *(const void **)&self->_mostRecentMasksLock._os_unfair_lock_opaque;
  if (v5)
    CFRelease(v5);
  mostRecentLearnedPersonMaskSampleBuffer = self->_mostRecentLearnedPersonMaskSampleBuffer;
  if (mostRecentLearnedPersonMaskSampleBuffer)
    CFRelease(mostRecentLearnedPersonMaskSampleBuffer);
  mostRecentLearnedSkinMaskSampleBuffer = self->_mostRecentLearnedSkinMaskSampleBuffer;
  if (mostRecentLearnedSkinMaskSampleBuffer)
    CFRelease(mostRecentLearnedSkinMaskSampleBuffer);
  v8 = *(NSObject **)&self->_timeInSecondsUntilNextStatsUpdate;
  if (v8)
  {
    dispatch_release(v8);
    *(_QWORD *)&self->_timeInSecondsUntilNextStatsUpdate = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)BWSmartStyleLearningNode;
  -[BWNode dealloc](&v9, sel_dealloc);
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)nodeSubType
{
  return CFSTR("SmartStyleLearning");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  unsigned int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BWVideoFormatRequirements *v14;
  BWVideoFormatRequirements *v15;
  void *v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  double v20;
  double v21;
  id v22;
  BWVideoFormatRequirements *v23;
  BWVideoFormatRequirements *v24;
  void *v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  id v29;
  BWVideoFormatRequirements *v30;
  BWVideoFormatRequirements *v31;
  id v32;
  BWVideoFormatRequirements *v33;
  BWVideoFormatRequirements *v34;
  void *v35;
  void *v36;
  void *v37;
  BWNodeOutputMediaConfiguration *v38;
  BWNodeOutputMediaConfiguration *v39;
  BWNodeOutputMediaConfiguration *v40;
  BWNodeOutputMediaConfiguration *v41;
  BWNodeOutputMediaConfiguration *v42;
  BWNodeOutputMediaConfiguration *v43;
  BWInferenceVideoFormatRequirements *v44;
  int *v45;
  int *v46;
  BWVideoFormatRequirements *v47;
  BWVideoFormatRequirements *v48;
  BWVideoFormatRequirements *v49;
  BWVideoFormatRequirements *v50;
  uint64_t v51;
  BWVideoFormatRequirements *v52;
  BWNodeOutputMediaConfiguration *v53;
  BWNodeOutputMediaConfiguration *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  unsigned int v58;
  objc_super v59;
  BWVideoFormatRequirements *v60;
  BWVideoFormatRequirements *v61;
  BWVideoFormatRequirements *v62;
  BWInferenceVideoFormatRequirements *v63;
  uint64_t v64;
  BWVideoFormatRequirements *v65;
  BWVideoFormatRequirements *v66;
  uint64_t v67;
  BWVideoFormatRequirements *v68;
  _QWORD v69[3];

  v69[1] = *MEMORY[0x1E0C80C00];
  if (!a3 || !a4)
    goto LABEL_46;
  v9 = LODWORD(self->_lastLearnedPortType) * (self->_learningRate / HIDWORD(self->_lastLearnedPortType)) + 2;
  objc_msgSend((id)objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "styleEngineConfiguration"), "thumbnailSize");
  v11 = v10;
  v13 = v12;
  if (-[NSArray objectAtIndexedSubscript:](-[BWNode inputs](self, "inputs"), "objectAtIndexedSubscript:", 0) != a4
    || !objc_msgSend(a5, "isEqualToString:", CFSTR("PrimaryFormat")))
  {
    if ((objc_msgSend(a5, "isEqualToString:", CFSTR("HumanFullBodiesMask")) & 1) == 0
      && (objc_msgSend(a5, "isEqualToString:", CFSTR("HumanSkinsMask")) & 1) == 0
      && !objc_msgSend(a5, "isEqualToString:", 0x1E495B218))
    {
      if ((objc_msgSend(a5, "isEqualToString:", CFSTR("HumanHairMask")) & 1) == 0
        && (objc_msgSend(a5, "isEqualToString:", 0x1E495B478) & 1) == 0)
      {
        v59.receiver = self;
        v59.super_class = (Class)BWSmartStyleLearningNode;
        -[BWNode didSelectFormat:forInput:forAttachedMediaKey:](&v59, sel_didSelectFormat_forInput_forAttachedMediaKey_, a3, a4, a5);
      }
      return;
    }
    v45 = &OBJC_IVAR___BWSinkNode__handlersToCallWhenActive;
    v46 = &OBJC_IVAR___BWSinkNode__handlersToCallWhenActive;
    if ((BYTE6(self->_previousPTS.epoch) || self->_generateCoefficients || self->_propagateMasks)
      && !self->_networkOutputMaskVideoFormat
      && !self->_inferenceEngine)
    {
      v47 = objc_alloc_init(BWVideoFormatRequirements);
      if (!v47)
        goto LABEL_46;
      v48 = v47;
      -[BWVideoFormatRequirements setWidth:](v47, "setWidth:", objc_msgSend(a3, "width"));
      -[BWVideoFormatRequirements setHeight:](v48, "setHeight:", objc_msgSend(a3, "height"));
      -[BWVideoFormatRequirements setBytesPerRowAlignment:](v48, "setBytesPerRowAlignment:", 64);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v48, "setSupportedPixelFormats:", &unk_1E4A007B8);
      v62 = v48;
      self->_networkOutputMaskVideoFormat = (BWVideoFormat *)+[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1));
      v45 = &OBJC_IVAR___BWSinkNode__handlersToCallWhenActive;
      v46 = &OBJC_IVAR___BWSinkNode__handlersToCallWhenActive;
      if (BYTE6(self->_previousPTS.epoch))
      {
        v49 = objc_alloc_init(BWVideoFormatRequirements);
        if (!v49)
        {
          fig_log_get_emitter();
          goto LABEL_55;
        }
        v50 = v49;
        -[BWVideoFormatRequirements setWidth:](v49, "setWidth:", objc_msgSend(a3, "width"));
        -[BWVideoFormatRequirements setHeight:](v50, "setHeight:", objc_msgSend(a3, "height"));
        -[BWVideoFormatRequirements setBytesPerRowAlignment:](v50, "setBytesPerRowAlignment:", 64);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v50, "setSupportedPixelFormats:", &unk_1E4A007D0);
        v61 = v50;
        self->_inferenceEngine = (BWInferenceEngine *)+[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1));
        -[BWVideoFormat setObject:forKeyedSubscript:](self->_anstMaskVideoFormat, "setObject:forKeyedSubscript:", self->_networkOutputMaskVideoFormat, 0x1E4951738);
        -[BWVideoFormat setObject:forKeyedSubscript:](self->_anstMaskVideoFormat, "setObject:forKeyedSubscript:", self->_networkOutputMaskVideoFormat, 0x1E4951758);
        -[BWVideoFormat setObject:forKeyedSubscript:](self->_anstMaskVideoFormat, "setObject:forKeyedSubscript:", self->_networkOutputMaskVideoFormat, 0x1E4951778);
        -[BWVideoFormat setObject:forKeyedSubscript:](self->_anstMaskVideoFormat, "setObject:forKeyedSubscript:", self->_inferenceEngine, 0x1E4951798);
        -[BWVideoFormat setObject:forKeyedSubscript:](self->_anstMaskVideoFormat, "setObject:forKeyedSubscript:", self->_inferenceEngine, 0x1E49517B8);
        -[BWVideoFormat setObject:forKeyedSubscript:](self->_anstMaskVideoFormat, "setObject:forKeyedSubscript:", self->_inferenceEngine, 0x1E49517D8);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_refinedVideoFormatByAttachedMediaKey, "setObject:forKeyedSubscript:", self->_inferenceEngine, CFSTR("HumanHairMask"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_processorPixelBufferPoolsByAttachedMediaKeys, "setObject:forKeyedSubscript:", self->_inferenceEngine, CFSTR("HumanFullBodiesMask"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_processorPixelBufferPoolsByAttachedMediaKeys, "setObject:forKeyedSubscript:", self->_inferenceEngine, CFSTR("HumanSkinsMask"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_processorPixelBufferPoolsByAttachedMediaKeys, "setObject:forKeyedSubscript:", self->_inferenceEngine, CFSTR("HumanHairMask"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_processorPixelBufferPoolsByAttachedMediaKeys, "setObject:forKeyedSubscript:", self->_inferenceEngine, 0x1E495B218);
        v45 = &OBJC_IVAR___BWSinkNode__handlersToCallWhenActive;
        v46 = &OBJC_IVAR___BWSinkNode__handlersToCallWhenActive;
      }
    }
    v51 = v46[441];
    if (*((_BYTE *)&self->super.super.isa + v51))
    {
      v52 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", objc_msgSend(a3, "pixelBufferAttributes"));
      v53 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      if (!v53)
      {
        fig_log_get_emitter();
        goto LABEL_55;
      }
      v54 = v53;
      -[BWNodeOutputMediaConfiguration setFormatRequirements:](v53, "setFormatRequirements:", v52);
      -[BWNodeOutputMediaConfiguration setPassthroughMode:](v54, "setPassthroughMode:", 0);
      -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v54, "setProvidesPixelBufferPool:", 1);
      -[BWNodeOutputMediaConfiguration setOwningNodeRetainedBufferCount:](v54, "setOwningNodeRetainedBufferCount:", v9 + self->_generateCoefficients + *((unsigned __int8 *)&self->super.super.isa + v51));
      -[BWNodeOutputMediaConfiguration setOwningNodeIndefinitelyHeldBufferCount:](v54, "setOwningNodeIndefinitelyHeldBufferCount:", 1);
      -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](self->super._output, "setMediaConfiguration:forAttachedMediaKey:", v54, a5);
      v60 = v52;
      v55 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1));
      v56 = 272;
    }
    else
    {
      if (!self->_generateCoefficients && !BYTE6(self->_previousPTS.epoch))
        return;
      v57 = v45[481];
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_refinedVideoFormatByAttachedMediaKey, "setObject:forKeyedSubscript:", *(Class *)((char *)&self->super.super.isa + v57), a5);
      v55 = *(Class *)((char *)&self->super.super.isa + v57);
      v56 = 288;
    }
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v56), "setObject:forKeyedSubscript:", v55, a5);
    return;
  }
  v58 = v9;
  -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3);
  v14 = objc_alloc_init(BWVideoFormatRequirements);
  if (!v14)
  {
LABEL_46:
    fig_log_get_emitter();
    goto LABEL_55;
  }
  v15 = v14;
  v16 = (void *)MEMORY[0x1E0CB37E8];
  v17 = FigCaptureUncompressedPixelFormatForPixelFormat(objc_msgSend(a3, "pixelFormat"));
  v18 = FigCaptureUnPackedPixelFormatForPixelFormat(v17);
  if ((v18 & 0xFFFFFFEF) == 0x34323066)
    v19 = 1111970369;
  else
    v19 = v18;
  v69[0] = objc_msgSend(v16, "numberWithInt:", v19);
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v15, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 1));
  objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "intermediateStyleRendererThumbnailSize");
  -[BWVideoFormatRequirements setWidth:](v15, "setWidth:", (unint64_t)v20);
  objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "intermediateStyleRendererThumbnailSize");
  -[BWVideoFormatRequirements setHeight:](v15, "setHeight:", (unint64_t)v21);
  -[BWVideoFormatRequirements setWidthAlignment:](v15, "setWidthAlignment:", 16);
  -[BWVideoFormatRequirements setHeightAlignment:](v15, "setHeightAlignment:", 16);
  v68 = v15;
  v22 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_refinedVideoFormatByAttachedMediaKey, "setObject:forKeyedSubscript:", v22, 0x1E495B398);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_processorPixelBufferPoolsByAttachedMediaKeys, "setObject:forKeyedSubscript:", v22, 0x1E495B398);
  v23 = objc_alloc_init(BWVideoFormatRequirements);
  if (!v23)
  {
    fig_log_get_emitter();
    goto LABEL_55;
  }
  v24 = v23;
  v25 = (void *)MEMORY[0x1E0CB37E8];
  v26 = FigCaptureUncompressedPixelFormatForPixelFormat(objc_msgSend(a3, "pixelFormat"));
  v27 = FigCaptureUnPackedPixelFormatForPixelFormat(v26);
  if ((v27 & 0xFFFFFFEF) == 0x34323066)
    v28 = 1111970369;
  else
    v28 = v27;
  v67 = objc_msgSend(v25, "numberWithInt:", v28);
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v24, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1));
  -[BWVideoFormatRequirements setWidth:](v24, "setWidth:", (unint64_t)v11);
  -[BWVideoFormatRequirements setHeight:](v24, "setHeight:", (unint64_t)v13);
  -[BWVideoFormatRequirements setWidthAlignment:](v24, "setWidthAlignment:", 16);
  -[BWVideoFormatRequirements setHeightAlignment:](v24, "setHeightAlignment:", 16);
  v66 = v24;
  v29 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_refinedVideoFormatByAttachedMediaKey, "setObject:forKeyedSubscript:", v29, 0x1E495B3B8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_processorPixelBufferPoolsByAttachedMediaKeys, "setObject:forKeyedSubscript:", v29, 0x1E495B3B8);
  v30 = objc_alloc_init(BWVideoFormatRequirements);
  if (!v30)
  {
    fig_log_get_emitter();
    goto LABEL_55;
  }
  v31 = v30;
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v30, "setSupportedPixelFormats:", &unk_1E4A007A0);
  -[BWVideoFormatRequirements setWidth:](v31, "setWidth:", (unint64_t)v11);
  -[BWVideoFormatRequirements setHeight:](v31, "setHeight:", (unint64_t)v13);
  -[BWVideoFormatRequirements setWidthAlignment:](v31, "setWidthAlignment:", 16);
  -[BWVideoFormatRequirements setHeightAlignment:](v31, "setHeightAlignment:", 16);
  v65 = v31;
  v32 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_refinedVideoFormatByAttachedMediaKey, "setObject:forKeyedSubscript:", v32, 0x1E495B3F8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_processorPixelBufferPoolsByAttachedMediaKeys, "setObject:forKeyedSubscript:", v32, 0x1E495B3F8);
  if (BYTE4(self->_previousPTS.epoch))
  {
    v33 = objc_alloc_init(BWVideoFormatRequirements);
    if (!v33)
    {
      fig_log_get_emitter();
      goto LABEL_55;
    }
    v34 = v33;
    v35 = (void *)objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "pixelBufferAttributesWithCapacityForLearntCoefficients");
    v64 = objc_msgSend(v35, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9040]);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v34, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1));
    v36 = (void *)objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "pixelBufferAttributesWithCapacityForLearntCoefficients");
    -[BWVideoFormatRequirements setWidth:](v34, "setWidth:", objc_msgSend((id)objc_msgSend(v36, "objectForKeyedSubscript:", *MEMORY[0x1E0CA90E0]), "unsignedIntValue"));
    v37 = (void *)objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "pixelBufferAttributesWithCapacityForLearntCoefficients");
    -[BWVideoFormatRequirements setHeight:](v34, "setHeight:", objc_msgSend((id)objc_msgSend(v37, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FD8]), "unsignedIntValue"));
    -[BWVideoFormatRequirements setWidthAlignment:](v34, "setWidthAlignment:", 16);
    -[BWVideoFormatRequirements setHeightAlignment:](v34, "setHeightAlignment:", 16);
    v38 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    if (!v38)
      goto LABEL_52;
    v39 = v38;
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](v38, "setFormatRequirements:", v34);
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](v39, "setPassthroughMode:", 0);
    -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v39, "setProvidesPixelBufferPool:", 1);
    -[BWNodeOutputMediaConfiguration setOwningNodeRetainedBufferCount:](v39, "setOwningNodeRetainedBufferCount:", v58);
    -[BWNodeOutputMediaConfiguration setOwningNodeIndefinitelyHeldBufferCount:](v39, "setOwningNodeIndefinitelyHeldBufferCount:", 1);
    -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](self->super._output, "setMediaConfiguration:forAttachedMediaKey:", v39, 0x1E495B358);
    v40 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    if (!v40)
      goto LABEL_52;
    v41 = v40;
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](v40, "setFormatRequirements:", v24);
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](v41, "setPassthroughMode:", 0);
    -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v41, "setProvidesPixelBufferPool:", 1);
    -[BWNodeOutputMediaConfiguration setOwningNodeRetainedBufferCount:](v41, "setOwningNodeRetainedBufferCount:", v58);
    -[BWNodeOutputMediaConfiguration setOwningNodeIndefinitelyHeldBufferCount:](v41, "setOwningNodeIndefinitelyHeldBufferCount:", 3);
    -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](self->super._output, "setMediaConfiguration:forAttachedMediaKey:", v41, 0x1E495B3B8);
    v42 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    if (!v42)
    {
LABEL_52:
      fig_log_get_emitter();
      goto LABEL_55;
    }
    v43 = v42;
    -[BWNodeOutputMediaConfiguration setFormatRequirements:](v42, "setFormatRequirements:", v31);
    -[BWNodeOutputMediaConfiguration setPassthroughMode:](v43, "setPassthroughMode:", 0);
    -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v43, "setProvidesPixelBufferPool:", 1);
    -[BWNodeOutputMediaConfiguration setOwningNodeRetainedBufferCount:](v43, "setOwningNodeRetainedBufferCount:", v58);
    -[BWNodeOutputMediaConfiguration setOwningNodeIndefinitelyHeldBufferCount:](v43, "setOwningNodeIndefinitelyHeldBufferCount:", 3);
    -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](self->super._output, "setMediaConfiguration:forAttachedMediaKey:", v43, 0x1E495B3F8);
  }
  if (BYTE6(self->_previousPTS.epoch))
  {
    -[BWVideoFormat setObject:forKeyedSubscript:](self->_anstMaskVideoFormat, "setObject:forKeyedSubscript:", -[NSMutableDictionary objectForKeyedSubscript:](self->_refinedVideoFormatByAttachedMediaKey, "objectForKeyedSubscript:", 0x1E495B398), CFSTR("PrimaryFormat"));
    v44 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWInferenceVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", objc_msgSend((id)-[BWVideoFormat objectForKeyedSubscript:](self->_anstMaskVideoFormat, "objectForKeyedSubscript:", CFSTR("PrimaryFormat")), "pixelBufferAttributes"));
    -[BWInferenceVideoFormatRequirements setIncludesInvalidContent:](v44, "setIncludesInvalidContent:", 1);
    v63 = v44;
    if (-[BWInferenceScheduler prepareForInputInferenceVideoFormat:attachedMediaKey:](self->_inferenceScheduler, "prepareForInputInferenceVideoFormat:attachedMediaKey:", +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1)), CFSTR("PrimaryFormat")))
    {
      fig_log_get_emitter();
LABEL_55:
      FigDebugAssert3();
    }
  }
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  if (-[NSArray objectAtIndexedSubscript:](-[BWNode inputs](self, "inputs", a3, a4), "objectAtIndexedSubscript:", 0) == a5)
    -[BWNodeOutput makeConfiguredFormatLive](self->super._output, "makeConfiguredFormatLive");
}

- (void)didReachEndOfDataForInput:(id)a3
{
  opaqueCMSampleBuffer *learnedCoefficientsSampleBuffer;
  __CVBuffer *identityCoefficientsPixelBuffer;

  if (-[NSArray objectAtIndexedSubscript:](-[BWNode inputs](self, "inputs"), "objectAtIndexedSubscript:", 0) == a3)
  {
    dispatch_sync(*(dispatch_queue_t *)&self->_timeInSecondsUntilNextStatsUpdate, &__block_literal_global_59_0);
    -[BWNodeOutput markEndOfLiveOutput](self->super._output, "markEndOfLiveOutput");
    os_unfair_lock_lock(&self->_inputMasksSampleBufferQueueLock);
    -[NSMutableArray removeAllObjects](self->_inputMasksSampleBufferQueue, "removeAllObjects");
    os_unfair_lock_unlock(&self->_inputMasksSampleBufferQueueLock);
    os_unfair_lock_lock(&self->_inputStyleContainerSampleBufferQueueLock);
    -[NSMutableArray removeAllObjects](self->_inputStyleContainerSampleBufferQueue, "removeAllObjects");
    os_unfair_lock_unlock(&self->_inputStyleContainerSampleBufferQueueLock);
    learnedCoefficientsSampleBuffer = self->_learnedCoefficientsSampleBuffer;
    if (learnedCoefficientsSampleBuffer)
    {
      CFRelease(learnedCoefficientsSampleBuffer);
      self->_learnedCoefficientsSampleBuffer = 0;
    }
    identityCoefficientsPixelBuffer = self->_identityCoefficientsPixelBuffer;
    if (identityCoefficientsPixelBuffer)
    {
      CFRelease(identityCoefficientsPixelBuffer);
      self->_identityCoefficientsPixelBuffer = 0;
    }
    -[BWSmartStyleLearningNode _releaseResources](self, "_releaseResources");
  }
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  uint64_t v3;
  NSMutableDictionary *refinedVideoFormatByAttachedMediaKey;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  uint64_t v17;
  BWPixelBufferPool *v18;
  uint64_t v19;
  void *v20;
  NSMutableDictionary *obj;
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD block[5];
  objc_super v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = MEMORY[0x1E0CA2E18];
  *(_OWORD *)(&self->_preLTMThumbnailFound + 3) = *MEMORY[0x1E0CA2E18];
  *(_QWORD *)&self->_previousPTS.flags = *(_QWORD *)(v3 + 16);
  v32.receiver = self;
  v32.super_class = (Class)BWSmartStyleLearningNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v32, sel_prepareForCurrentConfigurationToBecomeLive);
  LOBYTE(self->_cameraInfoByPortType) = BYTE1(self->_mostRecentLearnedSkyMaskSampleBuffer) ^ 1;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_statsUpdateDeltaTimeThreshold);
  self->_timingLock._os_unfair_lock_opaque = 0;
  self->_anstMasksMatchingTimeInSecondsThreshold = 0.0;
  os_unfair_lock_unlock((os_unfair_lock_t)&self->_statsUpdateDeltaTimeThreshold);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__BWSmartStyleLearningNode_prepareForCurrentConfigurationToBecomeLive__block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_async(*(dispatch_queue_t *)&self->_timeInSecondsUntilNextStatsUpdate, block);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  refinedVideoFormatByAttachedMediaKey = self->_refinedVideoFormatByAttachedMediaKey;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](refinedVideoFormatByAttachedMediaKey, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(refinedVideoFormatByAttachedMediaKey);
        v9 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (-[BWNodeOutput mediaConfigurationForAttachedMediaKey:](self->super._output, "mediaConfigurationForAttachedMediaKey:", v9))
        {
          v10 = (id)objc_msgSend(-[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", v9), "preparedPixelBufferPool");
          if (!v10)
          {
            fig_log_get_emitter();
LABEL_23:
            FigDebugAssert3();
            return;
          }
          v11 = v10;
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_processorVideoFormatsByAttachedMediaKeys, "setObject:forKeyedSubscript:", v10, v9);

        }
      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](refinedVideoFormatByAttachedMediaKey, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
      if (v6)
        continue;
      break;
    }
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_processorPixelBufferPoolsByAttachedMediaKeys;
  v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    while (2)
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j);
        v17 = -[NSMutableDictionary objectForKeyedSubscript:](self->_refinedVideoFormatByAttachedMediaKey, "objectForKeyedSubscript:", v16);
        v18 = [BWPixelBufferPool alloc];
        v19 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:](v18, "initWithVideoFormat:capacity:name:memoryPool:", v17, 3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SmartStyleLearningNode_%@_Pool"), v16), -[BWNodeOutput memoryPool](self->super._output, "memoryPool"));
        if (!v19)
        {
          fig_log_get_emitter();
          goto LABEL_23;
        }
        v20 = (void *)v19;
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_intermediateVideoFormatsByAttachedMediaKeys, "setObject:forKeyedSubscript:", v19, v16);

      }
      v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
      if (v13)
        continue;
      break;
    }
  }
  if (BYTE6(self->_previousPTS.epoch))
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __70__BWSmartStyleLearningNode_prepareForCurrentConfigurationToBecomeLive__block_invoke_2;
    v22[3] = &unk_1E491E720;
    v22[4] = self;
    dispatch_async(*(dispatch_queue_t *)&self->_timeInSecondsUntilNextStatsUpdate, v22);
  }
}

uint64_t __70__BWSmartStyleLearningNode_prepareForCurrentConfigurationToBecomeLive__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t result;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setup"))
  {
    fig_log_get_emitter();
    return FigDebugAssert3();
  }
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 220))
    v3 = 9;
  else
    v3 = 8;
  v4 = *(void **)(v2 + 112);
  v5 = objc_alloc(MEMORY[0x1E0D08A80]);
  v15 = CFSTR("ProcessingType");
  v16[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v6 = (void *)objc_msgSend(v5, "initWithMaxInputDimensions:inputPixelFormat:maxOutputDimensions:cmiResourceEnabled:processorSpecificOptions:", 0, 0, 0, 0, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1));
  if (!v6)
  {
    v9 = 0;
    v12 = 0;
    v8 = 0;
    v7 = 0;
LABEL_23:
    v13 = -12786;
    goto LABEL_12;
  }
  v7 = (id)objc_msgSend(v4, "externalMemoryDescriptorForConfiguration:", v6);
  if (!v7)
  {
    v9 = 0;
    v12 = 0;
    v8 = 0;
    goto LABEL_23;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D08B10]), "initWithDevice:allocatorType:", objc_msgSend((id)objc_msgSend(v4, "metalCommandQueue"), "device"), objc_msgSend(v7, "allocatorType"));
  if (!v8)
  {
    v9 = 0;
    goto LABEL_22;
  }
  v9 = (void *)objc_opt_new();
  if (!v9)
  {
LABEL_22:
    v12 = 0;
    goto LABEL_23;
  }
  objc_msgSend(v9, "setMemSize:", objc_msgSend(v7, "memSize"));
  objc_msgSend(v9, "setWireMemory:", 1);
  objc_msgSend(v9, "setLabel:", CFSTR("BWSmartStyleLearningNode-FigMetalAllocatorBackend"));
  objc_msgSend(v9, "setMemoryPoolId:", -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier"));
  v10 = objc_msgSend(v8, "setupWithDescriptor:", v9);
  if (v10)
  {
    v13 = v10;
    v12 = 0;
    goto LABEL_12;
  }
  v11 = (void *)objc_opt_new();
  v12 = v11;
  if (!v11)
    goto LABEL_23;
  objc_msgSend(v11, "setAllocatorBackend:", v8);
  objc_msgSend(v4, "setExternalMemoryResource:", v12);
  v13 = 0;
LABEL_12:

  if (v13 || (result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "prepareToProcess:", v3), (_DWORD)result))
  {
    fig_log_get_emitter();
    return FigDebugAssert3();
  }
  return result;
}

void __70__BWSmartStyleLearningNode_prepareForCurrentConfigurationToBecomeLive__block_invoke_2(uint64_t a1)
{
  int v2;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "prepareForInferenceWithFormatProvider:pixelBufferPoolProvider:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 32));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 228));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 225) = v2 == 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 228));
}

- (int)processMaskSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  CMTimeEpoch epoch;
  CMTimeFlags flags;
  int v7;
  CMTime time;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self
    && (-[BWSmartStyleLearningNode _getSampleBufferPresentationTimeStamp:](self, "_getSampleBufferPresentationTimeStamp:"), epoch = time.epoch, value = time.value, flags = time.flags, timescale = time.timescale, (time.flags & 1) != 0))
  {
    if (*MEMORY[0x1E0CA1FC0] == 1)
    {
      time.value = value;
      time.timescale = timescale;
      CMTimeGetSeconds(&time);
      kdebug_trace();
    }
    time.value = value;
    time.timescale = timescale;
    time.flags = flags;
    time.epoch = epoch;
    v7 = -[BWSmartStyleLearningNode _extractANSTMasks:forPTS:](self, "_extractANSTMasks:forPTS:", a3, &time);
    if (v7)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  return v7;
}

- (int)processVideoSampleBuffer:(opaqueCMSampleBuffer *)a3 frameEmitted:(BOOL *)a4
{
  int *v5;
  int *v6;
  int *v7;
  CMTimeEpoch epoch;
  CMTimeFlags flags;
  BOOL *v12;
  float v13;
  int v14;
  double Seconds;
  opaqueCMSampleBuffer *v16;
  CFTypeRef v17;
  void *v18;
  void *v19;
  float v20;
  float v21;
  uint64_t v22;
  float v23;
  float anstMasksMatchingTimeInSecondsThreshold;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  CFDictionaryRef DictionaryRepresentation;
  NSNumber *srlCurveParameter;
  uint64_t v31;
  void *v32;
  NSMutableDictionary *currentImageStats;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  int CopyIncludingMetadata;
  int workQueue_high;
  id v40;
  NSObject *v41;
  uint64_t AttachedMedia;
  float *p_statsUpdateDeltaTimeThreshold;
  _BOOL4 generateImageStats;
  os_unfair_lock_s *p_inputMasksSampleBufferQueueLock;
  uint64_t v46;
  NSMutableDictionary *v47;
  NSMutableArray *inputMasksSampleBufferQueue;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v53;
  NSMutableDictionary *v54;
  int v55;
  CFTypeRef v56;
  NSObject *v57;
  uint64_t v58;
  uint32_t os_unfair_lock_opaque;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v61;
  unsigned int v62;
  opaqueCMSampleBuffer *v63;
  int v64;
  CFTypeRef v65;
  NSObject *v66;
  os_unfair_lock_s *v67;
  uint64_t v68;
  int *v70;
  uint64_t v71;
  os_unfair_lock_s *v72;
  uint64_t v73;
  os_unfair_lock_t p_inputStyleContainerSampleBufferQueueLock;
  uint64_t v75;
  BOOL v76;
  os_unfair_lock_t p_styleUpdateLock;
  uint64_t v78;
  opaqueCMSampleBuffer *v79;
  BOOL *v80;
  opaqueCMSampleBuffer *v81;
  void *v82;
  _QWORD v83[11];
  BOOL v84;
  _QWORD block[9];
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  os_log_type_t type;
  unsigned int v91;
  CFTypeRef v92;
  CFTypeRef v93;
  CFTypeRef v94;
  CFTypeRef v95;
  CFTypeRef cf;
  opaqueCMSampleBuffer *v97;
  CFTypeRef v98;
  _BYTE v99[128];
  int v100;
  const char *v101;
  CMTime time;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v97 = 0;
  v98 = 0;
  v95 = 0;
  cf = 0;
  v93 = 0;
  v94 = 0;
  v92 = 0;
  v5 = &OBJC_IVAR___BWSinkNode__handlersToCallWhenActive;
  v6 = &OBJC_IVAR___BWSinkNode__handlersToCallWhenActive;
  v7 = &OBJC_IVAR___BWSinkNode__handlersToCallWhenActive;
  if (!self
    || (-[BWSmartStyleLearningNode _getSampleBufferPresentationTimeStamp:](self, "_getSampleBufferPresentationTimeStamp:"), epoch = time.epoch, value = time.value, flags = time.flags, timescale = time.timescale, (time.flags & 1) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v82 = 0;
    v14 = 0;
    goto LABEL_111;
  }
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    time.value = value;
    time.timescale = timescale;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  v12 = &self->_preLTMThumbnailFound + 3;
  v80 = a4;
  if ((self->_previousPTS.timescale & 1) != 0)
  {
    time.value = value;
    time.timescale = timescale;
    time.flags = flags;
    time.epoch = epoch;
    Seconds = CMTimeGetSeconds(&time);
    *(_OWORD *)&time.value = *(_OWORD *)v12;
    time.epoch = *(_QWORD *)&self->_previousPTS.flags;
    v13 = Seconds - CMTimeGetSeconds(&time);
  }
  else
  {
    v13 = 1.0 / (float)HIDWORD(self->_lastLearnedPortType);
  }
  *(_QWORD *)v12 = value;
  HIDWORD(self->_previousPTS.value) = timescale;
  self->_previousPTS.timescale = flags;
  *(_QWORD *)&self->_previousPTS.flags = epoch;
  v16 = -[BWSmartStyleLearningNode _unpackSbufFromPrimaryCameraStream:](self, "_unpackSbufFromPrimaryCameraStream:", a3);
  v17 = CMGetAttachment(v16, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (!v17)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v82 = 0;
    v14 = 0;
    goto LABEL_110;
  }
  v18 = (void *)v17;
  os_unfair_lock_lock(&self->_styleUpdateLock);
  if (LOBYTE(self->_mostRecentLearnedSkyMaskSampleBuffer)
    && (v19 = (void *)objc_msgSend(*(id *)&self->_bypassStyleEngineForStandardStyle, "cast"),
        objc_msgSend(v19, "isEqual:", FigSmartStyleCastTypeStandard))
    && (objc_msgSend(*(id *)&self->_bypassStyleEngineForStandardStyle, "toneBias"), v20 == 0.0))
  {
    objc_msgSend(*(id *)&self->_bypassStyleEngineForStandardStyle, "colorBias");
    v76 = v21 == 0.0;
  }
  else
  {
    v76 = 0;
  }
  v22 = objc_msgSend(*(id *)&self->_bypassStyleEngineForStandardStyle, "dictionaryRepresentation");
  p_styleUpdateLock = &self->_styleUpdateLock;
  os_unfair_lock_unlock(&self->_styleUpdateLock);
  -[BWSmartStyleLearningNode _updateCurrentSmartStyleMetadata:onSbuf:](self, "_updateCurrentSmartStyleMetadata:onSbuf:", v22, a3);
  os_unfair_lock_lock((os_unfair_lock_t)&self->_statsUpdateDeltaTimeThreshold);
  v23 = *(float *)&self->_timingLock._os_unfair_lock_opaque;
  anstMasksMatchingTimeInSecondsThreshold = self->_anstMasksMatchingTimeInSecondsThreshold;
  os_unfair_lock_unlock((os_unfair_lock_t)&self->_statsUpdateDeltaTimeThreshold);
  v25 = (void *)objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
  v26 = v25;
  if (*(_QWORD *)&self->_firstFrame)
  {
    if ((objc_msgSend(v25, "isEqualToString:") & 1) != 0)
      goto LABEL_20;
    v27 = *(void **)&self->_firstFrame;
  }
  else
  {
    v27 = 0;
  }

  *(_QWORD *)&self->_firstFrame = v26;
  LOBYTE(self->_cameraInfoByPortType) = 1;
  v23 = 0.0;
  anstMasksMatchingTimeInSecondsThreshold = 0.0;
LABEL_20:
  v79 = a3;
  v28 = -[BWSmartStyleLearningNode _getContainerAssetsFromSampleBuffer:outputUnstyledThumbnailSampleBuffer:outputLinearThumbnailSampleBuffer:](self, "_getContainerAssetsFromSampleBuffer:outputUnstyledThumbnailSampleBuffer:outputLinearThumbnailSampleBuffer:", v16, &v95, &v94);
  if (v28)
  {
    v14 = v28;
    fig_log_get_emitter();
    FigDebugAssert3();
    v82 = 0;
    goto LABEL_110;
  }
  BWSampleBufferSetAttachedMedia(v16, 0x1E495B3B8, (uint64_t)v95);
  BWSampleBufferSetAttachedMedia(v16, 0x1E495B3F8, (uint64_t)v94);
  os_unfair_lock_lock((os_unfair_lock_t)&self->_workQueue);
  BWSampleBufferSetAttachedMedia(v16, 0x1E495B358, (uint64_t)self->_learnedCoefficientsSampleBuffer);
  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*(CGRect *)&self->_srlStats);
  objc_msgSend(v18, "setObject:forKeyedSubscript:", DictionaryRepresentation, *MEMORY[0x1E0D060D8]);
  objc_msgSend(v18, "setObject:forKeyedSubscript:", self->_smartStyleLearned, *MEMORY[0x1E0D060F8]);
  srlCurveParameter = self->_srlCurveParameter;
  if (!srlCurveParameter)
    srlCurveParameter = (NSNumber *)(id)objc_opt_new();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", srlCurveParameter, *MEMORY[0x1E0D06100]);
  v31 = objc_msgSend(*(id *)&self->_workQueueLearnCount, "dictionaryRepresentation");
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0D060E0]);

  os_unfair_lock_unlock((os_unfair_lock_t)&self->_workQueue);
  v32 = (void *)objc_msgSend((id)-[FigMetalContext device](self->_metalContext, "device"), "newSharedEvent");
  if (v32)
  {
    v82 = v32;
    CMSetAttachment(v16, (CFStringRef)*MEMORY[0x1E0D05D88], v32, 1u);
    if (BYTE5(self->_previousPTS.epoch))
    {
      currentImageStats = self->_currentImageStats;
      if (currentImageStats)
        objc_msgSend(v18, "setObject:forKeyedSubscript:", currentImageStats, *MEMORY[0x1E0D060C0]);
    }
    os_unfair_lock_lock(&self->_semanticStyleSceneLock);
    v34 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_semanticStyleSceneType);
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v34, *MEMORY[0x1E0D06098]);
    os_unfair_lock_unlock(&self->_semanticStyleSceneLock);
    os_unfair_lock_lock((os_unfair_lock_t)&self->_lastLearnedROI.size.height);
    v35 = BYTE4(self->_lastLearnedROI.size.height);
    if (BYTE4(self->_lastLearnedROI.size.height) && self->_propagateMasks)
    {
      BWSampleBufferSetAttachedMedia(v16, (uint64_t)CFSTR("HumanFullBodiesMask"), *(_QWORD *)&self->_mostRecentMasksLock._os_unfair_lock_opaque);
      BWSampleBufferSetAttachedMedia(v16, (uint64_t)CFSTR("HumanSkinsMask"), (uint64_t)self->_mostRecentLearnedPersonMaskSampleBuffer);
      BWSampleBufferSetAttachedMedia(v16, 0x1E495B218, (uint64_t)self->_mostRecentLearnedSkinMaskSampleBuffer);
      BYTE4(self->_lastLearnedROI.size.height) = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&self->_lastLearnedROI.size.height);
    v36 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v35 != 0);
    v37 = *MEMORY[0x1E0D060D0];
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v36, *MEMORY[0x1E0D060D0]);
    if (v35 && self->_propagateMasks)
      BWSynchronizeSmartStyleAttachedMediaPTS(v16);
    CopyIncludingMetadata = BWCMSampleBufferCreateCopyIncludingMetadata(v16, (CMSampleBufferRef *)&cf);
    if (CopyIncludingMetadata)
      goto LABEL_129;
    BWSampleBufferRemoveAttachedMedia(v16, 0x1E495B478);
    os_unfair_lock_lock((os_unfair_lock_t)&self->_workQueue);
    workQueue_high = HIDWORD(self->_workQueue);
    os_unfair_lock_unlock((os_unfair_lock_t)&self->_workQueue);
    if (!LOBYTE(self->_cameraInfoByPortType) && workQueue_high <= 1)
    {
      -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", v79);
      *v80 = 1;
      goto LABEL_39;
    }
    if (workQueue_high < 2)
    {
LABEL_39:
      CopyIncludingMetadata = -[BWSmartStyleLearningNode _createSmartStyleContainerFromSampleBuffer:unstyledThumbnailSampleBuffer:linearThumbnailSampleBuffer:to:](self, "_createSmartStyleContainerFromSampleBuffer:unstyledThumbnailSampleBuffer:linearThumbnailSampleBuffer:to:", cf, v95, v94, &v98);
      if (!CopyIncludingMetadata)
      {
        os_unfair_lock_lock(&self->_inputStyleContainerSampleBufferQueueLock);
        -[NSMutableArray addObject:](self->_inputStyleContainerSampleBufferQueue, "addObject:", v98);
        os_unfair_lock_unlock(&self->_inputStyleContainerSampleBufferQueueLock);
        AttachedMedia = BWSampleBufferGetAttachedMedia(cf, 0x1E494FBD8);
        v75 = v37;
        p_inputStyleContainerSampleBufferQueueLock = &self->_inputStyleContainerSampleBufferQueueLock;
        if (v23 > 0.0)
        {
          v46 = 0;
          v47 = 0;
          p_statsUpdateDeltaTimeThreshold = &self->_statsUpdateDeltaTimeThreshold;
LABEL_72:
          os_unfair_lock_lock((os_unfair_lock_t)p_statsUpdateDeltaTimeThreshold);
          *(float *)&self->_timingLock._os_unfair_lock_opaque = *(float *)&self->_timingLock._os_unfair_lock_opaque
                                                              - v13;
          self->_anstMasksMatchingTimeInSecondsThreshold = self->_anstMasksMatchingTimeInSecondsThreshold - v13;
          os_unfair_lock_unlock((os_unfair_lock_t)p_statsUpdateDeltaTimeThreshold);
          v55 = BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)v94, (CMSampleBufferRef *)&v93);
          if (v55
            || (v55 = BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)v95, (CMSampleBufferRef *)&v92)) != 0)
          {
            v14 = v55;
            fig_log_get_emitter();
          }
          else
          {
            os_unfair_lock_lock((os_unfair_lock_t)&self->_workQueue);
            ++HIDWORD(self->_workQueue);
            os_unfair_lock_unlock((os_unfair_lock_t)&self->_workQueue);
            if (cf)
              CFRetain(cf);
            if (v93)
              CFRetain(v93);
            if (v92)
            {
              CFRetain(v92);
              v56 = v92;
            }
            else
            {
              v56 = 0;
            }
            v57 = *(NSObject **)&self->_timeInSecondsUntilNextStatsUpdate;
            v58 = MEMORY[0x1E0C809B0];
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __66__BWSmartStyleLearningNode_processVideoSampleBuffer_frameEmitted___block_invoke;
            block[3] = &unk_1E4921110;
            block[6] = cf;
            block[7] = v93;
            block[8] = v56;
            block[4] = self;
            block[5] = v82;
            dispatch_async(v57, block);
            os_unfair_lock_lock((os_unfair_lock_t)&self->_workQueue);
            os_unfair_lock_opaque = self->_workQueueLock._os_unfair_lock_opaque;
            os_unfair_lock_unlock((os_unfair_lock_t)&self->_workQueue);
            if (v23 > 0.0)
              goto LABEL_102;
            if (os_unfair_lock_opaque)
            {
              v91 = 0;
              type = OS_LOG_TYPE_DEFAULT;
              os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              v61 = v91;
              if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
                v62 = v61;
              else
                v62 = v61 & 0xFFFFFFFE;
              if (v62)
              {
                v100 = 136315138;
                v101 = "-[BWSmartStyleLearningNode processVideoSampleBuffer:frameEmitted:]";
                LODWORD(v71) = 12;
                v70 = &v100;
                _os_log_send_and_compose_impl();
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              *(float *)&self->_timingLock._os_unfair_lock_opaque = v13;
LABEL_102:
              if (LOBYTE(self->_cameraInfoByPortType))
              {
                dispatch_sync(*(dispatch_queue_t *)&self->_timeInSecondsUntilNextStatsUpdate, &__block_literal_global_73);
                v7 = &OBJC_IVAR___BWSinkNode__handlersToCallWhenActive;
                if (BYTE4(self->_lastLearnedROI.size.height))
                {
                  BWSampleBufferSetAttachedMedia(v16, (uint64_t)CFSTR("HumanFullBodiesMask"), *(_QWORD *)&self->_mostRecentMasksLock._os_unfair_lock_opaque);
                  BWSampleBufferSetAttachedMedia(v16, (uint64_t)CFSTR("HumanSkinsMask"), (uint64_t)self->_mostRecentLearnedPersonMaskSampleBuffer);
                  BWSampleBufferSetAttachedMedia(v16, 0x1E495B218, (uint64_t)self->_mostRecentLearnedSkinMaskSampleBuffer);
                  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BYTE4(self->_lastLearnedROI.size.height)), v75);
                  BYTE4(self->_lastLearnedROI.size.height) = 0;
                }
                if (LOBYTE(self->_cameraInfoByPortType))
                {
                  BWSampleBufferSetAttachedMedia(v16, 0x1E495B358, (uint64_t)self->_learnedCoefficientsSampleBuffer);
                  LOBYTE(self->_cameraInfoByPortType) = 0;
                }
                -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", v79, v70, v71);
                v14 = 0;
                *v80 = 1;
                goto LABEL_110;
              }
              v14 = 0;
              goto LABEL_109;
            }
            if (v97)
              v63 = v97;
            else
              v63 = (opaqueCMSampleBuffer *)v98;
            time.value = 0;
            v81 = v63;
            v64 = BWCMSampleBufferCreateCopyIncludingMetadata(v63, (CMSampleBufferRef *)&time);
            if (!v64)
            {
              os_unfair_lock_lock(p_styleUpdateLock);
              v78 = *(_QWORD *)&self->_bypassStyleEngineForStandardStyle;
              os_unfair_lock_unlock(p_styleUpdateLock);
              os_unfair_lock_lock((os_unfair_lock_t)&self->_workQueue);
              ++self->_workQueueLock._os_unfair_lock_opaque;
              os_unfair_lock_unlock((os_unfair_lock_t)&self->_workQueue);
              if (time.value)
                CFRetain((CFTypeRef)time.value);
              if (cf)
              {
                CFRetain(cf);
                v65 = cf;
              }
              else
              {
                v65 = 0;
              }
              v66 = *(NSObject **)&self->_timeInSecondsUntilNextStatsUpdate;
              v83[0] = v58;
              v83[1] = 3221225472;
              v83[2] = __66__BWSmartStyleLearningNode_processVideoSampleBuffer_frameEmitted___block_invoke_72;
              v83[3] = &unk_1E4921138;
              v83[8] = time.value;
              v83[9] = v65;
              v83[10] = v97;
              v83[4] = self;
              v83[5] = v46;
              v83[6] = v47;
              v83[7] = v78;
              v84 = v76;
              dispatch_async(v66, v83);
              os_unfair_lock_lock(p_inputStyleContainerSampleBufferQueueLock);
              -[NSMutableArray removeObject:](self->_inputStyleContainerSampleBufferQueue, "removeObject:", v81);
              os_unfair_lock_unlock(p_inputStyleContainerSampleBufferQueueLock);
              if (v97)
              {
                os_unfair_lock_lock(&self->_inputMasksSampleBufferQueueLock);
                -[NSMutableArray removeObject:](self->_inputMasksSampleBufferQueue, "removeObject:", v46);
                os_unfair_lock_unlock(&self->_inputMasksSampleBufferQueueLock);
              }
              if (time.value)
                CFRelease((CFTypeRef)time.value);
              goto LABEL_102;
            }
            v14 = v64;
            fig_log_get_emitter();
          }
          goto LABEL_132;
        }
        v73 = AttachedMedia;
        p_statsUpdateDeltaTimeThreshold = &self->_statsUpdateDeltaTimeThreshold;
        if (BYTE6(self->_previousPTS.epoch))
        {
          os_unfair_lock_lock((os_unfair_lock_t)&self->_gdcAttachmentsEnabled);
          generateImageStats = self->_generateImageStats;
          os_unfair_lock_unlock((os_unfair_lock_t)&self->_gdcAttachmentsEnabled);
          p_inputMasksSampleBufferQueueLock = &self->_inputMasksSampleBufferQueueLock;
          os_unfair_lock_lock(&self->_inputMasksSampleBufferQueueLock);
          if (generateImageStats)
          {
            v46 = -[NSMutableArray lastObject](self->_inputMasksSampleBufferQueue, "lastObject");
            if (v46)
              -[BWSmartStyleLearningNode _findCorrespondingSmartStyleContainerWithMasks:outputSmartStyleContainer:](self, "_findCorrespondingSmartStyleContainerWithMasks:outputSmartStyleContainer:", v46, &v97);
            goto LABEL_61;
          }
          v72 = &self->_inputMasksSampleBufferQueueLock;
        }
        else
        {
          v72 = &self->_inputMasksSampleBufferQueueLock;
          os_unfair_lock_lock(&self->_inputMasksSampleBufferQueueLock);
        }
        v88 = 0u;
        v89 = 0u;
        v86 = 0u;
        v87 = 0u;
        inputMasksSampleBufferQueue = self->_inputMasksSampleBufferQueue;
        v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputMasksSampleBufferQueue, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
        if (v49)
        {
          v50 = v49;
          v51 = *(_QWORD *)v87;
LABEL_51:
          v52 = 0;
          while (1)
          {
            if (*(_QWORD *)v87 != v51)
              objc_enumerationMutation(inputMasksSampleBufferQueue);
            v46 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * v52);
            if (!-[BWSmartStyleLearningNode _findCorrespondingSmartStyleContainerWithMasks:outputSmartStyleContainer:](self, "_findCorrespondingSmartStyleContainerWithMasks:outputSmartStyleContainer:", v46, &v97))break;
            if (v50 == ++v52)
            {
              v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputMasksSampleBufferQueue, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
              if (v50)
                goto LABEL_51;
              v46 = 0;
              break;
            }
          }
          p_statsUpdateDeltaTimeThreshold = &self->_statsUpdateDeltaTimeThreshold;
        }
        else
        {
          v46 = 0;
        }
        p_inputMasksSampleBufferQueueLock = v72;
LABEL_61:
        os_unfair_lock_unlock(p_inputMasksSampleBufferQueueLock);
        os_unfair_lock_lock((os_unfair_lock_t)p_statsUpdateDeltaTimeThreshold);
        *(float *)&self->_timingLock._os_unfair_lock_opaque = (float)LODWORD(self->_lastLearnedPortType)
                                                            / (float)HIDWORD(self->_lastLearnedPortType);
        os_unfair_lock_unlock((os_unfair_lock_t)p_statsUpdateDeltaTimeThreshold);
        v53 = LODWORD(self->_lastLearnedPortType) >= 4 && v73 == 0;
        if (v53 && !objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D06BF0]))
        {
          os_unfair_lock_lock((os_unfair_lock_t)p_statsUpdateDeltaTimeThreshold);
          *(float *)&self->_timingLock._os_unfair_lock_opaque = *(float *)&self->_timingLock._os_unfair_lock_opaque
                                                              * 0.5;
          os_unfair_lock_unlock((os_unfair_lock_t)p_statsUpdateDeltaTimeThreshold);
        }
        v47 = 0;
        if (BYTE5(self->_previousPTS.epoch) && anstMasksMatchingTimeInSecondsThreshold <= 0.0)
        {

          v54 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
          self->_currentImageStats = v54;
          if (!v54)
          {
            fig_log_get_emitter();
            FigDebugAssert3();
            v14 = -12780;
            goto LABEL_109;
          }
          v47 = v54;
          os_unfair_lock_lock((os_unfair_lock_t)p_statsUpdateDeltaTimeThreshold);
          LODWORD(self->_anstMasksMatchingTimeInSecondsThreshold) = self->_learningFramesPerSecondUnit;
          os_unfair_lock_unlock((os_unfair_lock_t)p_statsUpdateDeltaTimeThreshold);
        }
        goto LABEL_72;
      }
LABEL_129:
      v14 = CopyIncludingMetadata;
      fig_log_get_emitter();
LABEL_132:
      FigDebugAssert3();
      goto LABEL_109;
    }
    time.value = value;
    time.timescale = timescale;
    time.flags = flags;
    time.epoch = epoch;
    v40 = +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1E494F1F8, &time);
    v91 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v41 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    -[BWNodeOutput emitDroppedSample:](self->super._output, "emitDroppedSample:", v40);

    v14 = 0;
    *v80 = 1;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v82 = 0;
    v14 = -12786;
  }
LABEL_109:
  v7 = &OBJC_IVAR___BWSinkNode__handlersToCallWhenActive;
LABEL_110:
  v6 = &OBJC_IVAR___BWSinkNode__handlersToCallWhenActive;
  v5 = &OBJC_IVAR___BWSinkNode__handlersToCallWhenActive;
LABEL_111:
  if (v98)
    CFRelease(v98);
  if (v94)
    CFRelease(v94);
  if (v95)
    CFRelease(v95);
  if (cf)
    CFRelease(cf);
  if (v93)
    CFRelease(v93);
  if (v92)
    CFRelease(v92);

  v67 = (os_unfair_lock_s *)((char *)self + v5[446]);
  os_unfair_lock_lock(v67);
  v68 = v6[442];
  if (objc_msgSend(*(id *)((char *)&self->super.super.isa + v68), "count") >= (unint64_t)(*(_DWORD *)((char *)&self->super.super.isa + v7[431])
                                                                                                * (self->_learningRate
                                                                                                 / HIDWORD(self->_lastLearnedPortType))))
    objc_msgSend(*(id *)((char *)&self->super.super.isa + v68), "removeObjectAtIndex:", 0);
  os_unfair_lock_unlock(v67);
  return v14;
}

void __66__BWSmartStyleLearningNode_processVideoSampleBuffer_frameEmitted___block_invoke(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_asynchronouslyRenderSampleBuffer:outputLinearThumbnailSampleBuffer:outputUnstyledThumbnailSampleBuffer:synchronizingEvent:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
  v2 = *(const void **)(a1 + 48);
  if (v2)
    CFRelease(v2);
  v3 = *(const void **)(a1 + 56);
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)(a1 + 64);
  if (v4)
    CFRelease(v4);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 368));
  --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 372);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 368));
}

void __66__BWSmartStyleLearningNode_processVideoSampleBuffer_frameEmitted___block_invoke_72(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const void *v4;
  const void *v5;

  v2 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 80))
    v3 = *(_QWORD *)(a1 + 40);
  else
    v3 = 0;
  objc_msgSend(v2, "_asynchronouslyLearnWithContainer:inputUnstyledSampleBuffer:withUnrefinedMasks:withStats:styleToLearn:shouldBypass:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 88));
  v4 = *(const void **)(a1 + 64);
  if (v4)
    CFRelease(v4);
  v5 = *(const void **)(a1 + 72);
  if (v5)
    CFRelease(v5);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 368));
  --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 376);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 368));
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  char v7;

  v7 = 0;
  if (!a3 || !a4)
    goto LABEL_16;
  if (!*(_QWORD *)&self->_bypassStyleEngineForStandardStyle)
    goto LABEL_8;
  if (-[NSArray objectAtIndexedSubscript:](-[BWNode inputs](self, "inputs"), "objectAtIndexedSubscript:", 1) == a4)
  {
    if (!-[BWSmartStyleLearningNode processMaskSampleBuffer:](self, "processMaskSampleBuffer:", a3))
      goto LABEL_8;
LABEL_16:
    fig_log_get_emitter();
    goto LABEL_17;
  }
  if (-[BWSmartStyleLearningNode processVideoSampleBuffer:frameEmitted:](self, "processVideoSampleBuffer:frameEmitted:", a3, &v7))
  {
    fig_log_get_emitter();
LABEL_17:
    FigDebugAssert3();
  }
LABEL_8:
  if (!v7
    && -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](self, "inputs"), "objectAtIndexedSubscript:", 0) == a4)
  {
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
    os_unfair_lock_lock(&self->_inputStyleContainerSampleBufferQueueLock);
    if (-[NSMutableArray count](self->_inputStyleContainerSampleBufferQueue, "count") >= (unint64_t)(LODWORD(self->_lastLearnedPortType) * (self->_learningRate / HIDWORD(self->_lastLearnedPortType))))
      -[NSMutableArray removeObjectAtIndex:](self->_inputStyleContainerSampleBufferQueue, "removeObjectAtIndex:", 0);
    os_unfair_lock_unlock(&self->_inputStyleContainerSampleBufferQueueLock);
  }
  os_unfair_lock_lock(&self->_inputMasksSampleBufferQueueLock);
  if ((unint64_t)-[NSMutableArray count](self->_inputMasksSampleBufferQueue, "count") >= 3)
    -[NSMutableArray removeObjectAtIndex:](self->_inputMasksSampleBufferQueue, "removeObjectAtIndex:", 0);
  os_unfair_lock_unlock(&self->_inputMasksSampleBufferQueueLock);
}

- (id)_runInferences:(opaqueCMSampleBuffer *)a3 unstyledSampleBuffer:(opaqueCMSampleBuffer *)a4 withMasks:(id)a5 currentPTS:(id *)a6
{
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  const void *AttachedMedia;
  opaqueCMSampleBuffer *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  opaqueCMSampleBuffer *v20;
  opaqueCMSampleBuffer *v21;
  opaqueCMSampleBuffer *v22;
  CVImageBufferRef ImageBuffer;
  __CVBuffer *v24;
  const __CFAllocator *v25;
  const __CFDictionary *v26;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v28;
  uint64_t v29;
  CMSampleTimingInfo time;
  CMSampleTimingInfo v31;
  CMSampleTimingInfo timingArrayOut;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  CMSampleBufferRef v34;
  CMSampleBufferRef v35;
  CMSampleBufferRef v36;
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[2];
  _QWORD v40[4];

  v40[2] = *MEMORY[0x1E0C80C00];
  v35 = 0;
  v36 = 0;
  formatDescriptionOut = 0;
  v34 = 0;
  memset(&timingArrayOut, 0, sizeof(timingArrayOut));
  memset(&v31, 0, sizeof(v31));
  v10 = *MEMORY[0x1E0D086D0];
  v11 = objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0D086D0]);
  v12 = &unk_1E4924000;
  if (!v11)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v15 = 0;
    AttachedMedia = 0;
LABEL_46:
    v22 = 0;
    goto LABEL_21;
  }
  v13 = (void *)v11;
  AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a3, 0x1E495B398);
  if (!AttachedMedia)
    goto LABEL_35;
  v15 = (opaqueCMSampleBuffer *)objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("HumanFullBodiesMask"));
  if (!v15)
  {
    fig_log_get_emitter();
LABEL_45:
    FigDebugAssert3();
    goto LABEL_46;
  }
  v29 = v10;
  v16 = objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("HumanSkinsMask"));
  if (!v16
    || (v17 = v16, v28 = a6, (v18 = objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("HumanHairMask"))) == 0)
    || (v19 = v18, (v20 = (opaqueCMSampleBuffer *)objc_msgSend(v13, "objectForKeyedSubscript:", 0x1E495B218)) == 0))
  {
LABEL_35:
    fig_log_get_emitter();
LABEL_43:
    FigDebugAssert3();
    v15 = 0;
    goto LABEL_46;
  }
  v21 = v20;
  if (CMSampleBufferGetSampleTimingInfoArray(v20, 1, &timingArrayOut, 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v15 = 0;
    v22 = 0;
    v12 = (_QWORD *)&unk_1E4924000;
    goto LABEL_21;
  }
  if (CMSampleBufferGetSampleTimingInfoArray(a4, 1, &v31, 0))
    goto LABEL_42;
  BWSampleBufferSetAttachedMedia(AttachedMedia, 0x1E4951738, (uint64_t)v15);
  BWSampleBufferSetAttachedMedia(AttachedMedia, 0x1E4951778, v17);
  BWSampleBufferSetAttachedMedia(AttachedMedia, 0x1E4951758, v19);
  if (-[BWInferenceScheduler performInferencesOnSampleBuffer:attachingResultsToSampleBuffer:](self->_inferenceScheduler, "performInferencesOnSampleBuffer:attachingResultsToSampleBuffer:", AttachedMedia, AttachedMedia))goto LABEL_42;
  BWSampleBufferRemoveAttachedMedia(AttachedMedia, 0x1E4951738);
  BWSampleBufferRemoveAttachedMedia(AttachedMedia, 0x1E4951778);
  BWSampleBufferRemoveAttachedMedia(AttachedMedia, 0x1E4951758);
  v15 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(AttachedMedia, 0x1E4951798);
  if (!v15)
    goto LABEL_44;
  v22 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(AttachedMedia, 0x1E49517D8);
  if (!v22)
    goto LABEL_47;
  ImageBuffer = CMSampleBufferGetImageBuffer(v15);
  if (!ImageBuffer)
  {
LABEL_42:
    fig_log_get_emitter();
    goto LABEL_43;
  }
  v24 = ImageBuffer;
  v15 = CMSampleBufferGetImageBuffer(v22);
  if (!v15)
  {
LABEL_44:
    fig_log_get_emitter();
    goto LABEL_45;
  }
  v22 = (opaqueCMSampleBuffer *)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_intermediateVideoFormatsByAttachedMediaKeys, "objectForKeyedSubscript:", 0x1E495B218), "newPixelBuffer");
  if (v22)
  {
    if (!objc_msgSend((id)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities"), "blitPixelBuffer:toPixelBuffer:", CMSampleBufferGetImageBuffer(v21), v22))
    {
      v25 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      if (!CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v24, &formatDescriptionOut))
      {
        time = v31;
        if (!BWSampleBufferCreateFromPixelBufferWithTimingInfo(v24, &time, (CFTypeRef *)&formatDescriptionOut, &v36))
        {
          time = v31;
          if (!BWSampleBufferCreateFromPixelBufferWithTimingInfo(v15, &time, (CFTypeRef *)&formatDescriptionOut, &v35))
          {
            time = timingArrayOut;
            if (!BWSampleBufferCreateFromPixelBufferWithTimingInfo(v22, &time, (CFTypeRef *)&formatDescriptionOut, &v34))
            {
              v39[0] = *MEMORY[0x1E0D05D00];
              *(_OWORD *)&time.duration.value = *(_OWORD *)&v28->var0;
              time.duration.epoch = v28->var3;
              v26 = CMTimeCopyAsDictionary(&time.duration, v25);
              v39[1] = v29;
              v40[0] = v26;
              v37[0] = CFSTR("HumanFullBodiesMask");
              v37[1] = CFSTR("HumanSkinsMask");
              v38[0] = v36;
              v38[1] = v35;
              v37[2] = 0x1E495B218;
              v38[2] = v34;
              v40[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
              v15 = (opaqueCMSampleBuffer *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
              goto LABEL_21;
            }
          }
        }
        fig_log_get_emitter();
        goto LABEL_51;
      }
    }
  }
LABEL_47:
  fig_log_get_emitter();
LABEL_51:
  FigDebugAssert3();
  v15 = 0;
LABEL_21:
  BWSampleBufferRemoveAttachedMedia(AttachedMedia, 0x1E4951798);
  BWSampleBufferRemoveAttachedMedia(AttachedMedia, v12[196]);
  BWSampleBufferRemoveAttachedMedia(AttachedMedia, 0x1E49517B8);
  if (v22)
    CFRelease(v22);
  if (v36)
    CFRelease(v36);
  if (v35)
    CFRelease(v35);
  if (v34)
    CFRelease(v34);
  if (formatDescriptionOut)
    CFRelease(formatDescriptionOut);
  return v15;
}

- (int)_findCorrespondingSmartStyleContainerWithMasks:(id)a3 outputSmartStyleContainer:(opaqueCMSampleBuffer *)a4
{
  int result;
  int v7;
  NSMutableArray *inputStyleContainerSampleBufferQueue;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  opaqueCMSampleBuffer *v13;
  double Seconds;
  CMTime time;
  CMTime v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  CMTime v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  result = -12784;
  if (!a3 || !a4)
    return result;
  *a4 = 0;
  memset(&v21, 0, sizeof(v21));
  CMTimeMakeFromDictionary(&v21, (CFDictionaryRef)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05D00]));
  if ((v21.flags & 1) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12784;
  }
  v7 = BYTE6(self->_previousPTS.epoch);
  os_unfair_lock_lock(&self->_inputStyleContainerSampleBufferQueueLock);
  if (!v7)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    inputStyleContainerSampleBufferQueue = self->_inputStyleContainerSampleBufferQueue;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputStyleContainerSampleBufferQueue, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(inputStyleContainerSampleBufferQueue);
          v13 = *(opaqueCMSampleBuffer **)(*((_QWORD *)&v17 + 1) + 8 * i);
          memset(&v16, 0, sizeof(v16));
          -[BWSmartStyleLearningNode _getSampleBufferPresentationTimeStamp:](self, "_getSampleBufferPresentationTimeStamp:", v13);
          time = v21;
          Seconds = CMTimeGetSeconds(&time);
          time = v16;
          if (vabdd_f64(Seconds, CMTimeGetSeconds(&time)) <= *(float *)&self->_learningMaxFramesPerSecond)
          {
            *a4 = v13;
            goto LABEL_17;
          }
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](inputStyleContainerSampleBufferQueue, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        if (v10)
          continue;
        break;
      }
    }
    os_unfair_lock_unlock(&self->_inputStyleContainerSampleBufferQueueLock);
    return -12784;
  }
  *a4 = (opaqueCMSampleBuffer *)-[NSMutableArray lastObject](self->_inputStyleContainerSampleBufferQueue, "lastObject");
LABEL_17:
  os_unfair_lock_unlock(&self->_inputStyleContainerSampleBufferQueueLock);
  return 0;
}

- (int)_loadAndConfigureSmartStyleBundle
{
  objc_class *v3;
  void *v4;
  FigMetalContext *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  CMISmartStyleProcessor *v10;
  objc_class *v11;

  v3 = NSClassFromString((NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CMISmartStyleV%d"), 1));
  self->_smartStyleClass = v3;
  if (v3)
  {
    v4 = BWLoadProcessorBundle((uint64_t)CFSTR("SmartStyle"), 1);
    if (v4
      && (v5 = (FigMetalContext *)objc_msgSend(objc_alloc(MEMORY[0x1E0D08B28]), "initWithoutLibraryUsingOptionalCommandQueue:", 0), (self->_metalContext = v5) != 0))
    {
      v6 = (void *)FigDispatchQueueCreateWithPriority();
      if (v6)
      {
        v7 = (void *)-[FigMetalContext commandQueue](self->_metalContext, "commandQueue");
        if (v7)
        {
          v8 = v7;
          objc_msgSend(v7, "setSubmissionQueue:", v6);
          objc_msgSend(v8, "setCompletionQueue:", v6);
          objc_msgSend(v8, "setGPUPriority:", 4);
          v9 = (objc_class *)objc_msgSend(v4, "classNamed:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CMISmartStyleProcessorV%d"), 1));
          v10 = (CMISmartStyleProcessor *)objc_msgSend([v9 alloc], "initWithOptionalMetalCommandQueue:", -[FigMetalContext commandQueue](self->_metalContext, "commandQueue"));
          self->_smartStyleProcessor = v10;
          if (v10)
          {
            -[CMISmartStyleProcessor setInstanceLabel:](v10, "setInstanceLabel:", CFSTR("LearningNode"));
            -[CMISmartStyleProcessor setUseLiveMetalAllocations:](self->_smartStyleProcessor, "setUseLiveMetalAllocations:", 1);
            -[CMISmartStyleProcessor setConfiguration:](self->_smartStyleProcessor, "setConfiguration:", -[objc_class getDefaultProcessorConfigurationForStreaming](v9, "getDefaultProcessorConfigurationForStreaming"));
            if (-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"))
            {
              v11 = (objc_class *)objc_msgSend(v4, "classNamed:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CMISmartStyleProcessorInputOutputV%d"), 1));
              self->_smartStyleProcessorInputOutputClass = v11;
              if (v11)
              {

                return 0;
              }
            }
          }
        }
      }
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
    v4 = 0;
  }

  self->_smartStyleProcessor = 0;
  return -12786;
}

- (int)_extractANSTMasks:(opaqueCMSampleBuffer *)a3 forPTS:(id *)a4
{
  uint64_t v4;
  opaqueCMSampleBuffer *v8;
  opaqueCMSampleBuffer *v9;
  opaqueCMSampleBuffer *v10;
  opaqueCMSampleBuffer *v11;
  opaqueCMSampleBuffer *v12;
  opaqueCMSampleBuffer *v13;
  BWSmartStyleLearningNode *v14;
  opaqueCMSampleBuffer *AttachedMedia;
  opaqueCMSampleBuffer *v16;
  BWSmartStyleLearningNode *v17;
  os_unfair_lock_s *p_inputMasksSampleBufferQueueLock;
  NSMutableArray *inputMasksSampleBufferQueue;
  const __CFAllocator *v20;
  uint64_t v22;
  uint64_t v23;
  CMTime time;
  _QWORD v25[4];
  _QWORD v26[4];
  _QWORD v27[2];
  _QWORD v28[4];

  v28[2] = *MEMORY[0x1E0C80C00];
  if (a3
    && (v8 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, (uint64_t)CFSTR("HumanFullBodiesMask"))) != 0
    && (v9 = v8, CMSampleBufferGetImageBuffer(v8))
    && (v10 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, (uint64_t)CFSTR("HumanHairMask"))) != 0
    && (v11 = v10, CMSampleBufferGetImageBuffer(v10))
    && (v12 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, (uint64_t)CFSTR("HumanSkinsMask"))) != 0
    && (v13 = v12, CMSampleBufferGetImageBuffer(v12)))
  {
    v14 = self;
    AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1E495B218);
    if (AttachedMedia)
    {
      v16 = AttachedMedia;
      if (CMSampleBufferGetImageBuffer(AttachedMedia))
      {
        v17 = v14;
        p_inputMasksSampleBufferQueueLock = &v14->_inputMasksSampleBufferQueueLock;
        os_unfair_lock_lock(p_inputMasksSampleBufferQueueLock);
        inputMasksSampleBufferQueue = v17->_inputMasksSampleBufferQueue;
        v27[0] = *MEMORY[0x1E0D05D00];
        v20 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        time = (CMTime)*a4;
        v28[0] = CMTimeCopyAsDictionary(&time, v20);
        v27[1] = *MEMORY[0x1E0D086D0];
        v25[0] = CFSTR("HumanFullBodiesMask");
        v25[1] = CFSTR("HumanHairMask");
        v26[0] = v9;
        v26[1] = v11;
        v25[2] = CFSTR("HumanSkinsMask");
        v25[3] = 0x1E495B218;
        v26[2] = v13;
        v26[3] = v16;
        v28[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
        -[NSMutableArray addObject:](inputMasksSampleBufferQueue, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2));
        os_unfair_lock_unlock(p_inputMasksSampleBufferQueueLock);
        return 0;
      }
    }
    fig_log_get_emitter();
    v23 = v4;
    LODWORD(v22) = 0;
    FigDebugAssert3();
    self = v14;
  }
  else
  {
    fig_log_get_emitter();
    v23 = v4;
    LODWORD(v22) = 0;
    FigDebugAssert3();
  }
  os_unfair_lock_lock(&self->_inputMasksSampleBufferQueueLock);
  -[NSMutableArray removeAllObjects](self->_inputMasksSampleBufferQueue, "removeAllObjects", v22, v23);
  os_unfair_lock_unlock(&self->_inputMasksSampleBufferQueueLock);
  return -12780;
}

- (id)_blitMasksToOutputPools:(id)a3 unstyledSampleBuffer:(opaqueCMSampleBuffer *)a4 currentPTS:(id *)a5
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const __CFAllocator *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  opaqueCMSampleBuffer *v19;
  opaqueCMSampleBuffer *v20;
  CVImageBufferRef ImageBuffer;
  CVImageBufferRef v22;
  OSStatus SampleTimingInfoArray;
  uint64_t v24;
  void *v25;
  int v26;
  const __CFDictionary *v27;
  void *v28;
  OSStatus v29;
  int v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v35;
  id v36;
  CMSampleTimingInfo sampleTiming;
  CMSampleTimingInfo timingArrayOut;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  CFTypeRef cf;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  _QWORD v45[2];
  _QWORD v46[2];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  cf = 0;
  formatDescriptionOut = 0;
  v36 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = *MEMORY[0x1E0D086D0];
  v11 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D086D0]);
  if (v11 && (v12 = (void *)v11, CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05CB0], 0)))
  {
    v34 = v10;
    v35 = a5;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    v14 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    if (v13)
    {
      v15 = v13;
      v16 = *(_QWORD *)v40;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v40 != v16)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          if ((objc_msgSend(v18, "isEqualToString:", CFSTR("HumanHairMask")) & 1) == 0)
          {
            memset(&timingArrayOut, 0, sizeof(timingArrayOut));
            v19 = (opaqueCMSampleBuffer *)objc_msgSend(v12, "objectForKeyedSubscript:", v18);
            if (!v19)
              goto LABEL_27;
            v20 = v19;
            ImageBuffer = CMSampleBufferGetImageBuffer(v19);
            if (!ImageBuffer)
              goto LABEL_27;
            v22 = ImageBuffer;
            SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray(v20, 1, &timingArrayOut, 0);
            if (SampleTimingInfoArray)
            {
              v29 = SampleTimingInfoArray;
              fig_log_get_emitter();
              v33 = v5;
              LODWORD(v32) = v29;
              goto LABEL_28;
            }
            v24 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_processorVideoFormatsByAttachedMediaKeys, "objectForKeyedSubscript:", v18), "newPixelBuffer");
            if (!v24)
            {
LABEL_27:
              fig_log_get_emitter();
              v33 = v5;
              LODWORD(v32) = 0;
              goto LABEL_28;
            }
            v25 = (void *)v24;
            v26 = objc_msgSend((id)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities"), "blitPixelBuffer:toPixelBuffer:", v22, v24);
            if (v26
              || (v26 = CMVideoFormatDescriptionCreateForImageBuffer(v14, (CVImageBufferRef)v25, &formatDescriptionOut)) != 0
              || (sampleTiming = timingArrayOut,
                  (v26 = BWSampleBufferCreateFromPixelBufferWithTimingInfo((CVImageBufferRef)v25, &sampleTiming, (CFTypeRef *)&formatDescriptionOut, (CMSampleBufferRef *)&cf)) != 0))
            {
              v30 = v26;
              fig_log_get_emitter();
              v33 = v5;
              LODWORD(v32) = v30;
              FigDebugAssert3();
              CFRelease(v25);
              goto LABEL_30;
            }
            objc_msgSend(v36, "setObject:forKeyedSubscript:", cf, v18);
            CFRelease(v25);
            if (formatDescriptionOut)
              CFRelease(formatDescriptionOut);
            if (cf)
              CFRelease(cf);
            cf = 0;
            formatDescriptionOut = 0;
          }
        }
        v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        if (v15)
          continue;
        break;
      }
    }
    v45[0] = *MEMORY[0x1E0D05D00];
    *(_OWORD *)&timingArrayOut.duration.value = *(_OWORD *)&v35->var0;
    timingArrayOut.duration.epoch = v35->var3;
    v27 = CMTimeCopyAsDictionary(&timingArrayOut.duration, v14);
    v45[1] = v34;
    v46[0] = v27;
    v46[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v36);
    v28 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
  }
  else
  {
    fig_log_get_emitter();
    v33 = v5;
    LODWORD(v32) = 0;
LABEL_28:
    FigDebugAssert3();
LABEL_30:
    v28 = 0;
  }
  if (formatDescriptionOut)
    CFRelease(formatDescriptionOut);
  if (cf)
    CFRelease(cf);
  objc_msgSend(v36, "removeAllObjects", v32, v33);

  return v28;
}

- (id)_undistortMasks:(id)a3 unstyledSampleBuffer:(opaqueCMSampleBuffer *)a4 currentPTS:(id *)a5 useIntermediatePools:(BOOL)a6
{
  uint64_t v6;
  _BOOL4 v7;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  uint64_t i;
  void *v22;
  void *v23;
  opaqueCMSampleBuffer *v24;
  opaqueCMSampleBuffer *v25;
  void *v26;
  CVImageBufferRef ImageBuffer;
  CVImageBufferRef v28;
  OSStatus SampleTimingInfoArray;
  int v30;
  int v31;
  const __CFDictionary *v32;
  void *v33;
  OSStatus v34;
  int v35;
  int v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v41;
  const __CFAllocator *allocator;
  int *v43;
  void *v44;
  CVImageBufferRef v45;
  uint64_t v46;
  CMSampleTimingInfo time;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  CMSampleTimingInfo timingArrayOut;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  CFTypeRef cf;
  _QWORD v56[2];
  _QWORD v57[2];
  _BYTE v58[128];
  uint64_t v59;

  v7 = a6;
  v59 = *MEMORY[0x1E0C80C00];
  formatDescriptionOut = 0;
  cf = 0;
  memset(&timingArrayOut, 0, sizeof(timingArrayOut));
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = *MEMORY[0x1E0D086D0];
  v13 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D086D0]);
  if (v13
    && (v14 = (void *)v13, (v15 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05CB0], 0)) != 0)
    && (v16 = v15,
        (v46 = -[NSMutableDictionary objectForKeyedSubscript:](self->_intermediatePixelBufferPoolsByAttachedMediaKeys, "objectForKeyedSubscript:", objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]))) != 0)&& (v45 = CMSampleBufferGetImageBuffer(a4)) != 0)
  {
    v44 = v16;
    v40 = v12;
    v41 = a5;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v50;
      v20 = &OBJC_IVAR___BWSmartStyleLearningNode__intermediatePixelBufferPoolsByAttachedMediaKeys;
      if (!v7)
        v20 = &OBJC_IVAR___BWSmartStyleLearningNode__processorPixelBufferPoolsByAttachedMediaKeys;
      v43 = v20;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v50 != v19)
            objc_enumerationMutation(v14);
          v22 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          if ((objc_msgSend(v22, "isEqualToString:", CFSTR("HumanHairMask")) & 1) == 0)
          {
            v23 = (void *)objc_msgSend(*(id *)((char *)&self->super.super.isa + *v43), "objectForKeyedSubscript:", v22);
            if (!v23)
            {
              fig_log_get_emitter();
              v39 = v6;
              LODWORD(v38) = 0;
LABEL_40:
              FigDebugAssert3();
              v33 = 0;
              goto LABEL_41;
            }
            v24 = (opaqueCMSampleBuffer *)objc_msgSend(v14, "objectForKeyedSubscript:", v22);
            if (!v24)
            {
              fig_log_get_emitter();
              v39 = v6;
              LODWORD(v38) = 0;
              goto LABEL_31;
            }
            v25 = v24;
            v26 = v11;
            ImageBuffer = CMSampleBufferGetImageBuffer(v24);
            if (!ImageBuffer)
            {
              fig_log_get_emitter();
              v39 = v6;
              LODWORD(v38) = 0;
              goto LABEL_34;
            }
            v28 = ImageBuffer;
            SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray(v25, 1, &timingArrayOut, 0);
            if (SampleTimingInfoArray)
            {
              v34 = SampleTimingInfoArray;
              fig_log_get_emitter();
              v39 = v6;
              LODWORD(v38) = v34;
LABEL_34:
              FigDebugAssert3();
              v33 = 0;
              v23 = 0;
LABEL_38:
              v11 = v26;
              goto LABEL_41;
            }
            v23 = (void *)objc_msgSend(v23, "newPixelBuffer");
            if (!v23)
            {
              fig_log_get_emitter();
              v39 = v6;
              LODWORD(v38) = 0;
LABEL_37:
              FigDebugAssert3();
              v33 = 0;
              goto LABEL_38;
            }
            v30 = objc_msgSend((id)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities"), "undistortMask:inputPixelBuffer:inputMetadata:cameraInfo:toPixelBuffer:", v28, v45, v44, v46, v23);
            if (v30)
            {
              v35 = v30;
              fig_log_get_emitter();
              v39 = v6;
              LODWORD(v38) = v35;
              goto LABEL_37;
            }
            v11 = v26;
            if (!formatDescriptionOut
              && (v31 = CMVideoFormatDescriptionCreateForImageBuffer(allocator, (CVImageBufferRef)v23, &formatDescriptionOut)) != 0|| (time = timingArrayOut, (v31 = BWSampleBufferCreateFromPixelBufferWithTimingInfo((CVImageBufferRef)v23, &time, (CFTypeRef *)&formatDescriptionOut, (CMSampleBufferRef *)&cf)) != 0))
            {
              v36 = v31;
              fig_log_get_emitter();
              v39 = v6;
              LODWORD(v38) = v36;
              goto LABEL_40;
            }
            objc_msgSend(v26, "setObject:forKeyedSubscript:", cf, v22);
            CFRelease(v23);
            if (cf)
              CFRelease(cf);
            cf = 0;
          }
        }
        v18 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
        if (v18)
          continue;
        break;
      }
    }
    v56[0] = *MEMORY[0x1E0D05D00];
    *(_OWORD *)&time.duration.value = *(_OWORD *)&v41->var0;
    time.duration.epoch = v41->var3;
    v32 = CMTimeCopyAsDictionary(&time.duration, allocator);
    v56[1] = v40;
    v57[0] = v32;
    v57[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v11);
    v33 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
  }
  else
  {
    fig_log_get_emitter();
    v39 = v6;
    LODWORD(v38) = 0;
LABEL_31:
    FigDebugAssert3();
    v33 = 0;
  }
  v23 = 0;
LABEL_41:
  objc_msgSend(v11, "removeAllObjects", v38, v39);
  if (v11)
    CFRelease(v11);
  if (v23)
    CFRelease(v23);
  if (cf)
    CFRelease(cf);
  if (formatDescriptionOut)
    CFRelease(formatDescriptionOut);
  return v33;
}

- (int)_createCoefficientsFromSampleBuffer:(opaqueCMSampleBuffer *)a3 to:(opaqueCMSampleBuffer *)a4
{
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  _DWORD *v6;
  BWSmartStyleLearningNode *v8;
  id v10;
  OSStatus SampleTimingInfoArray;
  int v12;
  opaqueCMSampleBuffer *v13;
  int v14;
  CMSampleTimingInfo time;
  CMSampleTimingInfo timingArrayOut;
  CFTypeRef v18;
  CMSampleBufferRef v19;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = 0;
  memset(&timingArrayOut, 0, sizeof(timingArrayOut));
  value = *MEMORY[0x1E0CA2E68];
  flags = *(_DWORD *)(MEMORY[0x1E0CA2E68] + 12);
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E68] + 8);
  epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v6 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (!a3 || !a4)
  {
    fig_log_get_emitter();
LABEL_28:
    FigDebugAssert3();
    goto LABEL_29;
  }
  v8 = self;
  *a4 = 0;
  if (!self)
  {
    flags = 0;
    epoch = 0;
    timescale = 0;
    value = 0;
LABEL_15:
    v14 = -12780;
    goto LABEL_16;
  }
  -[BWSmartStyleLearningNode _getSampleBufferPresentationTimeStamp:](self, "_getSampleBufferPresentationTimeStamp:");
  epoch = time.duration.epoch;
  value = time.duration.value;
  flags = time.duration.flags;
  timescale = time.duration.timescale;
  if ((time.duration.flags & 1) == 0)
  {
LABEL_29:
    v8 = 0;
    goto LABEL_15;
  }
  if (*v6 == 1)
  {
    time.duration.value = value;
    time.duration.timescale = timescale;
    CMTimeGetSeconds(&time.duration);
    kdebug_trace();
  }
  v10 = -[BWNodeOutput mediaPropertiesForAttachedMediaKey:](v8->super._output, "mediaPropertiesForAttachedMediaKey:", 0x1E495B358);
  if (!v10)
  {
    fig_log_get_emitter();
    goto LABEL_28;
  }
  v8 = (BWSmartStyleLearningNode *)objc_msgSend((id)objc_msgSend(v10, "livePixelBufferPool"), "newPixelBuffer");
  if (v8)
  {
    SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray(a3, 1, &timingArrayOut, 0);
    if (SampleTimingInfoArray)
    {
      v14 = SampleTimingInfoArray;
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      time = timingArrayOut;
      v12 = BWSampleBufferCreateFromPixelBufferWithTimingInfo((CVImageBufferRef)v8, &time, &v18, &v19);
      if (v12)
      {
        v14 = v12;
      }
      else
      {
        v13 = v19;
        if (v19)
          v13 = (opaqueCMSampleBuffer *)CFRetain(v19);
        v14 = 0;
        *a4 = v13;
      }
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v14 = -12786;
  }
LABEL_16:
  if (*v6 == 1)
  {
    time.duration.value = value;
    time.duration.timescale = timescale;
    time.duration.flags = flags;
    time.duration.epoch = epoch;
    CMTimeGetSeconds(&time.duration);
    kdebug_trace();
  }
  if (v19)
    CFRelease(v19);
  if (v8)
    CFRelease(v8);
  if (v18)
    CFRelease(v18);
  return v14;
}

- (int)_createIdentityCoefficientsFromSampleBuffer:(opaqueCMSampleBuffer *)a3 to:(opaqueCMSampleBuffer *)a4
{
  OSStatus SampleTimingInfoArray;
  __CVBuffer *identityCoefficientsPixelBuffer;
  id v9;
  int v10;
  int v11;
  id v12;
  void *v13;
  opaqueCMSampleBuffer *v14;
  CMSampleTimingInfo sampleTiming;
  CMSampleTimingInfo timingArrayOut;
  CFTypeRef v18;
  CMSampleBufferRef v19;

  v18 = 0;
  v19 = 0;
  memset(&timingArrayOut, 0, sizeof(timingArrayOut));
  if (!a3 || !a4)
  {
    fig_log_get_emitter();
LABEL_25:
    FigDebugAssert3();
LABEL_26:
    v13 = 0;
    v10 = -12780;
    goto LABEL_14;
  }
  *a4 = 0;
  if (!self)
    goto LABEL_26;
  -[BWSmartStyleLearningNode _getSampleBufferPresentationTimeStamp:](self, "_getSampleBufferPresentationTimeStamp:");
  if ((sampleTiming.duration.flags & 1) == 0)
    goto LABEL_26;
  SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray(a3, 1, &timingArrayOut, 0);
  if (SampleTimingInfoArray)
  {
    v10 = SampleTimingInfoArray;
    fig_log_get_emitter();
LABEL_28:
    FigDebugAssert3();
    goto LABEL_29;
  }
  identityCoefficientsPixelBuffer = self->_identityCoefficientsPixelBuffer;
  if (identityCoefficientsPixelBuffer)
    goto LABEL_9;
  v9 = -[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", 0x1E495B358);
  if (!v9)
  {
    fig_log_get_emitter();
    goto LABEL_25;
  }
  self->_identityCoefficientsPixelBuffer = (__CVBuffer *)objc_msgSend((id)objc_msgSend(v9, "livePixelBufferPool"), "newPixelBuffer");
  v10 = objc_msgSend((id)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities"), "createIdentityTransformCoefficients:", self->_identityCoefficientsPixelBuffer);
  identityCoefficientsPixelBuffer = self->_identityCoefficientsPixelBuffer;
  if (!identityCoefficientsPixelBuffer)
  {
    fig_log_get_emitter();
    goto LABEL_28;
  }
LABEL_9:
  sampleTiming = timingArrayOut;
  v11 = BWSampleBufferCreateFromPixelBufferWithTimingInfo(identityCoefficientsPixelBuffer, &sampleTiming, &v18, &v19);
  if (v11)
  {
    v10 = v11;
LABEL_29:
    v13 = 0;
    goto LABEL_14;
  }
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D060C8]);
    CMSetAttachment(v19, (CFStringRef)*MEMORY[0x1E0D05CB0], v13, 1u);
    v14 = v19;
    if (v19)
      v14 = (opaqueCMSampleBuffer *)CFRetain(v19);
    v10 = 0;
    *a4 = v14;
  }
  else
  {
    v10 = -12786;
  }
LABEL_14:
  if (v19)
    CFRelease(v19);
  if (v18)
    CFRelease(v18);

  return v10;
}

- (int)_runFalsePositiveRejectionOnPixelBuffer:(__CVBuffer *)a3 unrefinedPixelBuffer:(__CVBuffer *)a4
{
  int v4;

  if (a3)
  {
    v4 = (int)a4;
    if (!a4
      || (v4 = objc_msgSend((id)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities"), "runFPRejectionOnMask:originalMask:", a3, a4)) != 0)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  return v4;
}

- (int)_createSmartStyleContainerFromSampleBuffer:(opaqueCMSampleBuffer *)a3 unstyledThumbnailSampleBuffer:(opaqueCMSampleBuffer *)a4 linearThumbnailSampleBuffer:(opaqueCMSampleBuffer *)a5 to:(opaqueCMSampleBuffer *)a6
{
  int v6;
  const __CFString *v11;
  CFTypeRef v12;
  const void *v13;
  OSStatus SampleTimingInfoArray;
  OSStatus v15;
  CMAttachmentBearerRef v16;
  opaqueCMSampleBuffer *v17;
  CMAttachmentBearerRef target;
  CMSampleTimingInfo timingArrayOut;

  target = 0;
  v6 = -12780;
  if (a3 && a4 && a5 && a6)
  {
    *a6 = 0;
    v11 = (const __CFString *)*MEMORY[0x1E0D05CB0];
    v12 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    if (!v12)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return 0;
    }
    v13 = v12;
    memset(&timingArrayOut, 0, sizeof(timingArrayOut));
    SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray(a3, 1, &timingArrayOut, 0);
    if (SampleTimingInfoArray)
    {
      v6 = SampleTimingInfoArray;
      fig_log_get_emitter();
      FigDebugAssert3();
      return v6;
    }
    v15 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 1u, 0, 0, 0, 0, 1, &timingArrayOut, 0, 0, (CMSampleBufferRef *)&target);
    v16 = target;
    if (v15)
    {
      v6 = -12786;
      if (!target)
        return v6;
      goto LABEL_12;
    }
    CMSetAttachment(target, v11, v13, 1u);
    BWSampleBufferSetAttachedMedia(target, 0x1E495B3B8, (uint64_t)a4);
    BWSampleBufferSetAttachedMedia(target, 0x1E495B3F8, (uint64_t)a5);
    v16 = target;
    if (target)
    {
      v17 = (opaqueCMSampleBuffer *)CFRetain(target);
      v16 = target;
    }
    else
    {
      v17 = 0;
    }
    v6 = 0;
    *a6 = v17;
    if (v16)
LABEL_12:
      CFRelease(v16);
  }
  return v6;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_getSampleBufferPresentationTimeStamp:(SEL)a3
{
  void *v6;
  void *v7;
  uint64_t v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  CMTime v10;

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  if (a4)
  {
    v6 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    if (v6 && (v7 = v6, v8 = *MEMORY[0x1E0D05D00], objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D05D00])))
      result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeFromDictionary(&v10, (CFDictionaryRef)objc_msgSend(v7, "objectForKeyedSubscript:", v8));
    else
      result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMSampleBufferGetPresentationTimeStamp(&v10, a4);
    *(CMTime *)retstr = v10;
  }
  else
  {
    fig_log_get_emitter();
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)FigDebugAssert3();
  }
  return result;
}

- (opaqueCMSampleBuffer)_unpackSbufFromPrimaryCameraStream:(opaqueCMSampleBuffer *)a3
{
  opaqueCMSampleBuffer *v3;
  uint64_t AttachedMedia;
  const void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  AttachedMedia = BWSampleBufferGetAttachedMedia(a3, (uint64_t)CFSTR("SynchronizedSlaveFrame"));
  if (AttachedMedia)
  {
    v5 = (const void *)AttachedMedia;
    v6 = (const __CFString *)*MEMORY[0x1E0D05CB0];
    v7 = (void *)CMGetAttachment(v3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v8 = (void *)CMGetAttachment(v5, v6, 0);
    v9 = *MEMORY[0x1E0D06EB8];
    if ((objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D06EB8]), "BOOLValue") & 1) == 0)
    {
      if (objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", v9), "BOOLValue"))
        return (opaqueCMSampleBuffer *)v5;
    }
  }
  return v3;
}

- (void)_updateCurrentSmartStyleMetadata:(id)a3 onSbuf:(opaqueCMSampleBuffer *)a4
{
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  const void *AttachedMedia;

  v6 = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v7 = (void *)CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v8 = *MEMORY[0x1E0D060B0];
  objc_msgSend(v7, "setObject:forKeyedSubscript:", a3, *MEMORY[0x1E0D060B0]);
  AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a4, (uint64_t)CFSTR("SynchronizedSlaveFrame"));
  if (AttachedMedia)
    objc_msgSend((id)CMGetAttachment(AttachedMedia, v6, 0), "setObject:forKeyedSubscript:", a3, v8);
}

- (int)_initVMRefinerInference
{
  BWInferenceScheduler *v3;
  BWInferenceEngine *v4;
  BWInferenceConfiguration *v5;
  BWVideoFormat *v6;

  *(_DWORD *)&self->_gdcAttachmentsEnabled = 0;
  v3 = objc_alloc_init(BWInferenceScheduler);
  *(_QWORD *)&self->_inferenceLock._os_unfair_lock_opaque = v3;
  if (v3
    && (v4 = -[BWInferenceEngine initWithScheduler:priority:]([BWInferenceEngine alloc], "initWithScheduler:priority:", *(_QWORD *)&self->_inferenceLock._os_unfair_lock_opaque, 6), (self->_inferenceScheduler = (BWInferenceScheduler *)v4) != 0)&& (v5 = -[BWInferenceConfiguration initWithInferenceType:]([BWInferenceConfiguration alloc], "initWithInferenceType:", 118), -[BWInferenceConfiguration setPriority:](v5, "setPriority:", 6), v5))
  {
    if (-[BWInferenceScheduler addInferenceOfType:version:configuration:](self->_inferenceScheduler, "addInferenceOfType:version:configuration:", 118, BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL, v5))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return -12780;
    }
    else
    {
      v6 = (BWVideoFormat *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      self->_anstMaskVideoFormat = v6;
      if (!v6)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
      return 0;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12786;
  }
}

- (int)_getContainerAssetsFromSampleBuffer:(opaqueCMSampleBuffer *)a3 outputUnstyledThumbnailSampleBuffer:(opaqueCMSampleBuffer *)a4 outputLinearThumbnailSampleBuffer:(opaqueCMSampleBuffer *)a5
{
  OSStatus SampleTimingInfoArray;
  __CVBuffer *v10;
  __CVBuffer *v11;
  int v12;
  opaqueCMSampleBuffer *v13;
  __CVBuffer *v14;
  opaqueCMSampleBuffer *v15;
  int v16;
  CMSampleTimingInfo sampleTiming;
  CFTypeRef cf;
  CFTypeRef v20;
  CMSampleTimingInfo timingArrayOut;

  memset(&timingArrayOut, 0, sizeof(timingArrayOut));
  cf = 0;
  v20 = 0;
  if (!a3 || !a4 || !a5)
  {
    fig_log_get_emitter();
LABEL_34:
    FigDebugAssert3();
LABEL_35:
    v16 = -12780;
    goto LABEL_25;
  }
  *a4 = 0;
  *a5 = 0;
  if (!self)
    goto LABEL_35;
  -[BWSmartStyleLearningNode _getSampleBufferPresentationTimeStamp:](self, "_getSampleBufferPresentationTimeStamp:");
  if ((sampleTiming.duration.flags & 1) == 0)
    goto LABEL_35;
  SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray(a3, 1, &timingArrayOut, 0);
  if (SampleTimingInfoArray)
  {
    v16 = SampleTimingInfoArray;
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_25;
  }
  if (!CMSampleBufferGetImageBuffer(a3))
  {
    fig_log_get_emitter();
    goto LABEL_34;
  }
  v10 = (__CVBuffer *)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_processorVideoFormatsByAttachedMediaKeys, "objectForKeyedSubscript:", 0x1E495B3B8), "newPixelBuffer");
  if (!v10)
    goto LABEL_36;
  v11 = v10;
  sampleTiming = timingArrayOut;
  v12 = BWSampleBufferCreateFromPixelBufferWithTimingInfo(v10, &sampleTiming, &v20, (CMSampleBufferRef *)&cf);
  if (v12)
  {
LABEL_30:
    v16 = v12;
    CFRelease(v11);
    goto LABEL_25;
  }
  v13 = (opaqueCMSampleBuffer *)cf;
  if (cf)
    v13 = (opaqueCMSampleBuffer *)CFRetain(cf);
  *a4 = v13;
  CFRelease(v11);
  if (v20)
  {
    CFRelease(v20);
    v20 = 0;
  }
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  v14 = (__CVBuffer *)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_processorVideoFormatsByAttachedMediaKeys, "objectForKeyedSubscript:", 0x1E495B3F8), "newPixelBuffer");
  if (!v14)
  {
LABEL_36:
    fig_log_get_emitter();
    FigDebugAssert3();
    v16 = -12786;
    goto LABEL_25;
  }
  v11 = v14;
  sampleTiming = timingArrayOut;
  v12 = BWSampleBufferCreateFromPixelBufferWithTimingInfo(v14, &sampleTiming, &v20, (CMSampleBufferRef *)&cf);
  if (v12)
    goto LABEL_30;
  v15 = (opaqueCMSampleBuffer *)cf;
  if (cf)
    v15 = (opaqueCMSampleBuffer *)CFRetain(cf);
  *a5 = v15;
  CFRelease(v11);
  if (v20)
  {
    CFRelease(v20);
    v20 = 0;
  }
  if (cf)
  {
    CFRelease(cf);
    v16 = 0;
    cf = 0;
  }
  else
  {
    v16 = 0;
  }
LABEL_25:
  if (v20)
    CFRelease(v20);
  if (cf)
    CFRelease(cf);
  return v16;
}

- (void)_asynchronouslyRenderSampleBuffer:(opaqueCMSampleBuffer *)a3 outputLinearThumbnailSampleBuffer:(opaqueCMSampleBuffer *)a4 outputUnstyledThumbnailSampleBuffer:(opaqueCMSampleBuffer *)a5 synchronizingEvent:(id)a6
{
  uint64_t AttachedMedia;
  opaqueCMSampleBuffer *v12;
  CVImageBufferRef ImageBuffer;
  __CVBuffer *v14;
  void *v15;
  void *v16;
  void *v17;
  CFStringRef *v18;
  __CVBuffer *v19;
  unsigned int v20;
  const __CFString *v21;
  CFTypeRef v22;
  const __CFString *v23;
  CFTypeRef v24;
  const __CFString *v25;
  CFTypeRef v26;
  CVImageBufferRef v27;
  __CVBuffer *v28;
  void *v29;
  CVImageBufferRef v30;
  __CVBuffer *v31;
  const __CFString *v32;
  CFTypeRef v33;
  const __CFString *v34;
  CFTypeRef v35;
  CVImageBufferRef v36;
  CVImageBufferRef v37;
  void *v38;
  int v39;
  uint64_t v40;
  void *v41;
  opaqueCMSampleBuffer *sbuf;
  unsigned int v43;
  unsigned int v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;

  if (!a3
    || !a4
    || !a5
    || (AttachedMedia = BWSampleBufferGetAttachedMedia(a3, 0x1E494FBD8),
        v12 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1E495B478),
        (ImageBuffer = CMSampleBufferGetImageBuffer(a3)) == 0)
    || (v14 = ImageBuffer, (v15 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0)) == 0))
  {
    fig_log_get_emitter();
LABEL_45:
    FigDebugAssert3();
    return;
  }
  v16 = v15;
  sbuf = (opaqueCMSampleBuffer *)AttachedMedia;
  if (self->_generateCoefficients)
  {
    v17 = (void *)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
    v44 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0D05A28]);
  }
  else
  {
    v44 = 0;
  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v52 = 0u;
  v18 = (CFStringRef *)MEMORY[0x1E0CA8D68];
  if (v12)
  {
    v19 = CMSampleBufferGetImageBuffer(v12);
    v20 = v44;
    if (!v19)
      v20 = 0;
    v43 = v20;
    if (v20 == 1
      && objc_msgSend(MEMORY[0x1E0D08A78], "getGDCParams:cameraInfo:metadata:", &v52, -[NSMutableDictionary objectForKeyedSubscript:](self->_intermediatePixelBufferPoolsByAttachedMediaKeys, "objectForKeyedSubscript:", objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00])), v16))
    {
      goto LABEL_44;
    }
    v21 = *v18;
    v22 = CVBufferCopyAttachment(v14, *v18, 0);
    CVBufferSetAttachment(v19, v21, v22, kCVAttachmentMode_ShouldPropagate);
    if (v22)
      CFRelease(v22);
    v23 = (const __CFString *)*MEMORY[0x1E0CA8E98];
    v24 = CVBufferCopyAttachment(v14, (CFStringRef)*MEMORY[0x1E0CA8E98], 0);
    CVBufferSetAttachment(v19, v23, v24, kCVAttachmentMode_ShouldPropagate);
    if (v24)
      CFRelease(v24);
    v25 = (const __CFString *)*MEMORY[0x1E0CA8EE8];
    v26 = CVBufferCopyAttachment(v14, (CFStringRef)*MEMORY[0x1E0CA8EE8], 0);
    CVBufferSetAttachment(v19, v25, v26, kCVAttachmentMode_ShouldPropagate);
    if (v26)
      CFRelease(v26);
    v14 = v19;
  }
  else
  {
    v43 = 0;
  }
  v27 = CMSampleBufferGetImageBuffer(a5);
  if (!v27)
  {
LABEL_44:
    fig_log_get_emitter();
    goto LABEL_45;
  }
  v28 = v27;
  v29 = (void *)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities");
  v49 = v56;
  v50 = v57;
  v51 = v58;
  v45 = v52;
  v46 = v53;
  v47 = v54;
  v48 = v55;
  if (objc_msgSend(v29, "downScalePixelBuffer:toPixelBuffer:propagateAttachments:gdcParams:applyGDC:", v14, v28, 1, &v45, v43)|| (v30 = CMSampleBufferGetImageBuffer(a4)) == 0)
  {
LABEL_41:
    fig_log_get_emitter();
    goto LABEL_45;
  }
  v31 = v30;
  v32 = *v18;
  v33 = CVBufferCopyAttachment(v28, *v18, 0);
  v34 = (const __CFString *)*MEMORY[0x1E0CA8EE8];
  v35 = CVBufferCopyAttachment(v28, (CFStringRef)*MEMORY[0x1E0CA8EE8], 0);
  CVBufferSetAttachment(v31, v32, v33, kCVAttachmentMode_ShouldPropagate);
  CVBufferSetAttachment(v31, (CFStringRef)*MEMORY[0x1E0CA8E98], (CFTypeRef)*MEMORY[0x1E0CA8EB8], kCVAttachmentMode_ShouldPropagate);
  CVBufferSetAttachment(v31, v34, v35, kCVAttachmentMode_ShouldPropagate);
  if (v33)
    CFRelease(v33);
  if (v35)
    CFRelease(v35);
  if (sbuf)
  {
    v36 = CMSampleBufferGetImageBuffer(sbuf);
    if (v36)
    {
      v37 = v36;
      v38 = (void *)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities");
      v39 = objc_msgSend(v38, "createLinearThumbnailFromMetadata:preLTMThumbnailPixelBuffer:postLTMThumbnailPixelBuffer:cameraInfo:applyGDC:cropToPreLTMBounds:toPixelBuffer:", v16, v37, v28, -[NSMutableDictionary objectForKeyedSubscript:](self->_intermediatePixelBufferPoolsByAttachedMediaKeys, "objectForKeyedSubscript:", objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00])), v44, 0, v31);
      goto LABEL_35;
    }
    goto LABEL_41;
  }
  v40 = objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D06BF0]);
  v41 = (void *)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities");
  if (v40)
  {
    v39 = objc_msgSend(v41, "createLinearThumbnailFromMetadata:postLTMThumbnailPixelBuffer:cameraInfo:applyGDC:cropToPreLTMBounds:toPixelBuffer:", v16, v28, -[NSMutableDictionary objectForKeyedSubscript:](self->_intermediatePixelBufferPoolsByAttachedMediaKeys, "objectForKeyedSubscript:", objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00])), v44, 0, v31);
  }
  else
  {
    v49 = v56;
    v50 = v57;
    v51 = v58;
    v45 = v52;
    v46 = v53;
    v47 = v54;
    v48 = v55;
    v39 = objc_msgSend(v41, "downScalePixelBuffer:toPixelBuffer:propagateAttachments:gdcParams:applyGDC:", v14, v31, 1, &v45, v43);
  }
LABEL_35:
  if (a6)
  {
    if (!v39)
      -[BWSmartStyleLearningNode _asynchronouslySignalEvent:](self, "_asynchronouslySignalEvent:");
  }
}

- (void)_asynchronouslyLearnWithContainer:(opaqueCMSampleBuffer *)a3 inputUnstyledSampleBuffer:(opaqueCMSampleBuffer *)a4 withUnrefinedMasks:(id)a5 withStats:(id)a6 styleToLearn:(id)a7 shouldBypass:(BOOL)a8
{
  uint64_t v8;
  _BOOL4 v9;
  unint64_t v12;
  uint64_t v15;
  __int128 v16;
  id v17;
  _DWORD *v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t AttachedMedia;
  opaqueCMSampleBuffer *v22;
  opaqueCMSampleBuffer *v23;
  CVImageBufferRef ImageBuffer;
  void *v25;
  __CVBuffer *v26;
  __CVBuffer *v27;
  __CVBuffer *v33;
  void *v34;
  unint64_t v35;
  __CVBuffer *v36;
  const __CFString *v37;
  CFTypeRef v38;
  const __CFString *v39;
  CFTypeRef v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  uint64_t v58;
  CVImageBufferRef v59;
  void *v60;
  __CVBuffer *v61;
  uint64_t v62;
  void *v63;
  const __CFString *v64;
  CFTypeRef v65;
  __CVBuffer *v66;
  const __CFString *v67;
  CFTypeRef v68;
  opaqueCMSampleBuffer *v69;
  void *v70;
  unint64_t v71;
  id v72;
  _BOOL4 propagateMasks;
  id v74;
  CVImageBufferRef v75;
  CVImageBufferRef v76;
  CVImageBufferRef v77;
  _BOOL8 v78;
  id v79;
  void *v80;
  uint64_t v81;
  opaqueCMSampleBuffer *v82;
  opaqueCMSampleBuffer *v83;
  opaqueCMSampleBuffer *v84;
  uint64_t v85;
  opaqueCMSampleBuffer *v86;
  CVImageBufferRef v87;
  opaqueCMSampleBuffer *v88;
  opaqueCMSampleBuffer *v89;
  CVImageBufferRef v90;
  uint64_t v91;
  uint64_t v92;
  const void *v93;
  uint64_t v94;
  const void *v95;
  const void *v96;
  opaqueCMSampleBuffer *mostRecentLearnedPersonMaskSampleBuffer;
  opaqueCMSampleBuffer *mostRecentLearnedSkinMaskSampleBuffer;
  __CVBuffer *v99;
  __CVBuffer *v100;
  id v101;
  __CVBuffer *v102;
  CVImageBufferRef v103;
  CVImageBufferRef v104;
  CVImageBufferRef v105;
  int v106;
  int v107;
  void *v108;
  double v109;
  int v110;
  int v111;
  void *v112;
  double v113;
  int v114;
  int v115;
  void *v116;
  double v117;
  opaqueCMSampleBuffer *learnedCoefficientsSampleBuffer;
  id v119;
  FigCaptureSmartStyle *v120;
  __int128 v121;
  opaqueCMSampleBuffer *v122;
  uint64_t v123;
  uint64_t v124;
  CVImageBufferRef v125;
  id v126;
  CVImageBufferRef v127;
  _BOOL4 v128;
  id v129;
  opaqueCMSampleBuffer *v130;
  __CVBuffer *v131;
  __CVBuffer *v132;
  unsigned int v133;
  void *v134;
  unint64_t v135;
  opaqueCMSampleBuffer *target;
  CVImageBufferRef targeta;
  unsigned int v138;
  CVImageBufferRef v139;
  void *v140;
  CMSampleBufferRef sbufa;
  __CVBuffer *cf;
  CMSampleTimingInfo timingArrayOut;
  _BYTE time[32];
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  CMSampleBufferRef v160;
  CFTypeRef v161;
  CMSampleBufferRef v162;
  uint64_t v163;
  unsigned int v164;
  uint64_t v165;

  v9 = a8;
  v12 = (unint64_t)a5;
  v165 = *MEMORY[0x1E0C80C00];
  v161 = 0;
  v162 = 0;
  v160 = 0;
  v15 = MEMORY[0x1E0CA2E68];
  v163 = *MEMORY[0x1E0CA2E68];
  v164 = *(_DWORD *)(MEMORY[0x1E0CA2E68] + 8);
  v16 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v158 = *MEMORY[0x1E0C9D628];
  v159 = v16;
  v17 = a5;
  v18 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (!a3)
  {
    v20 = *(_DWORD *)(v15 + 12);
    v19 = *(_QWORD *)(v15 + 16);
    fig_log_get_emitter();
LABEL_172:
    FigDebugAssert3();
LABEL_173:
    v25 = 0;
    sbufa = 0;
    cf = 0;
    v26 = 0;
    a7 = 0;
LABEL_175:
    v27 = 0;
LABEL_199:
    LOBYTE(ImageBuffer) = 0;
    goto LABEL_151;
  }
  if (!self)
  {
    v25 = 0;
    sbufa = 0;
    cf = 0;
    v19 = 0;
    v20 = 0;
    v26 = 0;
    a7 = 0;
    v27 = 0;
    LOBYTE(ImageBuffer) = 0;
    v164 = 0;
    v163 = 0;
    goto LABEL_151;
  }
  v128 = v9;
  v126 = a6;
  target = a3;
  -[BWSmartStyleLearningNode _getSampleBufferPresentationTimeStamp:](self, "_getSampleBufferPresentationTimeStamp:", a3);
  v19 = *(_QWORD *)&time[16];
  v163 = *(_QWORD *)time;
  v20 = *(_DWORD *)&time[12];
  v164 = *(_DWORD *)&time[8];
  if ((time[12] & 1) == 0)
    goto LABEL_173;
  if (*v18 == 1)
  {
    *(_QWORD *)time = v163;
    *(_DWORD *)&time[8] = v164;
    CMTimeGetSeconds((CMTime *)time);
    kdebug_trace();
  }
  v140 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (!v140)
  {
    fig_log_get_emitter();
    goto LABEL_172;
  }
  if (!a7)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v25 = 0;
    sbufa = 0;
    cf = 0;
    v26 = 0;
    goto LABEL_175;
  }
  AttachedMedia = BWSampleBufferGetAttachedMedia(a4, 0x1E495B478);
  v22 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a4, 0x1E494FBD8);
  v23 = v22;
  v133 = v20;
  if (v22)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(v22);
    if (!ImageBuffer)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v25 = 0;
      sbufa = 0;
      cf = 0;
      v26 = 0;
      a7 = 0;
      v27 = 0;
      goto LABEL_151;
    }
    objc_msgSend((id)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities"), "getPreLTMValidROIFromMetadata:inputPreLTMThumbnailPixelBuffer:outputRect:", v140, ImageBuffer, &v158);
  }
  else
  {
    v158 = 0uLL;
    __asm { FMOV            V0.2D, #1.0 }
    v159 = _Q0;
  }
  v33 = CMSampleBufferGetImageBuffer(a4);
  if (self->_generateCoefficients)
  {
    v34 = (void *)objc_msgSend(v140, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
    v138 = objc_msgSend(v34, "isEqualToString:", *MEMORY[0x1E0D05A28]);
  }
  else
  {
    v138 = 0;
  }
  v156 = 0u;
  v157 = 0u;
  v154 = 0u;
  v155 = 0u;
  v152 = 0u;
  v153 = 0u;
  v151 = 0u;
  v129 = a7;
  v130 = (opaqueCMSampleBuffer *)AttachedMedia;
  if (AttachedMedia)
  {
    v35 = v12;
    v36 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)AttachedMedia);
    if (v36)
      AttachedMedia = v138;
    else
      AttachedMedia = 0;
    if ((_DWORD)AttachedMedia == 1
      && objc_msgSend(MEMORY[0x1E0D08A78], "getGDCParams:cameraInfo:metadata:", &v151, -[NSMutableDictionary objectForKeyedSubscript:](self->_intermediatePixelBufferPoolsByAttachedMediaKeys, "objectForKeyedSubscript:", objc_msgSend(v140, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00])), v140))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v25 = 0;
      sbufa = 0;
      cf = 0;
      v26 = 0;
      a7 = 0;
      LOBYTE(ImageBuffer) = 0;
      v18 = (_DWORD *)MEMORY[0x1E0CA1FC0];
      v20 = v133;
      v12 = v35;
      v27 = 0;
      goto LABEL_151;
    }
    v37 = (const __CFString *)*MEMORY[0x1E0CA8D68];
    v38 = CVBufferCopyAttachment(v33, (CFStringRef)*MEMORY[0x1E0CA8D68], 0);
    CVBufferSetAttachment(v36, v37, v38, kCVAttachmentMode_ShouldPropagate);
    if (v38)
      CFRelease(v38);
    v39 = (const __CFString *)*MEMORY[0x1E0CA8E98];
    v40 = CVBufferCopyAttachment(v33, (CFStringRef)*MEMORY[0x1E0CA8E98], 0);
    CVBufferSetAttachment(v36, v39, v40, kCVAttachmentMode_ShouldPropagate);
    if (v40)
      CFRelease(v40);
    v33 = v36;
    v12 = v35;
  }
  objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "intermediateStyleRendererThumbnailSize");
  v42 = v41;
  v44 = v43;
  objc_msgSend((id)objc_msgSend((id)-[CMISmartStyleProcessor configuration](self->_smartStyleProcessor, "configuration"), "styleEngineConfiguration"), "thumbnailSize");
  if (v42 == v46 && v44 == v45)
  {
    v27 = 0;
  }
  else
  {
    v27 = (__CVBuffer *)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_intermediateVideoFormatsByAttachedMediaKeys, "objectForKeyedSubscript:", 0x1E495B398), "newPixelBuffer");
    if (!v27)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v25 = 0;
      sbufa = 0;
      cf = 0;
      v26 = 0;
      a7 = 0;
      goto LABEL_180;
    }
  }
  a7 = (id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_intermediateVideoFormatsByAttachedMediaKeys, "objectForKeyedSubscript:", 0x1E495B3B8), "newPixelBuffer");
  if (!a7
    || (v47 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_intermediateVideoFormatsByAttachedMediaKeys, "objectForKeyedSubscript:", 0x1E495B3F8), "newPixelBuffer")) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v25 = 0;
    sbufa = 0;
    cf = 0;
    v26 = 0;
LABEL_180:
    LOBYTE(ImageBuffer) = 0;
    v18 = (_DWORD *)MEMORY[0x1E0CA1FC0];
LABEL_187:
    v20 = v133;
    goto LABEL_151;
  }
  cf = (__CVBuffer *)v47;
  v134 = (void *)v12;
  CVPixelBufferGetWidth(v33);
  CVPixelBufferGetHeight(v33);
  FigCaptureMetadataUtilitiesDenormalizeCropRect(*(double *)&v158, *((double *)&v158 + 1), *(double *)&v159, *((double *)&v159 + 1));
  v49 = v48;
  v51 = v50;
  v53 = v52;
  v55 = v54;
  v56 = (void *)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities");
  if (v27)
  {
    v148 = v155;
    v149 = v156;
    v150 = v157;
    *(_OWORD *)time = v151;
    *(_OWORD *)&time[16] = v152;
    v146 = v153;
    v147 = v154;
    if (objc_msgSend(v56, "downScalePixelBuffer:toPixelBuffer:inputROI:gdcParams:applyGDC:", v33, v27, time, AttachedMedia, v49, v51, v53, v55))goto LABEL_178;
    v57 = (void *)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities");
    v148 = v155;
    v149 = v156;
    v150 = v157;
    *(_OWORD *)time = v151;
    *(_OWORD *)&time[16] = v152;
    v146 = v153;
    v147 = v154;
    if (objc_msgSend(v57, "downScalePixelBuffer:toPixelBuffer:propagateAttachments:gdcParams:applyGDC:", v27, a7, 1, time, 0))
    {
LABEL_178:
      fig_log_get_emitter();
      FigDebugAssert3();
      v25 = 0;
      sbufa = 0;
      v26 = 0;
LABEL_190:
      LOBYTE(ImageBuffer) = 0;
      v18 = (_DWORD *)MEMORY[0x1E0CA1FC0];
      v20 = v133;
      goto LABEL_151;
    }
  }
  else
  {
    v148 = v155;
    v149 = v156;
    v150 = v157;
    *(_OWORD *)time = v151;
    *(_OWORD *)&time[16] = v152;
    v146 = v153;
    v147 = v154;
    if (objc_msgSend(v56, "downScalePixelBuffer:toPixelBuffer:inputROI:gdcParams:applyGDC:", v33, a7, time, AttachedMedia, v49, v51, v53, v55))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v25 = 0;
      sbufa = 0;
      v26 = 0;
      v27 = 0;
      goto LABEL_190;
    }
  }
  v131 = v27;
  if (v23)
  {
    v58 = AttachedMedia;
    v59 = CMSampleBufferGetImageBuffer(v23);
    v60 = (void *)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities");
    v61 = cf;
    if (objc_msgSend(v60, "createLinearThumbnailFromMetadata:preLTMThumbnailPixelBuffer:postLTMThumbnailPixelBuffer:cameraInfo:applyGDC:cropToPreLTMBounds:toPixelBuffer:", v140, v59, a7, -[NSMutableDictionary objectForKeyedSubscript:](self->_intermediatePixelBufferPoolsByAttachedMediaKeys, "objectForKeyedSubscript:", objc_msgSend(v140, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00])), v138, 1, cf))
    {
LABEL_40:
      v25 = 0;
      sbufa = 0;
      v26 = 0;
      LOBYTE(ImageBuffer) = 0;
      v18 = (_DWORD *)MEMORY[0x1E0CA1FC0];
      v20 = v133;
      v12 = (unint64_t)v134;
      v27 = v131;
      goto LABEL_151;
    }
  }
  else
  {
    v62 = objc_msgSend(v140, "objectForKeyedSubscript:", *MEMORY[0x1E0D06BF0]);
    v63 = (void *)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities");
    if (v62)
    {
      v58 = AttachedMedia;
      v61 = cf;
      if (objc_msgSend(v63, "createLinearThumbnailFromMetadata:postLTMThumbnailPixelBuffer:cameraInfo:applyGDC:cropToPreLTMBounds:toPixelBuffer:", v140, a7, -[NSMutableDictionary objectForKeyedSubscript:](self->_intermediatePixelBufferPoolsByAttachedMediaKeys, "objectForKeyedSubscript:", objc_msgSend(v140, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00])), v138, 0, cf))goto LABEL_40;
    }
    else
    {
      v148 = v155;
      v149 = v156;
      v150 = v157;
      *(_OWORD *)time = v151;
      *(_OWORD *)&time[16] = v152;
      v146 = v153;
      v147 = v154;
      v61 = cf;
      v58 = AttachedMedia;
      if (objc_msgSend(v63, "downScalePixelBuffer:toPixelBuffer:propagateAttachments:gdcParams:applyGDC:", v33, cf, 1, time, AttachedMedia))goto LABEL_40;
    }
  }
  v64 = (const __CFString *)*MEMORY[0x1E0CA8D68];
  v65 = CVBufferCopyAttachment((CVBufferRef)a7, (CFStringRef)*MEMORY[0x1E0CA8D68], 0);
  v66 = (__CVBuffer *)a7;
  v67 = (const __CFString *)*MEMORY[0x1E0CA8EE8];
  v132 = v66;
  v68 = CVBufferCopyAttachment(v66, (CFStringRef)*MEMORY[0x1E0CA8EE8], 0);
  CVBufferSetAttachment(v61, v64, v65, kCVAttachmentMode_ShouldPropagate);
  CVBufferSetAttachment(v61, (CFStringRef)*MEMORY[0x1E0CA8E98], (CFTypeRef)*MEMORY[0x1E0CA8EB8], kCVAttachmentMode_ShouldPropagate);
  CVBufferSetAttachment(v61, v67, v68, kCVAttachmentMode_ShouldPropagate);
  if (v65)
    CFRelease(v65);
  v69 = v130;
  if (v68)
    CFRelease(v68);
  v12 = (unint64_t)v134;
  v27 = v131;
  a7 = v132;
  if (!BYTE6(self->_previousPTS.epoch) || !v134 || !self->_generateImageStats)
  {
    if (!v134)
    {
      v127 = 0;
      v125 = 0;
      v139 = 0;
      v71 = 0;
      v76 = 0;
      ImageBuffer = 0;
      v77 = 0;
      goto LABEL_100;
    }
    v127 = 0;
    ImageBuffer = 0;
    v75 = 0;
    v20 = v133;
LABEL_70:
    if ((v138 & 1) != 0)
      goto LABEL_71;
    goto LABEL_89;
  }
  memset(&timingArrayOut, 0, sizeof(timingArrayOut));
  v26 = (__CVBuffer *)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_intermediateVideoFormatsByAttachedMediaKeys, "objectForKeyedSubscript:", 0x1E495B398), "newPixelBuffer");
  if (!v26)
    goto LABEL_196;
  v70 = (void *)-[CMISmartStyleProcessor utilities](self->_smartStyleProcessor, "utilities");
  v148 = v155;
  v149 = v156;
  v150 = v157;
  *(_OWORD *)time = v151;
  *(_OWORD *)&time[16] = v152;
  v146 = v153;
  v147 = v154;
  if (objc_msgSend(v70, "downScalePixelBuffer:toPixelBuffer:propagateAttachments:gdcParams:applyGDC:", v33, v26, 1, time, v58))
  {
LABEL_196:
    fig_log_get_emitter();
    FigDebugAssert3();
    v18 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    v20 = v133;
LABEL_198:
    v25 = 0;
    sbufa = 0;
    goto LABEL_199;
  }
  -[FigMetalContext waitForSchedule](self->_metalContext, "waitForSchedule");
  v20 = v133;
  if (CMSampleBufferGetSampleTimingInfoArray(a4, 1, &timingArrayOut, 0)
    || (v146 = *(_OWORD *)&timingArrayOut.presentationTimeStamp.timescale,
        v147 = *(_OWORD *)&timingArrayOut.decodeTimeStamp.value,
        *(_QWORD *)&v148 = timingArrayOut.decodeTimeStamp.epoch,
        *(_OWORD *)time = *(_OWORD *)&timingArrayOut.duration.value,
        *(_OWORD *)&time[16] = *(_OWORD *)&timingArrayOut.duration.epoch,
        BWSampleBufferCreateFromPixelBufferWithTimingInfo(v26, (CMSampleTimingInfo *)time, &v161, &v160))
    || !v160)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v18 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    goto LABEL_198;
  }
  BWSampleBufferSetAttachedMedia(target, 0x1E495B398, (uint64_t)v160);
  *(_QWORD *)time = v163;
  *(_QWORD *)&time[8] = __PAIR64__(v133, v164);
  *(_QWORD *)&time[16] = v19;
  v71 = -[BWSmartStyleLearningNode _runInferences:unstyledSampleBuffer:withMasks:currentPTS:](self, "_runInferences:unstyledSampleBuffer:withMasks:currentPTS:", target, a4, v134, time);
  if (!v71)
  {
    fig_log_get_emitter();
    v124 = v8;
    LODWORD(v123) = 0;
    FigDebugAssert3();
  }
  v72 = (id)v71;
  CFRelease(v26);
  if (v161)
  {
    CFRelease(v161);
    v161 = 0;
  }
  if (v160)
  {
    CFRelease(v160);
    v160 = 0;
  }
  if (!v71)
  {
    v127 = 0;
    ImageBuffer = 0;
    v75 = 0;
    goto LABEL_70;
  }
  propagateMasks = self->_propagateMasks;
  if (v138)
  {
    *(_QWORD *)time = v163;
    *(_QWORD *)&time[8] = __PAIR64__(v133, v164);
    *(_QWORD *)&time[16] = v19;
    v74 = -[BWSmartStyleLearningNode _undistortMasks:unstyledSampleBuffer:currentPTS:useIntermediatePools:](self, "_undistortMasks:unstyledSampleBuffer:currentPTS:useIntermediatePools:", v71, a4, time, !propagateMasks, v123, v124);
  }
  else
  {
    if (!self->_propagateMasks)
      goto LABEL_78;
    *(_QWORD *)time = v163;
    *(_QWORD *)&time[8] = __PAIR64__(v133, v164);
    *(_QWORD *)&time[16] = v19;
    v74 = -[BWSmartStyleLearningNode _blitMasksToOutputPools:unstyledSampleBuffer:currentPTS:](self, "_blitMasksToOutputPools:unstyledSampleBuffer:currentPTS:", v71, a4, time);
  }
  v80 = v74;
  if (v74)
  {

    v71 = v80;
  }
LABEL_78:
  v81 = *MEMORY[0x1E0D086D0];
  v82 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend((id)v71, "objectForKeyedSubscript:", *MEMORY[0x1E0D086D0], v123), "objectForKeyedSubscript:", CFSTR("HumanFullBodiesMask"));
  if (!v82)
    goto LABEL_208;
  v127 = CMSampleBufferGetImageBuffer(v82);
  if (!v127)
    goto LABEL_208;
  v83 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend((id)v71, "objectForKeyedSubscript:", v81), "objectForKeyedSubscript:", CFSTR("HumanSkinsMask"));
  if (!v83)
    goto LABEL_208;
  ImageBuffer = CMSampleBufferGetImageBuffer(v83);
  if (ImageBuffer)
  {
    v84 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend((id)v71, "objectForKeyedSubscript:", v81), "objectForKeyedSubscript:", 0x1E495B218);
    if (v84)
    {
      v75 = CMSampleBufferGetImageBuffer(v84);
      if (v75)
      {
        if ((v138 & 1) != 0)
        {
          if (v71)
          {
            v139 = v75;
            v78 = 1;
LABEL_72:
            *(_QWORD *)time = v163;
            *(_QWORD *)&time[8] = __PAIR64__(v20, v164);
            *(_QWORD *)&time[16] = v19;
            v79 = -[BWSmartStyleLearningNode _undistortMasks:unstyledSampleBuffer:currentPTS:useIntermediatePools:](self, "_undistortMasks:unstyledSampleBuffer:currentPTS:useIntermediatePools:", v134, a4, time, v78, v123);
            if (!v79)
            {
LABEL_93:
              v85 = *MEMORY[0x1E0D086D0];
              v86 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend((id)v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D086D0], v123), "objectForKeyedSubscript:", CFSTR("HumanFullBodiesMask"));
              if (v86)
              {
                v87 = CMSampleBufferGetImageBuffer(v86);
                if (v87)
                {
                  v77 = v87;
                  v88 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend((id)v12, "objectForKeyedSubscript:", v85), "objectForKeyedSubscript:", CFSTR("HumanSkinsMask"));
                  if (v88)
                  {
                    v125 = ImageBuffer;
                    ImageBuffer = CMSampleBufferGetImageBuffer(v88);
                    if (!ImageBuffer)
                    {
                      sbufa = (CMSampleBufferRef)v71;
                      fig_log_get_emitter();
                      FigDebugAssert3();
                      v25 = 0;
                      v26 = 0;
LABEL_186:
                      v18 = (_DWORD *)MEMORY[0x1E0CA1FC0];
                      goto LABEL_187;
                    }
                    v89 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend((id)v12, "objectForKeyedSubscript:", v85), "objectForKeyedSubscript:", 0x1E495B218);
                    if (v89)
                    {
                      v90 = CMSampleBufferGetImageBuffer(v89);
                      if (!v90)
                      {
                        sbufa = (CMSampleBufferRef)v71;
                        fig_log_get_emitter();
LABEL_201:
                        FigDebugAssert3();
                        v25 = 0;
LABEL_202:
                        v26 = 0;
LABEL_204:
                        LOBYTE(ImageBuffer) = 0;
                        v18 = (_DWORD *)MEMORY[0x1E0CA1FC0];
                        v20 = v133;
                        goto LABEL_150;
                      }
                      v76 = v90;
LABEL_100:
                      sbufa = (CMSampleBufferRef)v71;
                      if (!HIBYTE(self->_previousPTS.epoch)
                        || !v127
                        || !v77
                        || !-[BWSmartStyleLearningNode _runFalsePositiveRejectionOnPixelBuffer:unrefinedPixelBuffer:](self, "_runFalsePositiveRejectionOnPixelBuffer:unrefinedPixelBuffer:", v127, v77))
                      {
                        if (v71 | v12)
                        {
                          if (!v71)
                            v71 = v12;
                          v91 = *MEMORY[0x1E0D086D0];
                          v26 = (__CVBuffer *)objc_msgSend((id)objc_msgSend((id)v71, "objectForKeyedSubscript:", *MEMORY[0x1E0D086D0]), "objectForKeyedSubscript:", CFSTR("HumanFullBodiesMask"));
                          if (!v26)
                            goto LABEL_203;
                          v135 = v12;
                          v92 = objc_msgSend((id)objc_msgSend((id)v71, "objectForKeyedSubscript:", v91), "objectForKeyedSubscript:", CFSTR("HumanSkinsMask"));
                          if (!v92
                            || (v93 = (const void *)v92,
                                (v94 = objc_msgSend((id)objc_msgSend((id)v71, "objectForKeyedSubscript:", v91), "objectForKeyedSubscript:", 0x1E495B218)) == 0))
                          {
                            fig_log_get_emitter();
                            FigDebugAssert3();
                            v25 = 0;
                            v26 = 0;
                            LOBYTE(ImageBuffer) = 0;
                            v18 = (_DWORD *)MEMORY[0x1E0CA1FC0];
                            v20 = v133;
                            v12 = v135;
LABEL_150:
                            a7 = v132;
                            goto LABEL_151;
                          }
                          v95 = (const void *)v94;
                          os_unfair_lock_lock((os_unfair_lock_t)&self->_lastLearnedROI.size.height);
                          BYTE4(self->_lastLearnedROI.size.height) = 1;
                          v96 = *(const void **)&self->_mostRecentMasksLock._os_unfair_lock_opaque;
                          if (v96)
                            CFRelease(v96);
                          *(_QWORD *)&self->_mostRecentMasksLock._os_unfair_lock_opaque = CFRetain(v26);
                          mostRecentLearnedPersonMaskSampleBuffer = self->_mostRecentLearnedPersonMaskSampleBuffer;
                          if (mostRecentLearnedPersonMaskSampleBuffer)
                            CFRelease(mostRecentLearnedPersonMaskSampleBuffer);
                          self->_mostRecentLearnedPersonMaskSampleBuffer = (opaqueCMSampleBuffer *)CFRetain(v93);
                          mostRecentLearnedSkinMaskSampleBuffer = self->_mostRecentLearnedSkinMaskSampleBuffer;
                          if (mostRecentLearnedSkinMaskSampleBuffer)
                            CFRelease(mostRecentLearnedSkinMaskSampleBuffer);
                          self->_mostRecentLearnedSkinMaskSampleBuffer = (opaqueCMSampleBuffer *)CFRetain(v95);
                          os_unfair_lock_unlock((os_unfair_lock_t)&self->_lastLearnedROI.size.height);
                          v12 = v135;
                          v69 = v130;
                        }
                        if (v128)
                        {
                          if (!-[BWSmartStyleLearningNode _createIdentityCoefficientsFromSampleBuffer:to:](self, "_createIdentityCoefficientsFromSampleBuffer:to:", target, &v162))
                          {
                            v99 = v131;
                            v25 = 0;
LABEL_144:
                            v18 = (_DWORD *)MEMORY[0x1E0CA1FC0];
                            v20 = v133;
                            os_unfair_lock_lock((os_unfair_lock_t)&self->_workQueue);
                            learnedCoefficientsSampleBuffer = self->_learnedCoefficientsSampleBuffer;
                            if (learnedCoefficientsSampleBuffer)
                              CFRelease(learnedCoefficientsSampleBuffer);
                            self->_learnedCoefficientsSampleBuffer = v162;

                            *(_QWORD *)&self->_workQueueLearnCount = v129;
                            if (v25)
                            {
                              v119 = objc_alloc(MEMORY[0x1E0CB37E8]);
                              objc_msgSend(v25, "outputSRLCurveParameter");
                              v120 = (FigCaptureSmartStyle *)objc_msgSend(v119, "initWithFloat:");
                            }
                            else
                            {
                              v120 = 0;
                            }
                            self->_smartStyleLearned = v120;

                            self->_srlCurveParameter = (NSNumber *)(id)objc_msgSend(v25, "outputSRLStats");
                            v121 = v159;
                            *(_OWORD *)&self->_srlStats = v158;
                            *(_OWORD *)&self->_lastLearnedROI.origin.y = v121;
                            os_unfair_lock_unlock((os_unfair_lock_t)&self->_workQueue);
                            v26 = 0;
                            LOBYTE(ImageBuffer) = 1;
                            v27 = v99;
                            goto LABEL_150;
                          }
                          goto LABEL_200;
                        }
                        if (!BYTE4(self->_previousPTS.epoch))
                        {
                          v26 = 0;
                          if (v69)
                            goto LABEL_124;
                          goto LABEL_126;
                        }
                        if (!-[BWSmartStyleLearningNode _createCoefficientsFromSampleBuffer:to:](self, "_createCoefficientsFromSampleBuffer:to:", target, &v162))
                        {
                          v26 = CMSampleBufferGetImageBuffer(v162);
                          if (v26)
                          {
                            if (v69)
                            {
LABEL_124:
                              targeta = CMSampleBufferGetImageBuffer(v69);
LABEL_129:
                              v101 = objc_alloc_init(self->_smartStyleProcessorInputOutputClass);
                              v25 = v101;
                              if (v101)
                              {
                                v102 = v131 ? v131 : v132;
                                objc_msgSend(v101, "setInputUnstyledPixelBuffer:", v102);
                                objc_msgSend(v25, "setInputUnstyledThumbnailPixelBuffer:", v132);
                                objc_msgSend(v25, "setInputLinearPixelBuffer:", cf);
                                objc_msgSend(v25, "setInputMetadataDict:", v140);
                                objc_msgSend(v25, "setInputLinearMetadataDict:", v140);
                                v103 = v127 ? v127 : v77;
                                objc_msgSend(v25, "setInputPersonMaskPixelBuffer:", v103);
                                CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v25, "inputPersonMaskPixelBuffer"));
                                CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v25, "inputPersonMaskPixelBuffer"));
                                FigCaptureMetadataUtilitiesDenormalizeCropRect(*(double *)&v158, *((double *)&v158 + 1), *(double *)&v159, *((double *)&v159 + 1));
                                objc_msgSend(v25, "setInputPersonMaskCropRect:");
                                v104 = v139 ? v139 : v76;
                                objc_msgSend(v25, "setInputSkyMaskPixelBuffer:", v104);
                                CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v25, "inputSkyMaskPixelBuffer"));
                                CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v25, "inputSkyMaskPixelBuffer"));
                                FigCaptureMetadataUtilitiesDenormalizeCropRect(*(double *)&v158, *((double *)&v158 + 1), *(double *)&v159, *((double *)&v159 + 1));
                                objc_msgSend(v25, "setInputSkyMaskCropRect:");
                                v105 = v125 ? v125 : ImageBuffer;
                                objc_msgSend(v25, "setInputSkinMaskPixelBuffer:", v105);
                                CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v25, "inputSkinMaskPixelBuffer"));
                                CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v25, "inputSkinMaskPixelBuffer"));
                                FigCaptureMetadataUtilitiesDenormalizeCropRect(*(double *)&v158, *((double *)&v158 + 1), *(double *)&v159, *((double *)&v159 + 1));
                                objc_msgSend(v25, "setInputSkinMaskCropRect:");
                                objc_msgSend(v25, "setOutputLearnedStyleCoefficientsPixelBuffer:", v26);
                                objc_msgSend(v25, "setInputSmartStyle:", objc_alloc_init(self->_smartStyleClass));
                                objc_msgSend((id)objc_msgSend(v25, "inputSmartStyle"), "setCastType:", objc_msgSend(v129, "cast"));
                                objc_msgSend(v129, "intensity");
                                v107 = v106;
                                v108 = (void *)objc_msgSend(v25, "inputSmartStyle");
                                LODWORD(v109) = v107;
                                objc_msgSend(v108, "setCastIntensity:", v109);
                                objc_msgSend(v129, "toneBias");
                                v111 = v110;
                                v112 = (void *)objc_msgSend(v25, "inputSmartStyle");
                                LODWORD(v113) = v111;
                                objc_msgSend(v112, "setToneBias:", v113);
                                objc_msgSend(v129, "colorBias");
                                v115 = v114;
                                v116 = (void *)objc_msgSend(v25, "inputSmartStyle");
                                LODWORD(v117) = v115;
                                objc_msgSend(v116, "setColorBias:", v117);
                                objc_msgSend(v25, "setInputTuningType:", *MEMORY[0x1E0D08A38]);
                                objc_msgSend(v25, "setInputSRLPixelBuffer:", targeta);
                                os_unfair_lock_lock(&self->_semanticStyleSceneLock);
                                objc_msgSend(v25, "setSemanticStyleSceneType:", self->_semanticStyleSceneType);
                                os_unfair_lock_unlock(&self->_semanticStyleSceneLock);
                                objc_msgSend(v25, "setOutputImageStatistics:", v126);
                                objc_msgSend(v25, "setSubjectRelightingEnabled:", BYTE2(self->_mostRecentLearnedSkyMaskSampleBuffer));
                                -[CMISmartStyleProcessor setInputOutput:](self->_smartStyleProcessor, "setInputOutput:", v25);
                                if (!-[CMISmartStyleProcessor process](self->_smartStyleProcessor, "process"))
                                {
                                  v99 = v131;
                                  -[FigMetalContext waitForSchedule](self->_metalContext, "waitForSchedule");
                                  goto LABEL_144;
                                }
                              }
                              fig_log_get_emitter();
                              FigDebugAssert3();
                              goto LABEL_202;
                            }
LABEL_126:
                            v100 = v132;
                            if (v131)
                              v100 = v131;
                            targeta = v100;
                            goto LABEL_129;
                          }
LABEL_203:
                          fig_log_get_emitter();
                          FigDebugAssert3();
                          v25 = 0;
                          goto LABEL_204;
                        }
                      }
LABEL_200:
                      fig_log_get_emitter();
                      goto LABEL_201;
                    }
                  }
                }
                sbufa = (CMSampleBufferRef)v71;
                fig_log_get_emitter();
                FigDebugAssert3();
                v25 = 0;
                v26 = 0;
                LOBYTE(ImageBuffer) = 0;
                goto LABEL_186;
              }
              goto LABEL_208;
            }
            goto LABEL_91;
          }
LABEL_71:
          v139 = v75;
          v71 = 0;
          v78 = !self->_propagateMasks;
          goto LABEL_72;
        }
        if (v71)
        {
          v139 = v75;
          goto LABEL_93;
        }
LABEL_89:
        v139 = v75;
        if (!self->_propagateMasks)
        {
          v71 = 0;
          goto LABEL_93;
        }
        *(_QWORD *)time = v163;
        *(_QWORD *)&time[8] = __PAIR64__(v20, v164);
        *(_QWORD *)&time[16] = v19;
        v79 = -[BWSmartStyleLearningNode _blitMasksToOutputPools:unstyledSampleBuffer:currentPTS:](self, "_blitMasksToOutputPools:unstyledSampleBuffer:currentPTS:", v134, a4, time);
        v71 = 0;
        if (!v79)
          goto LABEL_93;
LABEL_91:

        v12 = (unint64_t)v79;
        goto LABEL_93;
      }
    }
LABEL_208:
    sbufa = (CMSampleBufferRef)v71;
    fig_log_get_emitter();
    FigDebugAssert3();
    v25 = 0;
    v26 = 0;
    LOBYTE(ImageBuffer) = 0;
    goto LABEL_209;
  }
  sbufa = (CMSampleBufferRef)v71;
  fig_log_get_emitter();
  FigDebugAssert3();
  v25 = 0;
  v26 = 0;
LABEL_209:
  v18 = (_DWORD *)MEMORY[0x1E0CA1FC0];
LABEL_151:
  if (v161)
    CFRelease(v161);
  if (v160)
    CFRelease(v160);
  if (v26)
    CFRelease(v26);
  if (a7)
    CFRelease(a7);
  if (v27)
    CFRelease(v27);
  if (cf)
    CFRelease(cf);

  if ((ImageBuffer & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&self->_workQueue);
    v122 = self->_learnedCoefficientsSampleBuffer;
    if (v122)
    {
      CFRelease(v122);
      self->_learnedCoefficientsSampleBuffer = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&self->_workQueue);
  }
  if (*v18 == 1)
  {
    *(_QWORD *)time = v163;
    *(_QWORD *)&time[8] = __PAIR64__(v20, v164);
    *(_QWORD *)&time[16] = v19;
    CMTimeGetSeconds((CMTime *)time);
    kdebug_trace();
  }
}

- (void)_asynchronouslySignalEvent:(id)a3
{
  void *v5;
  void *v6;

  v5 = (void *)-[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "setLabel:", CFSTR("asynchronouslySignalEvent"));
    objc_msgSend(v6, "encodeSignalEvent:value:", a3, 1);
    -[FigMetalContext forceCommit](self->_metalContext, "forceCommit");
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (id)inputInferenceVideoFormatForAttachedMediaKey:(id)a3
{
  return 0;
}

- (id)inputVideoFormatForAttachedMediaKey:(id)a3
{
  return (id)-[BWVideoFormat objectForKeyedSubscript:](self->_anstMaskVideoFormat, "objectForKeyedSubscript:", a3);
}

- (BOOL)intermediateResourceTrackingAllowedForAttachedMediaKey:(id)a3
{
  return 0;
}

- (id)outputVideoFormatForAttachedMediaKey:(id)a3
{
  return (id)-[BWVideoFormat objectForKeyedSubscript:](self->_anstMaskVideoFormat, "objectForKeyedSubscript:", a3);
}

- (id)preparedOutputPixelBufferPoolForAttachedMediaKey:(id)a3 format:(id)a4
{
  __CFString **v6;

  if ((objc_msgSend(a3, "isEqualToString:", 0x1E4951798, a4) & 1) != 0)
  {
    v6 = BWAttachedMediaKey_HumanFullBodiesMask;
    return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_intermediateVideoFormatsByAttachedMediaKeys, "objectForKeyedSubscript:", *v6);
  }
  if ((objc_msgSend(a3, "isEqualToString:", 0x1E49517D8) & 1) != 0)
  {
    v6 = BWAttachedMediaKey_HumanSkinsMask;
    return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_intermediateVideoFormatsByAttachedMediaKeys, "objectForKeyedSubscript:", *v6);
  }
  if (objc_msgSend(a3, "isEqualToString:", 0x1E49517B8))
  {
    v6 = BWAttachedMediaKey_HumanHairMask;
    return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_intermediateVideoFormatsByAttachedMediaKeys, "objectForKeyedSubscript:", *v6);
  }
  return 0;
}

- (void)semanticStyleSceneTypeDidChange:(int)a3
{
  os_unfair_lock_s *p_semanticStyleSceneLock;

  p_semanticStyleSceneLock = &self->_semanticStyleSceneLock;
  os_unfair_lock_lock(&self->_semanticStyleSceneLock);
  self->_semanticStyleSceneType = a3;
  os_unfair_lock_unlock(p_semanticStyleSceneLock);
}

- (FigCaptureSmartStyle)smartStyle
{
  return *(FigCaptureSmartStyle **)&self->_bypassStyleEngineForStandardStyle;
}

- (BOOL)disableWaitForCoefficientsOnFirstFrame
{
  return BYTE1(self->_mostRecentLearnedSkyMaskSampleBuffer);
}

- (BOOL)subjectRelightingEnabled
{
  return BYTE2(self->_mostRecentLearnedSkyMaskSampleBuffer);
}

@end

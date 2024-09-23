@implementation BWDeepFusionProcessorController

- (BWDeepFusionProcessorController)initWithConfiguration:(id)a3
{
  BWDeepFusionProcessorController *v4;
  FigStateMachine *v5;
  uint64_t v6;
  void *v7;
  int SetupAndPrepareDeepFusion;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BWDeepFusionProcessorController;
  v4 = -[BWDeepFusionProcessorController init](&v10, sel_init);
  if (v4)
  {
    if (!objc_msgSend((id)objc_msgSend(a3, "sensorConfigurationsByPortType"), "count")
      || !FigCaptureVideoDimensionsAreValid(objc_msgSend(a3, "maxInputDimensions"))
      || !FigCaptureVideoDimensionsAreValid(objc_msgSend(a3, "maxOutputDimensions")))
    {
      FigDebugAssert3();
      goto LABEL_6;
    }
    v4->_configuration = (BWDeepFusionProcessorControllerConfiguration *)a3;
    v4->_requestQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = -[FigStateMachine initWithLabel:stateCount:initialState:owner:]([FigStateMachine alloc], "initWithLabel:stateCount:initialState:owner:", CFSTR("BWDeepFusionProcessorController state machine"), (char)+[FigStateMachine indexForState:](FigStateMachine, "indexForState:", 32), 1, v4);
    -[FigStateMachine setPerformsAtomicStateTransitions:](v5, "setPerformsAtomicStateTransitions:", 0);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("Idle"), 1);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("Ready"), 2);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("Caching"), 4);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("Waiting"), 8);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("Processing"), 16);
    -[FigStateMachine whenTransitioningToStates:callHandler:](v5, "whenTransitioningToStates:callHandler:", 0xFFFFFFFFLL, &__block_literal_global_436);
    -[FigStateMachine whenTransitioningToStates:callHandler:](v5, "whenTransitioningToStates:callHandler:", 1, &__block_literal_global_438);
    -[FigStateMachine whenTransitioningToStates:callHandler:](v5, "whenTransitioningToStates:callHandler:", 2, &__block_literal_global_439);
    -[FigStateMachine whenTransitioningToState:callHandler:](v5, "whenTransitioningToState:callHandler:", 8, &__block_literal_global_440);
    -[FigStateMachine whenTransitioningToState:callHandler:](v5, "whenTransitioningToState:callHandler:", 8, &__block_literal_global_441);
    v6 = -[FigStateMachine whenTransitioningToState:callHandler:](v5, "whenTransitioningToState:callHandler:", 16, &__block_literal_global_442);
    v4->_stateMachine = v5;
    v4->_processorVersion = -1;
    v7 = (void *)MEMORY[0x1A858DD40](v6);
    SetupAndPrepareDeepFusion = -[BWDeepFusionProcessorController _loadSetupAndPrepareDeepFusionProcessor]((uint64_t)v4);
    objc_autoreleasePoolPop(v7);
    if (SetupAndPrepareDeepFusion)
    {
LABEL_6:

      return 0;
    }
  }
  return v4;
}

- (uint64_t)_loadSetupAndPrepareDeepFusionProcessor
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  id obj;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (!a1 || *(_QWORD *)(a1 + 88))
    return 0;
  v28 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v32 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v33 = (void *)v3;
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("DefaultSensorIDs"));
  v31 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = (id)objc_msgSend(*(id *)(a1 + 56), "sensorConfigurationsByPortType");
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (!v4)
  {
    v29 = 0;
LABEL_27:
    if (!objc_msgSend(v2, "count"))
    {
      v26 = v27;
      LODWORD(v25) = 0;
      FigDebugAssert3();
    }
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v2, *MEMORY[0x1E0D06188], v25, v26);
    v16 = &OBJC_IVAR___BWFigVideoCaptureDevice__numAPSStatisticsSamples;
    if (objc_msgSend(v32, "count"))
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0D06140]);
    *(_QWORD *)(a1 + 64) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithSet:", v31);
    v17 = BWLoadProcessorBundle((uint64_t)v29, *(unsigned int *)(a1 + 80));
    if (!v17)
    {
      FigDebugAssert3();
      return 0;
    }
    v18 = v17;
    v19 = objc_msgSend(v17, "classNamed:", CFSTR("DeepFusionOutput"));
    *(_QWORD *)(a1 + 104) = v19;
    if (!v19)
      goto LABEL_44;
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D08B28]), "initWithbundle:andOptionalCommandQueue:", v18, objc_msgSend(*(id *)(a1 + 56), "metalCommandQueue"));
    *(_QWORD *)(a1 + 88) = objc_msgSend(objc_alloc((Class)objc_msgSend(v18, "classNamed:", CFSTR("DeepFusionProcessor"))), "initWithContext:", v20);

    if (!*(_QWORD *)(a1 + 88))
      goto LABEL_44;
    if (objc_msgSend(*(id *)(a1 + 56), "quadraSupportEnabled"))
      objc_msgSend(v28, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D08640]);
    v21 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[FigCaptureCameraParameters deviceGeneration](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "deviceGeneration"));
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D08630]);
    v22 = objc_msgSend(*(id *)(a1 + 88), "setupWithOptions:", v28);
    if ((_DWORD)v22)
    {
      v15 = v22;
      goto LABEL_41;
    }
    v23 = objc_alloc_init((Class)objc_msgSend(v18, "classNamed:", CFSTR("DeepFusionPrepareDescriptor")));
    *(_QWORD *)(a1 + 96) = v23;
    if (v23)
    {
      objc_msgSend(*(id *)(a1 + 96), "setWidth:", objc_msgSend(*(id *)(a1 + 56), "maxOutputDimensions"));
      objc_msgSend(*(id *)(a1 + 96), "setHeight:", (unint64_t)objc_msgSend(*(id *)(a1 + 56), "maxOutputDimensions") >> 32);
      objc_msgSend(*(id *)(a1 + 96), "setCmiResourceEnabled:", objc_msgSend(*(id *)(a1 + 56), "cmiResourceEnabled"));
      if ((objc_msgSend(*(id *)(a1 + 56), "delayPrepareAndCacheBuffers") & 1) != 0)
        return 0;
      v15 = objc_msgSend(*(id *)(a1 + 88), "prepareToProcess:prepareDescriptor:", 0, *(_QWORD *)(a1 + 96));
      if (!(_DWORD)v15)
        return v15;
    }
    else
    {
LABEL_44:
      v15 = 4294954510;
    }
LABEL_41:

    *(_QWORD *)(a1 + v16[716]) = 0;
    *(_QWORD *)(a1 + 96) = 0;
    return v15;
  }
  v5 = v4;
  v29 = 0;
  v34 = *(_QWORD *)v36;
LABEL_5:
  v6 = 0;
  while (1)
  {
    if (*(_QWORD *)v36 != v34)
      objc_enumerationMutation(obj);
    v7 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v6));
    v8 = objc_msgSend((id)objc_msgSend(v7, "sensorIDDictionary"), "objectForKeyedSubscript:", CFSTR("DeepFusionParameters"));
    if (!v8)
      goto LABEL_21;
    v9 = v8;
    objc_msgSend(v33, "setObject:forKeyedSubscript:", objc_msgSend(v7, "sensorIDString"), objc_msgSend(v7, "portType"));
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("DeepFusionParameters"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v7, "sensorIDDictionary"), "objectForKeyedSubscript:", CFSTR("ModuleConfig")), CFSTR("ModuleConfig"));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v7, "sensorIDDictionary"), "objectForKeyedSubscript:", CFSTR("SoftISPTuning")), CFSTR("SoftISPTuning"));
    v11 = objc_msgSend(*(id *)(a1 + 56), "stillImageFusionScheme");
    if (v11 - 4 < 2)
    {
      *(_DWORD *)(a1 + 80) = -[FigCaptureCameraParameters nrfVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "nrfVersion");
      if (!*(_DWORD *)(a1 + 80))
      {
        FigDebugAssert3();
        v15 = 4294954510;
        v16 = &OBJC_IVAR___BWFigVideoCaptureDevice__numAPSStatisticsSamples;
        goto LABEL_41;
      }
      objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "sensorIDDictionary"), "objectForKeyedSubscript:", CFSTR("NRFParameters")), "objectForKeyedSubscript:", CFSTR("NRFParameters")), CFSTR("NRFParameters"));
      v29 = CFSTR("NRF");
      goto LABEL_18;
    }
    if (v11 == 3)
    {
      v12 = objc_msgSend((id)objc_msgSend(v7, "sensorIDDictionary"), "objectForKeyedSubscript:", CFSTR("UBParameters"));
      if (v12)
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("UBParameters"));
      v29 = CFSTR("UB");
      goto LABEL_18;
    }
    if (v11 < 3)
      break;
LABEL_18:
    v13 = objc_msgSend((id)objc_msgSend(v7, "sensorIDDictionary"), "objectForKeyedSubscript:", CFSTR("ChromaticDefringing"));
    if (v13)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("ChromaticDefringing"));
    v39 = objc_msgSend(v7, "sensorIDString");
    v40 = v10;
    objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1), objc_msgSend(v7, "portType"));
    objc_msgSend(v32, "setObject:forKeyedSubscript:", objc_msgSend(v7, "cameraInfo"), objc_msgSend(v7, "portType"));
    objc_msgSend(v31, "addObject:", objc_msgSend(v7, "portType"));
LABEL_21:
    if (v5 == ++v6)
    {
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      if (v5)
        goto LABEL_5;
      goto LABEL_27;
    }
  }
  v14 = FigSignalErrorAt();
  v15 = v14;
  v16 = &OBJC_IVAR___BWFigVideoCaptureDevice__numAPSStatisticsSamples;
  if ((_DWORD)v14)
    goto LABEL_41;
  return v15;
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

- (void)dealloc
{
  opaqueCMFormatDescription *outputFormatDescription;
  opaqueCMFormatDescription *quadraForEnhancedResolutionOutputFormatDescription;
  opaqueCMFormatDescription *inferenceInputFormatDescription;
  opaqueCMFormatDescription *demosaicedRawFormatDescription;
  opaqueCMFormatDescription *smartStyleStillLinearImageFormatDescription;
  opaqueCMFormatDescription *inferenceAttachedMediaFormatDescription;
  opaqueCMFormatDescription *gainMapFormatDescription;
  objc_super v10;

  -[BWDeepFusionProcessorController _resetProcessor]((uint64_t)self);

  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
    CFRelease(outputFormatDescription);
  quadraForEnhancedResolutionOutputFormatDescription = self->_quadraForEnhancedResolutionOutputFormatDescription;
  if (quadraForEnhancedResolutionOutputFormatDescription)
    CFRelease(quadraForEnhancedResolutionOutputFormatDescription);
  inferenceInputFormatDescription = self->_inferenceInputFormatDescription;
  if (inferenceInputFormatDescription)
    CFRelease(inferenceInputFormatDescription);
  demosaicedRawFormatDescription = self->_demosaicedRawFormatDescription;
  if (demosaicedRawFormatDescription)
    CFRelease(demosaicedRawFormatDescription);
  smartStyleStillLinearImageFormatDescription = self->_smartStyleStillLinearImageFormatDescription;
  if (smartStyleStillLinearImageFormatDescription)
    CFRelease(smartStyleStillLinearImageFormatDescription);
  inferenceAttachedMediaFormatDescription = self->_inferenceAttachedMediaFormatDescription;
  if (inferenceAttachedMediaFormatDescription)
    CFRelease(inferenceAttachedMediaFormatDescription);
  gainMapFormatDescription = self->_gainMapFormatDescription;
  if (gainMapFormatDescription)
    CFRelease(gainMapFormatDescription);

  v10.receiver = self;
  v10.super_class = (Class)BWDeepFusionProcessorController;
  -[BWStillImageProcessorController dealloc](&v10, sel_dealloc);
}

- (uint64_t)_resetProcessor
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 88), "setOutput:", 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(v1 + 88), "setDelegate:", 0);
    return objc_msgSend(*(id *)(v1 + 88), "resetState");
  }
  return result;
}

- (unint64_t)type
{
  return 2;
}

- (void)input:(id)a3 addInputBuffer:(id)a4
{
  if (-[BWDeepFusionProcessorRequest input](self->_currentRequest, "input") == a3
    && !-[BWDeepFusionProcessorRequest cacheBuffers](self->_currentRequest, "cacheBuffers")
    && !-[BWDeepFusionProcessorInput onlyApplyingSemanticStyle](-[BWDeepFusionProcessorRequest input](self->_currentRequest, "input"), "onlyApplyingSemanticStyle"))
  {
    -[BWDeepFusionProcessorRequest delegate](self->_currentRequest, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[BWDeepFusionProcessorControllerDelegate processorController:willAddBuffer:metadata:bufferType:processorInput:](-[BWDeepFusionProcessorRequest delegate](self->_currentRequest, "delegate"), "processorController:willAddBuffer:metadata:bufferType:processorInput:", self, objc_msgSend(a4, "buffer"), objc_msgSend(a4, "metadata"), objc_msgSend(a4, "type"), a3);
    dfp_addBuffer(self->_deepFusionProcessor, self->_currentRequest, a4);
  }
  -[BWDeepFusionProcessorController _updateStateIfNeeded]((uint64_t)self);
}

- (uint64_t)_updateStateIfNeeded
{
  uint64_t v1;
  _QWORD *v2;
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  if (result)
  {
    v1 = result;
    v2 = *(_QWORD **)(result + 176);
    v3 = objc_msgSend(*(id *)(result + 72), "currentState");
    if (v2)
    {
      if (v3 == 8)
      {
        if (!-[BWDeepFusionProcessorRequest receivedAllBuffers]((uint64_t)v2))
          goto LABEL_21;
        v5 = objc_msgSend((id)objc_msgSend(v2, "input"), "onlyApplyingSemanticStyle");
        v6 = v2[1];
        if (v5)
        {
          v4 = 8;
          if (v6)
          {
            if (*(_BYTE *)(v6 + 88))
              v4 = 16;
            else
              v4 = 8;
          }
          goto LABEL_22;
        }
        if (v6 && *(_BYTE *)(v6 + 88)
          || objc_msgSend((id)objc_msgSend(v2, "input"), "processInferenceInputImage"))
        {
          v4 = 16;
        }
        else
        {
LABEL_21:
          v4 = 8;
        }
      }
      else if (v3 == 4 || v3 == 2)
      {
        if (objc_msgSend(v2, "cacheBuffers"))
          v4 = 4;
        else
          v4 = 8;
      }
      else
      {
        v4 = 2;
      }
    }
    else
    {
      v4 = 1;
    }
LABEL_22:
    result = objc_msgSend(*(id *)(v1 + 72), "currentState");
    if ((_DWORD)v4 != (_DWORD)result)
      return objc_msgSend(*(id *)(v1 + 72), "transitionToState:", v4);
  }
  return result;
}

- (void)addInferencesForInput:(id)a3
{
  if (-[BWDeepFusionProcessorRequest input](self->_currentRequest, "input") == a3
    && !-[BWDeepFusionProcessorRequest cacheBuffers](self->_currentRequest, "cacheBuffers")
    && (objc_msgSend(a3, "processInferenceInputImage") & 1) == 0)
  {
    -[IBPDeepFusionProcessor addInferenceResults:inferenceInputType:](self->_deepFusionProcessor, "addInferenceResults:inferenceInputType:", -[BWDeepFusionProcessorController processorGetInferenceResults:inferenceInputBufferType:](self, "processorGetInferenceResults:inferenceInputBufferType:", 0, 10), 10);
  }
  -[BWDeepFusionProcessorController _updateStateIfNeeded]((uint64_t)self);
}

- (void)beginProcessingCachedBuffersForInput:(id)a3
{
  if (-[BWDeepFusionProcessorRequest input](self->_currentRequest, "input") == a3)
    -[BWDeepFusionProcessorRequest setCacheBuffers:](self->_currentRequest, "setCacheBuffers:", 0);
  if (-[FigStateMachine currentState](self->_stateMachine, "currentState") != 16)
    -[BWDeepFusionProcessorController _updateStateIfNeeded]((uint64_t)self);
}

- (int)enqueueInputForProcessing:(id)a3 delegate:(id)a4
{
  id v7;
  uint64_t v8;

  if (!-[NSSet containsObject:](self->_supportedPortTypes, "containsObject:", objc_msgSend(a3, "portType")))
    return -12780;
  v7 = -[BWDeepFusionProcessorRequest initWithInput:delegate:]([BWDeepFusionProcessorRequest alloc], a3, a4);
  if (-[BWDeepFusionProcessorControllerConfiguration delayPrepareAndCacheBuffers](self->_configuration, "delayPrepareAndCacheBuffers"))
  {
    v8 = objc_msgSend(a3, "onlyApplyingSemanticStyle") ^ 1;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v7, "setCacheBuffers:", v8);
  -[NSMutableArray addObject:](self->_requestQueue, "addObject:", v7);

  if (-[FigStateMachine currentState](self->_stateMachine, "currentState") == 1)
    -[FigStateMachine transitionToState:](self->_stateMachine, "transitionToState:", 2);
  return 0;
}

- (void)cancelProcessing
{
  -[NSMutableArray removeAllObjects](self->_requestQueue, "removeAllObjects");
  -[BWDeepFusionProcessorRequest setErr:](self->_currentRequest, "setErr:", 4294950490);
  -[BWDeepFusionProcessorController _serviceNextRequest]((id *)&self->super.super.isa);
  -[BWDeepFusionProcessorController _resetProcessor]((uint64_t)self);
  -[BWDeepFusionProcessorController _updateStateIfNeeded]((uint64_t)self);
}

- (id)_serviceNextRequest
{
  id *v1;
  id v2;
  id v3;
  uint64_t v4;

  if (result)
  {
    v1 = result;
    v2 = (id)objc_msgSend(result[22], "delegate");
    v3 = (id)objc_msgSend(v1[22], "input");
    v4 = objc_msgSend(v1[22], "err");

    v1[22] = 0;
    objc_msgSend(v2, "processorController:didFinishProcessingInput:err:", v1, v3, v4);

    result = (id *)(id)objc_msgSend(v1[21], "firstObject");
    v1[22] = result;
    if (result)
    {
      objc_msgSend(v1[21], "removeObjectAtIndex:", 0);
      return (id *)objc_msgSend((id)objc_msgSend(v1[22], "input"), "setDelegate:", v1);
    }
  }
  return result;
}

- (id)metalImageBufferProcessor
{
  return self->_deepFusionProcessor;
}

- (id)externalMemoryDescriptor
{
  return (id)-[IBPDeepFusionProcessor externalMemoryDescriptorForConfiguration:](self->_deepFusionProcessor, "externalMemoryDescriptorForConfiguration:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D08A80]), "initWithMaxInputDimensions:inputPixelFormat:maxOutputDimensions:cmiResourceEnabled:processorSpecificOptions:", -[BWDeepFusionProcessorControllerConfiguration maxInputDimensions](self->_configuration, "maxInputDimensions"), 0, -[BWDeepFusionProcessorControllerConfiguration maxOutputDimensions](self->_configuration, "maxOutputDimensions"), -[BWDeepFusionProcessorControllerConfiguration cmiResourceEnabled](self->_configuration, "cmiResourceEnabled"), 0));
}

- (uint64_t)_setupProcessor
{
  uint64_t v1;
  int *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const void *v8;
  const void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  const void *v14;
  uint64_t v15;
  int v16;
  int v17;
  unsigned int v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  __CVBuffer *v22;
  uint64_t v23;
  __CVBuffer *v24;
  uint64_t v25;
  const void *v26;
  int *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int *v41;
  void *v42;
  uint64_t v43;
  int *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE *v50;
  id obj;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v1 = result;
  v2 = &OBJC_IVAR___BWFigVideoCaptureDevice__numAPSStatisticsSamples;
  v3 = (void *)objc_msgSend(*(id *)(result + 176), "input");
  v4 = objc_alloc_init(*(Class *)(v1 + 104));
  if (!v4)
    goto LABEL_70;
  v5 = v4;
  v6 = objc_msgSend(*(id *)(v1 + 176), "output");
  objc_msgSend(*(id *)(v1 + 176), "setOutput:", v5);

  v7 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:", v1, v3, 13);
  if (!v7)
    goto LABEL_70;
  v8 = (const void *)v7;
  objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "output"), "setBuffer:", v7);
  CFRelease(v8);
  objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "output"), "setMetadata:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"));
  if (objc_msgSend((id)objc_msgSend(v3, "processingSettings"), "provideDemosaicedRaw"))
  {
    v9 = (const void *)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:", v1, v3, 21);
    v10 = *(void **)(v1 + 176);
    if (v9)
    {
      objc_msgSend(v10, "output");
      v11 = objc_opt_respondsToSelector();
      v12 = *(void **)(v1 + 176);
      if ((v11 & 1) != 0)
      {
        objc_msgSend((id)objc_msgSend(v12, "output"), "setLinearOutputPixelBuffer:", v9);
        objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "output"), "setLinearOutputMetadata:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"));
      }
      else
      {
        objc_msgSend(v12, "setDemosaicedRawErr:", 4294954516);
      }
      CFRelease(v9);
    }
    else
    {
      objc_msgSend(v10, "setDemosaicedRawErr:", 4294954510);
    }
  }
  if (objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "input"), "processSmartStyleRenderingInput"))
  {
    v13 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:", v1, v3, 41);
    if (!v13)
      goto LABEL_70;
    v14 = (const void *)v13;
    objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "output"), "setLinearOutputMIWBAppliedPixelBuffer:", v13);
    objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "output"), "setLinearOutputMIWBAppliedMetadata:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"));
    CFRelease(v14);
  }
  v15 = objc_msgSend((id)objc_msgSend(v3, "captureStreamSettings"), "captureFlags");
  v16 = v15;
  if ((v15 & 0x10) != 0)
    v17 = 3;
  else
    v17 = 1;
  if ((v15 & 0x200000000) != 0)
    v18 = 2;
  else
    v18 = v17;
  v19 = (v15 & 4) != 0 && (v15 & 0x200000000) != 0;
  if ((v15 & 4) != 0)
    v20 = v18;
  else
    v20 = 0;
  if (objc_msgSend(v3, "processInferenceInputImage"))
  {
    v21 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:", v1, v3, 15);
    if (!v21)
      goto LABEL_70;
    v22 = (__CVBuffer *)v21;
    objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "output"), "setInferenceInputPixelBuffer:", v21);
    CVPixelBufferRelease(v22);
  }
  if ((v19 & objc_msgSend(v3, "processQuadraForEnhancedResolutionInferenceInputImage")) == 1)
  {
    objc_msgSend(*(id *)(v1 + 176), "output");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v23 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:", v1, v3, 36);
      if (!v23)
        goto LABEL_70;
      v24 = (__CVBuffer *)v23;
      objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "output"), "setQuadraForEnhancedResInferenceInputPixelBuffer:", v23);
      CVPixelBufferRelease(v24);
    }
  }
  if (v19)
  {
    objc_msgSend(*(id *)(v1 + 176), "output");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v25 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:", v1, v3, 30);
      if (v25)
      {
        v26 = (const void *)v25;
        objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "output"), "setQuadraForEnhancedResOutputPixelBuffer:", v25);
        CFRelease(v26);
        objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "output"), "setQuadraForEnhancedResOutputMetadata:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"));
        goto LABEL_37;
      }
LABEL_70:
      v49 = 4294954510;
LABEL_71:
      objc_msgSend(*(id *)(v1 + 176), "setErr:", v49);
      return -[BWDeepFusionProcessorController _resetProcessor](v1);
    }
  }
LABEL_37:
  v27 = &OBJC_IVAR___BWFigVideoCaptureDevice__numAPSStatisticsSamples;
  objc_msgSend(*(id *)(v1 + 88), "setProcessingMode:", v20);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((v16 & 0x100000) != 0)
    {
      if ((v16 & 0x1800) == 0x800)
      {
        v28 = 1;
      }
      else
      {
        v29 = objc_msgSend(v3, "fusionMode");
        if (v29 == 2)
          v28 = 2;
        else
          v28 = v29 == 1;
      }
    }
    else
    {
      v28 = 0;
    }
    objc_msgSend(*(id *)(v1 + 88), "setFusionMode:", v28);
  }
  objc_msgSend(v3, "settings");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_51;
  v30 = objc_msgSend((id)objc_msgSend(v3, "settings"), "semanticStyle");
  v31 = !v19;
  if (!v30)
    v31 = 1;
  if ((v31 & 1) != 0 || objc_msgSend((id)objc_msgSend(v3, "captureSettings"), "learnedNRStereoPhotoFrameFlag"))
LABEL_51:
    -[BWDeepFusionProcessorController _addSemanticStylePropertiesIfAvailable](v1);
  objc_msgSend(*(id *)(v1 + 88), "setOutput:", objc_msgSend(*(id *)(v1 + 176), "output"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(v1 + 88), "setDelegate:", v1);
  objc_msgSend(*(id *)(v1 + 96), "setCmiResourceEnabled:", objc_msgSend(*(id *)(v1 + 56), "cmiResourceEnabled"));
  if (!v6)
  {
    v32 = objc_msgSend(*(id *)(v1 + 88), "prepareToProcess:prepareDescriptor:", 0, *(_QWORD *)(v1 + 96));
    if ((_DWORD)v32)
    {
      v49 = v32;
      goto LABEL_71;
    }
  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = v3;
  obj = (id)objc_msgSend(v3, "inputBuffers");
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v53 != v35)
          objc_enumerationMutation(obj);
        v37 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_msgSend(*(id *)(v1 + v2[726]), "delegate");
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v38 = objc_msgSend(*(id *)(v1 + v2[726]), "delegate");
          v39 = v35;
          v40 = v1;
          v41 = v27;
          v42 = (void *)v38;
          v43 = objc_msgSend(v37, "buffer");
          v44 = v2;
          v45 = objc_msgSend(v37, "metadata");
          v46 = objc_msgSend(v37, "type");
          v47 = v42;
          v27 = v41;
          v1 = v40;
          v35 = v39;
          v48 = v45;
          v2 = v44;
          objc_msgSend(v47, "processorController:willAddBuffer:metadata:bufferType:processorInput:", v1, v43, v48, v46, v50);
        }
        dfp_addBuffer(*(void **)(v1 + v27[716]), *(void **)(v1 + v2[726]), v37);
      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    }
    while (v34);
  }
  result = objc_msgSend(v50, "processInferenceInputImage");
  if ((result & 1) == 0 && v50)
  {
    if (v50[88])
      return objc_msgSend(*(id *)(v1 + v27[716]), "addInferenceResults:inferenceInputType:", objc_msgSend((id)v1, "processorGetInferenceResults:inferenceInputBufferType:", 0, 10), 10);
  }
  return result;
}

- (uint64_t)_addSemanticStylePropertiesIfAvailable
{
  uint64_t v1;
  uint64_t v2;
  BWStillImageSemanticStyle *v3;

  if (result)
  {
    v1 = result;
    objc_msgSend((id)objc_msgSend(*(id *)(result + 176), "input"), "settings");
    objc_opt_class();
    result = objc_opt_isKindOfClass();
    if ((result & 1) != 0)
    {
      v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "input"), "settings"), "semanticStyle");
      if (v2)
        v3 = -[BWStillImageSemanticStyle initWithSemanticStyle:]([BWStillImageSemanticStyle alloc], "initWithSemanticStyle:", v2);
      else
        v3 = 0;
      return objc_msgSend(*(id *)(v1 + 88), "setSemanticStyleProperties:", v3);
    }
  }
  return result;
}

- (uint64_t)_setupProcessorForOnlyApplyingSemanticStyle
{
  id *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (result)
  {
    v1 = (id *)result;
    v2 = objc_msgSend(*(id *)(result + 176), "input");
    if (v2 && *(_BYTE *)(v2 + 88))
    {
      v3 = objc_msgSend(v1, "processorGetInferenceResults:inferenceInputBufferType:", 0, 10);
      if (!v3)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        objc_msgSend(v1[22], "setErr:", 4294954516);
        return -[BWDeepFusionProcessorController _resetProcessor]((uint64_t)v1);
      }
      objc_msgSend(v1[11], "addInferenceResults:inferenceInputType:", v3, 10);
    }
    -[BWDeepFusionProcessorController _addSemanticStylePropertiesIfAvailable]((uint64_t)v1);
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(v1[11], "setDelegate:", v1);
  }
  return result;
}

- (void)_process
{
  void *v2;
  unsigned __int8 v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v9;
  uint64_t AttachedMedia;
  uint64_t v11;
  __CVBuffer *v12;
  NSObject *v13;
  id v14;
  __CVBuffer *v15;
  const __CFString *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  const void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  BWInferenceResult *v34;
  __CVBuffer *v35;
  uint64_t v36;
  void *v37;
  unint64_t v38;
  double *v39;
  __int128 v40;
  uint64_t v41;
  CGFloat v42;
  CGFloat v43;
  NSObject *v44;
  int v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const __CFString *v55;
  id v56;
  uint64_t v57;
  void *v58;
  unsigned __int8 v59;
  CMAttachmentBearerRef cf;
  CMTime v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[3];
  os_log_type_t type;
  CMAttachmentBearerRef target;
  CMTime v69;
  _QWORD v70[2];
  _QWORD v71[2];
  _BYTE v72[128];
  __int128 v73;
  CGFloat v74[15];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v2 = (void *)objc_msgSend(*(id *)(a1 + 176), "input");
  target = 0;
  if (objc_msgSend(*(id *)(a1 + 176), "err"))
  {
    v14 = 0;
    goto LABEL_61;
  }
  objc_msgSend(*(id *)(a1 + 176), "output");
  v3 = objc_opt_respondsToSelector();
  v4 = objc_msgSend((id)objc_msgSend(v2, "captureStreamSettings"), "captureFlags");
  v5 = 0;
  v59 = v3;
  v6 = 0;
  if ((v4 & 0x200000000) != 0 && (v3 & 1) != 0)
  {
    v7 = objc_msgSend((id)objc_msgSend(v2, "inputBuffers"), "indexOfObjectPassingTest:", &__block_literal_global_110);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      LODWORD(cf) = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v5 = 0;
      v6 = 0;
    }
    else
    {
      v9 = (void *)objc_msgSend((id)objc_msgSend(v2, "inputBuffers"), "objectAtIndexedSubscript:", v7);
      v6 = (id)objc_msgSend((id)objc_msgSend(v9, "metadata"), "mutableCopy");
      v5 = psn_pixelBufferDimensions((__CVBuffer *)objc_msgSend(v9, "buffer"));
    }
  }
  v57 = v5;
  if ((objc_msgSend((id)objc_msgSend(v2, "captureStreamSettings", v49, v52), "captureFlags") & 4) != 0)
  {
    AttachedMedia = BWSampleBufferAttachmentsGetAttachedMedia((void *)objc_msgSend(v2, "evZeroReferenceFrameAttachments"), 0x1E4936818);
    if (objc_msgSend((id)objc_msgSend(v2, "captureSettings"), "downgradedDeepFusionEnhancedResolutionCapture"))
    {
      if ((objc_msgSend(v2, "processInferenceInputImage") & 1) == 0)
        goto LABEL_16;
LABEL_13:
      v11 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:", a1, v2, 19);
      if (v11)
      {
        v12 = (__CVBuffer *)v11;
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "output"), "setGainMapOutputPixelBuffer:", v11);
        CVPixelBufferRelease(v12);
        objc_msgSend(*(id *)(a1 + 176), "output");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "output"), "setGainMapOutputMetadata:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"));
      }
      goto LABEL_16;
    }
    if (!AttachedMedia)
      goto LABEL_13;
  }
LABEL_16:
  v58 = v6;
  -[BWDeepFusionProcessorController _propagateZoomAndLtmRelatedMetadataIfNeeded]((id *)a1);
  if (*(int *)(a1 + 80) >= 3)
    objc_msgSend(v2, "releaseInputPixelBuffers");
  objc_msgSend(*(id *)(a1 + 176), "setErr:", objc_msgSend(*(id *)(a1 + 88), "process"));
  if (dword_1EE6BE538)
  {
    LODWORD(cf) = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v14 = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "output", v50, v53), "metadata");
  if (objc_msgSend(*(id *)(a1 + 176), "err"))
    goto LABEL_61;
  objc_msgSend(*(id *)(a1 + 176), "setErr:", objc_msgSend(*(id *)(a1 + 88), "finishProcessing"));
  if (objc_msgSend(*(id *)(a1 + 176), "err"))
    goto LABEL_61;
  v15 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "output"), "buffer");
  if (v2)
    objc_msgSend(v2, "evZeroReferenceFramePTS");
  else
    memset(v66, 0, sizeof(v66));
  objc_msgSend(*(id *)(a1 + 176), "setErr:", BWSampleBufferCreateFromPixelBuffer(v15, (uint64_t)v66, (CFTypeRef *)(a1 + 112), (CMSampleBufferRef *)&target));
  if (objc_msgSend(*(id *)(a1 + 176), "err"))
    goto LABEL_61;
  CMSetAttachments(target, (CFDictionaryRef)objc_msgSend(v2, "evZeroReferenceFrameAttachments"), 1u);
  CMSetAttachment(target, CFSTR("HasUnreliableBracketingMetadata"), MEMORY[0x1E0C9AAB0], 1u);
  v16 = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v17 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  objc_msgSend(v17, "addEntriesFromDictionary:", v14);
  v18 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "output"), "fusionMode");
  if (v18 == 2)
    v19 = 2;
  else
    v19 = v18 == 1;
  v20 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D05EF0]);
  FigCaptureMetadataUtilitiesCopyZoomRelatedMetadata(v14, v17);
  v21 = (const void *)BWSampleBufferGetAttachedMedia(target, 0x1E4936818);
  if (v21)
  {
    v22 = (void *)CMGetAttachment(v21, v16, 0);
    if (v22)
      FigCaptureMetadataUtilitiesCopyZoomRelatedMetadata(v14, v22);
  }
  objc_msgSend(v17, "setObject:forKeyedSubscript:", &unk_1E49FBA30, CFSTR("CompositeImage"));
  -[BWDeepFusionProcessorController _propagateGainMapToOutputSampleBufferIfNeeded:](a1, (void *)target);
  -[BWDeepFusionProcessorController _propagateDemosaicedRawPixelBufferToOutputSampleBufferIfNeeded:](a1, (void *)target);
  -[BWDeepFusionProcessorController _propagateSmartStyleLinearInputBufferToOutputSampleBufferIfNeeded:](a1, (opaqueCMSampleBuffer *)target);
  if ((int)objc_msgSend(*(id *)(a1 + 56), "stillImageFusionScheme") <= 4)
  {
    v55 = v16;
    v56 = v14;
    v23 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "delegate"), "processorController:newInferencesForProcessorInput:", a1, objc_msgSend(*(id *)(a1 + 176), "input"));
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v24 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "providedInferenceAttachedMedia");
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v63 != v27)
            objc_enumerationMutation(v24);
          BWPropagateInferenceAttachedMedia(v23, *(void **)(*((_QWORD *)&v62 + 1) + 8 * i), (CFTypeRef *)(a1 + 152), (opaqueCMSampleBuffer *)target);
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
      }
      while (v26);
    }
    v29 = objc_msgSend(v23, "inferenceForAttachmentKey:", 0x1E4951338);
    v30 = objc_msgSend(v23, "inferenceForAttachmentKey:", 0x1E4951358);
    if (v29)
    {
      v31 = v30;
      if (v30)
      {
        v32 = (id)objc_msgSend((id)CMGetAttachment(target, CFSTR("Inferences"), 0), "mutableCopy");
        if (!v32)
          v32 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        if (!objc_msgSend(v32, "objectForKeyedSubscript:", &unk_1E49FBA48))
        {
          v70[0] = 0x1E4951338;
          v70[1] = 0x1E4951358;
          v71[0] = v29;
          v71[1] = v31;
          v33 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 2);
          v34 = [BWInferenceResult alloc];
          CMSampleBufferGetPresentationTimeStamp(&v61, (CMSampleBufferRef)target);
          objc_msgSend(v32, "setObject:forKeyedSubscript:", -[BWInferenceResult initWithInferenceType:inferences:atTimestamp:](v34, "initWithInferenceType:inferences:atTimestamp:", 104, v33, &v61), &unk_1E49FBA48);
          CMSetAttachment(target, CFSTR("Inferences"), v32, 1u);
        }

      }
    }

    v16 = v55;
    v14 = v56;
  }
  if ((((objc_msgSend((id)objc_msgSend(v2, "captureStreamSettings"), "captureFlags") & 0x200000000) != 0) & v59) != 1)
    goto LABEL_58;
  if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "output"), "quadraForEnhancedResOutputPixelBuffer"))
  {
    LODWORD(cf) = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v44 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v44, type);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_58:
    if (objc_msgSend((id)objc_msgSend(v2, "captureSettings", v51, v54), "downgradedDeepFusionEnhancedResolutionCapture"))
    {
      v45 = objc_msgSend((id)CMGetAttachment(target, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue");
      CMSetAttachment(target, CFSTR("StillImageProcessingFlags"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v45 | 0x40000u), 1u);
    }
    v46 = (void *)objc_msgSend(*(id *)(a1 + 176), "delegate");
    objc_msgSend(v46, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", a1, target, 13, objc_msgSend(*(id *)(a1 + 176), "input"), objc_msgSend(*(id *)(a1 + 176), "err"));
    goto LABEL_61;
  }
  cf = 0;
  memset(&v69, 0, sizeof(v69));
  CMTimeMakeFromDictionary(&v69, (CFDictionaryRef)objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D05D00]));
  v35 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "output"), "quadraForEnhancedResOutputPixelBuffer");
  v73 = *(_OWORD *)&v69.value;
  v74[0] = *(CGFloat *)&v69.epoch;
  objc_msgSend(*(id *)(a1 + 176), "setErr:", BWSampleBufferCreateFromPixelBuffer(v35, (uint64_t)&v73, (CFTypeRef *)(a1 + 120), (CMSampleBufferRef *)&cf));
  if (!objc_msgSend(*(id *)(a1 + 176), "err"))
  {
    v36 = *MEMORY[0x1E0D06118];
    v37 = (void *)objc_msgSend(v58, "objectForKeyedSubscript:", *MEMORY[0x1E0D06118]);
    if (!v37)
    {
      v37 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      objc_msgSend(v58, "setObject:forKeyedSubscript:", v37, v36);
    }
    objc_msgSend(v37, "addEntriesFromDictionary:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "output"), "quadraForEnhancedResOutputMetadata"));
    CMSetAttachment(cf, v16, v58, 1u);
    v38 = psn_pixelBufferDimensions((__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "output"), "quadraForEnhancedResOutputPixelBuffer"));
    v39 = (double *)MEMORY[0x1E0C9D628];
    v40 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    v73 = *MEMORY[0x1E0C9D628];
    *(_OWORD *)v74 = v40;
    if (FigCFDictionaryGetCGRectIfPresent())
    {
      *(_QWORD *)&v73 = FigCaptureUpdateRectSizeAndMaintainCenter(*(CGFloat *)&v73, *((CGFloat *)&v73 + 1), v74[0], v74[1], (double)(int)v38);
      *((_QWORD *)&v73 + 1) = v41;
      v74[0] = v42;
      v74[1] = v43;
      FigCFDictionarySetCGRect();
    }
    FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v58, v57, v38, *(CGFloat *)&v73, *((CGFloat *)&v73 + 1), v74[0], v74[1], *v39, v39[1], v39[2], v39[3]);
    BWSampleBufferSetAttachedMedia(target, 0x1E4951618, (uint64_t)cf);
    if (cf)
      CFRelease(cf);
    goto LABEL_58;
  }
LABEL_61:
  if (objc_msgSend(*(id *)(a1 + 176), "err"))
  {
    if (objc_msgSend(*(id *)(a1 + 176), "err") == -2)
      objc_msgSend(*(id *)(a1 + 176), "setErr:", 4294950469);
    if (objc_msgSend(*(id *)(a1 + 176), "err"))
      v47 = 14;
    else
      v47 = 13;
    v48 = (void *)objc_msgSend(*(id *)(a1 + 176), "delegate");
    objc_msgSend(v48, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", a1, target, v47, objc_msgSend(*(id *)(a1 + 176), "input"), objc_msgSend(*(id *)(a1 + 176), "err"));
  }
  if (target)
    CFRelease(target);

}

BOOL __43__BWDeepFusionProcessorController__process__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 25;
}

- (id)_propagateZoomAndLtmRelatedMetadataIfNeeded
{
  id *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id *v5;

  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend(result[22], "input");
    v3 = objc_msgSend((id)objc_msgSend(v2, "inputBuffers"), "indexOfObjectPassingTest:", &__block_literal_global_275);
    v4 = (void *)objc_msgSend(v2, "inputBuffers");
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      result = (id *)objc_msgSend(v4, "indexOfObjectPassingTest:", &__block_literal_global_276);
      if (result == (id *)0x7FFFFFFFFFFFFFFFLL)
        return result;
      result = (id *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "inputBuffers"), "objectAtIndexedSubscript:", result), "metadata"), "objectForKeyedSubscript:", CFSTR("ReferenceMetadata"));
    }
    else
    {
      result = (id *)objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", v3), "metadata");
    }
    v5 = result;
    if (result)
    {
      FigCaptureMetadataUtilitiesCopyZoomRelatedMetadata(result, (void *)objc_msgSend((id)objc_msgSend(v1[22], "output"), "metadata"));
      if (objc_msgSend((id)objc_msgSend(v1[22], "input"), "processSmartStyleRenderingInput"))
        BWCopyLTMMetadata(v5, (void *)objc_msgSend((id)objc_msgSend(v1[22], "output"), "metadata"));
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v1[22], "output"), "metadata"), "setObject:forKeyedSubscript:", objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D05F80]), *MEMORY[0x1E0D05F80]);
      return (id *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v1[22], "output"), "metadata"), "setObject:forKeyedSubscript:", objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D05F78]), *MEMORY[0x1E0D05F78]);
    }
  }
  return result;
}

- (uint64_t)_propagateGainMapToOutputSampleBufferIfNeeded:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  void *v5;
  __CVBuffer *v6;
  void *v7;
  uint64_t v8;

  if (!result)
    return result;
  v3 = result;
  v4 = (void *)objc_msgSend(*(id *)(result + 176), "input");
  v5 = (void *)objc_msgSend(*(id *)(v3 + 176), "output");
  if (objc_msgSend(v5, "gainMapOutputPixelBuffer"))
  {
    v6 = (__CVBuffer *)objc_msgSend(v5, "gainMapOutputPixelBuffer");
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
    {
      result = objc_msgSend(v5, "gainMapOutputMetadata");
      v7 = (void *)result;
      if (!v6)
        return result;
      goto LABEL_10;
    }
  }
  else
  {
    result = BWSampleBufferGetAttachedMedia(a2, 0x1E4936818);
    if (result)
      return result;
    result = objc_msgSend((id)objc_msgSend(v4, "inputBuffers"), "indexOfObjectPassingTest:", &__block_literal_global_280);
    if (result == 0x7FFFFFFFFFFFFFFFLL)
      return result;
    result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "inputBuffers"), "objectAtIndexedSubscript:", result), "buffer");
    v6 = (__CVBuffer *)result;
  }
  v7 = 0;
  if (!v6)
    return result;
LABEL_10:
  if (!v7)
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[FigCaptureCameraParameters gainMapVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "gainMapVersion"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D05F08]);
  return BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)a2, 0x1E4936818, v6, (CFTypeRef *)(v3 + 160), (uint64_t)v7, 0, 1);
}

- (void)_propagateDemosaicedRawPixelBufferToOutputSampleBufferIfNeeded:(uint64_t)a1
{
  __CVBuffer *v4;
  void *v5;
  BOOL v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  int v10;
  CFTypeRef v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t PixelFormatType;
  float v21;
  float v22;
  unint64_t v23;
  void *v24;
  CMAttachmentBearerRef target;

  if (a1)
  {
    target = 0;
    v4 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "output"), "linearOutputPixelBuffer");
    v5 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "output"), "linearOutputMetadata");
    if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "processingSettings"), "provideDemosaicedRaw")|| (!objc_msgSend(*(id *)(a1 + 176), "demosaicedRawErr") ? (v6 = v4 == 0) : (v6 = 1), v6))
    {
      v9 = 0;
LABEL_18:

      if (target)
        CFRelease(target);
      return;
    }
    v7 = (const __CFString *)*MEMORY[0x1E0D05CB0];
    v8 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    if (objc_msgSend(v5, "count"))
      objc_msgSend(v9, "addEntriesFromDictionary:", v5);
    if (BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)a2, v4, (CFTypeRef *)(a1 + 136), (CMSampleBufferRef *)&target))goto LABEL_18;
    v10 = objc_msgSend((id)CMGetAttachment(target, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue");
    CMSetAttachment(target, CFSTR("StillImageProcessingFlags"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10 | 0x10000u), 1u);
    v11 = CMGetAttachment(target, CFSTR("RawDNGDictionary"), 0);
    if (v11)
    {
      v12 = (void *)v11;
      v13 = psn_pixelBufferDimensions(v4);
      v14 = (void *)BWCreateDNGDictionaryWithUpdatedToneCurvesIfNeeded(v12, v13, v9);
      if (!v14)
        goto LABEL_17;
    }
    else
    {
      v15 = objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
      v16 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "rawColorCalibrationsByPortType"), "objectForKeyedSubscript:", v15);
      if (!v16)
        goto LABEL_18;
      v17 = (void *)v16;
      v18 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", v15), "cameraInfo");
      if (!v18)
        goto LABEL_18;
      v19 = (void *)v18;
      PixelFormatType = CVPixelBufferGetPixelFormatType(v4);
      v21 = (float)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "settings"), "outputWidth");
      v22 = v21
          / (float)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "settings"), "outputHeight");
      v23 = psn_pixelBufferDimensions(v4);
      v14 = (void *)BWCreateDemosaicedRawDNGDictionary(v23, PixelFormatType, v9, v17, v19, v22);
      if (!v14)
        goto LABEL_18;
    }
    v24 = v14;
    CMSetAttachment(target, CFSTR("RawDNGDictionary"), v14, 1u);

LABEL_17:
    CMSetAttachment(target, v7, v9, 1u);
    BWSampleBufferSetAttachedMedia(a2, 0x1E495B0F8, (uint64_t)target);
    goto LABEL_18;
  }
}

- (uint64_t)_propagateSmartStyleLinearInputBufferToOutputSampleBufferIfNeeded:(uint64_t)result
{
  uint64_t v3;
  void *v4;

  if (result)
  {
    v3 = result;
    v4 = (void *)objc_msgSend(*(id *)(result + 176), "output");
    result = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 176), "input"), "processSmartStyleRenderingInput");
    if ((_DWORD)result)
      return BWSampleBufferSetAttachedMediaFromPixelBuffer(a2, 0x1E495B238, (__CVBuffer *)objc_msgSend(v4, "linearOutputMIWBAppliedPixelBuffer"), (CFTypeRef *)(v3 + 144), objc_msgSend(v4, "linearOutputMIWBAppliedMetadata"), 0, 0);
  }
  return result;
}

BOOL __78__BWDeepFusionProcessorController__propagateZoomAndLtmRelatedMetadataIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 23;
}

BOOL __78__BWDeepFusionProcessorController__propagateZoomAndLtmRelatedMetadataIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 8;
}

- (uint64_t)_processOnlyApplyingSemanticStyle
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  __CVBuffer *v4;
  OSType PixelFormatType;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v7;
  const void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[3];
  os_log_type_t type;
  int v16;
  CFTypeRef cf[21];

  cf[20] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v1 = result;
  cf[0] = 0;
  if (!objc_msgSend(*(id *)(result + 88), "semanticStyleProperties"))
  {
    v2 = 0;
    goto LABEL_19;
  }
  v2 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "input"), "inputBuffers"), "firstObject");
  v3 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:dimensions:", v1, objc_msgSend(*(id *)(v1 + 176), "input"), objc_msgSend(v2, "type"), psn_pixelBufferDimensions((__CVBuffer *)objc_msgSend(v2, "buffer")));
  if (!v3)
  {
    objc_msgSend(*(id *)(v1 + 176), "setErr:", 4294954510);
    goto LABEL_19;
  }
  v4 = (__CVBuffer *)v3;
  objc_msgSend(*(id *)(v1 + 176), "setErr:", objc_msgSend(*(id *)(v1 + 88), "applySemanticStylesWithOutputBuffer:inputBuffer:inputMetadata:", v3, objc_msgSend(v2, "buffer"), objc_msgSend(v2, "metadata")));
  if (!objc_msgSend(*(id *)(v1 + 176), "err"))
    goto LABEL_11;
  PixelFormatType = CVPixelBufferGetPixelFormatType(v4);
  if (PixelFormatType == CVPixelBufferGetPixelFormatType((CVPixelBufferRef)objc_msgSend(v2, "buffer")))
  {
    v16 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    CFRelease(v4);
    v8 = (const void *)objc_msgSend(v2, "buffer");
    if (v8)
      v4 = (__CVBuffer *)CFRetain(v8);
    else
      v4 = 0;
LABEL_11:
    v9 = (void *)objc_msgSend(*(id *)(v1 + 176), "input", v12, v13);
    if (v9)
      objc_msgSend(v9, "evZeroReferenceFramePTS");
    else
      memset(v14, 0, sizeof(v14));
    objc_msgSend(*(id *)(v1 + 176), "setErr:", BWSampleBufferCreateFromPixelBuffer(v4, (uint64_t)v14, (CFTypeRef *)(v1 + 112), (CMSampleBufferRef *)cf));
    v10 = *(void **)(v1 + 176);
    if (cf[0])
    {
      if (objc_msgSend((id)objc_msgSend(v10, "input"), "evZeroReferenceFrameAttachments"))
        CMSetAttachments(cf[0], (CFDictionaryRef)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "input"), "evZeroReferenceFrameAttachments"), 1u);
      v11 = (void *)objc_msgSend(*(id *)(v1 + 176), "delegate");
      objc_msgSend(v11, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", v1, cf[0], 13, objc_msgSend(*(id *)(v1 + 176), "input"), objc_msgSend(*(id *)(v1 + 176), "err"));
      if (!v4)
        goto LABEL_19;
    }
    else
    {
      objc_msgSend(v10, "setErr:", 4294954510);
      if (!v4)
        goto LABEL_19;
    }
    goto LABEL_18;
  }
  v16 = 0;
  type = OS_LOG_TYPE_DEFAULT;
  v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_18:
  CFRelease(v4);
LABEL_19:
  if (cf[0])
    CFRelease(cf[0]);
  result = objc_msgSend(*(id *)(v1 + 176), "err", v12, v13);
  if ((_DWORD)result)
    return objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "delegate"), "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", v1, 0, objc_msgSend(v2, "type"), objc_msgSend(*(id *)(v1 + 176), "input"), objc_msgSend(*(id *)(v1 + 176), "err"));
  return result;
}

BOOL __81__BWDeepFusionProcessorController__propagateGainMapToOutputSampleBufferIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 19;
}

- (void)processor:(id)a3 outputReadyWithBufferType:(int)a4 outputPixelBuffer:(__CVBuffer *)a5 outputMetadata:(id)a6 error:(int)a7
{
  uint64_t v7;
  NSUInteger v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSDictionary *v16;
  BWDeepFusionProcessorInput *v17;
  const __CFString *v18;
  void *v19;
  BWDeepFusionProcessorControllerDelegate *v20;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CMAttachmentBearerRef target;
  CMTime v23;
  CMTime v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((a4 & 0xFFFFFFFE) != 0xA)
    return;
  v7 = *(_QWORD *)&a7;
  target = 0;
  if (a4 == 10)
  {
    v16 = -[BWDeepFusionProcessorInput evZeroReferenceFrameAttachments](-[BWDeepFusionProcessorRequest input](self->_currentRequest, "input", a3), "evZeroReferenceFrameAttachments");
    memset(&v23, 0, sizeof(v23));
    v17 = -[BWDeepFusionProcessorRequest input](self->_currentRequest, "input");
    if (v17)
    {
      -[BWDeepFusionProcessorInput evZeroReferenceFramePTS](v17, "evZeroReferenceFramePTS");
      if ((_DWORD)v7)
        return;
    }
    else
    {
      memset(&v23, 0, sizeof(v23));
      if ((_DWORD)v7)
        return;
    }
    if (!v16)
      return;
    if ((v23.flags & 1) == 0)
      return;
    v24 = v23;
    if (BWSampleBufferCreateFromPixelBuffer(a5, (uint64_t)&v24, (CFTypeRef *)&self->_inferenceInputFormatDescription, (CMSampleBufferRef *)&target))return;
    CMSetAttachments(target, (CFDictionaryRef)v16, 1u);
    v18 = (const __CFString *)*MEMORY[0x1E0D05CB0];
    v19 = (void *)objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "mutableCopy");
    objc_msgSend(v19, "addEntriesFromDictionary:", a6);
    CMSetAttachment(target, v18, v19, 1u);

    v7 = 0;
    v15 = 15;
LABEL_18:
    v20 = -[BWDeepFusionProcessorRequest delegate](self->_currentRequest, "delegate");
    -[BWDeepFusionProcessorControllerDelegate processorController:didFinishProcessingSampleBuffer:type:processorInput:err:](v20, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", self, target, v15, -[BWDeepFusionProcessorRequest input](self->_currentRequest, "input"), v7);
    if (target)
      CFRelease(target);
    return;
  }
  if (a4 != 11)
  {
    v15 = 0;
    goto LABEL_18;
  }
  v11 = -[NSArray indexOfObjectPassingTest:](-[BWDeepFusionProcessorInput inputBuffers](-[BWDeepFusionProcessorRequest input](self->_currentRequest, "input", a3), "inputBuffers"), "indexOfObjectPassingTest:", &__block_literal_global_282);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL
    || (v12 = -[NSArray objectAtIndexedSubscript:](-[BWDeepFusionProcessorInput inputBuffers](-[BWDeepFusionProcessorRequest input](self->_currentRequest, "input"), "inputBuffers"), "objectAtIndexedSubscript:", v11), !objc_msgSend(v12, "metadata")))
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return;
  }
  memset(&v23, 0, sizeof(v23));
  v13 = (void *)objc_msgSend(v12, "metadata");
  CMTimeMakeFromDictionary(&v23, (CFDictionaryRef)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D05D00]));
  if ((v23.flags & 1) != 0)
  {
    v24 = v23;
    if (!BWSampleBufferCreateFromPixelBuffer(a5, (uint64_t)&v24, (CFTypeRef *)&self->_inferenceInputFormatDescription, (CMSampleBufferRef *)&target))
    {
      v14 = (void *)objc_msgSend((id)objc_msgSend(v12, "metadata"), "mutableCopy");
      objc_msgSend(v14, "addEntriesFromDictionary:", a6);
      CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], v14, 1u);

      CMSetAttachment(target, CFSTR("StillSettings"), -[BWStillImageProcessorControllerInput stillImageSettings](-[BWDeepFusionProcessorRequest input](self->_currentRequest, "input"), "stillImageSettings"), 1u);
      CMSetAttachment(target, CFSTR("StillImageCaptureFrameFlags"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v12, "captureFrameFlags")), 1u);
      v7 = 0;
      v15 = 36;
      goto LABEL_18;
    }
  }
}

BOOL __110__BWDeepFusionProcessorController_processor_outputReadyWithBufferType_outputPixelBuffer_outputMetadata_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 25;
}

- (id)processorGetInferenceResults:(id)a3 inferenceInputBufferType:(int)a4
{
  objc_class *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = NSClassFromString(CFSTR("DeepFusionInferenceResults"));
  if (a4 == 11)
    v7 = 36;
  else
    v7 = 15;
  v8 = (void *)-[BWDeepFusionProcessorControllerDelegate processorController:newInferencesForProcessorInput:inferenceInputBufferType:](-[BWDeepFusionProcessorRequest delegate](self->_currentRequest, "delegate"), "processorController:newInferencesForProcessorInput:inferenceInputBufferType:", self, -[BWDeepFusionProcessorRequest input](self->_currentRequest, "input"), v7);
  v9 = objc_alloc_init(v6);
  v10 = objc_msgSend(v8, "inferenceBufferForAttachedMediaKey:", CFSTR("PersonSemanticsSkin"));
  if (v10)
    objc_msgSend(v9, "setSkinMask:", v10);
  v11 = objc_msgSend(v8, "inferenceBufferForAttachedMediaKey:", CFSTR("PersonSemanticsHair"));
  if (v11)
    objc_msgSend(v9, "setHairMask:", v11);
  v12 = objc_msgSend(v8, "inferenceBufferForAttachedMediaKey:", 0x1E495B0B8);
  if (v12)
    objc_msgSend(v9, "setSkyMask:", v12);
  if (-[BWDeepFusionProcessorControllerConfiguration semanticRenderingVersion](self->_configuration, "semanticRenderingVersion") < 4)
  {
    v15 = objc_msgSend(v8, "inferenceBufferForAttachedMediaKey:", 0x1E49511B8);
    if (v15)
      objc_msgSend(v9, "setPersonMask:", v15);
  }
  else
  {
    v13 = objc_msgSend(v8, "inferenceBufferForAttachedMediaKey:", 0x1E495AF38);
    if (v13)
    {
      v14 = v13;
      if (-[BWDeepFusionProcessorControllerConfiguration semanticRenderingVersion](self->_configuration, "semanticRenderingVersion") >= 4)objc_msgSend(v9, "setHighResPersonMask:", v14);
    }
  }
  v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v17 = BWInferenceLowResPersonInstanceMaskKeys();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v27;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v17);
        v22 = objc_msgSend(v8, "inferenceBufferForAttachedMediaKey:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v21), (_QWORD)v26);
        if (v22)
          objc_msgSend(v16, "addObject:", v22);
        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v19);
  }
  if (objc_msgSend(v16, "count", (_QWORD)v26))
  {
    objc_msgSend(v9, "setLowResPersonInstanceMasks:", v16);
    objc_msgSend(v9, "setLowResPersonInstanceConfidences:", objc_msgSend(v8, "inferenceForAttachmentKey:", 0x1E4951338));
    objc_msgSend(v9, "setLowResPersonInstanceBoundingBoxes:", objc_msgSend(v8, "inferenceForAttachmentKey:", 0x1E4951358));
  }
  objc_msgSend(v9, "setSmartCameraSceneType:", objc_msgSend(-[BWStillImageCaptureSettings metadata](-[BWStillImageProcessorControllerInput captureSettings](-[BWDeepFusionProcessorRequest input](self->_currentRequest, "input"), "captureSettings"), "metadata"), "semanticStyleSceneTypeAsSmartCameraSceneType"));
  v23 = objc_msgSend(v8, "inferenceForAttachmentKey:", 0x1E4951158);
  if (v23)
    objc_msgSend(v9, "setSkinToneClassificationsForFaces:", v23);
  v24 = objc_msgSend(v8, "inferenceForAttachmentKey:", 0x1E4951058);
  if (v24)
    objc_msgSend(v9, "setFaceLandmarks:", v24);

  return v9;
}

- (void)processor:(id)a3 didSelectFusionMode:(int)a4
{
  uint64_t v4;

  if (a4 == 2)
    v4 = 2;
  else
    v4 = a4 == 1;
  -[BWDeepFusionProcessorControllerDelegate processorController:didSelectFusionMode:processorInput:](-[BWDeepFusionProcessorRequest delegate](self->_currentRequest, "delegate", a3), "processorController:didSelectFusionMode:processorInput:", self, v4, -[BWDeepFusionProcessorRequest input](self->_currentRequest, "input"));
}

@end

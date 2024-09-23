@implementation BWNRFProcessorController

- (unsigned)rawNightModeOutputPixelFormatByBufferType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 - 31 < 2)
    return 1751527984;
  if (a3 == 35 || a3 == 33)
    return -[BWVideoFormat pixelFormat](-[BWNRFProcessorControllerConfiguration outputFormat](self->_configuration, "outputFormat", v3, v4), "pixelFormat");
  return 0;
}

- (BWNRFProcessorController)initWithConfiguration:(id)a3
{
  BWNRFProcessorController *v4;
  FigStateMachine *v5;
  void *v6;
  id *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BWNRFProcessorController;
  v4 = -[BWNRFProcessorController init](&v9, sel_init);
  if (v4)
  {
    v4->_configuration = (BWNRFProcessorControllerConfiguration *)a3;
    v4->_requestQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = -[FigStateMachine initWithLabel:stateCount:initialState:owner:]([FigStateMachine alloc], "initWithLabel:stateCount:initialState:owner:", CFSTR("BWNRFProcessorController state machine"), (char)+[FigStateMachine indexForState:](FigStateMachine, "indexForState:", 512), 1, v4);
    -[FigStateMachine setPerformsAtomicStateTransitions:](v5, "setPerformsAtomicStateTransitions:", 0);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("Idle"), 1);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("Ready"), 2);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("WaitingForFrames"), 4);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("ProcessingSingleImage"), 8);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("ProcessingOriginalImage"), 16);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("ProcessingUBFusion"), 32);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("ProcessingUBLowLightFusion"), 64);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("ProcessingDeepFusion"), 128);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("ProcessingRawNightMode"), 256);
    -[FigStateMachine whenTransitioningToStates:callHandler:](v5, "whenTransitioningToStates:callHandler:", 1, &__block_literal_global_46);
    -[FigStateMachine whenTransitioningToStates:callHandler:](v5, "whenTransitioningToStates:callHandler:", 2, &__block_literal_global_671);
    -[FigStateMachine whenTransitioningToState:callHandler:](v5, "whenTransitioningToState:callHandler:", 4, &__block_literal_global_672);
    -[FigStateMachine whenTransitioningToState:callHandler:](v5, "whenTransitioningToState:callHandler:", 8, &__block_literal_global_673);
    -[FigStateMachine whenTransitioningToState:callHandler:](v5, "whenTransitioningToState:callHandler:", 16, &__block_literal_global_674);
    -[FigStateMachine whenTransitioningToState:callHandler:](v5, "whenTransitioningToState:callHandler:", 32, &__block_literal_global_675);
    -[FigStateMachine whenTransitioningToState:callHandler:](v5, "whenTransitioningToState:callHandler:", 64, &__block_literal_global_676);
    -[FigStateMachine whenTransitioningToState:callHandler:](v5, "whenTransitioningToState:callHandler:", 128, &__block_literal_global_677);
    -[FigStateMachine whenTransitioningToState:callHandler:](v5, "whenTransitioningToState:callHandler:", 256, &__block_literal_global_678);
    v4->_stateMachine = v5;
    objc_msgSend(a3, "figThreadPriority");
    v4->_completionStatusQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v6 = (void *)MEMORY[0x1A858DD40]();
    if (-[BWNRFProcessorController _loadNRFProcessor]((uint64_t)v4)
      || (v7 = -[BWNRFProcessorController _prepareDescriptorsByProcessingType]((id *)&v4->super.super.isa),
          -[BWNRFProcessorController _setupNRFProcessorWithprepareDescriptorsByProcessingType:]((uint64_t)v4, (uint64_t)v7)))
    {
      objc_autoreleasePoolPop(v6);

      return 0;
    }
    else
    {
      objc_autoreleasePoolPop(v6);
    }
  }
  return v4;
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

- (uint64_t)_loadNRFProcessor
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  if (a1 && !*(_QWORD *)(a1 + 80))
  {
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "sensorConfigurationsByPortType"), "count")
      && objc_msgSend(*(id *)(a1 + 56), "inputFormat")
      && objc_msgSend(*(id *)(a1 + 56), "outputFormat"))
    {
      v2 = -[FigCaptureCameraParameters nrfVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "nrfVersion");
      if ((_DWORD)v2)
      {
        v3 = v2;
        *(_QWORD *)(a1 + 88) = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NRFProcessorV%d"), v2);
        *(_QWORD *)(a1 + 64) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "sensorConfigurationsByPortType"), "allKeys"));
        v4 = BWLoadProcessorBundle((uint64_t)CFSTR("NRF"), v3);
        if (v4)
        {
          v5 = v4;
          v6 = objc_msgSend(v4, "classNamed:", CFSTR("NRFUBFusionOutput"));
          *(_QWORD *)(a1 + 120) = v6;
          if (v6)
          {
            if (!objc_msgSend(*(id *)(a1 + 56), "rawNightModeEnabled")
              || (v7 = objc_msgSend(v5, "classNamed:", CFSTR("NRFRawNightModeOutputFrame")),
                  (*(_QWORD *)(a1 + 152) = v7) != 0))
            {
              v8 = objc_msgSend(v5, "classNamed:", CFSTR("NRFDeepFusionOutput"));
              *(_QWORD *)(a1 + 168) = v8;
              if (v8)
              {
                v9 = objc_msgSend(v5, "classNamed:", CFSTR("NRFCompletionStatus"));
                *(_QWORD *)(a1 + 184) = v9;
                if (v9)
                {
                  v10 = objc_msgSend(v5, "classNamed:", CFSTR("NRFProgressiveBracketingStatistics"));
                  *(_QWORD *)(a1 + 128) = v10;
                  if (v10)
                  {
                    v11 = objc_msgSend(v5, "classNamed:", CFSTR("NRFProgressiveBracketingParameters"));
                    *(_QWORD *)(a1 + 136) = v11;
                    if (v11)
                    {
                      v12 = objc_msgSend(objc_alloc((Class)objc_msgSend(v5, "classNamed:", *(_QWORD *)(a1 + 88))), "initWithCommandQueue:", objc_msgSend(*(id *)(a1 + 56), "metalCommandQueue"));
                      *(_QWORD *)(a1 + 80) = v12;
                      if (v12)
                      {
                        v13 = objc_alloc_init((Class)objc_msgSend(v5, "classNamed:", CFSTR("NRFPrepareDescriptor")));
                        *(_QWORD *)(a1 + 96) = v13;
                        if (v13)
                        {
                          if ((objc_msgSend(*(id *)(a1 + 56), "fusionEnabled") & 1) == 0
                            && !objc_msgSend(*(id *)(a1 + 56), "lowLightFusionEnabled")
                            || (v14 = objc_alloc_init((Class)objc_msgSend(v5, "classNamed:", CFSTR("NRFPrepareDescriptor"))), (*(_QWORD *)(a1 + 112) = v14) != 0))
                          {
                            if ((objc_msgSend(*(id *)(a1 + 56), "learnedNRMode") & 0x10) == 0
                              || (v15 = objc_alloc_init((Class)objc_msgSend(v5, "classNamed:", CFSTR("NRFPrepareDescriptor"))), (*(_QWORD *)(a1 + 104) = v15) != 0))
                            {
                              if (!objc_msgSend(*(id *)(a1 + 56), "rawNightModeEnabled")
                                || (v16 = objc_alloc_init((Class)objc_msgSend(v5, "classNamed:", CFSTR("NRFPrepareDescriptor"))), (*(_QWORD *)(a1 + 160) = v16) != 0))
                              {
                                if (!objc_msgSend(*(id *)(a1 + 56), "deepFusionEnabled")
                                  || (FigCapturePixelFormatIs420(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "deepFusionInputFormat"), "pixelFormat")) & 1) == 0&& !objc_msgSend(*(id *)(a1 + 56), "deferredCaptureSupportEnabled"))
                                {
                                  return 0;
                                }
                                v17 = objc_alloc_init((Class)objc_msgSend(v5, "classNamed:", CFSTR("NRFPrepareDescriptor")));
                                *(_QWORD *)(a1 + 176) = v17;
                                if (v17)
                                  return 0;
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      v18 = 4294954510;
    }
    else
    {
      v18 = 4294954516;
    }
    -[BWNRFProcessorController _releaseNRFProcessorResources]((id *)a1);
    return v18;
  }
  return 0;
}

- (id)_prepareDescriptorsByProcessingType
{
  id *v1;
  void *v2;
  unsigned int v3;
  unsigned int v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  unsigned int v13;
  unsigned int v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unsigned int v21;
  unsigned int v22;
  void *v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;

  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_msgSend((id)objc_msgSend(v1[7], "inputFormat"), "width");
    v4 = objc_msgSend((id)objc_msgSend(v1[7], "inputFormat"), "height");
    v5 = FigCaptureDimensionsFromDictionaryRepresentation((void *)objc_msgSend((id)objc_msgSend(v1[7], "dimensionsByQSubResolutionFlavor"), "objectForKeyedSubscript:", &unk_1E49F95A0));
    v6 = FigCaptureDimensionsFromDictionaryRepresentation((void *)objc_msgSend((id)objc_msgSend(v1[7], "dimensionsByQSubResolutionFlavor"), "objectForKeyedSubscript:", &unk_1E49F9570));
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = v3 | ((unint64_t)v4 << 32);
    if (FigCaptureVideoDimensionsAreValid(v9))
    {
      objc_msgSend(v7, "addObject:", FigCaptureDictionaryRepresentationForDimensions(v9));
      objc_msgSend(v8, "addObject:", FigCaptureDictionaryRepresentationForDimensions(v9));
    }
    if (FigCaptureVideoDimensionsAreValid(v5) && !FigCaptureVideoDimensionsAreEqual(v9, v5))
    {
      objc_msgSend(v7, "addObject:", FigCaptureDictionaryRepresentationForDimensions(v5));
      objc_msgSend(v8, "addObject:", FigCaptureDictionaryRepresentationForDimensions(v5));
    }
    if (FigCaptureVideoDimensionsAreValid(v6))
      objc_msgSend(v7, "addObject:", FigCaptureDictionaryRepresentationForDimensions(v6));
    v10 = FigCaptureLargestDimensionsFromDimensionsArray(v7);
    v11 = HIDWORD(v10);
    objc_msgSend(v1[12], "setWidth:", v10);
    objc_msgSend(v1[12], "setHeight:", v11);
    objc_msgSend(v1[12], "setMemoryPoolId:", -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier"));
    objc_msgSend(v1[12], "setPixelFormat:", objc_msgSend((id)objc_msgSend(v1[7], "inputFormat"), "pixelFormat"));
    objc_msgSend(v1[12], "setAllowModifyingInputBuffers:", objc_msgSend(v1[7], "alwaysAllowModifyingInputBuffers"));
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v1[12], &unk_1E49F95B8);
    if (objc_msgSend(v1[7], "swfrEnabled"))
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v1[12], &unk_1E49F95D0);
    if (objc_msgSend(v1[7], "learnedNRMode"))
    {
      if ((objc_msgSend(v1[7], "learnedNRMode") & 0x10) != 0)
      {
        v12 = (void *)objc_msgSend(v1[7], "learnedNRInputFormat");
        if (!v12)
          v12 = (void *)objc_msgSend(v1[7], "inputFormat");
        v13 = objc_msgSend(v12, "width");
        v14 = objc_msgSend(v12, "height");
        v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v16 = v13 | ((unint64_t)v14 << 32);
        if (FigCaptureVideoDimensionsAreValid(v16))
          objc_msgSend(v15, "addObject:", FigCaptureDictionaryRepresentationForDimensions(v16));
        if (FigCaptureVideoDimensionsAreValid(v5))
          objc_msgSend(v15, "addObject:", FigCaptureDictionaryRepresentationForDimensions(v5));
        if ((objc_msgSend(v1[7], "learnedNRMode") & 4) != 0 && FigCaptureVideoDimensionsAreValid(v6))
          objc_msgSend(v15, "addObject:", FigCaptureDictionaryRepresentationForDimensions(v6));
        v17 = FigCaptureLargestDimensionsFromDimensionsArray(v15);
        v18 = HIDWORD(v17);
        objc_msgSend(v1[13], "setWidth:", v17);
        objc_msgSend(v1[13], "setHeight:", v18);
        objc_msgSend(v1[13], "setPixelFormat:", objc_msgSend(v12, "pixelFormat"));
        objc_msgSend(v1[13], "setAllowModifyingInputBuffers:", objc_msgSend(v1[7], "alwaysAllowModifyingInputBuffers"));
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v1[13], &unk_1E49F95E8);
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v1[10], "setLearnedNREnabled:", (objc_msgSend(v1[7], "learnedNRMode") & 5) != 0);
      }
    }
    if ((objc_msgSend(v1[7], "fusionEnabled") & 1) != 0 || objc_msgSend(v1[7], "lowLightFusionEnabled"))
    {
      v19 = FigCaptureLargestDimensionsFromDimensionsArray(v8);
      v20 = HIDWORD(v19);
      objc_msgSend(v1[14], "setWidth:", v19);
      objc_msgSend(v1[14], "setHeight:", v20);
      objc_msgSend(v1[14], "setPixelFormat:", objc_msgSend((id)objc_msgSend(v1[7], "inputFormat"), "pixelFormat"));
      objc_msgSend(v1[14], "setAllowModifyingInputBuffers:", objc_msgSend(v1[7], "alwaysAllowModifyingInputBuffers"));
      objc_msgSend(v1[14], "setMemoryPoolId:", -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier"));
      if (objc_msgSend(v1[7], "fusionEnabled"))
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v1[14], &unk_1E49F9600);
      if (objc_msgSend(v1[7], "lowLightFusionEnabled"))
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v1[14], &unk_1E49F9618);
    }
    if (objc_msgSend(v1[7], "rawNightModeEnabled"))
    {
      v21 = objc_msgSend((id)objc_msgSend(v1[7], "rawNightModeInputFormat"), "width");
      v22 = objc_msgSend((id)objc_msgSend(v1[7], "rawNightModeInputFormat"), "height");
      v23 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v24 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v25 = v21 | ((unint64_t)v22 << 32);
      if (FigCaptureVideoDimensionsAreValid(v25))
      {
        objc_msgSend(v23, "addObject:", FigCaptureDictionaryRepresentationForDimensions(v25));
        objc_msgSend(v24, "addObject:", FigCaptureDictionaryRepresentationForDimensions(v25));
      }
      if (FigCaptureVideoDimensionsAreValid(v5))
      {
        objc_msgSend(v23, "addObject:", FigCaptureDictionaryRepresentationForDimensions(v5));
        objc_msgSend(v24, "addObject:", FigCaptureDictionaryRepresentationForDimensions(v5));
      }
      if (FigCaptureVideoDimensionsAreValid(v6))
        objc_msgSend(v23, "addObject:", FigCaptureDictionaryRepresentationForDimensions(v6));
      v26 = FigCaptureLargestDimensionsFromDimensionsArray(v24);
      v27 = HIDWORD(v26);
      objc_msgSend(v1[20], "setWidth:", v26);
      objc_msgSend(v1[20], "setHeight:", v27);
      objc_msgSend(v1[20], "setPixelFormat:", objc_msgSend((id)objc_msgSend(v1[7], "rawNightModeInputFormat"), "pixelFormat"));
      objc_msgSend(v1[20], "setAllowModifyingInputBuffers:", objc_msgSend(v1[7], "alwaysAllowModifyingInputBuffers"));
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v1[20], &unk_1E49F9630);
    }
    if (objc_msgSend(v1[7], "deepFusionEnabled")
      && ((FigCapturePixelFormatIs420(objc_msgSend((id)objc_msgSend(v1[7], "deepFusionInputFormat"), "pixelFormat")) & 1) != 0
       || objc_msgSend(v1[7], "deferredCaptureSupportEnabled")))
    {
      v28 = FigCaptureLargestDimensionsFromDimensionsArray(v8);
      v29 = HIDWORD(v28);
      objc_msgSend(v1[22], "setWidth:", v28);
      objc_msgSend(v1[22], "setHeight:", v29);
      objc_msgSend(v1[22], "setPixelFormat:", objc_msgSend((id)objc_msgSend(v1[7], "deepFusionInputFormat"), "pixelFormat"));
      objc_msgSend(v1[22], "setAllowModifyingInputBuffers:", objc_msgSend(v1[7], "alwaysAllowModifyingInputBuffers"));
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v1[22], &unk_1E49F9648);
    }
    return (id *)(id)objc_msgSend(v2, "copy");
  }
  return result;
}

- (uint64_t)_setupNRFProcessorWithprepareDescriptorsByProcessingType:(uint64_t)a1
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id obj;
  uint64_t v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = a1;
  v22 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", -[FigCaptureCameraParameters commonNRFParameters](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "commonNRFParameters"), CFSTR("NRFParameters"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("Common"));
  v27 = v3;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("DefaultSensorIDs"));
  v26 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = (id)objc_msgSend(*(id *)(v2 + 56), "sensorConfigurationsByPortType");
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v7)
  {
    v8 = v7;
    v25 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        v10 = v5;
        if (*(_QWORD *)v29 != v25)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        v12 = v2;
        v13 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v2 + 56), "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", v11);
        objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(v13, "sensorIDString"), v11);
        v14 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v13, "sensorIDDictionary"), "objectForKeyedSubscript:", CFSTR("NRFParameters")), CFSTR("NRFParameters"));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v13, "sensorIDDictionary"), "objectForKeyedSubscript:", CFSTR("DeepFusionParameters")), CFSTR("DeepFusionParameters"));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v13, "sensorIDDictionary"), "objectForKeyedSubscript:", CFSTR("RawNightmodeParameters")), CFSTR("RawNightmodeParameters"));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v13, "sensorIDDictionary"), "objectForKeyedSubscript:", CFSTR("ChromaticDefringing")), CFSTR("ChromaticDefringing"));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v13, "sensorIDDictionary"), "objectForKeyedSubscript:", CFSTR("SoftISPTuning")), CFSTR("SoftISPTuning"));
        objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v13, "sensorIDDictionary"), "objectForKeyedSubscript:", CFSTR("ModuleConfig")), CFSTR("ModuleConfig"));
        v32 = objc_msgSend(v13, "sensorIDString");
        v33 = v14;
        objc_msgSend(v27, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1), v11);
        v5 = v10;
        objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(v13, "cameraInfo"), v11);
        v15 = v13;
        v2 = v12;
        objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "sensorIDDictionary"), "objectForKeyedSubscript:", CFSTR("UBCaptureParameters")), "objectForKeyedSubscript:", CFSTR("AdaptiveBracketingParameters")), v11);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v8);
  }
  if (!objc_msgSend(v27, "count"))
  {
    v20 = v21;
    LODWORD(v19) = 0;
    FigDebugAssert3();
  }
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0D06188], v19, v20);
  if (objc_msgSend(v5, "count"))
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D06140]);
  *(_QWORD *)(v2 + 144) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v26);
  objc_msgSend(v22, "setObject:forKeyedSubscript:", a2, *MEMORY[0x1E0D08638]);
  if (objc_msgSend(*(id *)(v2 + 56), "depthDataDeliveryEnabled"))
    objc_msgSend(v22, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D08628]);
  if (objc_msgSend(*(id *)(v2 + 56), "quadraSupportEnabled"))
    objc_msgSend(v22, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D08640]);
  v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[FigCaptureCameraParameters deviceGeneration](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "deviceGeneration"));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D08630]);
  v17 = objc_msgSend(*(id *)(v2 + 80), "setupWithOptions:", v22);
  if ((_DWORD)v17)
    -[BWNRFProcessorController _releaseNRFProcessorResources]((id *)v2);
  return v17;
}

- (void)dealloc
{
  opaqueCMFormatDescription *outputFormatDescription;
  opaqueCMFormatDescription *inferenceInputFormatDescription;
  opaqueCMFormatDescription *demosaicedRawFormatDescription;
  opaqueCMFormatDescription *linearOutputMIWBAppliedFormatDescription;
  opaqueCMFormatDescription *gainMapFormatDescription;
  objc_super v8;

  -[NRFProcessor finishProcessing](self->_nrfProcessor, "finishProcessing");
  -[NRFProcessor setOutput:](self->_nrfProcessor, "setOutput:", 0);
  -[NRFProcessor resetState](self->_nrfProcessor, "resetState");
  -[BWNRFProcessorController _releaseNRFProcessorResources]((id *)&self->super.super.isa);
  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
    CFRelease(outputFormatDescription);
  inferenceInputFormatDescription = self->_inferenceInputFormatDescription;
  if (inferenceInputFormatDescription)
    CFRelease(inferenceInputFormatDescription);
  demosaicedRawFormatDescription = self->_demosaicedRawFormatDescription;
  if (demosaicedRawFormatDescription)
    CFRelease(demosaicedRawFormatDescription);
  linearOutputMIWBAppliedFormatDescription = self->_linearOutputMIWBAppliedFormatDescription;
  if (linearOutputMIWBAppliedFormatDescription)
    CFRelease(linearOutputMIWBAppliedFormatDescription);
  gainMapFormatDescription = self->_gainMapFormatDescription;
  if (gainMapFormatDescription)
    CFRelease(gainMapFormatDescription);

  v8.receiver = self;
  v8.super_class = (Class)BWNRFProcessorController;
  -[BWStillImageProcessorController dealloc](&v8, sel_dealloc);
}

- (void)_releaseNRFProcessorResources
{
  if (a1)
  {

    a1[10] = 0;
    a1[11] = 0;

    a1[8] = 0;
    a1[18] = 0;

    a1[12] = 0;
    a1[13] = 0;

    a1[14] = 0;
    a1[22] = 0;

    a1[20] = 0;
    a1[23] = 0;

    a1[15] = 0;
    a1[21] = 0;

    a1[16] = 0;
    a1[17] = 0;

    a1[19] = 0;
  }
}

- (unint64_t)type
{
  return 6;
}

- (void)input:(id)a3 addFrame:(opaqueCMSampleBuffer *)a4 isReferenceFrame:(BOOL)a5
{
  _BOOL4 v5;
  BWNRFProcessorRequest *currentRequest;
  BWNRFProcessorControllerDelegate *delegate;
  void *v11;

  v5 = a5;
  if (-[BWNRFProcessorRequest input](self->_currentRequest, "input") == a3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      currentRequest = self->_currentRequest;
      if (currentRequest)
        delegate = currentRequest->_delegate;
      else
        delegate = 0;
      -[BWNRFProcessorControllerDelegate processorController:willAddSampleBuffer:processorInput:](delegate, "processorController:willAddSampleBuffer:processorInput:", self, a4, a3);
    }
    nrfp_addFrame((uint64_t)self, (uint64_t)self->_currentRequest, self->_nrfProcessor, a4, v5);
    if (-[BWNRFProcessorRequest err](self->_currentRequest, "err"))
    {
      v11 = -[BWNRFProcessorInput adaptiveBracketingParameters](-[BWNRFProcessorRequest input](self->_currentRequest, "input"));
      -[BWNRFAdaptiveBracketingParameters stopAdaptiveBracketing]((uint64_t)v11);
    }
  }
  -[BWNRFProcessorController _updateStateIfNeeded]((uint64_t)self);
}

- (uint64_t)_updateStateIfNeeded
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  char *v4;
  uint64_t v5;

  if (result)
  {
    v1 = result;
    v2 = *(_QWORD *)(result + 248);
    v3 = objc_msgSend(*(id *)(result + 72), "currentState");
    if (!v2)
    {
      v5 = 1;
      goto LABEL_10;
    }
    if (v3 != 2)
    {
      if (v3 != 4)
      {
        v5 = 2;
LABEL_10:
        result = objc_msgSend(*(id *)(v1 + 72), "currentState");
        if ((_DWORD)v5 != (_DWORD)result)
          return objc_msgSend(*(id *)(v1 + 72), "transitionToState:", v5);
        return result;
      }
      if (-[BWNRFProcessorRequest receivedAllFrames](v2))
      {
        v4 = (char *)&loc_1A2F05634 + 4 * byte_1A32B0F34[-[BWNRFProcessorRequest processingType](v2)];
        __asm { BR              X10 }
      }
    }
    v5 = 4;
    goto LABEL_10;
  }
  return result;
}

- (void)inputReceivedProcessedRawErrorRecoveryFrame:(id)a3
{
  BWNRFProcessorRequest *currentRequest;

  if (-[BWNRFProcessorRequest input](self->_currentRequest, "input") == a3)
  {
    currentRequest = self->_currentRequest;
    if (currentRequest)
    {
      if (currentRequest->_processErrorRecoveryFrame)
        -[BWNRFProcessorController _updateStateIfNeeded]((uint64_t)self);
    }
  }
}

- (void)inputReceivedAllFrames:(id)a3
{
  if (-[BWNRFProcessorRequest input](self->_currentRequest, "input") == a3)
    -[BWNRFProcessorController _updateStateIfNeeded]((uint64_t)self);
}

- (int)enqueueInputForProcessing:(id)a3 delegate:(id)a4 processErrorRecoveryFrame:(BOOL)a5 processOriginalImage:(BOOL)a6 processToneMapping:(BOOL)a7 processInferenceInputImage:(BOOL)a8 clientBracketSequenceNumber:(int)a9 processSemanticRendering:(BOOL)a10 provideInferenceInputImageForProcessing:(BOOL)a11 processSmartStyleRenderingInput:(BOOL)a12 inferencesAvailable:(BOOL)a13
{
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v20;
  int result;
  id v22;
  id v23;
  id v24;
  _QWORD *v25;

  v15 = a6;
  v16 = a5;
  v20 = -[NSSet containsObject:](self->_supportedPortTypes, "containsObject:", objc_msgSend(a3, "portType"));
  result = -12780;
  if ((!v16 || !v15) && v20)
  {
    v22 = objc_alloc_init(self->_nrfUBFusionOutputClass);
    objc_msgSend(v22, "setCompletionStatus:", objc_alloc_init(self->_nrfCompletionStatusClass));
    if ((objc_msgSend((id)objc_msgSend(a3, "captureStreamSettings"), "captureFlags") & 0x800000000) != 0)
    {
      v23 = objc_alloc_init(self->_nrfRawNightModeOutputFrameClass);
      objc_msgSend(v23, "setCompletionStatus:", objc_alloc_init(self->_nrfCompletionStatusClass));
    }
    else
    {
      v23 = 0;
    }
    if (objc_msgSend((id)objc_msgSend(a3, "captureStreamSettings"), "captureType") == 12)
    {
      v24 = objc_alloc_init(self->_nrfDeepFusionOutputClass);
      objc_msgSend(v24, "setCompletionStatus:", objc_alloc_init(self->_nrfCompletionStatusClass));
    }
    else
    {
      v24 = 0;
    }
    v25 = -[BWNRFProcessorRequest initWithInput:output:rawNightModeOutputFrame:deepFusionOutput:processErrorRecoveryFrame:processOriginalImage:processToneMapping:processInferenceInputImage:clientBracketSequenceNumber:processSemanticRendering:provideInferenceInputImageForProcessing:inferencesAvailable:processSmartStyleRenderingInput:delegate:]([BWNRFProcessorRequest alloc], a3, v22, v23, v24, v16, v15, a7, a8, a9, a10, a11, a13, a12, a4);

    -[NSMutableArray addObject:](self->_requestQueue, "addObject:", v25);
    if (-[FigStateMachine currentState](self->_stateMachine, "currentState") == 1)
      -[FigStateMachine transitionToState:](self->_stateMachine, "transitionToState:", 2);
    return 0;
  }
  return result;
}

- (BOOL)finishProcessingCurrentInputNow
{
  BWNRFProcessorRequest *v2;
  char v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v2 = self->_currentRequest;
  if (-[BWNRFProcessorInput adaptiveBracketingParameters](-[BWNRFProcessorRequest input](v2, "input")))
  {
    -[BWNRFProcessorInput stopAdaptiveBracketingNow]((os_unfair_lock_s *)-[BWNRFProcessorRequest input](v2, "input"));
    if (-[BWNRFProcessorRequest err](v2, "err"))
      v3 = -[BWNRFProcessorRequest deliveredAdaptiveBracketingErrorRecoveryFrame](v2, "deliveredAdaptiveBracketingErrorRecoveryFrame");
    else
      v3 = 1;
    if (dword_1EE6BE778)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)cancelProcessing
{
  -[NSMutableArray removeAllObjects](self->_requestQueue, "removeAllObjects");
  -[BWNRFProcessorRequest setErr:](self->_currentRequest, "setErr:", 4294950490);
  -[BWNRFProcessorController _serviceNextRequest](self);
  -[NRFProcessor setOutput:](self->_nrfProcessor, "setOutput:", 0);
  -[NRFProcessor resetState](self->_nrfProcessor, "resetState");
  -[BWNRFProcessorController _updateStateIfNeeded]((uint64_t)self);
}

- (_QWORD)_serviceNextRequest
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  id v4;
  uint64_t v5;

  if (result)
  {
    v1 = result;
    v2 = (_QWORD *)result[31];
    if (v2)
      v2 = (_QWORD *)v2[7];
    v3 = v2;
    v4 = (id)objc_msgSend((id)v1[31], "input");
    v5 = objc_msgSend((id)v1[31], "err");

    v1[31] = 0;
    objc_msgSend(v3, "processorController:didFinishProcessingInput:err:", v1, v4, v5);

    result = (id)objc_msgSend((id)v1[30], "firstObject");
    v1[31] = result;
    if (result)
    {
      objc_msgSend((id)v1[30], "removeObjectAtIndex:", 0);
      return (_QWORD *)objc_msgSend((id)objc_msgSend((id)v1[31], "input"), "setDelegate:", v1);
    }
  }
  return result;
}

- (id)metalImageBufferProcessor
{
  return self->_nrfProcessor;
}

- (uint64_t)_setupProcessorForProcessingType:(uint64_t)a1
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  unsigned int v14;
  BOOL v15;
  uint64_t v17;
  char v18;
  char v19;
  char v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  const void *v24;
  void *v25;
  uint64_t v26;
  float v27;
  int v28;
  int v29;
  uint64_t v30;
  _BYTE *v31;
  BOOL v32;
  char v33;
  int v34;
  void *v35;
  void *v36;
  int *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  const void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  _QWORD *v51;
  uint64_t v52;
  char v53;
  int *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const void *v65;
  uint64_t v66;
  void *v67;
  _QWORD *v68;
  uint64_t v69;
  _BOOL8 v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  BWStillImageSemanticStyle *v74;
  uint64_t v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  _BOOL8 v79;
  const void *v80;
  uint64_t v82;
  uint64_t v83;
  int v84;
  unsigned int cf;
  CFTypeRef cfa;
  unint64_t v87;
  CFTypeRef v88;
  _BOOL4 v89;
  CFTypeRef v90;
  unsigned int v91;
  uint64_t v92;
  CFTypeRef v93;
  unsigned int v94;
  void *v95;
  unint64_t v96;
  void *v97;

  if (!a1)
    return 0;
  if (dword_1EE6BE778)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(*(id *)(a1 + 80), "setOutput:", 0, v82, v83);
  objc_msgSend(*(id *)(a1 + 80), "resetState");
  v97 = (void *)objc_msgSend(*(id *)(a1 + 248), "input");
  v95 = (void *)objc_msgSend(v97, "captureSettings");
  v5 = objc_msgSend(v95, "captureType");
  v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "captureStreamSettings"), "captureFlags");
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 248);
  v92 = a2;
  if (!(_DWORD)a2 && (v5 - 10) <= 2)
  {
    if (!v8 || !*(_BYTE *)(v8 + 40) && !*(_BYTE *)(v8 + 41))
    {
      v91 = 0;
      LOWORD(v9) = 0;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v87 = (v6 >> 7) & 1;
      v84 = 1;
      cf = 1;
      goto LABEL_21;
    }
    goto LABEL_11;
  }
  if (v8)
LABEL_11:
    LODWORD(v8) = *(unsigned __int8 *)(v8 + 40) != 0;
  v10 = a2 == 3;
  v14 = a2;
  v11 = a2 == 4;
  v12 = v14 == 5;
  cf = (v14 < 8) & (0xC1u >> v14);
  v87 = (unint64_t)(v6 & 0x80) >> 7;
  v15 = (v6 & 0x80) != 0 || v14 == 7;
  v9 = v8 ^ 1;
  if (!v15 || v9 == 0)
  {
    v91 = 0;
    v84 = 0;
    v13 = 0;
  }
  else
  {
    v84 = 0;
    v13 = objc_msgSend(v95, "learnedNRStereoPhotoFrameFlag") != 0;
    v91 = 1;
    LOWORD(v9) = 1;
  }
LABEL_21:
  v17 = objc_msgSend(*(id *)(a1 + 248), "processSemanticRendering");
  v96 = v7;
  v89 = v12;
  if ((_DWORD)v17 && v5 == 10)
  {
    v18 = objc_msgSend(v95, "sceneFlags", v17);
    v19 = objc_msgSend(v95, "sceneFlags");
    v17 = 1;
    if ((v18 & 8) != 0 || (v19 & 4) != 0)
    {
      LODWORD(v7) = v96;
    }
    else
    {
      LODWORD(v7) = v96;
      if ((v96 & 0x100000) == 0)
        v17 = (v96 >> 22) & 1;
    }
  }
  objc_msgSend(*(id *)(a1 + 80), "setSrlEnabled:", v17);
  v20 = objc_opt_respondsToSelector();
  v21 = *(_QWORD *)(a1 + 248);
  if ((v20 & 1) != 0)
  {
    if (v21)
      v22 = *(_BYTE *)(v21 + 42) != 0;
    else
      v22 = 0;
    objc_msgSend(*(id *)(a1 + 80), "setSkipDenoising:", v22);
    v21 = *(_QWORD *)(a1 + 248);
    if (!v21)
      goto LABEL_40;
    if (*(_BYTE *)(v21 + 42) && (_DWORD)v92 && (_DWORD)v92 != 6)
      return 4294954516;
  }
  else if (!v21)
  {
    goto LABEL_40;
  }
  if (*(_BYTE *)(v21 + 43))
  {
    if (v12)
    {
      v24 = 0;
      goto LABEL_46;
    }
    goto LABEL_43;
  }
LABEL_40:
  if (((v12 | objc_msgSend((id)v21, "provideInferenceInputImageForProcessing") ^ 1) & 1) != 0)
  {
    v24 = 0;
    goto LABEL_46;
  }
  v21 = *(_QWORD *)(a1 + 248);
  if (!v21)
  {
    v25 = 0;
    goto LABEL_44;
  }
LABEL_43:
  v25 = *(void **)(v21 + 56);
LABEL_44:
  v26 = objc_msgSend(v25, "processorController:newOutputPixelBufferForProcessorInput:type:", a1, v97, -[BWNRFProcessorRequest inferenceInputType](v21));
  if (!v26)
    return 4294954510;
  v24 = (const void *)v26;
  LODWORD(v7) = v96;
LABEL_46:
  v94 = v9 & (v7 >> 20);
  objc_msgSend(*(id *)(a1 + 248), "setGainMapEnabled:", 0);
  objc_msgSend(*(id *)(a1 + 56), "gainMapMainImageDownscalingFactor");
  v28 = v27 == 0.0 || v11;
  if (((v28 | v13) & 1) == 0)
  {
    v29 = -[FigCaptureCameraParameters gainMapVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "gainMapVersion") >> 16;
    if (v29 != 2)
    {
      if (v29 != 1)
        goto LABEL_74;
      if (objc_msgSend(*(id *)(a1 + 56), "depthDataDeliveryEnabled"))
      {
        if ((v96 & 0x800) != 0)
          v30 = v91 | cf ^ 1;
        else
          v30 = 0;
      }
      else if ((cf & 1) != 0)
      {
        if (!v91)
          goto LABEL_74;
        v34 = -[FigCaptureCameraParameters nrfVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "nrfVersion");
        if (!v34)
        {
          v90 = 0;
          v65 = 0;
          v80 = 0;
          v23 = 4294954516;
          goto LABEL_200;
        }
        v30 = v34 > 2;
      }
      else if (v5 == 11)
      {
        v30 = 1;
      }
      else
      {
        v30 = v94 | v10;
      }
      v31 = *(_BYTE **)(a1 + 248);
      goto LABEL_73;
    }
    v31 = *(_BYTE **)(a1 + 248);
    if (v5 == 2 && (v96 & 8) != 0)
    {
      if (!v31)
      {
        v32 = 0;
        goto LABEL_60;
      }
      if (!v31[43])
      {
        v32 = v31[42] != 0;
LABEL_60:
        v33 = 1;
        if (v32 || (v96 & 0x10000) == 0)
          goto LABEL_63;
      }
    }
    v33 = v87 | (v5 == 12) | ((v5 & 0xFFFFFFFE) == 10);
LABEL_63:
    v30 = v33 & 1;
LABEL_73:
    objc_msgSend(v31, "setGainMapEnabled:", v30);
  }
LABEL_74:
  v93 = v24;
  if (v10)
  {
    v35 = *(void **)(a1 + 176);
    v36 = (void *)objc_msgSend(*(id *)(a1 + 248), "deepFusionOutput");
    if (objc_msgSend(v95, "produceDeferredPhotoProxyImage")
      && objc_msgSend((id)objc_msgSend(v97, "processingSettings"), "provideDemosaicedRaw"))
    {
      objc_msgSend(v36, "setLinearOutputMetadata:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"));
    }
    objc_msgSend(v36, "setInferenceInputPixelBuffer:", v93);
    v37 = &OBJC_IVAR___BWSinkNode__handlersToCallWhenActive;
    v38 = v92;
    if (objc_msgSend(*(id *)(a1 + 248), "inferencesAvailable"))
      v39 = objc_msgSend(*(id *)(a1 + 248), "provideInferenceInputImageForProcessing") ^ 1;
    else
      v39 = 0;
    objc_msgSend(v36, "setProvidesInferencesWithoutInferenceInputPixelBuffer:", v39);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if ((v96 & 4) != 0)
      {
        if ((v96 & 0x200000000) != 0)
        {
          v48 = 2;
        }
        else if ((v96 & 0x100000000) != 0)
        {
          v48 = 4;
        }
        else if ((v96 & 0x10) != 0)
        {
          v48 = 3;
        }
        else
        {
          v48 = 1;
        }
      }
      else
      {
        v48 = 0;
      }
      objc_msgSend(*(id *)(a1 + 80), "setDeepFusionProcessingMode:", v48);
    }
    cfa = 0;
    v43 = 0;
    v46 = 0;
LABEL_162:
    v88 = 0;
    v90 = 0;
    v65 = 0;
    goto LABEL_163;
  }
  if (v11)
  {
    v36 = (void *)objc_msgSend(*(id *)(a1 + 248), "rawNightModeOutputFrame");
    v40 = *(_QWORD *)(a1 + 248);
    if (v40)
      v41 = *(void **)(v40 + 56);
    else
      v41 = 0;
    v35 = *(void **)(a1 + 160);
    v42 = objc_msgSend(v41, "processorController:newOutputPixelBufferForProcessorInput:type:", a1, v97, 31);
    v37 = &OBJC_IVAR___BWSinkNode__handlersToCallWhenActive;
    if (v42)
    {
      v43 = (void *)v42;
      v44 = *(_QWORD *)(a1 + 248);
      v38 = v92;
      if (v44)
        v45 = *(void **)(v44 + 56);
      else
        v45 = 0;
      v46 = (const void *)objc_msgSend(v45, "processorController:newOutputPixelBufferForProcessorInput:type:", a1, v97, 32);
      if (!v46)
      {
        v88 = 0;
        v90 = 0;
        v65 = 0;
        v23 = 4294954510;
        v24 = v93;
LABEL_196:
        CFRelease(v43);
LABEL_197:
        if (v46)
          CFRelease(v46);
        v80 = v88;
        goto LABEL_200;
      }
      objc_msgSend(v35, "setWidth:", CVPixelBufferGetWidth((CVPixelBufferRef)v43));
      objc_msgSend(v35, "setHeight:", CVPixelBufferGetHeight((CVPixelBufferRef)v43));
      objc_msgSend(v36, "setPixelBuffer:", v43);
      objc_msgSend(v36, "setNoiseMapPixelBuffer:", v46);
      objc_msgSend(v36, "setInferenceInputPixelBuffer:", v93);
      objc_msgSend(v36, "setMetadata:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"));
      if ((int)objc_msgSend(*(id *)(a1 + 56), "greenGhostMitigationVersion") < 1)
        v47 = 0;
      else
        v47 = objc_msgSend((id)objc_msgSend(v97, "processingSettings"), "provideDemosaicedRaw") ^ 1;
      objc_msgSend(*(id *)(a1 + 80), "setEnableGreenGhostMitigation:", v47);
      objc_msgSend(*(id *)(a1 + 80), "enableGreenGhostMitigation");
      v51 = -[BWNRFProcessorInput adaptiveBracketingParameters]((void *)objc_msgSend(*(id *)(a1 + 248), "input"));
      if (v51)
        v52 = v51[2];
      else
        v52 = 0;
      objc_msgSend(*(id *)(a1 + 80), "setProgressiveBracketingParameters:", v52);
      cfa = 0;
      goto LABEL_162;
    }
    goto LABEL_211;
  }
  v38 = v92;
  if (objc_msgSend((id)objc_msgSend(v97, "processingSettings"), "provideDemosaicedRaw"))
  {
    v49 = *(_QWORD *)(a1 + 248);
    if (v49)
    {
      v37 = &OBJC_IVAR___BWSinkNode__handlersToCallWhenActive;
      if (*(_BYTE *)(v49 + 43))
      {
        v50 = 0;
        goto LABEL_110;
      }
      LODWORD(v49) = *(unsigned __int8 *)(v49 + 42) != 0;
    }
    else
    {
      v37 = &OBJC_IVAR___BWSinkNode__handlersToCallWhenActive;
    }
    v50 = v49 ^ 1;
  }
  else
  {
    v50 = 0;
    v37 = &OBJC_IVAR___BWSinkNode__handlersToCallWhenActive;
  }
LABEL_110:
  v53 = objc_msgSend(*(id *)(a1 + 56), "learnedNRMode");
  v54 = &OBJC_IVAR___BWNRFProcessorController__learnedNRPrepareDescriptor;
  if ((v53 & 0x10) == 0)
    v54 = &OBJC_IVAR___BWNRFProcessorController__prepareDescriptor;
  if ((v92 - 1) < 2)
    v54 = &OBJC_IVAR___BWNRFProcessorController__ubPrepareDescriptor;
  v35 = *(void **)(a1 + *v54);
  v36 = (void *)objc_msgSend(*(id *)(a1 + 248), "output");
  v55 = *(_QWORD *)(a1 + 248);
  if (v55)
  {
    if (*(_BYTE *)(v55 + 43))
    {
      v56 = 0;
LABEL_122:
      cfa = (CFTypeRef)v56;
      objc_msgSend(v36, "setPixelBuffer:", v56);
      objc_msgSend(v36, "setMetadata:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"));
      if (v89)
      {
        objc_msgSend(v36, "setInferenceInputPixelBuffer:", 0);
        v59 = 1;
      }
      else
      {
        objc_msgSend(v36, "setInferenceInputPixelBuffer:", v93);
        if (objc_msgSend(*(id *)(a1 + 248), "inferencesAvailable"))
          v59 = objc_msgSend(*(id *)(a1 + 248), "provideInferenceInputImageForProcessing") ^ 1;
        else
          v59 = 0;
      }
      objc_msgSend(v36, "setProvidesInferencesWithoutInferenceInputPixelBuffer:", v59);
      if (v50)
      {
        v60 = *(_QWORD *)(a1 + 248);
        if (v60)
          v61 = *(void **)(v60 + 56);
        else
          v61 = 0;
        v62 = objc_msgSend(v61, "processorController:newOutputPixelBufferForProcessorInput:type:", a1, v97, 21);
        if (v62)
        {
          objc_msgSend(v36, "setLinearOutputPixelBuffer:", v62);
          objc_msgSend(v36, "setLinearOutputMetadata:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"));
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 248), "setDemosaicedRawErr:", 4294954510);
        }
      }
      else
      {
        v62 = 0;
      }
      v88 = (CFTypeRef)v62;
      if (objc_msgSend(*(id *)(a1 + 248), "processSmartStyleRenderingInput"))
      {
        v63 = *(_QWORD *)(a1 + 248);
        if (v63)
          v64 = *(void **)(v63 + 56);
        else
          v64 = 0;
        v65 = (const void *)objc_msgSend(v64, "processorController:newOutputPixelBufferForProcessorInput:type:", a1, v97, 41);
        if (!v65)
        {
          v43 = 0;
          v46 = 0;
          v90 = 0;
          v23 = 4294954510;
          goto LABEL_193;
        }
        objc_msgSend(v36, "setLinearOutputMIWBAppliedPixelBuffer:", v65);
        objc_msgSend(v36, "setLinearOutputMIWBAppliedMetadata:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"));
      }
      else
      {
        v65 = 0;
      }
      v90 = v65;
      if (objc_msgSend(*(id *)(a1 + 248), "gainMapEnabled"))
      {
        v66 = *(_QWORD *)(a1 + 248);
        if (v66)
          v67 = *(void **)(v66 + 56);
        else
          v67 = 0;
        v65 = (const void *)objc_msgSend(v67, "processorController:newOutputPixelBufferForProcessorInput:type:", a1, v97, 19);
        if (v65 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v36, "setGainMapOutputMetadata:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"));
      }
      else
      {
        v65 = 0;
      }
      objc_msgSend(v36, "setGainMapOutputPixelBuffer:", v65);
      if ((_DWORD)v92 == 5 || (_DWORD)v92 == 2)
      {
        v68 = -[BWNRFProcessorInput adaptiveBracketingParameters]((void *)objc_msgSend(*(id *)(a1 + 248), "input"));
        if (v68)
          v69 = v68[2];
        else
          v69 = 0;
        objc_msgSend(*(id *)(a1 + v37[660]), "setProgressiveBracketingParameters:", v69);
      }
      v70 = (objc_msgSend(v95, "sceneFlags") & 0x100) != 0 && objc_msgSend(v95, "captureType") != 2;
      objc_msgSend(*(id *)(a1 + v37[660]), "setDoRedFaceFix:", v70);
      if ((int)objc_msgSend(*(id *)(a1 + 56), "greenGhostMitigationVersion") < 1)
        v71 = 0;
      else
        v71 = objc_msgSend((id)objc_msgSend(v97, "processingSettings"), "provideDemosaicedRaw") ^ 1;
      objc_msgSend(*(id *)(a1 + v37[660]), "setEnableGreenGhostMitigation:", v71);
      objc_msgSend(*(id *)(a1 + v37[660]), "enableGreenGhostMitigation");
      v43 = 0;
      v46 = 0;
LABEL_163:
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "settings");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && -[BWNRFProcessorRequest imageType](*(_QWORD *)(a1 + 248)) != 38)
      {
        v72 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "settings"), "semanticStyle");
        if (v72 && (v73 = v72, objc_msgSend(*(id *)(a1 + 248), "inferencesAvailable")))
          v74 = -[BWStillImageSemanticStyle initWithSemanticStyle:]([BWStillImageSemanticStyle alloc], "initWithSemanticStyle:", v73);
        else
          v74 = 0;
        objc_msgSend(*(id *)(a1 + v37[660]), "setSemanticStyleProperties:", v74);
      }
      if (v94)
      {
        if ((v96 & 0x1800) == 0x800)
        {
          v75 = 1;
        }
        else
        {
          v76 = objc_msgSend(v97, "fusionMode");
          if (v76 == 2)
            v75 = 2;
          else
            v75 = v76 == 1;
        }
      }
      else
      {
        v75 = 0;
      }
      objc_msgSend(*(id *)(a1 + v37[660]), "setFusionMode:", v75);
      objc_msgSend(*(id *)(a1 + v37[660]), "setReferenceFrameHasEVMinus:", v94);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if ((_DWORD)v38 == 7)
          v77 = 0;
        else
          v77 = v91;
        objc_msgSend(*(id *)(a1 + v37[660]), "setLearnedNREnabled:", v77);
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if (v91)
          v78 = objc_msgSend(v95, "deliverDeferredPhotoProxyImage") ^ 1;
        else
          v78 = 1;
        objc_msgSend(*(id *)(a1 + v37[660]), "setStfAllowed:", v78);
      }
      objc_msgSend(*(id *)(a1 + v37[660]), "setOutput:", v36);
      if (v35)
      {
        if (objc_msgSend(*(id *)(a1 + 56), "cmiResourceEnabled"))
          v79 = objc_msgSend((id)objc_msgSend(v97, "captureStreamSettings"), "captureType") == 12;
        else
          v79 = 0;
        objc_msgSend(v35, "setCmiResourceEnabled:", v79);
        objc_msgSend(v35, "setIsQuadra:", ((unint64_t)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "captureStreamSettings"), "captureFlags") >> 4) & 1);
        objc_msgSend(v35, "setSensorID:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "captureStreamSettings"), "portType")), "sensorIDString"));
        v23 = objc_msgSend(*(id *)(a1 + v37[660]), "prepareToProcess:prepareDescriptor:", v38, v35);
        if (!(_DWORD)v23)
          objc_msgSend(*(id *)(a1 + v37[660]), "setDelegate:", a1);
      }
      else
      {
        v23 = 4294954516;
      }
LABEL_193:
      v24 = v93;
      if (cfa)
        CFRelease(cfa);
      if (!v43)
        goto LABEL_197;
      goto LABEL_196;
    }
    v57 = *(void **)(v55 + 56);
  }
  else
  {
    v57 = 0;
  }
  if (v84)
    v58 = -[BWNRFProcessorRequest fusionErrorRecoveryImageType](v55);
  else
    v58 = -[BWNRFProcessorRequest imageType](v55);
  v56 = objc_msgSend(v57, "processorController:newOutputPixelBufferForProcessorInput:type:", a1, v97, v58);
  if (v56)
    goto LABEL_122;
LABEL_211:
  v90 = 0;
  v65 = 0;
  v80 = 0;
  v23 = 4294954510;
  v24 = v93;
LABEL_200:
  if (v24)
    CFRelease(v24);
  if (v65)
    CFRelease(v65);
  if (v80)
    CFRelease(v80);
  if (v90)
    CFRelease(v90);
  return v23;
}

- (unint64_t)_setupProcessor
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t i;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  unint64_t v8;

  if (result)
  {
    v1 = result;
    v2 = -[BWNRFProcessorRequest processingType](*(_QWORD *)(result + 248));
    v3 = -[BWNRFProcessorController _setupProcessorForProcessingType:](v1, v2);
    if ((_DWORD)v3)
    {
      objc_msgSend(*(id *)(v1 + 248), "setErr:", v3);
      objc_msgSend(*(id *)(v1 + 80), "setOutput:", 0);
      return objc_msgSend(*(id *)(v1 + 80), "resetState");
    }
    else
    {
      for (i = 0; ; ++i)
      {
        v5 = (_QWORD *)objc_msgSend(*(id *)(v1 + 248), "input");
        if (v5)
          v5 = (_QWORD *)v5[7];
        result = objc_msgSend(v5, "count");
        if (result <= i)
          break;
        v6 = (_QWORD *)objc_msgSend(*(id *)(v1 + 248), "input");
        if (v6)
          v6 = (_QWORD *)v6[7];
        v7 = (_QWORD *)objc_msgSend(v6, "objectAtIndexedSubscript:", i);
        v8 = (unint64_t)BWStillImageCaptureFrameFlagsForSampleBuffer(v7);
        nrfp_addFrame(v1, *(_QWORD *)(v1 + 248), *(void **)(v1 + 80), v7, (v8 >> 4) & 1);
      }
    }
  }
  return result;
}

- (void)_processSingleImage
{
  uint64_t v2;
  opaqueCMSampleBuffer *v3;
  _QWORD *v4;
  uint64_t v5;
  _BYTE *v6;
  BOOL v7;
  int v8;
  uint64_t v9;
  void *v10;
  CMAttachmentBearerRef target;

  if (a1)
  {
    target = 0;
    v2 = *(_QWORD *)(a1 + 248);
    if (!v2)
      goto LABEL_7;
    if (*(_BYTE *)(v2 + 40))
    {
      v3 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend((id)v2, "input"), "errorRecoveryFrame");
      goto LABEL_10;
    }
    if (*(int *)(v2 + 44) >= 1)
    {
      v3 = (opaqueCMSampleBuffer *)-[BWNRFProcessorRequest clientBracketFrame](v2);
    }
    else
    {
LABEL_7:
      v4 = (_QWORD *)objc_msgSend((id)v2, "input");
      if (v4)
        v4 = (_QWORD *)v4[7];
      v3 = (opaqueCMSampleBuffer *)objc_msgSend(v4, "firstObject");
    }
LABEL_10:
    v5 = -[BWNRFProcessorController _singleImageProcessSampleBuffer:sampleBufferOut:](a1, v3, &target);
    if ((_DWORD)v5)
      goto LABEL_24;
    v6 = *(_BYTE **)(a1 + 248);
    if (v6)
    {
      if (v6[43])
        v7 = 1;
      else
        v7 = target == 0;
      if (v7)
      {
LABEL_24:
        v9 = *(_QWORD *)(a1 + 248);
        if (v9)
        {
          if (*(_BYTE *)(v9 + 43))
            goto LABEL_28;
          v10 = *(void **)(v9 + 56);
        }
        else
        {
          v10 = 0;
        }
        objc_msgSend(v10, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", a1, target, -[BWNRFProcessorRequest imageType](v9), objc_msgSend(*(id *)(a1 + 248), "input"), v5);
LABEL_28:
        if (target)
          CFRelease(target);
        return;
      }
      if (v6[40])
      {
        v8 = objc_msgSend((id)CMGetAttachment(target, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue");
        CMSetAttachment(target, CFSTR("StillImageProcessingFlags"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8 | 0x400u), 1u);
        if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "captureSettings"), "captureFlags") & 4) != 0)objc_msgSend(*(id *)(a1 + 248), "setErr:", 4294950489);
LABEL_22:
        if (objc_msgSend(*(id *)(a1 + 248), "processSmartStyleRenderingInput"))
          BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)target, 0x1E495B238, (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "linearOutputMIWBAppliedPixelBuffer"), (CFTypeRef *)(a1 + 224), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "linearOutputMIWBAppliedMetadata"), 0, 0);
        goto LABEL_24;
      }
    }
    else if (!target)
    {
      goto LABEL_24;
    }
    if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "input"), "captureSettings"), "captureFlags") & 0x80) != 0)
      CMSetAttachment(target, CFSTR("SDOFCustomRendered"), &unk_1E49F9558, 1u);
    goto LABEL_22;
  }
}

- (uint64_t)_singleImageProcessSampleBuffer:(CMAttachmentBearerRef *)a3 sampleBufferOut:
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __CVBuffer *ImageBuffer;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t CopyWithNewPixelBuffer;
  uint64_t v13;
  _BYTE *v14;
  const __CFString *v15;
  void *v16;
  int v17;
  CMAttachmentBearerRef v18;
  int v19;
  _QWORD *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  __CVBuffer *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CMAttachmentBearerRef target[17];

  target[16] = *(CMAttachmentBearerRef *)MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (!sbuf)
    return 4294954516;
  if (dword_1EE6BE778)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
  v8 = (const __CFString *)*MEMORY[0x1E0D05A10];
  v9 = (void *)CVBufferCopyAttachment(ImageBuffer, (CFStringRef)*MEMORY[0x1E0D05A10], 0);
  v10 = *(void **)(a1 + 80);
  if (v9)
    v11 = objc_msgSend(v10, "addInputResource:", v9);
  else
    v11 = objc_msgSend(v10, "addFrame:", sbuf);
  CopyWithNewPixelBuffer = v11;

  CVBufferRemoveAttachment(ImageBuffer, v8);
  if (!(_DWORD)CopyWithNewPixelBuffer)
  {
    v13 = objc_msgSend(*(id *)(a1 + 80), "process");
    if ((_DWORD)v13)
      return v13;
    -[BWNRFProcessorController _logCompletionStatus:processingType:request:](a1, (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 80), "output"), "completionStatus"), 0, *(void **)(a1 + 248));
    v14 = *(_BYTE **)(a1 + 248);
    if (v14 && v14[43])
      return 0;
    target[0] = 0;
    CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer(sbuf, (__CVBuffer *)objc_msgSend((id)objc_msgSend(v14, "output", v28, v30), "pixelBuffer"), (CFTypeRef *)(a1 + 200), (CMSampleBufferRef *)target);
    if (!(_DWORD)CopyWithNewPixelBuffer)
    {
      if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "metadata"), "objectForKeyedSubscript:", CFSTR("UB")))objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "metadata"), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionary"), CFSTR("UB"));
      v15 = (const __CFString *)*MEMORY[0x1E0D05CB0];
      v16 = (void *)objc_msgSend((id)CMGetAttachment(target[0], (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "mutableCopy");
      objc_msgSend(v16, "addEntriesFromDictionary:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "metadata"));
      CMSetAttachment(target[0], v15, v16, 1u);

      if (-[BWNRFProcessorRequest imageType](*(_QWORD *)(a1 + 248)) == 29)
      {
        v17 = objc_msgSend((id)CMGetAttachment(target[0], CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue");
        CMSetAttachment(target[0], CFSTR("StillImageProcessingFlags"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v17 | 0x1000u), 1u);
        objc_msgSend(*(id *)(a1 + 248), "setDeliveredDeferredProxyImage:", 1);
      }
      else if (-[BWNRFProcessorRequest imageType](*(_QWORD *)(a1 + 248)) == 38)
      {
        v18 = target[0];
        v19 = BWStillImageProcessingFlagsForSampleBuffer(target[0]);
        BWStillImageSetProcessingFlagsForSampleBuffer(v18, v19 | 0x100000);
      }
      if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "gainMapOutputPixelBuffer"))
      {
        v20 = *(_QWORD **)(a1 + 248);
        if (v20)
          v21 = (void *)v20[7];
        else
          v21 = 0;
        LODWORD(v29) = 0;
        objc_msgSend(v21, "processorController:didFinishProcessingBuffer:metadata:type:captureFrameFlags:processorInput:err:", a1, objc_msgSend((id)objc_msgSend(v20, "output"), "gainMapOutputPixelBuffer"), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "metadata"), 19, 0, objc_msgSend(*(id *)(a1 + 248), "input"), v29);
        objc_msgSend(*(id *)(a1 + 248), "output");
        if ((objc_opt_respondsToSelector() & 1) != 0
          && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "gainMapOutputMetadata"))
        {
          v22 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "gainMapOutputMetadata");
        }
        else
        {
          v22 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        }
        v23 = (void *)v22;
        v24 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[FigCaptureCameraParameters gainMapVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "gainMapVersion"));
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0D05F08]);
        BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)target[0], 0x1E4936818, (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "gainMapOutputPixelBuffer"), (CFTypeRef *)(a1 + 232), (uint64_t)v23, 0, 1);
      }
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "processingSettings"), "provideDemosaicedRaw"))
      {
        v25 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "linearOutputPixelBuffer");
        v26 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "linearOutputMetadata");
        -[BWNRFProcessorController _propagateDemosaicedRawPixelBuffer:demosaicedRawMetadata:outputSampleBuffer:error:](a1, v25, v26, (void *)target[0], objc_msgSend(*(id *)(a1 + 248), "demosaicedRawErr"));
      }
      if (objc_msgSend(*(id *)(a1 + 248), "processSmartStyleRenderingInput"))
        BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)target[0], 0x1E495B238, (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "linearOutputMIWBAppliedPixelBuffer"), (CFTypeRef *)(a1 + 224), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "linearOutputMIWBAppliedMetadata"), 0, 0);
      if (a3)
        *a3 = target[0];
    }
  }
  return CopyWithNewPixelBuffer;
}

- (void)_processUBFusion
{
  void *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  const __CFString **v9;
  uint64_t v10;
  void *v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t k;
  uint64_t v17;
  uint64_t AttachedMedia;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  opaqueCMSampleBuffer *v22;
  void *v23;
  uint64_t i;
  int j;
  void *v26;
  int v27;
  int v28;
  double v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  _QWORD *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  void *ExifCompositeImageMetadata;
  __CVBuffer *v48;
  void *v49;
  NSObject *v50;
  unsigned int v51;
  unsigned int v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id v57;
  uint64_t v58;
  CMTime *v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  int v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  int v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  os_log_type_t type;
  unsigned int v73;
  CMAttachmentBearerRef target;
  const __CFString *v75;
  id v76;
  _BYTE v77[128];
  const __CFString *v78;
  _QWORD v79[4];
  CMTime v80;
  uint64_t v81;
  CMTime v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  target = 0;
  v2 = (void *)objc_msgSend(*(id *)(a1 + 248), "output");
  if (dword_1EE6BE778)
  {
    v73 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (objc_msgSend(*(id *)(a1 + 248), "err", v58, v60))
  {
    v4 = (id)objc_msgSend(v2, "metadata");
    if (!v4)
      v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 248), "err")), CFSTR("UBAddFrameFailure"));
    goto LABEL_64;
  }
  objc_msgSend(*(id *)(a1 + 248), "setErr:", objc_msgSend(*(id *)(a1 + 80), "process"));
  v4 = (id)objc_msgSend(v2, "metadata");
  if (!objc_msgSend(*(id *)(a1 + 248), "err"))
  {
    v5 = (void *)objc_msgSend(v2, "completionStatus");
    v6 = -[BWNRFProcessorRequest processingType](*(_QWORD *)(a1 + 248));
    -[BWNRFProcessorController _logCompletionStatus:processingType:request:](a1, v5, v6, *(void **)(a1 + 248));
    objc_msgSend(*(id *)(a1 + 248), "setErr:", BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "referenceFrame"), (__CVBuffer *)objc_msgSend(v2, "pixelBuffer"), (CFTypeRef *)(a1 + 200), (CMSampleBufferRef *)&target));
    if (!objc_msgSend(*(id *)(a1 + 248), "err"))
    {
      if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "captureSettings"), "captureFlags") & 0x800) == 0)
      {
LABEL_25:
        if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "gainMapOutputPixelBuffer"))
        {
          objc_msgSend(*(id *)(a1 + 248), "output");
          if ((objc_opt_respondsToSelector() & 1) != 0
            && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "gainMapOutputMetadata"))
          {
            v19 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "gainMapOutputMetadata");
          }
          else
          {
            v19 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          }
          v20 = (void *)v19;
          v21 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[FigCaptureCameraParameters gainMapVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "gainMapVersion"));
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D05F08]);
          BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)target, 0x1E4936818, (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "gainMapOutputPixelBuffer"), (CFTypeRef *)(a1 + 232), (uint64_t)v20, 0, 1);
        }
        if (objc_msgSend(v2, "fusionMode") == 2 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v22 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "evMinusReferenceFrame");
          memset(&v82, 0, sizeof(v82));
          CMSampleBufferGetPresentationTimeStamp(&v82, v22);
          v23 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          for (i = 0; i != 3; ++i)
          {
            for (j = 0; j != 3; ++j)
            {
              v26 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v2, "refFrameTransform");
              v63 = v27;
              v65 = v28;
              v62 = v29;
              v64 = v30;
              v67 = v31;
              v66 = v32;
              LODWORD(v29) = *(_DWORD *)((unint64_t)(&v62 + 2 * i) & 0xFFFFFFFFFFFFFFF3 | (4 * (j & 3)));
              objc_msgSend(v23, "addObject:", objc_msgSend(v26, "numberWithFloat:", v29));
            }
          }
          v33 = *(_QWORD **)(a1 + 248);
          if (v33)
            v34 = (void *)v33[7];
          else
            v34 = 0;
          v35 = objc_msgSend(v33, "input");
          v80 = v82;
          objc_msgSend(v34, "processorController:didSelectNewReferenceFrameWithPTS:transform:processorInput:", a1, &v80, v23, v35);
        }
        CMSetAttachment(target, CFSTR("HasUnreliableBracketingMetadata"), MEMORY[0x1E0C9AAB0], 1u);
        v36 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
        if (objc_msgSend(*(id *)(a1 + 248), "processSmartStyleRenderingInput"))
          BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)target, 0x1E495B238, (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "linearOutputMIWBAppliedPixelBuffer"), (CFTypeRef *)(a1 + 224), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "linearOutputMIWBAppliedMetadata"), 0, 0);
        objc_msgSend(v36, "addEntriesFromDictionary:", v4);
        v37 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v2, "fusionMode"));
        objc_msgSend(v36, "setObject:forKeyedSubscript:", v37, *MEMORY[0x1E0D05EF0]);
        if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "captureSettings"), "captureFlags") & 0x100000) != 0)
        {
          v38 = objc_msgSend((id)CMGetAttachment(target, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue");
          CMSetAttachment(target, CFSTR("StillImageProcessingFlags"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v38 | 2u), 1u);
          if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "captureSettings"), "deliverOriginalImage") & 1) != 0|| objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "settings"), "HDRMode") == 1)
          {
            if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "captureSettings"), "deliverOriginalImage"))v39 = 3;
            else
              v39 = 2;
            v40 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v39);
            objc_msgSend(v36, "setObject:forKeyedSubscript:", v40, *MEMORY[0x1E0D06B08]);
          }
        }
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "captureSettings"), "captureType") == 11)
        {
          v41 = objc_msgSend(*(id *)(a1 + 248), "numberOfFramesAddedForMultiFrameProcessing");
          objc_msgSend(*(id *)(a1 + 248), "totalExposureTimesOfFramesAddedForMultiFrameProcessing");
          v43 = v42;
          objc_msgSend(*(id *)(a1 + 248), "minExposureTimesOfFramesAddedForMultiFrameProcessing");
          v45 = v44;
          objc_msgSend(*(id *)(a1 + 248), "maxExposureTimesOfFramesAddedForMultiFrameProcessing");
          ExifCompositeImageMetadata = (void *)FigCaptureMetadataUtilitiesCreateExifCompositeImageMetadata(v41, v43, v45, v46);
          objc_msgSend(v36, "addEntriesFromDictionary:", ExifCompositeImageMetadata);

          CMSetAttachment(target, CFSTR("OisRecenteringLoggingData"), (CFTypeRef)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "oisRecenteringLoggingData"), 1u);
          CMSetAttachment(target, CFSTR("ISPMotionHighPassFilterConvergenceFlags"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "ispMotionHighPassFilterConvergenceFlags")), 1u);
        }
        else
        {
          objc_msgSend(v36, "setObject:forKeyedSubscript:", &unk_1E49F9570, CFSTR("CompositeImage"));
        }
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "processingSettings"), "provideDemosaicedRaw"))
        {
          v48 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "linearOutputPixelBuffer");
          v49 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "linearOutputMetadata");
          -[BWNRFProcessorController _propagateDemosaicedRawPixelBuffer:demosaicedRawMetadata:outputSampleBuffer:error:](a1, v48, v49, (void *)target, objc_msgSend(*(id *)(a1 + 248), "demosaicedRawErr"));
        }
        if (dword_1EE6BE778)
        {
          v73 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v50 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v51 = v73;
          if (os_log_type_enabled(v50, type))
            v52 = v51;
          else
            v52 = v51 & 0xFFFFFFFE;
          if (v52)
          {
            v53 = *(void **)(a1 + 248);
            v54 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v53, "input"), "settings"), "settingsID");
            LODWORD(v80.value) = 136315651;
            *(CMTimeValue *)((char *)&v80.value + 4) = (CMTimeValue)"-[BWNRFProcessorController _processUBFusion]";
            LOWORD(v80.flags) = 2113;
            *(_QWORD *)((char *)&v80.flags + 2) = v53;
            HIWORD(v80.epoch) = 2048;
            v81 = v54;
            LODWORD(v61) = 32;
            v59 = &v80;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        v55 = *(_QWORD *)(a1 + 248);
        if (v55)
          v56 = *(void **)(v55 + 56);
        else
          v56 = 0;
        objc_msgSend(v56, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", a1, target, -[BWNRFProcessorRequest imageType](v55), objc_msgSend(*(id *)(a1 + 248), "input"), objc_msgSend(*(id *)(a1 + 248), "err"));
        goto LABEL_64;
      }
      v7 = objc_msgSend(v2, "fusionMode");
      if (v7 == 1)
      {
        if (!BWSampleBufferGetAttachedMedia(target, (uint64_t)CFSTR("SensorInterfaceRaw")))
        {
          v78 = CFSTR("SensorInterfaceRaw");
          v8 = (void *)MEMORY[0x1E0C99D20];
          v9 = &v78;
          v10 = 1;
          goto LABEL_17;
        }
      }
      else if (v7 == 2)
      {
        v79[0] = CFSTR("Depth");
        v79[1] = 0x1E495AF58;
        v79[2] = 0x1E495AED8;
        v79[3] = CFSTR("FocusPixelData");
        v8 = (void *)MEMORY[0x1E0C99D20];
        v9 = (const __CFString **)v79;
        v10 = 4;
LABEL_17:
        v11 = (void *)objc_msgSend(v8, "arrayWithObjects:count:", v9, v10);
LABEL_18:
        v12 = (const void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "evMinusReferenceFrame");
        v68 = 0u;
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v69;
          do
          {
            for (k = 0; k != v14; ++k)
            {
              if (*(_QWORD *)v69 != v15)
                objc_enumerationMutation(v11);
              v17 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * k);
              AttachedMedia = BWSampleBufferGetAttachedMedia(v12, v17);
              BWSampleBufferSetAttachedMedia(target, v17, AttachedMedia);
            }
            v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
          }
          while (v14);
        }
        goto LABEL_25;
      }
      v11 = 0;
      goto LABEL_18;
    }
  }
LABEL_64:
  if (objc_msgSend(*(id *)(a1 + 248), "err", v59, v61))
  {
    if (v4)
      v57 = v4;
    else
      v57 = (id)MEMORY[0x1E0C9AA70];
    v75 = CFSTR("UBFusionFailure");
    v76 = v57;
    -[BWNRFProcessorController _handleFusionErrorRecoveryWithFailureMetadata:]((id *)a1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1));
  }
  if (target)
    CFRelease(target);

}

- (void)_logCompletionStatus:(int)a3 processingType:(void *)a4 request:
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[7];
  int v12;

  if (a1)
  {
    if (a2)
    {
      v7 = -[BWNRFProcessorCompletionStatus initWithCompletionStatus:]([BWNRFProcessorCompletionStatus alloc], a2);
      v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "input"), "settings"), "settingsID");
      v9 = objc_msgSend(a4, "description");
      v10 = *(NSObject **)(a1 + 192);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __72__BWNRFProcessorController__logCompletionStatus_processingType_request___block_invoke;
      v11[3] = &unk_1E4921268;
      v12 = a3;
      v11[4] = v7;
      v11[5] = v9;
      v11[6] = v8;
      dispatch_async(v10, v11);
    }
  }
}

- (void)_propagateDemosaicedRawPixelBuffer:(void *)a3 demosaicedRawMetadata:(void *)target outputSampleBuffer:(int)a5 error:
{
  void *v6;
  const __CFString *v10;
  void *v11;
  int v12;
  CFTypeRef v13;
  void *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t PixelFormatType;
  float v23;
  float v24;
  unint64_t v25;
  void *v26;
  CMAttachmentBearerRef targeta;

  if (a1)
  {
    v6 = 0;
    targeta = 0;
    if (!a2 || a5)
      goto LABEL_15;
    v10 = (const __CFString *)*MEMORY[0x1E0D05CB0];
    v11 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v6 = (void *)objc_msgSend(v11, "mutableCopy");
    if (objc_msgSend(a3, "count"))
      objc_msgSend(v6, "addEntriesFromDictionary:", a3);
    if (BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)target, a2, (CFTypeRef *)(a1 + 216), (CMSampleBufferRef *)&targeta))goto LABEL_15;
    v12 = objc_msgSend((id)CMGetAttachment(targeta, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue");
    CMSetAttachment(targeta, CFSTR("StillImageProcessingFlags"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12 | 0x10000u), 1u);
    v13 = CMGetAttachment(targeta, CFSTR("RawDNGDictionary"), 0);
    if (v13)
    {
      v14 = (void *)v13;
      v15 = psn_pixelBufferDimensions(a2);
      v16 = (void *)BWCreateDNGDictionaryWithUpdatedToneCurvesIfNeeded(v14, v15, v6);
      if (!v16)
        goto LABEL_14;
    }
    else
    {
      v17 = objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
      v18 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "rawColorCalibrationsByPortType"), "objectForKeyedSubscript:", v17);
      if (!v18)
        goto LABEL_15;
      v19 = (void *)v18;
      v20 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", v17), "cameraInfo");
      if (!v20)
        goto LABEL_15;
      v21 = (void *)v20;
      PixelFormatType = CVPixelBufferGetPixelFormatType(a2);
      v23 = (float)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "settings"), "outputWidth");
      v24 = v23
          / (float)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "settings"), "outputHeight");
      v25 = psn_pixelBufferDimensions(a2);
      v16 = (void *)BWCreateDemosaicedRawDNGDictionary(v25, PixelFormatType, v6, v19, v21, v24);
      if (!v16)
        goto LABEL_15;
    }
    v26 = v16;
    CMSetAttachment(targeta, CFSTR("RawDNGDictionary"), v16, 1u);

LABEL_14:
    CMSetAttachment(targeta, v10, v6, 1u);
    BWSampleBufferSetAttachedMedia(target, 0x1E495B0F8, (uint64_t)targeta);
LABEL_15:

    if (targeta)
      CFRelease(targeta);
  }
}

- (void)_handleFusionErrorRecoveryWithFailureMetadata:(id *)a1
{
  opaqueCMSampleBuffer *v4;
  __CVBuffer *ImageBuffer;
  OSType PixelFormatType;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  CMAttachmentBearerRef v11;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  CMAttachmentBearerRef target[23];

  target[22] = *(CMAttachmentBearerRef *)MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  if (!objc_msgSend(a1[31], "err"))
    return;
  objc_msgSend(a1[10], "setOutput:", 0);
  objc_msgSend(a1[10], "resetState");
  if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1[31], "input"), "captureSettings"), "deliverOriginalImage") & 1) != 0)
    return;
  v4 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(a1[31], "input"), "errorRecoveryFrame");
  if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1[31], "input"), "captureSettings"), "captureFlags") & 4) == 0
    || objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1[31], "input"), "captureSettings"), "captureType") == 11)
  {
    if (v4)
    {
      target[0] = 0;
      if (-[BWNRFProcessorController _setupProcessorForProcessingType:]((uint64_t)a1, 0)
        || (-[BWNRFProcessorController _singleImageProcessSampleBuffer:sampleBufferOut:]((uint64_t)a1, v4, target),
            (v11 = target[0]) == 0))
      {
        ImageBuffer = CMSampleBufferGetImageBuffer(v4);
        PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer);
        if (PixelFormatType != objc_msgSend((id)objc_msgSend(a1[7], "outputFormat"), "pixelFormat")
          || BWCMSampleBufferCreateCopyIncludingMetadata(v4, (CMSampleBufferRef *)target)
          || !dword_1EE6BE778)
        {
LABEL_23:
          v11 = target[0];
          if (!target[0])
            goto LABEL_28;
          goto LABEL_24;
        }
      }
      else if (!dword_1EE6BE778)
      {
LABEL_24:
        v13 = objc_msgSend((id)CMGetAttachment(v11, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue");
        CMSetAttachment(target[0], CFSTR("StillImageProcessingFlags"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v13 | 0x400u), 1u);
        objc_msgSend((id)CMGetAttachment(target[0], (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "addEntriesFromDictionary:", a2);
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1[31], "input"), "captureSettings"), "captureType") == 11)
        {
          objc_msgSend(a1[31], "setDeliveredAdaptiveBracketingErrorRecoveryFrame:", 1);
          CMSetAttachment(target[0], CFSTR("OisRecenteringLoggingData"), (CFTypeRef)objc_msgSend((id)objc_msgSend(a1[31], "input"), "oisRecenteringLoggingData"), 1u);
          CMSetAttachment(target[0], CFSTR("ISPMotionHighPassFilterConvergenceFlags"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(a1[31], "input"), "ispMotionHighPassFilterConvergenceFlags")), 1u);
        }
        if (target[0])
        {
          v14 = 0;
LABEL_29:
          v15 = (uint64_t)a1[31];
          if (v15)
            v16 = *(void **)(v15 + 56);
          else
            v16 = 0;
          objc_msgSend(v16, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", a1, target[0], -[BWNRFProcessorRequest fusionErrorRecoveryImageType](v15), objc_msgSend(a1[31], "input"), v14);
          if (target[0])
            CFRelease(target[0]);
          return;
        }
LABEL_28:
        v14 = objc_msgSend(a1[31], "err", v17, v18);
        goto LABEL_29;
      }
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      goto LABEL_23;
    }
    goto LABEL_17;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = a1[31];
    if (v7)
      v8 = (void *)v7[7];
    else
      v8 = 0;
    objc_msgSend(a1[31], "setErr:", objc_msgSend(v8, "processorController:processRawErrorRecoveryFrameForProcessorInput:failureMetadata:", a1, objc_msgSend(v7, "input"), a2));
  }
  if (objc_msgSend(a1[31], "err"))
  {
LABEL_17:
    v9 = (uint64_t)a1[31];
    if (v9)
      v10 = *(void **)(v9 + 56);
    else
      v10 = 0;
    objc_msgSend(v10, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", a1, 0, -[BWNRFProcessorRequest fusionErrorRecoveryImageType](v9), objc_msgSend(a1[31], "input"), objc_msgSend(a1[31], "err"));
  }
}

- (void)_processOriginalImage
{
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  CMAttachmentBearerRef target;

  if (a1)
  {
    target = 0;
    v2 = -[BWNRFProcessorController _singleImageProcessSampleBuffer:sampleBufferOut:](a1, (CMSampleBufferRef)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "originalImage"), &target);
    if (target)
    {
      v3 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      v4 = objc_msgSend((id)CMGetAttachment(target, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue");
      CMSetAttachment(target, CFSTR("StillImageProcessingFlags"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4 | 1u), 1u);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E49F9588, *MEMORY[0x1E0D06B08]);
      if (!(_DWORD)v2)
        objc_msgSend(v3, "addEntriesFromDictionary:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "metadata"));
    }
    v5 = *(_QWORD *)(a1 + 248);
    if (v5)
      v6 = *(void **)(v5 + 56);
    else
      v6 = 0;
    objc_msgSend(v6, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", a1, target, -[BWNRFProcessorRequest imageType](v5), objc_msgSend(*(id *)(a1 + 248), "input"), v2);
    if (target)
      CFRelease(target);
  }
}

- (void)_processDigitalFlash
{
  if (a1)
  {
    if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "captureStreamSettings"), "captureFlags") & 0x800000000) != 0)-[BWNRFProcessorController _processRawNightMode](a1);
    else
      -[BWNRFProcessorController _processUBFusion](a1);
  }
}

- (void)_processRawNightMode
{
  void *v2;
  void *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  void *ExifCompositeImageMetadata;
  __CVBuffer *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CMAttachmentBearerRef cf;
  CMAttachmentBearerRef target;
  const __CFString *v33;
  _QWORD v34[23];

  v34[21] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    cf = 0;
    target = 0;
    v2 = (void *)objc_msgSend(*(id *)(a1 + 248), "rawNightModeOutputFrame");
    v3 = (void *)objc_msgSend(*(id *)(a1 + 248), "output");
    if (dword_1EE6BE778)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (objc_msgSend(*(id *)(a1 + 248), "err", v27, v29))
    {
      v5 = (id)objc_msgSend((id)objc_msgSend(v2, "metadata"), "mutableCopy");
      if (!v5)
        v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 248), "err")), CFSTR("RawNightModeAddFrameFailure"));
    }
    else
    {
      v6 = (void *)MEMORY[0x1A858DD40]();
      objc_msgSend(*(id *)(a1 + 248), "setErr:", objc_msgSend(*(id *)(a1 + 80), "process"));
      objc_autoreleasePoolPop(v6);
      v5 = (id)objc_msgSend((id)objc_msgSend(v2, "metadata"), "mutableCopy");
      if (!objc_msgSend(*(id *)(a1 + 248), "err"))
      {
        objc_msgSend(*(id *)(a1 + 248), "setErr:", -[BWNRFProcessorController _setupProcessorForProcessingType:](a1, 5));
        if (!objc_msgSend(*(id *)(a1 + 248), "err"))
        {
          v7 = (void *)objc_msgSend(v2, "completionStatus");
          v8 = -[BWNRFProcessorRequest processingType](*(_QWORD *)(a1 + 248));
          -[BWNRFProcessorController _logCompletionStatus:processingType:request:](a1, v7, v8, *(void **)(a1 + 248));
          objc_msgSend(*(id *)(a1 + 248), "setErr:", BWCMSampleBufferCreateDeepCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "referenceFrame"), (__CVBuffer *)objc_msgSend(v2, "pixelBuffer"), 0, (CFTypeRef *)(a1 + 200), (CMSampleBufferRef *)&target));
          if (!objc_msgSend(*(id *)(a1 + 248), "err"))
          {
            CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05D28], (CFTypeRef)objc_msgSend(v2, "noiseMapPixelBuffer"), 1u);
            v9 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
            objc_msgSend(v9, "addEntriesFromDictionary:", v5);
            v10 = (void *)MEMORY[0x1A858DD40](objc_msgSend(*(id *)(a1 + 80), "addFrame:", target));
            objc_msgSend(*(id *)(a1 + 248), "setErr:", objc_msgSend(*(id *)(a1 + 80), "process"));
            objc_autoreleasePoolPop(v10);
            if (!objc_msgSend(*(id *)(a1 + 248), "err"))
            {
              -[BWNRFProcessorController _logCompletionStatus:processingType:request:](a1, (void *)objc_msgSend(v3, "completionStatus"), 5, *(void **)(a1 + 248));
              objc_msgSend(*(id *)(a1 + 248), "setErr:", BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "referenceFrame"), (__CVBuffer *)objc_msgSend(v3, "pixelBuffer"), (CFTypeRef *)(a1 + 200), (CMSampleBufferRef *)&cf));
              if (!objc_msgSend(*(id *)(a1 + 248), "err"))
              {
                if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "gainMapOutputPixelBuffer"))
                {
                  objc_msgSend(*(id *)(a1 + 248), "output");
                  if ((objc_opt_respondsToSelector() & 1) != 0
                    && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "gainMapOutputMetadata"))
                  {
                    v11 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "gainMapOutputMetadata");
                  }
                  else
                  {
                    v11 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                  }
                  v12 = (void *)v11;
                  v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[FigCaptureCameraParameters gainMapVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "gainMapVersion"));
                  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D05F08]);
                  BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)cf, 0x1E4936818, (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "gainMapOutputPixelBuffer"), (CFTypeRef *)(a1 + 232), (uint64_t)v12, 0, 1);
                }
                CMSetAttachment(cf, CFSTR("HasUnreliableBracketingMetadata"), MEMORY[0x1E0C9AAB0], 1u);
                objc_msgSend(v9, "addEntriesFromDictionary:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "metadata"));
                v14 = objc_msgSend(*(id *)(a1 + 248), "numberOfFramesAddedForMultiFrameProcessing");
                objc_msgSend(*(id *)(a1 + 248), "totalExposureTimesOfFramesAddedForMultiFrameProcessing");
                v16 = v15;
                objc_msgSend(*(id *)(a1 + 248), "minExposureTimesOfFramesAddedForMultiFrameProcessing");
                v18 = v17;
                objc_msgSend(*(id *)(a1 + 248), "maxExposureTimesOfFramesAddedForMultiFrameProcessing");
                ExifCompositeImageMetadata = (void *)FigCaptureMetadataUtilitiesCreateExifCompositeImageMetadata(v14, v16, v18, v19);
                objc_msgSend(v9, "addEntriesFromDictionary:", ExifCompositeImageMetadata);

                CMSetAttachment(cf, CFSTR("OisRecenteringLoggingData"), (CFTypeRef)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "oisRecenteringLoggingData"), 1u);
                CMSetAttachment(cf, CFSTR("ISPMotionHighPassFilterConvergenceFlags"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "ispMotionHighPassFilterConvergenceFlags")), 1u);
                if (objc_msgSend(*(id *)(a1 + 248), "processSmartStyleRenderingInput"))
                  BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)cf, 0x1E495B238, (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "linearOutputMIWBAppliedPixelBuffer"), (CFTypeRef *)(a1 + 224), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "linearOutputMIWBAppliedMetadata"), 0, 0);
                if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "input"), "processingSettings"), "provideDemosaicedRaw"))
                {
                  v21 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "linearOutputPixelBuffer");
                  v22 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 248), "output"), "linearOutputMetadata");
                  -[BWNRFProcessorController _propagateDemosaicedRawPixelBuffer:demosaicedRawMetadata:outputSampleBuffer:error:](a1, v21, v22, (void *)cf, objc_msgSend(*(id *)(a1 + 248), "demosaicedRawErr"));
                }
                if (dword_1EE6BE778)
                {
                  v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                }
                v24 = *(_QWORD *)(a1 + 248);
                if (v24)
                  v25 = *(void **)(v24 + 56);
                else
                  v25 = 0;
                objc_msgSend(v25, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", a1, cf, -[BWNRFProcessorRequest imageType](v24), objc_msgSend(*(id *)(a1 + 248), "input"), objc_msgSend(*(id *)(a1 + 248), "err"));
              }
            }
          }
        }
      }
    }
    if (objc_msgSend(*(id *)(a1 + 248), "err", v28, v30))
    {
      if (v5)
        v26 = v5;
      else
        v26 = (id)MEMORY[0x1E0C9AA70];
      v33 = CFSTR("NRFFusionFailure");
      v34[0] = v26;
      -[BWNRFProcessorController _handleFusionErrorRecoveryWithFailureMetadata:]((id *)a1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1));
    }
    if (cf)
      CFRelease(cf);
    if (target)
      CFRelease(target);

  }
}

- (void)_processDeepFusion
{
  void *v2;
  void *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  __CVBuffer *v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  __CVBuffer *v12;
  _QWORD *v13;
  void *v14;
  uint64_t v15;
  __CVBuffer *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  _QWORD v22[23];

  v22[22] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v2 = (void *)objc_msgSend(a1[31], "input");
  v3 = (void *)objc_msgSend(a1[31], "deepFusionOutput");
  if (dword_1EE6BE778)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!objc_msgSend(a1[31], "err", v19, v20))
  {
    if ((objc_msgSend((id)objc_msgSend(v2, "captureSettings"), "captureFlags") & 4) != 0)
      goto LABEL_22;
    if (!objc_msgSend(v3, "syntheticLongPixelBuffer"))
    {
      v5 = a1[31];
      if (v5)
        v6 = (void *)v5[7];
      else
        v6 = 0;
      v7 = objc_msgSend(v6, "processorController:newOutputPixelBufferForProcessorInput:type:", a1, v2, 10);
      if (!v7)
        goto LABEL_30;
      v8 = (__CVBuffer *)v7;
      objc_msgSend(v3, "setSyntheticLongPixelBuffer:", v7);
      CVPixelBufferRelease(v8);
      objc_msgSend(v3, "setSyntheticLongMetadata:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"));
    }
    if (objc_msgSend(v3, "syntheticLongFusionMapPixelBuffer"))
    {
LABEL_16:
      if (!objc_msgSend(v3, "longFusionMapPixelBuffer")
        && (objc_msgSend((id)objc_msgSend(v2, "captureSettings"), "captureFlags") & 0x400000) != 0)
      {
        v13 = a1[31];
        if (v13)
          v14 = (void *)v13[7];
        else
          v14 = 0;
        v15 = objc_msgSend(v14, "processorController:newOutputPixelBufferForProcessorInput:type:", a1, v2, 12);
        if (v15)
        {
          v16 = (__CVBuffer *)v15;
          objc_msgSend(v3, "setLongFusionMapPixelBuffer:", v15);
          CVPixelBufferRelease(v16);
          goto LABEL_22;
        }
        goto LABEL_30;
      }
LABEL_22:
      objc_msgSend(a1[31], "setErr:", objc_msgSend(a1[10], "process"));
      if (!objc_msgSend(a1[31], "err"))
      {
        v17 = (void *)objc_msgSend((id)objc_msgSend(a1[10], "output"), "completionStatus");
        v18 = -[BWNRFProcessorRequest processingType]((uint64_t)a1[31]);
        -[BWNRFProcessorController _logCompletionStatus:processingType:request:]((uint64_t)a1, v17, v18, a1[31]);
        if (objc_msgSend(a1[7], "deepFusionWaitForProcessingToFinish"))
          objc_msgSend(a1[10], "finishProcessing");
      }
      goto LABEL_25;
    }
    v9 = a1[31];
    if (v9)
      v10 = (void *)v9[7];
    else
      v10 = 0;
    v11 = objc_msgSend(v10, "processorController:newOutputPixelBufferForProcessorInput:type:", a1, v2, 11);
    if (v11)
    {
      v12 = (__CVBuffer *)v11;
      objc_msgSend(v3, "setSyntheticLongFusionMapPixelBuffer:", v11);
      CVPixelBufferRelease(v12);
      goto LABEL_16;
    }
LABEL_30:
    objc_msgSend(a1[31], "setErr:", 4294954510);
  }
LABEL_25:
  if (objc_msgSend(a1[31], "err")
    && objc_msgSend((id)objc_msgSend(v2, "captureSettings"), "deliverDeferredPhotoProxyImage")
    && (objc_msgSend(a1[31], "deliveredDeferredProxyImage") & 1) == 0)
  {
    v21 = CFSTR("UBDeepFusionFusionFailure");
    v22[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a1[31], "err"));
    -[BWNRFProcessorController _handleFusionErrorRecoveryWithFailureMetadata:](a1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1));
  }
}

- (void)processor:(id)a3 outputReadyWithFrameType:(int)a4 outputPixelBuffer:(__CVBuffer *)a5 outputMetadata:(id)a6 error:(int)a7
{
  char v10;
  NRFDeepFusionOutput *v11;
  opaqueCMSampleBuffer *v12;
  void *v13;
  uint64_t i;
  int j;
  void *v16;
  int v17;
  int v18;
  double v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  BWNRFProcessorRequest *currentRequest;
  BWNRFProcessorControllerDelegate *delegate;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BWNRFProcessorRequest *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  BWNRFProcessorRequest *v37;
  BWNRFProcessorControllerDelegate *v38;
  BWNRFProcessorControllerDelegate *v39;
  uint64_t v40;
  BWNRFProcessorControllerDelegate *v41;
  BWNRFProcessorController *v42;
  __CVBuffer *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  BWNRFProcessorRequest *v47;
  opaqueCMSampleBuffer *v48;
  BWNRFProcessorControllerDelegate *v49;
  uint64_t v50;
  BWNRFProcessorRequest *v51;
  BWNRFProcessorControllerDelegate *v52;
  uint64_t v53;
  BWNRFProcessorControllerDelegate *v54;
  BWNRFProcessorController *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  BWNRFProcessorRequest *v61;
  BWNRFProcessorControllerDelegate *v62;
  uint64_t v63;
  id v64;
  CMTime v65;
  double v66;
  int v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  int v71;
  CMTime v72;

  if (!a7)
  {
    if (a4 == 3)
    {
      v10 = -[BWStillImageCaptureSettings captureFlags](-[BWStillImageProcessorControllerInput captureSettings](-[BWNRFProcessorRequest input](self->_currentRequest, "input", a3), "captureSettings"), "captureFlags");
      if (a5 || (v10 & 4) != 0)
      {
        v11 = -[BWNRFProcessorRequest deepFusionOutput](self->_currentRequest, "deepFusionOutput");
        if ((-[NRFDeepFusionOutput refFrameTransformIsValid](v11, "refFrameTransformIsValid") & 1) != 0
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v64 = a6;
          v12 = -[BWNRFProcessorInput evMinusReferenceFrame](-[BWNRFProcessorRequest input](self->_currentRequest, "input"), "evMinusReferenceFrame");
          memset(&v72, 0, sizeof(v72));
          CMSampleBufferGetPresentationTimeStamp(&v72, v12);
          v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          for (i = 0; i != 3; ++i)
          {
            for (j = 0; j != 3; ++j)
            {
              v16 = (void *)MEMORY[0x1E0CB37E8];
              -[NRFDeepFusionOutput refFrameTransform](v11, "refFrameTransform");
              v67 = v17;
              v69 = v18;
              v66 = v19;
              v68 = v20;
              v71 = v21;
              v70 = v22;
              LODWORD(v19) = *(_DWORD *)((unint64_t)(&v66 + 2 * i) & 0xFFFFFFFFFFFFFFF3 | (4 * (j & 3)));
              objc_msgSend(v13, "addObject:", objc_msgSend(v16, "numberWithFloat:", v19));
            }
          }
          currentRequest = self->_currentRequest;
          if (currentRequest)
            delegate = currentRequest->_delegate;
          else
            delegate = 0;
          a6 = v64;
          v25 = -[BWNRFProcessorRequest input](currentRequest, "input");
          v65 = v72;
          -[BWNRFProcessorControllerDelegate processorController:didSelectNewReferenceFrameWithPTS:transform:processorInput:](delegate, "processorController:didSelectNewReferenceFrameWithPTS:transform:processorInput:", self, &v65, v13, v25);
        }
        v26 = -[NRFDeepFusionOutput gainMapOutputPixelBuffer](-[BWNRFProcessorRequest deepFusionOutput](self->_currentRequest, "deepFusionOutput"), "gainMapOutputPixelBuffer");
        if (v26)
        {
          v27 = v26;
          -[BWNRFProcessorRequest deepFusionOutput](self->_currentRequest, "deepFusionOutput");
          if ((objc_opt_respondsToSelector() & 1) != 0
            && -[NRFDeepFusionOutput gainMapOutputMetadata](-[BWNRFProcessorRequest deepFusionOutput](self->_currentRequest, "deepFusionOutput"), "gainMapOutputMetadata"))
          {
            v28 = -[NRFDeepFusionOutput gainMapOutputMetadata](-[BWNRFProcessorRequest deepFusionOutput](self->_currentRequest, "deepFusionOutput"), "gainMapOutputMetadata");
          }
          else
          {
            v28 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          }
          v35 = (void *)v28;
          v36 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[FigCaptureCameraParameters gainMapVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "gainMapVersion"));
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v36, *MEMORY[0x1E0D05F08]);
          v37 = self->_currentRequest;
          if (v37)
            v38 = v37->_delegate;
          else
            v38 = 0;
          LODWORD(v63) = 0;
          -[BWNRFProcessorControllerDelegate processorController:didFinishProcessingBuffer:metadata:type:captureFrameFlags:processorInput:err:](v38, "processorController:didFinishProcessingBuffer:metadata:type:captureFrameFlags:processorInput:err:", self, v27, v35, 19, 0, -[BWNRFProcessorRequest input](v37, "input"), v63);
        }
        v29 = self->_currentRequest;
        v30 = 8;
LABEL_32:
        if (v29)
          v39 = v29->_delegate;
        else
          v39 = 0;
        v40 = -[BWNRFProcessorRequest input](v29, "input", a3);
        LODWORD(v63) = 0;
        v41 = v39;
        v42 = self;
        v43 = a5;
        v44 = a6;
        v45 = v30;
LABEL_35:
        -[BWNRFProcessorControllerDelegate processorController:didFinishProcessingBuffer:metadata:type:captureFrameFlags:processorInput:err:](v41, "processorController:didFinishProcessingBuffer:metadata:type:captureFrameFlags:processorInput:err:", v42, v43, v44, v45, 0, v40, v63);
      }
    }
    else if (a5)
    {
      v29 = self->_currentRequest;
      v30 = 9;
      switch(a4)
      {
        case 2:
          v31 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[NRFDeepFusionOutput fusionMode](-[BWNRFProcessorRequest deepFusionOutput](v29, "deepFusionOutput", a3), "fusionMode"));
          objc_msgSend(a6, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0D05EF0]);
          v32 = (void *)-[BWNRFProcessorController _newOutputSampleBufferWithSampleBuffer:pixelBuffer:formatDescriptionInOut:metadataToMerge:](self, -[BWNRFProcessorInput referenceFrame](-[BWNRFProcessorRequest input](self->_currentRequest, "input"), "referenceFrame"), a5, (CFTypeRef *)&self->_outputFormatDescription, (uint64_t)a6);
          if (!-[BWStillImageCaptureSettings deliverDeferredPhotoProxyImage](-[BWStillImageProcessorControllerInput captureSettings](-[BWNRFProcessorRequest input](self->_currentRequest, "input"), "captureSettings"), "deliverDeferredPhotoProxyImage"))goto LABEL_63;
          v33 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)CMGetAttachment(v32, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue") | 0x1000);
          CMSetAttachment(v32, CFSTR("StillImageProcessingFlags"), v33, 1u);
          -[BWNRFProcessorRequest setDeliveredDeferredProxyImage:](self->_currentRequest, "setDeliveredDeferredProxyImage:", 1);
          if (-[BWStillImageProcessingSettings provideDemosaicedRaw](-[BWStillImageProcessorControllerInput processingSettings](-[BWNRFProcessorRequest input](self->_currentRequest, "input"), "processingSettings"), "provideDemosaicedRaw"))
          {
            -[BWNRFProcessorController _propagateDemosaicedRawPixelBuffer:demosaicedRawMetadata:outputSampleBuffer:error:]((uint64_t)self, (__CVBuffer *)-[NRFDeepFusionOutput linearOutputPixelBuffer](-[BWNRFProcessorRequest deepFusionOutput](self->_currentRequest, "deepFusionOutput"), "linearOutputPixelBuffer"), (void *)-[NRFDeepFusionOutput linearOutputMetadata](-[BWNRFProcessorRequest deepFusionOutput](self->_currentRequest, "deepFusionOutput"), "linearOutputMetadata"), v32, -[BWNRFProcessorRequest demosaicedRawErr](self->_currentRequest, "demosaicedRawErr"));
          }
          if (-[NRFDeepFusionOutput gainMapOutputPixelBuffer](-[BWNRFProcessorRequest deepFusionOutput](self->_currentRequest, "deepFusionOutput"), "gainMapOutputPixelBuffer"))
          {
            -[BWNRFProcessorRequest deepFusionOutput](self->_currentRequest, "deepFusionOutput");
            if ((objc_opt_respondsToSelector() & 1) != 0
              && -[NRFDeepFusionOutput gainMapOutputMetadata](-[BWNRFProcessorRequest deepFusionOutput](self->_currentRequest, "deepFusionOutput"), "gainMapOutputMetadata"))
            {
              v34 = -[NRFDeepFusionOutput gainMapOutputMetadata](-[BWNRFProcessorRequest deepFusionOutput](self->_currentRequest, "deepFusionOutput"), "gainMapOutputMetadata");
            }
            else
            {
              v34 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            }
            v59 = (void *)v34;
            v60 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[FigCaptureCameraParameters gainMapVersion](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "gainMapVersion"));
            objc_msgSend(v59, "setObject:forKeyedSubscript:", v60, *MEMORY[0x1E0D05F08]);
            BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)v32, 0x1E4936818, (__CVBuffer *)-[NRFDeepFusionOutput gainMapOutputPixelBuffer](-[BWNRFProcessorRequest deepFusionOutput](self->_currentRequest, "deepFusionOutput"), "gainMapOutputPixelBuffer"), (CFTypeRef *)&self->_gainMapFormatDescription, (uint64_t)v59, 0, 1);
          }
          if (-[BWNRFProcessorRequest processSmartStyleRenderingInput](self->_currentRequest, "processSmartStyleRenderingInput"))
          {
            BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)v32, 0x1E495B238, (__CVBuffer *)-[NRFDeepFusionOutput linearOutputMIWBAppliedPixelBuffer](-[BWNRFProcessorRequest deepFusionOutput](self->_currentRequest, "deepFusionOutput"), "linearOutputMIWBAppliedPixelBuffer"), (CFTypeRef *)&self->_demosaicedRawFormatDescription, -[NRFDeepFusionOutput linearOutputMIWBAppliedMetadata](-[BWNRFProcessorRequest deepFusionOutput](self->_currentRequest, "deepFusionOutput"), "linearOutputMIWBAppliedMetadata"), 0, 0);
          }
          v61 = self->_currentRequest;
          if (v61)
            v62 = v61->_delegate;
          else
            v62 = 0;
          v53 = -[BWNRFProcessorRequest input](v61, "input");
          v54 = v62;
          v55 = self;
          v56 = v32;
          v57 = 7;
          v58 = 0;
          break;
        case 4:
          goto LABEL_32;
        case 5:
          v30 = 10;
          goto LABEL_32;
        case 6:
          v30 = 11;
          goto LABEL_32;
        case 7:
          v30 = 12;
          goto LABEL_32;
        case 9:
          v46 = -[BWNRFProcessorRequest inferenceInputType]((uint64_t)v29);
          v47 = self->_currentRequest;
          if (v47 && v47->_processErrorRecoveryFrame)
            goto LABEL_39;
          v48 = -[BWNRFProcessorInput referenceFrame](-[BWNRFProcessorRequest input](v47, "input"), "referenceFrame");
          if (!v48)
          {
            v47 = self->_currentRequest;
LABEL_39:
            v48 = -[BWNRFProcessorInput errorRecoveryFrame](-[BWNRFProcessorRequest input](v47, "input"), "errorRecoveryFrame");
          }
          v32 = (void *)-[BWNRFProcessorController _newOutputSampleBufferWithSampleBuffer:pixelBuffer:formatDescriptionInOut:metadataToMerge:](self, v48, a5, (CFTypeRef *)&self->_inferenceInputFormatDescription, (uint64_t)a6);
          if (v32)
            v50 = 0;
          else
            v50 = 4294954516;
          v51 = self->_currentRequest;
          if (v51)
            v52 = v51->_delegate;
          else
            v52 = 0;
          v53 = -[BWNRFProcessorRequest input](v51, "input");
          v54 = v52;
          v55 = self;
          v56 = v32;
          v57 = v46;
          v58 = v50;
          break;
        case 10:
          if (!-[BWNRFProcessorRequest demosaicedRawErr](v29, "demosaicedRawErr", a3))
            -[BWNRFProcessorRequest setDemosaicedRawErr:](self->_currentRequest, "setDemosaicedRawErr:", 0);
          return;
        case 11:
          if (v29)
            v49 = v29->_delegate;
          else
            v49 = 0;
          v40 = -[BWNRFProcessorRequest input](v29, "input", a3);
          LODWORD(v63) = 0;
          v41 = v49;
          v42 = self;
          v43 = a5;
          v44 = a6;
          v45 = 19;
          goto LABEL_35;
        default:
          return;
      }
      -[BWNRFProcessorControllerDelegate processorController:didFinishProcessingSampleBuffer:type:processorInput:err:](v54, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", v55, v56, v57, v53, v58);
LABEL_63:
      if (v32)
        CFRelease(v32);
    }
  }
}

- (CMAttachmentBearerRef)_newOutputSampleBufferWithSampleBuffer:(__CVBuffer *)a3 pixelBuffer:(CFTypeRef *)a4 formatDescriptionInOut:(uint64_t)a5 metadataToMerge:
{
  const __CFString *v6;
  void *v7;
  CMAttachmentBearerRef target;

  if (result)
  {
    target = 0;
    if (a2 && a3)
    {
      if (BWCMSampleBufferCreateCopyWithNewPixelBuffer(a2, a3, a4, (CMSampleBufferRef *)&target))
      {
        FigDebugAssert3();
      }
      else
      {
        v6 = (const __CFString *)*MEMORY[0x1E0D05CB0];
        v7 = (void *)objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "mutableCopy");
        objc_msgSend(v7, "addEntriesFromDictionary:", a5);
        CMSetAttachment(target, v6, v7, 1u);

      }
    }
    return target;
  }
  return result;
}

- (void)processor:(id)a3 didSelectFusionMode:(int)a4
{
  BWNRFProcessorRequest *currentRequest;
  BWNRFProcessorControllerDelegate *delegate;

  currentRequest = self->_currentRequest;
  if (currentRequest)
    delegate = currentRequest->_delegate;
  else
    delegate = 0;
  -[BWNRFProcessorControllerDelegate processorController:didSelectFusionMode:processorInput:](delegate, "processorController:didSelectFusionMode:processorInput:", self, *(_QWORD *)&a4, -[BWNRFProcessorRequest input](currentRequest, "input", a3));
}

- (void)processor:(id)a3 didSelectProgressiveFusionReferenceFrameIndex:(int)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v7;
  unint64_t v8;
  int v9;
  BWNRFProcessorInput *v10;
  BWNRFProcessorInput *v11;
  _QWORD *v12;
  BWNRFProcessorRequest *currentRequest;
  BWNRFProcessorRequest *v14;
  BWNRFProcessorControllerDelegate *delegate;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (dword_1EE6BE778)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v7 = -[BWStillImageCaptureStreamSettings referenceFrameIndex](-[BWStillImageProcessorControllerInput captureStreamSettings](-[BWNRFProcessorRequest input](self->_currentRequest, "input", a3, v16, v17), "captureStreamSettings"), "referenceFrameIndex");
  if ((a4 & 0x80000000) == 0
    && v7 < 0
    && !-[BWNRFProcessorInput referenceFrame](-[BWNRFProcessorRequest input](self->_currentRequest, "input"), "referenceFrame"))
  {
    v8 = 0;
    v9 = 0;
    while (1)
    {
      v10 = -[BWNRFProcessorRequest input](self->_currentRequest, "input");
      if (v10)
        v10 = (BWNRFProcessorInput *)v10->_frames;
      if (-[BWNRFProcessorInput count](v10, "count") <= v8)
        break;
      v11 = -[BWNRFProcessorRequest input](self->_currentRequest, "input");
      if (v11)
        v11 = (BWNRFProcessorInput *)v11->_frames;
      v12 = (_QWORD *)-[BWNRFProcessorInput objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", v8);
      if (-[BWNRFProcessorRequest useFrameForMultiFrameProcessing:]((uint64_t)self->_currentRequest, v12))
      {
        if (v9 == a4)
        {
          if (v12)
          {
            -[BWNRFProcessorInput _setReferenceFrame:]((_QWORD *)-[BWNRFProcessorRequest input](self->_currentRequest, "input"), v12);
            -[BWNRFProcessorInput _setErrorRecoveryFrame:]((_QWORD *)-[BWNRFProcessorRequest input](self->_currentRequest, "input"), (_QWORD *)-[BWNRFProcessorInput errorRecoveryFrame](-[BWNRFProcessorRequest input](self->_currentRequest, "input"), "errorRecoveryFrame"));
            currentRequest = self->_currentRequest;
            if (currentRequest
              && objc_msgSend(-[BWStillImageCaptureStreamSettings adaptiveUnifiedBracketedCaptureParams](-[BWStillImageProcessorControllerInput captureStreamSettings](currentRequest->_input, "captureStreamSettings"), "adaptiveUnifiedBracketedCaptureParams"), "count"))
            {
              -[BWNRFProcessorInput setKeepFrames:](-[BWNRFProcessorRequest input](self->_currentRequest, "input"), "setKeepFrames:", 0);
            }
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v14 = self->_currentRequest;
              if (v14)
                delegate = v14->_delegate;
              else
                delegate = 0;
              -[BWNRFProcessorControllerDelegate processorController:didSelectLowLightReferenceFrame:processorInput:](delegate, "processorController:didSelectLowLightReferenceFrame:processorInput:", self, v12, -[BWNRFProcessorRequest input](v14, "input"));
            }
          }
          return;
        }
        ++v9;
      }
      ++v8;
    }
  }
}

- (id)processorGetInferenceResults:(id)a3
{
  id v4;
  BWNRFProcessorRequest *currentRequest;
  BWNRFProcessorControllerDelegate *delegate;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(NSClassFromString(CFSTR("NRFProcessorInferenceResults")));
  if (-[BWNRFProcessorRequest inferencesAvailable](self->_currentRequest, "inferencesAvailable"))
  {
    currentRequest = self->_currentRequest;
    if (currentRequest)
      delegate = currentRequest->_delegate;
    else
      delegate = 0;
    v7 = (void *)-[BWNRFProcessorControllerDelegate processorController:newInferencesForProcessorInput:inferenceInputBufferType:](delegate, "processorController:newInferencesForProcessorInput:inferenceInputBufferType:", self, -[BWNRFProcessorRequest input](currentRequest, "input"), -[BWNRFProcessorRequest inferenceInputType]((uint64_t)self->_currentRequest));
    v8 = objc_msgSend(v7, "inferenceBufferForAttachedMediaKey:", CFSTR("PersonSemanticsSkin"));
    if (v8)
      objc_msgSend(v4, "setSkinMask:", v8);
    v9 = objc_msgSend(v7, "inferenceBufferForAttachedMediaKey:", CFSTR("PersonSemanticsHair"));
    if (v9)
      objc_msgSend(v4, "setHairMask:", v9);
    v10 = objc_msgSend(v7, "inferenceBufferForAttachedMediaKey:", 0x1E495B0B8);
    if (v10)
      objc_msgSend(v4, "setSkyMask:", v10);
    if (-[BWNRFProcessorControllerConfiguration semanticRenderingVersion](self->_configuration, "semanticRenderingVersion") < 4)
    {
      v12 = objc_msgSend(v7, "inferenceBufferForAttachedMediaKey:", 0x1E49511B8);
      if (v12)
        objc_msgSend(v4, "setPersonMask:", v12);
    }
    else
    {
      v11 = objc_msgSend(v7, "inferenceBufferForAttachedMediaKey:", 0x1E495AF38);
      if (v11)
        objc_msgSend(v4, "setHighResPersonMask:", v11);
    }
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v14 = BWInferenceLowResPersonInstanceMaskKeys();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v24;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v14);
          v19 = objc_msgSend(v7, "inferenceBufferForAttachedMediaKey:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v18), (_QWORD)v23);
          if (v19)
            objc_msgSend(v13, "addObject:", v19);
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v16);
    }
    if (objc_msgSend(v13, "count", (_QWORD)v23))
    {
      objc_msgSend(v4, "setLowResPersonInstanceMasks:", v13);
      objc_msgSend(v4, "setLowResPersonInstanceConfidences:", objc_msgSend(v7, "inferenceForAttachmentKey:", 0x1E4951338));
      objc_msgSend(v4, "setLowResPersonInstanceBoundingBoxes:", objc_msgSend(v7, "inferenceForAttachmentKey:", 0x1E4951358));
    }
    objc_msgSend(v4, "setSmartCameraSceneType:", objc_msgSend(-[BWStillImageCaptureSettings metadata](-[BWStillImageProcessorControllerInput captureSettings](-[BWNRFProcessorRequest input](self->_currentRequest, "input"), "captureSettings"), "metadata"), "semanticStyleSceneTypeAsSmartCameraSceneType"));
    v20 = objc_msgSend(v7, "inferenceForAttachmentKey:", 0x1E4951158);
    if (v20)
      objc_msgSend(v4, "setSkinToneClassificationsForFaces:", v20);
    v21 = objc_msgSend(v7, "inferenceForAttachmentKey:", 0x1E4951058);
    if (v21)
      objc_msgSend(v4, "setFaceLandmarks:", v21);
  }
  else
  {
    v7 = 0;
  }

  return v4;
}

- (void)processor:(id)a3 didEnqueueProcessingForSurfaceID:(unsigned int)a4
{
  +[BWIOSurfaceTracking noteSurfaceIDInUse:byClient:](BWIOSurfaceTracking, "noteSurfaceIDInUse:byClient:", *(_QWORD *)&a4, self->_nrfProcessorClassName);
}

- (void)processor:(id)a3 didCompleteProcessingForSurfaceID:(unsigned int)a4
{
  +[BWIOSurfaceTracking noteSurfaceIDNoLongerInUse:byClient:](BWIOSurfaceTracking, "noteSurfaceIDNoLongerInUse:byClient:", *(_QWORD *)&a4, self->_nrfProcessorClassName);
}

- (int)progressiveLowLightFusionBatchSize
{
  int result;

  result = -[BWNRFProcessorControllerConfiguration lowLightFusionEnabled](self->_configuration, "lowLightFusionEnabled");
  if (result)
    return -[NRFProcessor progressiveBatchSize](self->_nrfProcessor, "progressiveBatchSize");
  return result;
}

- (id)adaptiveBracketingParametersForDigitalFlashMode:(int)a3 frameStatistics:(id)a4 stationary:(BOOL)a5 sphereOffsetEnabled:(BOOL)a6 detectedObjects:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v13;
  id v14;
  id NRFStatisticsFromFrameStatistics;
  _DWORD *v16;

  if (a3
    && (v8 = a6,
        v9 = a5,
        (v13 = -[NSDictionary objectForKeyedSubscript:](self->_adaptiveBracketingCaptureParametersByPortType, "objectForKeyedSubscript:", objc_msgSend(a4, "portType"))) != 0))
  {
    v14 = v13;
    NRFStatisticsFromFrameStatistics = nfrp_createNRFStatisticsFromFrameStatistics(self->_nrfProgressiveBracketingStatisticsClass, a4, v9, a7);
    v16 = -[BWNRFAdaptiveBracketingParameters initWithProgressiveBracketingParameters:progressiveBracketingStatisticsClass:]([BWNRFAdaptiveBracketingParameters alloc], (id)objc_msgSend(objc_alloc(self->_nrfProgressiveBracketingParametersClass), "initWithOptions:portType:statistics:mode:sphereOffsetEnabled:", v14, objc_msgSend(a4, "portType"), NRFStatisticsFromFrameStatistics, a3 == 2, v8), (uint64_t)self->_nrfProgressiveBracketingStatisticsClass);

  }
  else
  {
    v16 = 0;
  }
  return v16;
}

- (id)adaptiveBracketingDigitalFlashTotalIntegrationTimesProviderForPortType:(id)a3
{
  _DWORD *v5;

  v5 = -[NSDictionary objectForKeyedSubscript:](self->_adaptiveBracketingCaptureParametersByPortType, "objectForKeyedSubscript:");
  if (v5)
    v5 = -[BWNRFAdaptiveBracketingParameters initWithProgressiveBracketingParameters:progressiveBracketingStatisticsClass:]([BWNRFAdaptiveBracketingParameters alloc], (id)objc_msgSend(objc_alloc(self->_nrfProgressiveBracketingParametersClass), "initWithOptions:portType:statistics:mode:sphereOffsetEnabled:", v5, a3, 0, 0, 0), (uint64_t)self->_nrfProgressiveBracketingStatisticsClass);
  return v5;
}

void __72__BWNRFProcessorController__logCompletionStatus_processingType_request___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4[27];

  v4[26] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A858DD40]();
  v4[0] = 0;
  -[BWNRFProcessorCompletionStatus waitForCompletionWithDescriptionOut:](*(_QWORD *)(a1 + 32), v4);
  if (dword_1EE6BE778)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }

  objc_autoreleasePoolPop(v2);
}

@end

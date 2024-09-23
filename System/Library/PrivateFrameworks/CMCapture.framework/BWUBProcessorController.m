@implementation BWUBProcessorController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWUBProcessorController)initWithConfiguration:(id)a3
{
  BWUBProcessorController *v4;
  FigStateMachine *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BWUBProcessorController;
  v4 = -[BWUBProcessorController init](&v7, sel_init);
  if (v4)
  {
    v4->_configuration = (BWUBProcessorControllerConfiguration *)a3;
    v4->_requestQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = -[FigStateMachine initWithLabel:stateCount:initialState:owner:]([FigStateMachine alloc], "initWithLabel:stateCount:initialState:owner:", CFSTR("BWUBProcessorController state machine"), 8, 1, v4);
    -[FigStateMachine setPerformsAtomicStateTransitions:](v5, "setPerformsAtomicStateTransitions:", 0);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("Idle"), 1);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("Ready"), 2);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("WaitingForFrames"), 4);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("ProcessingSingleImage"), 8);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("ProcessingUBOriginalImage"), 16);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("ProcessingUBFusion"), 32);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("ProcessingUBLowLightFusion"), 64);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("ProcessingUBDeepFusion"), 128);
    -[FigStateMachine whenTransitioningToStates:callHandler:](v5, "whenTransitioningToStates:callHandler:", 1, &__block_literal_global_45);
    -[FigStateMachine whenTransitioningToStates:callHandler:](v5, "whenTransitioningToStates:callHandler:", 2, &__block_literal_global_545);
    -[FigStateMachine whenTransitioningToState:callHandler:](v5, "whenTransitioningToState:callHandler:", 4, &__block_literal_global_546);
    -[FigStateMachine whenTransitioningToState:callHandler:](v5, "whenTransitioningToState:callHandler:", 8, &__block_literal_global_547);
    -[FigStateMachine whenTransitioningToState:callHandler:](v5, "whenTransitioningToState:callHandler:", 16, &__block_literal_global_548);
    -[FigStateMachine whenTransitioningToState:callHandler:](v5, "whenTransitioningToState:callHandler:", 32, &__block_literal_global_549);
    -[FigStateMachine whenTransitioningToState:callHandler:](v5, "whenTransitioningToState:callHandler:", 64, &__block_literal_global_550);
    -[FigStateMachine whenTransitioningToState:callHandler:](v5, "whenTransitioningToState:callHandler:", 128, &__block_literal_global_551);
    v4->_stateMachine = v5;
    if (-[BWUBProcessorController _loadSetupAndPrepareUBProcessor]((uint64_t)v4))
    {

      return 0;
    }
  }
  return v4;
}

- (uint64_t)_loadSetupAndPrepareUBProcessor
{
  uint64_t v1;
  uint64_t v2;
  int *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id obj;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = a1;
  if (*(_QWORD *)(a1 + 80))
    return 0;
  v3 = &OBJC_IVAR___BWSinkNode__handlersToCallWhenActive;
  if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "sensorConfigurationsByPortType"), "count")
    || !objc_msgSend(*(id *)(v2 + 56), "inputFormat")
    || !objc_msgSend(*(id *)(v2 + 56), "outputFormat"))
  {
    goto LABEL_42;
  }
  v31 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v34 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("DefaultSensorIDs"));
  v33 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v35 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = (id)objc_msgSend(*(id *)(v2 + 56), "sensorConfigurationsByPortType");
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(obj);
        v10 = v3;
        v11 = v3[572];
        v12 = v2;
        v13 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v2 + v11), "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(v13, "sensorIDString"), objc_msgSend(v13, "portType"));
        v14 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v15 = objc_msgSend((id)objc_msgSend(v13, "sensorIDDictionary"), "objectForKeyedSubscript:", CFSTR("UBParameters"));
        if (v15)
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("UBParameters"));
        v16 = objc_msgSend((id)objc_msgSend(v13, "sensorIDDictionary"), "objectForKeyedSubscript:", CFSTR("ChromaticDefringing"));
        if (v16)
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("ChromaticDefringing"));
        v41 = objc_msgSend(v13, "sensorIDString");
        v42 = v14;
        objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1), objc_msgSend(v13, "portType"));
        objc_msgSend(v34, "setObject:forKeyedSubscript:", objc_msgSend(v13, "cameraInfo"), objc_msgSend(v13, "portType"));
        objc_msgSend(v33, "addObject:", objc_msgSend(v13, "portType"));
        objc_msgSend(v35, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "sensorIDDictionary"), "objectForKeyedSubscript:", CFSTR("UBCaptureParameters")), "objectForKeyedSubscript:", CFSTR("AdaptiveBracketingParameters")), objc_msgSend(v13, "portType"));
        v2 = v12;
        v3 = v10;
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v7);
  }
  if (!objc_msgSend(v4, "count"))
  {
    v30 = v1;
    LODWORD(v29) = 0;
    FigDebugAssert3();
  }
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D06188], v29, v30);
  if (objc_msgSend(v34, "count"))
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v34, *MEMORY[0x1E0D06140]);
  *(_QWORD *)(v2 + 64) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithSet:", v33);
  *(_QWORD *)(v2 + 120) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v35);
  v17 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/VideoProcessors/UB.bundle"));
  if (!v17)
  {
LABEL_42:
    FigDebugAssert3();
    return 0;
  }
  v18 = v17;
  v36 = 0;
  if (!objc_msgSend(v17, "loadAndReturnError:", &v36))
    goto LABEL_41;
  v19 = objc_msgSend(v18, "classNamed:", CFSTR("UBFusionOutput"));
  *(_QWORD *)(v2 + 96) = v19;
  if (!v19)
    goto LABEL_41;
  v20 = objc_msgSend(v18, "classNamed:", CFSTR("UBDeepFusionOutput"));
  *(_QWORD *)(v2 + 128) = v20;
  if (!v20)
    goto LABEL_41;
  v21 = objc_msgSend(v18, "classNamed:", CFSTR("UBProgressiveBracketingStatistics"));
  *(_QWORD *)(v2 + 104) = v21;
  if (!v21)
    goto LABEL_41;
  v22 = objc_msgSend(v18, "classNamed:", CFSTR("UBProgressiveBracketingParameters"));
  *(_QWORD *)(v2 + 112) = v22;
  if (!v22)
    goto LABEL_41;
  v23 = objc_msgSend(objc_alloc((Class)objc_msgSend(v18, "classNamed:", CFSTR("UBProcessor"))), "initWithCommandQueue:", objc_msgSend(*(id *)(v2 + v3[572]), "metalCommandQueue"));
  *(_QWORD *)(v2 + 80) = v23;
  if (!v23)
    goto LABEL_41;
  v24 = objc_alloc_init((Class)objc_msgSend(v18, "classNamed:", CFSTR("UBPrepareDescriptor")));
  *(_QWORD *)(v2 + 88) = v24;
  if (!v24)
    goto LABEL_41;
  objc_msgSend(*(id *)(v2 + 88), "setWidth:", objc_msgSend((id)objc_msgSend(*(id *)(v2 + v3[572]), "inputFormat"), "width"));
  objc_msgSend(*(id *)(v2 + 88), "setHeight:", objc_msgSend((id)objc_msgSend(*(id *)(v2 + v3[572]), "inputFormat"), "height"));
  objc_msgSend(*(id *)(v2 + 88), "setPixelFormat:", objc_msgSend((id)objc_msgSend(*(id *)(v2 + v3[572]), "inputFormat"), "pixelFormat"));
  objc_msgSend(*(id *)(v2 + 88), "setAllowModifyingInputBuffers:", objc_msgSend(*(id *)(v2 + v3[572]), "alwaysAllowModifyingInputBuffers"));
  v25 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v25, "setObject:forKeyedSubscript:", *(_QWORD *)(v2 + 88), &unk_1E49F94F8);
  if (objc_msgSend(*(id *)(v2 + v3[572]), "fusionEnabled"))
    objc_msgSend(v25, "setObject:forKeyedSubscript:", *(_QWORD *)(v2 + 88), &unk_1E49F9510);
  if (objc_msgSend(*(id *)(v2 + v3[572]), "lowLightFusionEnabled"))
    objc_msgSend(v25, "setObject:forKeyedSubscript:", *(_QWORD *)(v2 + 88), &unk_1E49F9528);
  if (objc_msgSend(*(id *)(v2 + v3[572]), "deepFusionEnabled"))
  {
    v26 = objc_alloc_init((Class)objc_msgSend(v18, "classNamed:", CFSTR("UBPrepareDescriptor")));
    *(_QWORD *)(v2 + 136) = v26;
    if (v26)
    {
      objc_msgSend(*(id *)(v2 + 136), "setWidth:", objc_msgSend((id)objc_msgSend(*(id *)(v2 + v3[572]), "inputFormat"), "width"));
      objc_msgSend(*(id *)(v2 + 136), "setHeight:", objc_msgSend((id)objc_msgSend(*(id *)(v2 + v3[572]), "inputFormat"), "height"));
      objc_msgSend(*(id *)(v2 + 136), "setPixelFormat:", objc_msgSend((id)objc_msgSend(*(id *)(v2 + v3[572]), "inputFormat"), "pixelFormat"));
      objc_msgSend(*(id *)(v2 + 136), "setAllowModifyingInputBuffers:", objc_msgSend(*(id *)(v2 + v3[572]), "alwaysAllowModifyingInputBuffers"));
      objc_msgSend(v25, "setObject:forKeyedSubscript:", *(_QWORD *)(v2 + 136), &unk_1E49F9540);
      goto LABEL_36;
    }
LABEL_41:
    v27 = 4294954510;
LABEL_39:

    *(_QWORD *)(v2 + 80) = 0;
    *(_QWORD *)(v2 + 88) = 0;

    *(_QWORD *)(v2 + 136) = 0;
    return v27;
  }
LABEL_36:
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0D08840]);
  if (objc_msgSend(*(id *)(v2 + v3[572]), "depthDataDeliveryEnabled"))
    objc_msgSend(v31, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D08838]);
  v27 = objc_msgSend(*(id *)(v2 + 80), "setupWithOptions:", v31);
  if ((_DWORD)v27)
    goto LABEL_39;
  return v27;
}

- (void)dealloc
{
  opaqueCMFormatDescription *outputFormatDescription;
  opaqueCMFormatDescription *inferenceInputFormatDescription;
  opaqueCMFormatDescription *gainMapFormatDescription;
  objc_super v6;

  -[UBProcessor finishProcessing](self->_ubProcessor, "finishProcessing");
  -[UBProcessor setOutput:](self->_ubProcessor, "setOutput:", 0);
  -[UBProcessor resetState](self->_ubProcessor, "resetState");

  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
    CFRelease(outputFormatDescription);
  inferenceInputFormatDescription = self->_inferenceInputFormatDescription;
  if (inferenceInputFormatDescription)
    CFRelease(inferenceInputFormatDescription);
  gainMapFormatDescription = self->_gainMapFormatDescription;
  if (gainMapFormatDescription)
    CFRelease(gainMapFormatDescription);

  v6.receiver = self;
  v6.super_class = (Class)BWUBProcessorController;
  -[BWStillImageProcessorController dealloc](&v6, sel_dealloc);
}

- (unint64_t)type
{
  return 1;
}

+ (BOOL)lazilyAllocatesDeepFusionOutputBuffers
{
  return 1;
}

- (void)input:(id)a3 addFrame:(opaqueCMSampleBuffer *)a4 isReferenceFrame:(BOOL)a5
{
  _BOOL4 v5;

  v5 = a5;
  if (-[BWUBProcessorRequest input](self->_currentRequest, "input") == a3)
  {
    ubp_addFrame((uint64_t)self, (uint64_t)self->_currentRequest, self->_ubProcessor, a4, v5);
    -[BWUBProcessorInput updateAdaptiveBracketingFrameParametersIfNeededUsingFrame:err:](-[BWUBProcessorRequest input](self->_currentRequest, "input"), a4, -[BWUBProcessorRequest err](self->_currentRequest, "err"));
  }
  -[BWUBProcessorController _updateStateIfNeeded]((uint64_t)self);
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
    v2 = *(_QWORD *)(result + 176);
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
      if (-[BWUBProcessorRequest receivedAllFrames](v2))
      {
        v4 = (char *)&loc_1A2EFDC7C + 4 * byte_1A32B0F20[-[BWUBProcessorRequest processingType](v2)];
        __asm { BR              X10 }
      }
    }
    v5 = 4;
    goto LABEL_10;
  }
  return result;
}

- (void)inputReceivedAllFrames:(id)a3
{
  if (-[BWUBProcessorRequest input](self->_currentRequest, "input") == a3)
    -[BWUBProcessorController _updateStateIfNeeded]((uint64_t)self);
}

- (int)enqueueInputForProcessing:(id)a3 delegate:(id)a4 processErrorRecoveryFrame:(BOOL)a5 processOriginalImage:(BOOL)a6 processToneMapping:(BOOL)a7 processInferenceInputImage:(BOOL)a8 clientBracketSequenceNumber:(int)a9 processSemanticRendering:(BOOL)a10 provideInferenceInputImageForProcessing:(BOOL)a11 processSmartStyleRenderingInput:(BOOL)a12 inferencesAvailable:(BOOL)a13
{
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v18;
  BOOL v19;
  id v21;
  id v22;
  _QWORD *v23;

  v13 = a6;
  v14 = a5;
  v18 = -[NSSet containsObject:](self->_supportedPortTypes, "containsObject:", objc_msgSend(a3, "portType"));
  if (a9)
    v19 = 1;
  else
    v19 = !v18;
  if (v19 || v14 && v13)
    return -12780;
  v21 = objc_alloc_init(self->_ubFusionOutputClass);
  if (objc_msgSend((id)objc_msgSend(a3, "captureStreamSettings"), "captureType") == 12)
    v22 = objc_alloc_init(self->_ubDeepFusionOutputClass);
  else
    v22 = 0;
  v23 = -[BWUBProcessorRequest initWithInput:output:deepFusionOutput:processErrorRecoveryFrame:processOriginalImage:processSemanticRendering:provideInferenceInputImageForProcessing:inferencesAvailable:delegate:]([BWUBProcessorRequest alloc], a3, v21, v22, v14, v13, a10, a11, a13, a4);

  -[NSMutableArray addObject:](self->_requestQueue, "addObject:", v23);
  if (-[FigStateMachine currentState](self->_stateMachine, "currentState") == 1)
    -[FigStateMachine transitionToState:](self->_stateMachine, "transitionToState:", 2);
  return 0;
}

- (BOOL)finishProcessingCurrentInputNow
{
  BWUBProcessorRequest *v2;
  BOOL v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v2 = self->_currentRequest;
  if (-[BWUBProcessorInput adaptiveBracketingParameters](-[BWUBProcessorRequest input](v2, "input")))
  {
    -[BWUBProcessorInput stopAdaptiveBracketingNow](-[BWUBProcessorRequest input](v2, "input"));
    v3 = -[BWUBProcessorRequest err](v2, "err") == 0;
    if (dword_1EE6BE598)
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
  -[BWUBProcessorRequest setErr:](self->_currentRequest, "setErr:", 4294950490);
  -[BWUBProcessorController _serviceNextRequest](self);
  -[UBProcessor setOutput:](self->_ubProcessor, "setOutput:", 0);
  -[UBProcessor resetState](self->_ubProcessor, "resetState");
  -[BWUBProcessorController _updateStateIfNeeded]((uint64_t)self);
}

- (_QWORD)_serviceNextRequest
{
  _QWORD *v1;
  _QWORD *v2;
  void *v3;
  id v4;
  uint64_t v5;

  if (result)
  {
    v1 = result;
    v2 = (_QWORD *)result[22];
    if (v2)
      v3 = (void *)v2[5];
    else
      v3 = 0;
    v4 = (id)objc_msgSend(v2, "input");
    v5 = objc_msgSend((id)v1[22], "err");

    v1[22] = 0;
    objc_msgSend(v3, "processorController:didFinishProcessingInput:err:", v1, v4, v5);

    result = (id)objc_msgSend((id)v1[21], "firstObject");
    v1[22] = result;
    if (result)
    {
      objc_msgSend((id)v1[21], "removeObjectAtIndex:", 0);
      return (_QWORD *)objc_msgSend((id)objc_msgSend((id)v1[22], "input"), "setDelegate:", v1);
    }
  }
  return result;
}

- (uint64_t)_setupProcessorForProcessingType:(uint64_t)a1
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v5;
  void *v6;
  _BYTE *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  uint64_t v12;
  unint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  int v24;
  _BYTE *v25;
  uint64_t v26;
  void *v27;
  CFTypeRef v28;
  const void *v29;
  const void *v30;
  const void *v31;
  const void *v32;
  const void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  const void *v38;
  uint64_t v39;
  void *v40;
  const void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  const void *v47;
  const void *v48;
  uint64_t v49;
  const void *v50;
  const void *v51;
  _BOOL4 v52;
  void *v53;
  uint64_t v54;
  void *v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  _BOOL8 v65;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  CFTypeRef cf;
  uint64_t v71;
  const void *v72;
  const void *v73;
  CFTypeRef v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (dword_1EE6BE598)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input", v67, v68), "captureSettings"), "captureType");
  objc_msgSend(*(id *)(a1 + 80), "setOutput:", 0);
  objc_msgSend(*(id *)(a1 + 80), "resetState");
  v6 = (void *)objc_msgSend(*(id *)(a1 + 176), "input");
  v7 = *(_BYTE **)(a1 + 176);
  if (v7)
  {
    v74 = 0;
    if ((_DWORD)a2 && v7[34])
    {
      v8 = (void *)objc_msgSend((id)objc_msgSend(v7, "input"), "captureSettings");
      if (v5 == 10)
      {
        v9 = v8;
        v10 = objc_msgSend(v8, "sceneFlags");
        v11 = objc_msgSend(v9, "sceneFlags");
        v12 = objc_msgSend(v9, "captureFlags") & 0x100000;
        v13 = ((unint64_t)objc_msgSend(v9, "captureFlags") >> 22) & 1;
        if (v12)
          LODWORD(v13) = 1;
        if ((v11 & 4) != 0)
          v14 = 1;
        else
          v14 = v13;
        if ((v10 & 8) != 0)
          v15 = 1;
        else
          v15 = v14;
      }
      else
      {
        v15 = 1;
      }
      objc_msgSend(*(id *)(a1 + 80), "setSrlEnabled:", v15);
      if (objc_msgSend(*(id *)(a1 + 176), "provideInferenceInputImageForProcessing"))
      {
        v16 = *(_QWORD *)(a1 + 176);
        if (v16)
          v17 = *(void **)(v16 + 40);
        else
          v17 = 0;
        v74 = (CFTypeRef)objc_msgSend(v17, "processorController:newOutputPixelBufferForProcessorInput:type:", a1, v6, 15);
        if (!v74)
        {
          FigDebugAssert3();
          return 4294954510;
        }
      }
      else
      {
        v74 = 0;
      }
    }
  }
  else
  {
    v74 = 0;
  }
  v18 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "captureStreamSettings"), "captureFlags");
  v19 = v18;
  if ((_DWORD)a2 != 3)
  {
    v23 = v18;
    v24 = 0;
    v25 = *(_BYTE **)(a1 + 176);
    if (!(_DWORD)a2 && (v5 - 10) <= 2)
    {
      if (v25)
      {
        if (v25[32])
        {
          v24 = 0;
          goto LABEL_61;
        }
        v52 = v25[33] != 0;
      }
      else
      {
        v52 = 0;
      }
      v24 = !v52;
    }
LABEL_61:
    v71 = *(_QWORD *)(a1 + 88);
    v53 = (void *)objc_msgSend(v25, "output");
    v54 = *(_QWORD *)(a1 + 176);
    if (v54)
    {
      v55 = *(void **)(v54 + 40);
      if (v24)
      {
        v56 = -[BWUBProcessorRequest processingType](v54);
        v57 = 14;
        v58 = 6;
        if (v56 != 2)
          v58 = 0;
        if (v56 != 3)
          v57 = v58;
        if (v56 == 1)
          v59 = 3;
        else
          v59 = v57;
LABEL_82:
        v61 = objc_msgSend(v55, "processorController:newOutputPixelBufferForProcessorInput:type:", a1, v6, v59);
        if (v61)
        {
          v50 = (const void *)v61;
          objc_msgSend(v53, "setPixelBuffer:", v61);
          objc_msgSend(v53, "setMetadata:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"));
          objc_msgSend(v53, "setInferenceInputPixelBuffer:", v74);
          v62 = objc_msgSend(v6, "fusionMode");
          if ((a2 - 1) <= 1)
          {
            if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "captureSettings"), "captureFlags") & 0x800) != 0)
            {
              if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "captureSettings"), "captureFlags") & 0x1000) != 0)v62 = v62;
              else
                v62 = 1;
            }
            if ((_DWORD)a2 == 2)
            {
              v63 = -[BWUBProcessorInput adaptiveBracketingParameters]((void *)objc_msgSend(*(id *)(a1 + 176), "input"));
              if (v63)
                v64 = v63[1];
              else
                v64 = 0;
              objc_msgSend(*(id *)(a1 + 80), "setProgressiveBracketingParameters:", v64);
            }
          }
          objc_msgSend(*(id *)(a1 + 80), "setFusionMode:", v62);
          v65 = (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "captureSettings"), "sceneFlags") & 0x100) != 0&& objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "captureSettings"), "captureType") != 2;
          objc_msgSend(*(id *)(a1 + 80), "setDoRedFaceFix:", v65);
          objc_msgSend(*(id *)(a1 + 80), "setReferenceFrameHasEVMinus:", (v23 >> 20) & 1);
          v49 = objc_msgSend(*(id *)(a1 + 176), "output");
          v48 = 0;
          v47 = 0;
          v41 = 0;
          v73 = 0;
          v29 = 0;
          v51 = 0;
          goto LABEL_96;
        }
        goto LABEL_116;
      }
    }
    else
    {
      v55 = 0;
      v59 = 0;
      if ((v24 & 1) != 0)
        goto LABEL_82;
    }
    v59 = -[BWUBProcessorRequest imageType](v54);
    goto LABEL_82;
  }
  v20 = *(_QWORD *)(a1 + 136);
  v21 = (void *)objc_msgSend(*(id *)(a1 + 176), "deepFusionOutput");
  if (!objc_msgSend((id)objc_msgSend(v6, "captureSettings"), "produceDeferredPhotoProxyImage"))
  {
    cf = 0;
    goto LABEL_37;
  }
  if ((objc_msgSend((id)objc_opt_class(), "lazilyAllocatesDeepFusionOutputBuffers") & 1) != 0)
  {
    v22 = 0;
LABEL_36:
    cf = (CFTypeRef)v22;
    objc_msgSend(v21, "setProxyPixelBuffer:");
    objc_msgSend(v21, "setProxyMetadata:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"));
LABEL_37:
    v71 = v20;
    if ((objc_msgSend((id)objc_opt_class(), "lazilyAllocatesDeepFusionOutputBuffers") & 1) != 0)
    {
      v28 = v74;
      v29 = 0;
      v30 = 0;
      v31 = 0;
      v32 = 0;
      v33 = 0;
LABEL_58:
      objc_msgSend(v21, "setReferencePixelBuffer:", v29);
      v73 = v30;
      objc_msgSend(v21, "setReferenceNoisePixelBuffer:", v30);
      objc_msgSend(v21, "setReferenceMetadata:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"));
      v41 = v31;
      objc_msgSend(v21, "setLongPixelBuffer:", v31);
      v47 = v32;
      objc_msgSend(v21, "setLongNoisePixelBuffer:", v32);
      objc_msgSend(v21, "setLongMetadata:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"));
      v48 = v33;
      objc_msgSend(v21, "setRealLongNoisePixelBuffer:", v33);
      v74 = v28;
      objc_msgSend(v21, "setInferenceInputPixelBuffer:", v28);
      objc_msgSend(*(id *)(a1 + 80), "setReferenceFrameHasEVMinus:", (v19 >> 20) & 1);
      v49 = objc_msgSend(*(id *)(a1 + 176), "deepFusionOutput");
      v50 = 0;
      a2 = 3;
      v51 = cf;
LABEL_96:
      objc_msgSend(*(id *)(a1 + 80), "setOutput:", v49);
      v60 = objc_msgSend(*(id *)(a1 + 80), "prepareToProcess:prepareDescriptor:", a2, v71);
      if (!(_DWORD)v60)
        objc_msgSend(*(id *)(a1 + 80), "setDelegate:", a1);
      if (v50)
        CFRelease(v50);
      v38 = v73;
      v32 = v47;
      goto LABEL_101;
    }
    v34 = *(_QWORD *)(a1 + 176);
    if (v34)
      v35 = *(void **)(v34 + 40);
    else
      v35 = 0;
    v69 = objc_msgSend(v35, "processorController:newOutputPixelBufferForProcessorInput:type:", a1, v6, 8);
    if (v69)
    {
      v36 = *(_QWORD *)(a1 + 176);
      if (v36)
        v37 = *(void **)(v36 + 40);
      else
        v37 = 0;
      v38 = (const void *)objc_msgSend(v37, "processorController:newOutputPixelBufferForProcessorInput:type:", a1, v6, 9);
      if (v38)
      {
        v39 = *(_QWORD *)(a1 + 176);
        if (v39)
          v40 = *(void **)(v39 + 40);
        else
          v40 = 0;
        v41 = (const void *)objc_msgSend(v40, "processorController:newOutputPixelBufferForProcessorInput:type:", a1, v6, 10);
        if (v41)
        {
          v72 = v38;
          v42 = *(_QWORD *)(a1 + 176);
          if (v42)
            v43 = *(void **)(v42 + 40);
          else
            v43 = 0;
          v32 = (const void *)objc_msgSend(v43, "processorController:newOutputPixelBufferForProcessorInput:type:", a1, v6, 11);
          if (v32)
          {
            if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "captureSettings"), "captureFlags") & 0x400000) == 0)
            {
              v28 = v74;
              v33 = 0;
LABEL_57:
              v29 = (const void *)v69;
              v30 = v72;
              v31 = v41;
              goto LABEL_58;
            }
            v44 = *(_QWORD *)(a1 + 176);
            if (v44)
              v45 = *(void **)(v44 + 40);
            else
              v45 = 0;
            v46 = objc_msgSend(v45, "processorController:newOutputPixelBufferForProcessorInput:type:", a1, v6, 12);
            if (v46)
            {
              v33 = (const void *)v46;
              v28 = v74;
              goto LABEL_57;
            }
          }
          FigDebugAssert3();
          v48 = 0;
          v60 = 4294954510;
          v51 = cf;
          v29 = (const void *)v69;
LABEL_101:
          if (v51)
            CFRelease(v51);
          if (v29)
            CFRelease(v29);
          if (v38)
            CFRelease(v38);
          if (v41)
            CFRelease(v41);
          if (v32)
            CFRelease(v32);
          if (v48)
            CFRelease(v48);
          goto LABEL_113;
        }
        FigDebugAssert3();
        v48 = 0;
        v32 = 0;
      }
      else
      {
        FigDebugAssert3();
        v48 = 0;
        v32 = 0;
        v41 = 0;
      }
      v60 = 4294954510;
      v51 = cf;
      v29 = (const void *)v69;
      goto LABEL_101;
    }
    FigDebugAssert3();
    v48 = 0;
    v32 = 0;
    v41 = 0;
    v38 = 0;
    v29 = 0;
    v60 = 4294954510;
    v51 = cf;
    goto LABEL_101;
  }
  v26 = *(_QWORD *)(a1 + 176);
  if (v26)
    v27 = *(void **)(v26 + 40);
  else
    v27 = 0;
  v22 = objc_msgSend(v27, "processorController:newOutputPixelBufferForProcessorInput:type:", a1, v6, 7);
  if (v22)
    goto LABEL_36;
LABEL_116:
  FigDebugAssert3();
  v60 = 4294954510;
LABEL_113:
  if (v74)
    CFRelease(v74);
  return v60;
}

- (unint64_t)_setupProcessor
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t i;
  _QWORD *v5;
  _QWORD *v6;

  if (result)
  {
    v1 = result;
    v2 = -[BWUBProcessorRequest processingType](*(_QWORD *)(result + 176));
    v3 = -[BWUBProcessorController _setupProcessorForProcessingType:](v1, v2);
    if ((_DWORD)v3)
    {
      objc_msgSend(*(id *)(v1 + 176), "setErr:", v3);
      objc_msgSend(*(id *)(v1 + 80), "setOutput:", 0);
      return objc_msgSend(*(id *)(v1 + 80), "resetState");
    }
    else
    {
      for (i = 0; ; ++i)
      {
        v5 = (_QWORD *)objc_msgSend(*(id *)(v1 + 176), "input");
        if (v5)
          v5 = (_QWORD *)v5[7];
        result = objc_msgSend(v5, "count");
        if (result <= i)
          break;
        v6 = (_QWORD *)objc_msgSend(*(id *)(v1 + 176), "input");
        if (v6)
          v6 = (_QWORD *)v6[7];
        ubp_addFrame(v1, *(_QWORD *)(v1 + 176), *(void **)(v1 + 80), (_QWORD *)objc_msgSend(v6, "objectAtIndexedSubscript:", i), i == objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "input"), "captureStreamSettings"), "referenceFrameIndex"));
      }
    }
  }
  return result;
}

- (void)_processSingleImage
{
  _BYTE *v2;
  opaqueCMSampleBuffer *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  void *v9;
  CMAttachmentBearerRef target;

  if (a1)
  {
    v2 = *(_BYTE **)(a1 + 176);
    if (v2 && v2[32])
    {
      v3 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(v2, "input"), "errorRecoveryFrame");
    }
    else
    {
      v4 = (_QWORD *)objc_msgSend(v2, "input");
      if (v4)
        v4 = (_QWORD *)v4[7];
      v3 = (opaqueCMSampleBuffer *)objc_msgSend(v4, "firstObject");
    }
    target = 0;
    v5 = -[BWUBProcessorController _singleImageProcessSampleBuffer:sampleBufferOut:](a1, v3, &target);
    if (target)
    {
      v6 = *(_QWORD *)(a1 + 176);
      if (v6)
      {
        if (*(_BYTE *)(v6 + 32))
        {
          v7 = objc_msgSend((id)CMGetAttachment(target, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue");
          CMSetAttachment(target, CFSTR("StillImageProcessingFlags"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7 | 0x400u), 1u);
        }
      }
    }
    v8 = *(_QWORD *)(a1 + 176);
    if (v8)
      v9 = *(void **)(v8 + 40);
    else
      v9 = 0;
    objc_msgSend(v9, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", a1, target, -[BWUBProcessorRequest imageType](v8), objc_msgSend(*(id *)(a1 + 176), "input"), v5);
    if (target)
      CFRelease(target);
  }
}

- (uint64_t)_singleImageProcessSampleBuffer:(CMAttachmentBearerRef *)a3 sampleBufferOut:
{
  uint64_t v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  CMAttachmentBearerRef target;
  os_log_type_t type;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (a2)
    {
      v5 = result;
      if (dword_1EE6BE598)
      {
        v13 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      result = objc_msgSend(*(id *)(v5 + 80), "addFrame:", a2, v9, v10);
      if (!(_DWORD)result)
      {
        result = objc_msgSend(*(id *)(v5 + 80), "process");
        if (!(_DWORD)result)
        {
          target = 0;
          result = BWCMSampleBufferCreateCopyWithNewPixelBuffer(a2, (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(v5 + 176), "output"), "pixelBuffer"), (CFTypeRef *)(v5 + 144), (CMSampleBufferRef *)&target);
          if (!(_DWORD)result)
          {
            v7 = (const __CFString *)*MEMORY[0x1E0D05CB0];
            v8 = (void *)objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "mutableCopy");
            objc_msgSend(v8, "addEntriesFromDictionary:", objc_msgSend((id)objc_msgSend(*(id *)(v5 + 176), "output"), "metadata"));
            CMSetAttachment(target, v7, v8, 1u);

            result = 0;
            if (a3)
              *a3 = target;
          }
        }
      }
    }
    else
    {
      return 4294954516;
    }
  }
  return result;
}

- (void)_processUBFusion
{
  uint64_t v2;
  void *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v5;
  uint64_t CopyWithNewPixelBuffer;
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
  opaqueCMSampleBuffer *v19;
  void *v20;
  uint64_t i;
  int j;
  void *v23;
  int v24;
  int v25;
  double v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  _QWORD *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  double v45;
  double v46;
  double v47;
  NSObject *v48;
  unsigned int v49;
  unsigned int v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  CMAttachmentBearerRef v55;
  opaqueCMSampleBuffer *v56;
  int v57;
  int v58;
  NSObject *v59;
  unsigned int v60;
  unsigned int v61;
  void *v62;
  uint64_t v63;
  CMAttachmentBearerRef v64;
  __CVBuffer *ImageBuffer;
  OSType PixelFormatType;
  NSObject *v67;
  unsigned int v68;
  unsigned int v69;
  void *v70;
  uint64_t v71;
  int v72;
  uint64_t v73;
  void *v74;
  CMAttachmentBearerRef v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  CMTime *v80;
  CMTime *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  int v85;
  double v86;
  int v87;
  uint64_t v88;
  int v89;
  uint64_t v90;
  int v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  os_log_type_t type;
  unsigned int v97;
  CMAttachmentBearerRef target;
  _QWORD v99[8];
  _QWORD v100[2];
  _BYTE v101[128];
  const __CFString *v102;
  _QWORD v103[4];
  CMTime v104;
  uint64_t v105;
  CMTime v106;
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = objc_msgSend(*(id *)(a1 + 176), "err");
    target = 0;
    v3 = (void *)objc_msgSend(*(id *)(a1 + 176), "output");
    v85 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "captureSettings"), "captureType");
    if (dword_1EE6BE598)
    {
      v97 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if ((_DWORD)v2)
    {
      v5 = (id)objc_msgSend(v3, "metadata");
      if (!v5)
        v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v2, v80, v82), CFSTR("UBAddFrameFailure"));
      goto LABEL_54;
    }
    v2 = objc_msgSend(*(id *)(a1 + 80), "process");
    v5 = (id)objc_msgSend(v3, "metadata");
    if ((_DWORD)v2)
      goto LABEL_54;
    CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "referenceFrame"), (__CVBuffer *)objc_msgSend(v3, "pixelBuffer"), (CFTypeRef *)(a1 + 144), (CMSampleBufferRef *)&target);
    if ((_DWORD)CopyWithNewPixelBuffer)
    {
      v2 = CopyWithNewPixelBuffer;
      goto LABEL_54;
    }
    if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "captureSettings"), "captureFlags") & 0x800) == 0)
    {
LABEL_25:
      if (objc_msgSend(v3, "fusionMode", v80) == 2 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v19 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "evMinusReferenceFrame");
        memset(&v106, 0, sizeof(v106));
        CMSampleBufferGetPresentationTimeStamp(&v106, v19);
        v20 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        for (i = 0; i != 3; ++i)
        {
          for (j = 0; j != 3; ++j)
          {
            v23 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v3, "refFrameTransform");
            v87 = v24;
            v89 = v25;
            v86 = v26;
            v88 = v27;
            v91 = v28;
            v90 = v29;
            LODWORD(v26) = *(_DWORD *)((unint64_t)(&v86 + 2 * i) & 0xFFFFFFFFFFFFFFF3 | (4 * (j & 3)));
            objc_msgSend(v20, "addObject:", objc_msgSend(v23, "numberWithFloat:", v26));
          }
        }
        v30 = *(_QWORD **)(a1 + 176);
        if (v30)
          v31 = (void *)v30[5];
        else
          v31 = 0;
        v32 = objc_msgSend(v30, "input");
        v104 = v106;
        objc_msgSend(v31, "processorController:didSelectNewReferenceFrameWithPTS:transform:processorInput:", a1, &v104, v20, v32);
      }
      CMSetAttachment(target, CFSTR("HasUnreliableBracketingMetadata"), MEMORY[0x1E0C9AAB0], 1u);
      v33 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      objc_msgSend(v33, "addEntriesFromDictionary:", v5);
      v34 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v3, "fusionMode"));
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v34, *MEMORY[0x1E0D05EF0]);
      if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "captureSettings"), "captureFlags") & 0x100000) != 0)
      {
        v35 = objc_msgSend((id)CMGetAttachment(target, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue");
        CMSetAttachment(target, CFSTR("StillImageProcessingFlags"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v35 | 2u), 1u);
        if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "captureSettings"), "deliverOriginalImage") & 1) != 0|| objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "settings"), "HDRMode") == 1)
        {
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "captureSettings"), "deliverOriginalImage"))v36 = 3;
          else
            v36 = 2;
          v37 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v36);
          objc_msgSend(v33, "setObject:forKeyedSubscript:", v37, *MEMORY[0x1E0D06B08]);
        }
      }
      if (v85 == 11)
      {
        objc_msgSend(v33, "setObject:forKeyedSubscript:", &unk_1E49F9498, CFSTR("CompositeImage"));
        v38 = objc_msgSend(*(id *)(a1 + 176), "numberOfFramesAddedForMultiFrameProcessing");
        v100[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v38);
        v100[1] = &unk_1E49F94B0;
        objc_msgSend(v33, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v100, 2), CFSTR("SourceImageNumberOfCompositeImage"));
        objc_msgSend(*(id *)(a1 + 176), "totalExposureTimesOfFramesAddedForMultiFrameProcessing");
        v40 = v39;
        objc_msgSend(*(id *)(a1 + 176), "maxExposureTimesOfFramesAddedForMultiFrameProcessing");
        v42 = v41;
        objc_msgSend(*(id *)(a1 + 176), "minExposureTimesOfFramesAddedForMultiFrameProcessing");
        v44 = v43;
        v99[0] = &unk_1E4A02E40;
        LODWORD(v45) = v40;
        v99[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v45);
        v99[2] = &unk_1E4A02E40;
        LODWORD(v46) = v42;
        v99[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v46);
        v99[4] = &unk_1E4A02E40;
        LODWORD(v47) = v44;
        v99[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v47);
        v99[6] = &unk_1E4A02E40;
        v99[7] = &unk_1E49F94B0;
        objc_msgSend(v33, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 8), CFSTR("SourceExposureTimesOfCompositeImage"));
        CMSetAttachment(target, CFSTR("OisRecenteringLoggingData"), (CFTypeRef)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "oisRecenteringLoggingData"), 1u);
      }
      else
      {
        objc_msgSend(v33, "setObject:forKeyedSubscript:", &unk_1E49F94C8, CFSTR("CompositeImage"));
      }
      if (dword_1EE6BE598)
      {
        v97 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v48 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v49 = v97;
        if (os_log_type_enabled(v48, type))
          v50 = v49;
        else
          v50 = v49 & 0xFFFFFFFE;
        if (v50)
        {
          v51 = *(void **)(a1 + 176);
          v52 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v51, "input"), "settings"), "settingsID");
          LODWORD(v104.value) = 136315651;
          *(CMTimeValue *)((char *)&v104.value + 4) = (CMTimeValue)"-[BWUBProcessorController _processUBFusion]";
          LOWORD(v104.flags) = 2113;
          *(_QWORD *)((char *)&v104.flags + 2) = v51;
          HIWORD(v104.epoch) = 2048;
          v105 = v52;
          LODWORD(v82) = 32;
          v80 = &v104;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v53 = *(_QWORD *)(a1 + 176);
      if (v53)
        v54 = *(void **)(v53 + 40);
      else
        v54 = 0;
      objc_msgSend(v54, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", a1, target, -[BWUBProcessorRequest imageType](v53), objc_msgSend(*(id *)(a1 + 176), "input"), 0);
      v2 = 0;
LABEL_54:
      if (!objc_msgSend(*(id *)(a1 + 176), "err", v80, v82))
        objc_msgSend(*(id *)(a1 + 176), "setErr:", v2);
      v55 = target;
      if (target)
      {
LABEL_91:
        CFRelease(v55);
LABEL_92:

        return;
      }
      objc_msgSend(v3, "setPixelBuffer:", 0);
      v56 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "errorRecoveryFrame");
      if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "captureSettings"), "deliverOriginalImage") & 1) != 0|| !v56)
      {
LABEL_82:
        v73 = *(_QWORD *)(a1 + 176);
        if (v73)
        {
          v74 = *(void **)(v73 + 40);
          v75 = target;
          v76 = -[BWUBProcessorRequest processingType](v73);
          v77 = 14;
          v78 = 6;
          if (v76 != 2)
            v78 = 0;
          if (v76 != 3)
            v77 = v78;
          if (v76 == 1)
            v79 = 3;
          else
            v79 = v77;
        }
        else
        {
          v74 = 0;
          v79 = 0;
          v75 = target;
        }
        objc_msgSend(v74, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", a1, v75, v79, objc_msgSend(*(id *)(a1 + 176), "input", v81, v83), v2);
        v55 = target;
        if (!target)
          goto LABEL_92;
        goto LABEL_91;
      }
      v57 = -[BWUBProcessorController _setupProcessorForProcessingType:](a1, 0);
      if (v57)
      {
        v83 = v84;
        LODWORD(v81) = v57;
      }
      else
      {
        v58 = -[BWUBProcessorController _singleImageProcessSampleBuffer:sampleBufferOut:](a1, v56, &target);
        if (!v58)
        {
          if (dword_1EE6BE598)
          {
            v97 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            v59 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            v60 = v97;
            if (os_log_type_enabled(v59, type))
              v61 = v60;
            else
              v61 = v60 & 0xFFFFFFFE;
            if (v61)
            {
              v62 = *(void **)(a1 + 176);
              v63 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v62, "input"), "settings"), "settingsID");
              LODWORD(v104.value) = 136315651;
              *(CMTimeValue *)((char *)&v104.value + 4) = (CMTimeValue)"-[BWUBProcessorController _processUBFusion]";
              LOWORD(v104.flags) = 2113;
              *(_QWORD *)((char *)&v104.flags + 2) = v62;
              HIWORD(v104.epoch) = 2048;
              v105 = v63;
              LODWORD(v83) = 32;
              v81 = &v104;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          goto LABEL_68;
        }
        v83 = v84;
        LODWORD(v81) = v58;
      }
      FigDebugAssert3();
LABEL_68:
      v64 = target;
      if (target)
        goto LABEL_79;
      ImageBuffer = CMSampleBufferGetImageBuffer(v56);
      PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer);
      if (PixelFormatType == objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "outputFormat"), "pixelFormat")&& !BWCMSampleBufferCreateCopyIncludingMetadata(v56, (CMSampleBufferRef *)&target)&& dword_1EE6BE598)
      {
        v97 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v67 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v68 = v97;
        if (os_log_type_enabled(v67, type))
          v69 = v68;
        else
          v69 = v68 & 0xFFFFFFFE;
        if (v69)
        {
          v70 = *(void **)(a1 + 176);
          v71 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v70, "input"), "settings"), "settingsID");
          LODWORD(v104.value) = 136315651;
          *(CMTimeValue *)((char *)&v104.value + 4) = (CMTimeValue)"-[BWUBProcessorController _processUBFusion]";
          LOWORD(v104.flags) = 2113;
          *(_QWORD *)((char *)&v104.flags + 2) = v70;
          HIWORD(v104.epoch) = 2048;
          v105 = v71;
          LODWORD(v83) = 32;
          v81 = &v104;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v64 = target;
      if (target)
      {
LABEL_79:
        v72 = objc_msgSend((id)CMGetAttachment(v64, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue");
        CMSetAttachment(target, CFSTR("StillImageProcessingFlags"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v72 | 0x400u), 1u);
        objc_msgSend((id)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "setObject:forKeyedSubscript:", v5, CFSTR("UBFusionFailure"));
        if (v85 == 11)
          CMSetAttachment(target, CFSTR("OisRecenteringLoggingData"), (CFTypeRef)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input"), "oisRecenteringLoggingData"), 1u);
        v2 = 0;
      }
      goto LABEL_82;
    }
    v7 = objc_msgSend(v3, "fusionMode");
    if (v7 == 1)
    {
      if (!BWSampleBufferGetAttachedMedia(target, (uint64_t)CFSTR("SensorInterfaceRaw")))
      {
        v102 = CFSTR("SensorInterfaceRaw");
        v8 = (void *)MEMORY[0x1E0C99D20];
        v9 = &v102;
        v10 = 1;
        goto LABEL_17;
      }
    }
    else if (v7 == 2)
    {
      v103[0] = CFSTR("Depth");
      v103[1] = 0x1E495AF58;
      v103[2] = 0x1E495AED8;
      v103[3] = CFSTR("FocusPixelData");
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = (const __CFString **)v103;
      v10 = 4;
LABEL_17:
      v11 = (void *)objc_msgSend(v8, "arrayWithObjects:count:", v9, v10, v80, v82);
LABEL_18:
      v12 = (const void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "input", v80), "evMinusReferenceFrame");
      v92 = 0u;
      v93 = 0u;
      v94 = 0u;
      v95 = 0u;
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v92, v101, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v93;
        do
        {
          for (k = 0; k != v14; ++k)
          {
            if (*(_QWORD *)v93 != v15)
              objc_enumerationMutation(v11);
            v17 = *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * k);
            AttachedMedia = BWSampleBufferGetAttachedMedia(v12, v17);
            BWSampleBufferSetAttachedMedia(target, v17, AttachedMedia);
          }
          v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v92, v101, 16);
        }
        while (v14);
      }
      goto LABEL_25;
    }
    v11 = 0;
    goto LABEL_18;
  }
}

- (uint64_t)_processUBOriginalImage
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  CMAttachmentBearerRef target;

  if (result)
  {
    v1 = result;
    target = 0;
    v2 = -[BWUBProcessorController _singleImageProcessSampleBuffer:sampleBufferOut:](result, (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(result + 176), "input"), "originalImage"), &target);
    if (target)
    {
      v3 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      v4 = objc_msgSend((id)CMGetAttachment(target, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue");
      CMSetAttachment(target, CFSTR("StillImageProcessingFlags"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4 | 1u), 1u);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E49F94E0, *MEMORY[0x1E0D06B08]);
      if (!(_DWORD)v2)
        objc_msgSend(v3, "addEntriesFromDictionary:", objc_msgSend((id)objc_msgSend(*(id *)(v1 + 176), "output"), "metadata"));
    }
    v5 = *(_QWORD *)(v1 + 176);
    if (v5)
      v6 = *(void **)(v5 + 40);
    else
      v6 = 0;
    objc_msgSend(v6, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", v1, target, -[BWUBProcessorRequest imageType](v5), objc_msgSend(*(id *)(v1 + 176), "input"), v2);
    if (target)
      CFRelease(target);
    return -[BWUBProcessorController _updateStateIfNeeded](v1);
  }
  return result;
}

- (void)_processDeepFusion
{
  uint64_t v1;
  uint64_t v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  const void *v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  const void *v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  const void *v18;
  uint64_t v19;
  uint64_t v20;
  opaqueCMSampleBuffer *v21;
  int v22;
  int v23;
  NSObject *v24;
  CMAttachmentBearerRef v25;
  __CVBuffer *ImageBuffer;
  OSType PixelFormatType;
  NSObject *v28;
  int v29;
  void *v30;
  uint64_t v31;
  void *v32;
  CMAttachmentBearerRef v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  CMAttachmentBearerRef target;
  const __CFString *v43;
  _QWORD v44[23];

  v44[21] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v3 = objc_msgSend(a1[22], "err");
  target = 0;
  if (dword_1EE6BE598)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!(_DWORD)v3)
  {
    if (!objc_msgSend((id)objc_opt_class(), "lazilyAllocatesDeepFusionOutputBuffers"))
      goto LABEL_22;
    v5 = (void *)objc_msgSend(a1[22], "input");
    v6 = (void *)objc_msgSend(a1[22], "deepFusionOutput");
    if (!objc_msgSend(v6, "longPixelBuffer"))
    {
      v7 = a1[22];
      if (v7)
        v8 = (void *)v7[5];
      else
        v8 = 0;
      v9 = objc_msgSend(v8, "processorController:newOutputPixelBufferForProcessorInput:type:", a1, v5, 10, v38, v40);
      if (!v9)
      {
        v40 = v1;
        LODWORD(v38) = 0;
        goto LABEL_61;
      }
      v10 = (const void *)v9;
      objc_msgSend(v6, "setLongPixelBuffer:", v9);
      CFRelease(v10);
    }
    if (!objc_msgSend(v6, "longNoisePixelBuffer", v38))
    {
      v11 = a1[22];
      if (v11)
        v12 = (void *)v11[5];
      else
        v12 = 0;
      v13 = objc_msgSend(v12, "processorController:newOutputPixelBufferForProcessorInput:type:", a1, v5, 11);
      if (!v13)
      {
        v40 = v1;
        LODWORD(v38) = 0;
        goto LABEL_61;
      }
      v14 = (const void *)v13;
      objc_msgSend(v6, "setLongNoisePixelBuffer:", v13);
      CFRelease(v14);
    }
    if (objc_msgSend(v6, "realLongNoisePixelBuffer")
      || (objc_msgSend((id)objc_msgSend(v5, "captureSettings"), "captureFlags") & 0x400000) == 0)
    {
LABEL_22:
      v19 = objc_msgSend(a1[10], "process", v38);
      if ((_DWORD)v19)
      {
        v3 = v19;
      }
      else
      {
        if (objc_msgSend(a1[7], "deepFusionWaitForProcessingToFinish"))
          objc_msgSend(a1[10], "finishProcessing");
        v3 = 0;
      }
      goto LABEL_26;
    }
    v15 = a1[22];
    if (v15)
      v16 = (void *)v15[5];
    else
      v16 = 0;
    v17 = objc_msgSend(v16, "processorController:newOutputPixelBufferForProcessorInput:type:", a1, v5, 12);
    if (v17)
    {
      v18 = (const void *)v17;
      objc_msgSend(v6, "setRealLongNoisePixelBuffer:", v17);
      CFRelease(v18);
      goto LABEL_22;
    }
    v40 = v1;
    LODWORD(v38) = 0;
LABEL_61:
    FigDebugAssert3();
    v3 = 4294954510;
  }
LABEL_26:
  if (!objc_msgSend(a1[22], "err", v38, v40))
    objc_msgSend(a1[22], "setErr:", v3);
  if ((_DWORD)v3
    && objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1[22], "input"), "captureSettings"), "deliverDeferredPhotoProxyImage")&& (objc_msgSend(a1[22], "deliveredDeferredProxyImage") & 1) == 0)
  {
    objc_msgSend((id)objc_msgSend(a1[22], "deepFusionOutput"), "setProxyPixelBuffer:", 0);
    v20 = objc_msgSend((id)objc_msgSend(a1[22], "input"), "errorRecoveryFrame");
    if (!v20)
    {
LABEL_43:
      v31 = (uint64_t)a1[22];
      if (v31)
      {
        v32 = *(void **)(v31 + 40);
        v33 = target;
        v34 = -[BWUBProcessorRequest processingType](v31);
        v35 = 14;
        v36 = 6;
        if (v34 != 2)
          v36 = 0;
        if (v34 != 3)
          v35 = v36;
        if (v34 == 1)
          v37 = 3;
        else
          v37 = v35;
      }
      else
      {
        v32 = 0;
        v37 = 0;
        v33 = target;
      }
      objc_msgSend(v32, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", a1, v33, v37, objc_msgSend(a1[22], "input", v39, v41), v3);
      if (target)
        CFRelease(target);
      return;
    }
    v21 = (opaqueCMSampleBuffer *)v20;
    v22 = -[BWUBProcessorController _setupProcessorForProcessingType:]((uint64_t)a1, 0);
    if (v22)
    {
      v41 = v1;
      LODWORD(v39) = v22;
    }
    else
    {
      v23 = -[BWUBProcessorController _singleImageProcessSampleBuffer:sampleBufferOut:]((uint64_t)a1, v21, &target);
      if (!v23)
      {
        if (dword_1EE6BE598)
        {
          v24 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        goto LABEL_36;
      }
      v41 = v1;
      LODWORD(v39) = v23;
    }
    FigDebugAssert3();
LABEL_36:
    v25 = target;
    if (target)
      goto LABEL_42;
    ImageBuffer = CMSampleBufferGetImageBuffer(v21);
    PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer);
    if (PixelFormatType == objc_msgSend((id)objc_msgSend(a1[7], "outputFormat"), "pixelFormat")
      && !BWCMSampleBufferCreateCopyIncludingMetadata(v21, (CMSampleBufferRef *)&target)
      && dword_1EE6BE598)
    {
      v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v25 = target;
    if (target)
    {
LABEL_42:
      v29 = objc_msgSend((id)CMGetAttachment(v25, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue");
      CMSetAttachment(target, CFSTR("StillImageProcessingFlags"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v29 | 0x400u), 1u);
      v30 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      v43 = CFSTR("UBDeepFusionFusionFailure");
      v44[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
      objc_msgSend(v30, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1), CFSTR("UB"));
      v3 = 0;
    }
    goto LABEL_43;
  }
}

- (void)processor:(id)a3 outputReadyWithFrameType:(int)a4 outputPixelBuffer:(__CVBuffer *)a5 outputMetadata:(id)a6 error:(int)a7
{
  uint64_t v10;
  CMAttachmentBearerRef v11;
  const void *v12;
  BWUBProcessorRequest *currentRequest;
  BWUBProcessorControllerDelegate *delegate;
  uint64_t v15;
  BWUBProcessorControllerDelegate *v16;
  BWUBProcessorController *v17;
  CMAttachmentBearerRef v18;
  uint64_t v19;
  UBDeepFusionOutput *v20;
  opaqueCMSampleBuffer *v21;
  void *v22;
  uint64_t i;
  int j;
  void *v25;
  int v26;
  int v27;
  double v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  BWUBProcessorRequest *v32;
  BWUBProcessorControllerDelegate *v33;
  uint64_t v34;
  BWUBProcessorRequest *v35;
  BWUBProcessorControllerDelegate *v36;
  BWUBProcessorRequest *v37;
  BWUBProcessorControllerDelegate *v38;
  uint64_t v39;
  CMTime v40;
  double v41;
  int v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  int v46;
  CMTime v47;

  if (a5 && !a7)
  {
    v10 = 9;
    switch(a4)
    {
      case 2:
        v11 = -[BWUBProcessorController _newOutputSampleBufferWithSampleBuffer:pixelBuffer:formatDescriptionInOut:metadataToMerge:](self, -[BWUBProcessorInput referenceFrame](-[BWUBProcessorRequest input](self->_currentRequest, "input", a3), "referenceFrame"), a5, (CFTypeRef *)&self->_outputFormatDescription, (uint64_t)a6);
        if (!-[BWStillImageCaptureSettings deliverDeferredPhotoProxyImage](-[BWStillImageProcessorControllerInput captureSettings](-[BWUBProcessorRequest input](self->_currentRequest, "input"), "captureSettings"), "deliverDeferredPhotoProxyImage"))goto LABEL_29;
        v12 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)CMGetAttachment(v11, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue") | 0x1000);
        CMSetAttachment(v11, CFSTR("StillImageProcessingFlags"), v12, 1u);
        -[BWUBProcessorRequest setDeliveredDeferredProxyImage:](self->_currentRequest, "setDeliveredDeferredProxyImage:", 1);
        currentRequest = self->_currentRequest;
        if (currentRequest)
          delegate = currentRequest->_delegate;
        else
          delegate = 0;
        v15 = -[BWUBProcessorRequest input](currentRequest, "input");
        v16 = delegate;
        v17 = self;
        v18 = v11;
        v19 = 7;
        goto LABEL_28;
      case 3:
        v20 = -[BWUBProcessorRequest deepFusionOutput](self->_currentRequest, "deepFusionOutput", a3);
        if (-[UBDeepFusionOutput refFrameTransformIsValid](v20, "refFrameTransformIsValid")
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v21 = -[BWUBProcessorInput evMinusReferenceFrame](-[BWUBProcessorRequest input](self->_currentRequest, "input"), "evMinusReferenceFrame");
          memset(&v47, 0, sizeof(v47));
          CMSampleBufferGetPresentationTimeStamp(&v47, v21);
          v22 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          for (i = 0; i != 3; ++i)
          {
            for (j = 0; j != 3; ++j)
            {
              v25 = (void *)MEMORY[0x1E0CB37E8];
              -[UBDeepFusionOutput refFrameTransform](v20, "refFrameTransform");
              v42 = v26;
              v44 = v27;
              v41 = v28;
              v43 = v29;
              v46 = v30;
              v45 = v31;
              LODWORD(v28) = *(_DWORD *)((unint64_t)(&v41 + 2 * i) & 0xFFFFFFFFFFFFFFF3 | (4 * (j & 3)));
              objc_msgSend(v22, "addObject:", objc_msgSend(v25, "numberWithFloat:", v28));
            }
          }
          v32 = self->_currentRequest;
          if (v32)
            v33 = v32->_delegate;
          else
            v33 = 0;
          v34 = -[BWUBProcessorRequest input](v32, "input");
          v40 = v47;
          -[BWUBProcessorControllerDelegate processorController:didSelectNewReferenceFrameWithPTS:transform:processorInput:](v33, "processorController:didSelectNewReferenceFrameWithPTS:transform:processorInput:", self, &v40, v22, v34);
        }
        v10 = 8;
        goto LABEL_21;
      case 4:
        goto LABEL_21;
      case 5:
        v10 = 10;
        goto LABEL_21;
      case 6:
        v10 = 11;
        goto LABEL_21;
      case 7:
        v10 = 12;
LABEL_21:
        v35 = self->_currentRequest;
        if (v35)
          v36 = v35->_delegate;
        else
          v36 = 0;
        LODWORD(v39) = 0;
        -[BWUBProcessorControllerDelegate processorController:didFinishProcessingBuffer:metadata:type:captureFrameFlags:processorInput:err:](v36, "processorController:didFinishProcessingBuffer:metadata:type:captureFrameFlags:processorInput:err:", self, a5, a6, v10, 0, -[BWUBProcessorRequest input](v35, "input", a3), v39);
        break;
      case 8:
        v11 = -[BWUBProcessorController _newOutputSampleBufferWithSampleBuffer:pixelBuffer:formatDescriptionInOut:metadataToMerge:](self, -[BWUBProcessorInput referenceFrame](-[BWUBProcessorRequest input](self->_currentRequest, "input", a3), "referenceFrame"), a5, (CFTypeRef *)&self->_inferenceInputFormatDescription, (uint64_t)a6);
        v37 = self->_currentRequest;
        if (v37)
          v38 = v37->_delegate;
        else
          v38 = 0;
        v15 = -[BWUBProcessorRequest input](v37, "input");
        v16 = v38;
        v17 = self;
        v18 = v11;
        v19 = 15;
LABEL_28:
        -[BWUBProcessorControllerDelegate processorController:didFinishProcessingSampleBuffer:type:processorInput:err:](v16, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", v17, v18, v19, v15, 0);
LABEL_29:
        if (v11)
          CFRelease(v11);
        break;
      default:
        return;
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
    return target;
  }
  return result;
}

- (void)processor:(id)a3 didSelectFusionMode:(int)a4
{
  BWUBProcessorRequest *currentRequest;
  BWUBProcessorControllerDelegate *delegate;

  currentRequest = self->_currentRequest;
  if (currentRequest)
    delegate = currentRequest->_delegate;
  else
    delegate = 0;
  -[BWUBProcessorControllerDelegate processorController:didSelectFusionMode:processorInput:](delegate, "processorController:didSelectFusionMode:processorInput:", self, *(_QWORD *)&a4, -[BWUBProcessorRequest input](currentRequest, "input", a3));
}

- (id)processorGetInferenceResults:(id)a3
{
  id v4;
  BWUBProcessorRequest *currentRequest;
  BWUBProcessorControllerDelegate *delegate;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = objc_alloc_init(NSClassFromString(CFSTR("UBProcessorInferenceResults")));
  if (-[BWUBProcessorRequest inferencesAvailable](self->_currentRequest, "inferencesAvailable"))
  {
    currentRequest = self->_currentRequest;
    if (currentRequest)
      delegate = currentRequest->_delegate;
    else
      delegate = 0;
    v7 = (void *)-[BWUBProcessorControllerDelegate processorController:newInferencesForProcessorInput:](delegate, "processorController:newInferencesForProcessorInput:", self, -[BWUBProcessorRequest input](currentRequest, "input"));
    v8 = objc_msgSend(v7, "inferenceBufferForAttachedMediaKey:", CFSTR("PersonSemanticsSkin"));
    if (v8)
      objc_msgSend(v4, "setSkinMask:", v8);
    v9 = objc_msgSend(v7, "inferenceBufferForAttachedMediaKey:", 0x1E49511B8);
    if (v9)
      objc_msgSend(v4, "setPersonMask:", v9);
    v10 = objc_msgSend(v7, "inferenceForAttachmentKey:", 0x1E4951058);
    if (v10)
      objc_msgSend(v4, "setFaceLandmarks:", v10);
  }
  else
  {
    v7 = 0;
  }

  return v4;
}

- (void)processor:(id)a3 didEnqueueProcessingForSurfaceID:(unsigned int)a4
{
  +[BWIOSurfaceTracking noteSurfaceIDInUse:byClient:](BWIOSurfaceTracking, "noteSurfaceIDInUse:byClient:", *(_QWORD *)&a4, CFSTR("UBProcessor"));
}

- (void)processor:(id)a3 didCompleteProcessingForSurfaceID:(unsigned int)a4
{
  +[BWIOSurfaceTracking noteSurfaceIDNoLongerInUse:byClient:](BWIOSurfaceTracking, "noteSurfaceIDNoLongerInUse:byClient:", *(_QWORD *)&a4, CFSTR("UBProcessor"));
}

- (int)progressiveLowLightFusionBatchSize
{
  int result;

  result = -[BWUBProcessorControllerConfiguration lowLightFusionEnabled](self->_configuration, "lowLightFusionEnabled");
  if (result)
    return -[UBProcessor progressiveBatchSize](self->_ubProcessor, "progressiveBatchSize");
  return result;
}

- (id)adaptiveBracketingParametersForDigitalFlashMode:(int)a3 frameStatistics:(id)a4 stationary:(BOOL)a5 sphereOffsetEnabled:(BOOL)a6 detectedObjects:(id)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id UBStatisticsFromFrameStatistics;
  _QWORD *v14;

  if (a3
    && (v7 = a5,
        (v11 = -[NSDictionary objectForKeyedSubscript:](self->_adaptiveBracketingCaptureParametersByPortType, "objectForKeyedSubscript:", objc_msgSend(a4, "portType"))) != 0))
  {
    v12 = v11;
    UBStatisticsFromFrameStatistics = udp_createUBStatisticsFromFrameStatistics(self->_ubProgressiveBracketingStatisticsClass, a4, v7);
    v14 = -[BWUBAdaptiveBracketingParameters initWithProgressiveBracketingParameters:progressiveBracketingStatisticsClass:]([BWUBAdaptiveBracketingParameters alloc], (id)objc_msgSend(objc_alloc(self->_ubProgressiveBracketingParametersClass), "initWithOptions:portType:statistics:mode:", v12, objc_msgSend(a4, "portType"), UBStatisticsFromFrameStatistics, a3 == 2), (uint64_t)self->_ubProgressiveBracketingStatisticsClass);

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (id)adaptiveBracketingDigitalFlashTotalIntegrationTimesProviderForPortType:(id)a3
{
  _QWORD *v5;

  v5 = -[NSDictionary objectForKeyedSubscript:](self->_adaptiveBracketingCaptureParametersByPortType, "objectForKeyedSubscript:");
  if (v5)
    v5 = -[BWUBAdaptiveBracketingParameters initWithProgressiveBracketingParameters:progressiveBracketingStatisticsClass:]([BWUBAdaptiveBracketingParameters alloc], (id)objc_msgSend(objc_alloc(self->_ubProgressiveBracketingParametersClass), "initWithOptions:portType:statistics:mode:", v5, a3, 0, 0), (uint64_t)self->_ubProgressiveBracketingStatisticsClass);
  return v5;
}

@end

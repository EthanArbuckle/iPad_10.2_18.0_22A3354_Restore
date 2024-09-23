@implementation BWDeepZoomProcessorController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && dzpc_initializeTrace_sInitializeTraceOnceToken != -1)
    dispatch_once(&dzpc_initializeTrace_sInitializeTraceOnceToken, &__block_literal_global_119);
}

- (BWDeepZoomProcessorController)initWithConfiguration:(id)a3
{
  NSMutableArray *v5;
  FigStateMachine *v6;
  void *v7;
  int SetupAndPrepareDeepZoom;
  objc_super v10;

  if (!a3
    || !objc_msgSend(a3, "metalCommandQueue")
    || !objc_msgSend(a3, "inputFormat")
    || !objc_msgSend(a3, "outputFormat")
    || (int)objc_msgSend(a3, "version") < 1
    || objc_msgSend(a3, "type") != 2
    && objc_msgSend(a3, "type") != 1
    && objc_msgSend(a3, "type") != 3)
  {
    goto LABEL_14;
  }
  v10.receiver = self;
  v10.super_class = (Class)BWDeepZoomProcessorController;
  self = -[BWDeepZoomProcessorController init](&v10, sel_init);
  if (self)
  {
    self->_configuration = (BWDeepZoomProcessorControllerConfiguration *)a3;
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_requestQueue = v5;
    if (!v5)
      goto LABEL_14;
    v6 = -[FigStateMachine initWithLabel:stateCount:initialState:owner:]([FigStateMachine alloc], "initWithLabel:stateCount:initialState:owner:", CFSTR("BWDeepZoomProcessorController state machine"), 4, 1, self);
    -[FigStateMachine setPerformsAtomicStateTransitions:](v6, "setPerformsAtomicStateTransitions:", 0);
    -[FigStateMachine setLabel:forState:](v6, "setLabel:forState:", CFSTR("Idle"), 1);
    -[FigStateMachine setLabel:forState:](v6, "setLabel:forState:", CFSTR("Ready"), 2);
    -[FigStateMachine setLabel:forState:](v6, "setLabel:forState:", CFSTR("Waiting"), 4);
    -[FigStateMachine setLabel:forState:](v6, "setLabel:forState:", CFSTR("Processing"), 8);
    -[FigStateMachine whenTransitioningToStates:callHandler:](v6, "whenTransitioningToStates:callHandler:", 1, &__block_literal_global_258);
    -[FigStateMachine whenTransitioningToStates:callHandler:](v6, "whenTransitioningToStates:callHandler:", 2, &__block_literal_global_259);
    -[FigStateMachine whenTransitioningToState:callHandler:](v6, "whenTransitioningToState:callHandler:", 4, &__block_literal_global_260);
    -[FigStateMachine whenTransitioningToState:callHandler:](v6, "whenTransitioningToState:callHandler:", 8, &__block_literal_global_261);
    self->_stateMachine = v6;
    if (!v6
      || (self->_inferenceConfigurationByInferenceType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]),
          v7 = (void *)MEMORY[0x1A858DD40](),
          SetupAndPrepareDeepZoom = -[BWDeepZoomProcessorController _loadSetupAndPrepareDeepZoomProcessor]((uint64_t)self),
          objc_autoreleasePoolPop(v7),
          SetupAndPrepareDeepZoom))
    {
LABEL_14:

      return 0;
    }
  }
  return self;
}

- (uint64_t)_loadSetupAndPrepareDeepZoomProcessor
{
  id *v1;
  uint64_t v2;
  BWInferenceEngine *v3;
  BWDeepZoomInferenceConfiguration *v4;
  BWDeepZoomInferenceConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  BWDeepZoomInferenceConfiguration *v13;
  void *v14;
  id v15;
  BWVideoFormatRequirements *v16;
  id v17;
  BWVideoFormatRequirements *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  _BOOL4 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  id v38;
  id v39;
  BWVideoFormatRequirements *v40;
  BWVideoFormatRequirements *v41;
  _BYTE v42[128];
  _QWORD v43[6];
  _QWORD v44[6];
  _QWORD v45[3];
  _QWORD v46[5];

  v46[3] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (id *)result;
    if (objc_msgSend(*(id *)(result + 56), "inferenceScheduler"))
    {
      v28 = objc_msgSend(v1[7], "type") == 3
         && FigCaptureVideoDimensionsAreValid(objc_msgSend(v1[7], "stereoPhotoOutputDimensions"));
      v2 = objc_msgSend(v1[7], "mode") == 5 ? 159 : 160;
      v3 = -[BWInferenceEngine initWithScheduler:priority:shareIntermediateBuffer:]([BWInferenceEngine alloc], "initWithScheduler:priority:shareIntermediateBuffer:", objc_msgSend(v1[7], "inferenceScheduler"), objc_msgSend(v1[7], "figThreadPriority"), 1);
      v1[11] = v3;
      if (v3)
      {
        FigCaptureVideoDimensionsAreValid(objc_msgSend(v1[7], "stereoPhotoOutputDimensions"));
        v4 = -[BWInferenceConfiguration initWithInferenceType:]([BWDeepZoomInferenceConfiguration alloc], "initWithInferenceType:", v2);
        if (v4)
        {
          v5 = v4;
          -[BWTiledEspressoInferenceConfiguration setMetalCommandQueue:](v4, "setMetalCommandQueue:", objc_msgSend(v1[7], "metalCommandQueue"));
          -[BWDeepZoomInferenceConfiguration setVersion:](v5, "setVersion:", objc_msgSend(v1[7], "version"));
          -[BWTiledEspressoInferenceConfiguration setForceSynchronousInference:](v5, "setForceSynchronousInference:", 0);
          v45[0] = &unk_1E49FC9D8;
          v45[1] = &unk_1E49FC9F0;
          v46[0] = &unk_1E49FC9F0;
          v46[1] = &unk_1E49FC9D8;
          v45[2] = &unk_1E49FCA08;
          v46[2] = &unk_1E49FCA08;
          v27 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
          -[BWDeepZoomInferenceConfiguration setType:](v5, "setType:", objc_msgSend((id)objc_msgSend(v27, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v1[7], "type"))), "unsignedIntValue"));
          if (-[BWDeepZoomInferenceConfiguration type](v5, "type"))
          {
            v43[0] = &unk_1E49FCA20;
            v43[1] = &unk_1E49FC9F0;
            v44[0] = &unk_1E49FCA20;
            v44[1] = &unk_1E49FC9F0;
            v43[2] = &unk_1E49FC9D8;
            v43[3] = &unk_1E49FCA08;
            v44[2] = &unk_1E49FC9D8;
            v44[3] = &unk_1E49FCA08;
            v43[4] = &unk_1E49FCA38;
            v43[5] = &unk_1E49FCA50;
            v44[4] = &unk_1E49FCA38;
            v44[5] = &unk_1E49FCA50;
            v6 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 6);
            -[BWDeepZoomInferenceConfiguration setMode:](v5, "setMode:", objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v1[7], "mode"))), "unsignedIntValue"));
            v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v33 = 0u;
            v34 = 0u;
            v35 = 0u;
            v36 = 0u;
            v8 = (void *)objc_msgSend(v1[7], "sensorConfigurationsByPortType");
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
            if (v9)
            {
              v10 = v9;
              v11 = *(_QWORD *)v34;
              do
              {
                for (i = 0; i != v10; ++i)
                {
                  if (*(_QWORD *)v34 != v11)
                    objc_enumerationMutation(v8);
                  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v1[7], "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i)), "sensorIDDictionary"), "objectForKeyedSubscript:", CFSTR("DeepZoomParameters")), *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
                }
                v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
              }
              while (v10);
            }
            -[BWInferenceConfiguration setTuningParameters:](v5, "setTuningParameters:", v7);
            if (objc_msgSend(v1[7], "mode") == 5)
              -[BWDeepZoomInferenceConfiguration setStereoPhotoOutputDimensions:](v5, "setStereoPhotoOutputDimensions:", objc_msgSend(v1[7], "stereoPhotoOutputDimensions"));
            if (!objc_msgSend(v1[11], "addInferenceOfType:version:configuration:", v2, BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL, v5))
            {
              objc_msgSend(v1[12], "setObject:forKeyedSubscript:", v5, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BWInferenceConfiguration inferenceType](v5, "inferenceType")));
              if (!v28 || objc_msgSend(v1[7], "mode") == 5)
                goto LABEL_26;
              v13 = -[BWInferenceConfiguration initWithInferenceType:]([BWDeepZoomInferenceConfiguration alloc], "initWithInferenceType:", 159);
              -[BWTiledEspressoInferenceConfiguration setMetalCommandQueue:](v13, "setMetalCommandQueue:", objc_msgSend(v1[7], "metalCommandQueue"));
              -[BWDeepZoomInferenceConfiguration setVersion:](v13, "setVersion:", objc_msgSend(v1[7], "version"));
              -[BWTiledEspressoInferenceConfiguration setForceSynchronousInference:](v13, "setForceSynchronousInference:", 0);
              -[BWDeepZoomInferenceConfiguration setType:](v13, "setType:", objc_msgSend((id)objc_msgSend(v27, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v1[7], "type"))), "unsignedIntValue"));
              -[BWDeepZoomInferenceConfiguration setMode:](v13, "setMode:", 5);
              -[BWInferenceConfiguration setTuningParameters:](v13, "setTuningParameters:", v7);
              -[BWDeepZoomInferenceConfiguration setStereoPhotoOutputDimensions:](v13, "setStereoPhotoOutputDimensions:", objc_msgSend(v1[7], "stereoPhotoOutputDimensions"));
              if (!objc_msgSend(v1[11], "addInferenceOfType:version:configuration:", 159, BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL, v13))
              {
                objc_msgSend(v1[12], "setObject:forKeyedSubscript:", v13, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[BWInferenceConfiguration inferenceType](v13, "inferenceType")));
LABEL_26:
                v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E4A02408);
                objc_msgSend(v14, "addObjectsFromArray:", FigCaptureSupportedCompressedPixelFormatsForSettings(4, 3, 0, 1, 0, 1, 1, 0));
                v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                v1[13] = v15;
                if (v15)
                {
                  v16 = objc_alloc_init(BWVideoFormatRequirements);
                  -[BWVideoFormatRequirements setWidth:](v16, "setWidth:", objc_msgSend((id)objc_msgSend(v1[7], "inputFormat"), "width"));
                  -[BWVideoFormatRequirements setHeight:](v16, "setHeight:", objc_msgSend((id)objc_msgSend(v1[7], "inputFormat"), "height"));
                  -[BWVideoFormatRequirements setSupportedPixelFormats:](v16, "setSupportedPixelFormats:", v14);
                  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v16, "setBytesPerRowAlignment:", 64);
                  v41 = v16;
                  v17 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1));

                  if (v17)
                  {
                    objc_msgSend(v1[13], "setObject:forKeyedSubscript:", v17, CFSTR("PrimaryFormat"));
                    v18 = objc_alloc_init(BWVideoFormatRequirements);
                    -[BWVideoFormatRequirements setWidth:](v18, "setWidth:", objc_msgSend((id)objc_msgSend(v1[7], "outputFormat"), "width"));
                    -[BWVideoFormatRequirements setHeight:](v18, "setHeight:", objc_msgSend((id)objc_msgSend(v1[7], "outputFormat"), "height"));
                    -[BWVideoFormatRequirements setSupportedPixelFormats:](v18, "setSupportedPixelFormats:", v14);
                    -[BWVideoFormatRequirements setBytesPerRowAlignment:](v18, "setBytesPerRowAlignment:", 64);
                    v40 = v18;
                    v19 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1));

                    if (v19)
                    {
                      if (objc_msgSend(v1[7], "mode") != 5)
                        objc_msgSend(v1[13], "setObject:forKeyedSubscript:", v19, 0x1E4951638);
                      if (objc_msgSend(v1[7], "type") != 3)
                        goto LABEL_37;
                      v20 = +[BWVideoFormatRequirements formatRequirements](BWVideoFormatRequirements, "formatRequirements");
                      objc_msgSend(v20, "setWidth:", objc_msgSend((id)objc_msgSend(v1[7], "outputFormat"), "width"));
                      objc_msgSend(v20, "setHeight:", objc_msgSend((id)objc_msgSend(v1[7], "outputFormat"), "height"));
                      objc_msgSend(v20, "setSupportedPixelFormats:", v14);
                      objc_msgSend(v20, "setBytesPerRowAlignment:", 64);
                      v39 = v20;
                      v21 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1));
                      if (v21)
                      {
                        objc_msgSend(v1[13], "setObject:forKeyedSubscript:", v21, 0x1E4951618);
                        if (!v28)
                        {
LABEL_37:
                          v31 = 0u;
                          v32 = 0u;
                          v29 = 0u;
                          v30 = 0u;
                          v23 = v1[13];
                          result = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
                          if (!result)
                            return result;
                          v24 = result;
                          v25 = *(_QWORD *)v30;
LABEL_39:
                          v26 = 0;
                          while (1)
                          {
                            if (*(_QWORD *)v30 != v25)
                              objc_enumerationMutation(v23);
                            if (objc_msgSend(v1[11], "prepareForInputVideoFormat:attachedMediaKey:", objc_msgSend(v1[13], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v26)), *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v26)))return 4294954516;
                            if (v24 == ++v26)
                            {
                              result = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
                              v24 = result;
                              if (result)
                                goto LABEL_39;
                              return result;
                            }
                          }
                        }
                        if (objc_msgSend(v1[7], "mode") == 5
                          || (v22 = +[BWVideoFormatRequirements formatRequirements](BWVideoFormatRequirements, "formatRequirements"), objc_msgSend(v22, "setWidth:", (int)objc_msgSend(v1[7], "stereoPhotoOutputDimensions")), objc_msgSend(v22, "setHeight:", objc_msgSend(v1[7], "stereoPhotoOutputDimensions") >> 32), objc_msgSend(v22, "setSupportedPixelFormats:", v14), objc_msgSend(v22, "setBytesPerRowAlignment:", 64), v38 = v22, (v19 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1))) != 0))
                        {
                          objc_msgSend(v1[13], "setObject:forKeyedSubscript:", v19, 0x1E4951658);
                          goto LABEL_37;
                        }
                      }
                    }
                  }
                }
                return 4294954510;
              }
            }
          }
        }
      }
    }
    return 4294954516;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWDeepZoomProcessorController;
  -[BWStillImageProcessorController dealloc](&v3, sel_dealloc);
}

- (unint64_t)type
{
  return 10;
}

- (int)prepareWithPixelBufferPoolProvider:(id)a3
{
  int result;

  if (!a3)
    return -12780;
  result = -[BWInferenceEngine prepareForInferenceWithFormatProvider:pixelBufferPoolProvider:](self->_inferenceEngine, "prepareForInferenceWithFormatProvider:pixelBufferPoolProvider:", self, a3);
  if (result)
    return -12782;
  return result;
}

- (int)enqueueInputForProcessing:(id)a3 delegate:(id)a4
{
  _QWORD *v5;

  v5 = -[BWDeepZoomProcessorRequest initWithInput:delegate:]([BWDeepZoomProcessorRequest alloc], a3, a4);
  -[NSMutableArray addObject:](self->_requestQueue, "addObject:", v5);

  if (-[FigStateMachine currentState](self->_stateMachine, "currentState") == 1)
    -[FigStateMachine transitionToState:](self->_stateMachine, "transitionToState:", 2);
  return 0;
}

- (void)cancelProcessing
{
  -[NSMutableArray removeAllObjects](self->_requestQueue, "removeAllObjects");
  -[BWDeepZoomProcessorRequest setErr:](self->_currentRequest, "setErr:", 4294950490);
  -[BWDeepZoomProcessorController _serviceNextRequest]((uint64_t)self);
}

- (uint64_t)_serviceNextRequest
{
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  id v5;

  if (result)
  {
    v1 = result;
    v2 = (id)objc_msgSend(*(id *)(result + 80), "delegate");
    v3 = (id)objc_msgSend(*(id *)(v1 + 80), "input");
    v4 = objc_msgSend(*(id *)(v1 + 80), "err");

    *(_QWORD *)(v1 + 80) = 0;
    objc_msgSend(v2, "processorController:didFinishProcessingInput:err:", v1, v3, v4);

    v5 = (id)objc_msgSend(*(id *)(v1 + 72), "firstObject");
    *(_QWORD *)(v1 + 80) = v5;
    if (v5)
    {
      objc_msgSend(*(id *)(v1 + 72), "removeObjectAtIndex:", 0);
      objc_msgSend((id)objc_msgSend(*(id *)(v1 + 80), "input"), "setDelegate:", v1);
    }
    return -[BWDeepZoomProcessorController _updateStateIfNeeded](v1);
  }
  return result;
}

- (void)inputSampleBufferReceived:(id)a3
{
  -[BWDeepZoomProcessorRequest input](self->_currentRequest, "input", a3);
  -[BWDeepZoomProcessorController _updateStateIfNeeded]((uint64_t)self);
}

- (uint64_t)_updateStateIfNeeded
{
  uint64_t v1;
  void *v2;
  int v3;
  uint64_t v4;

  if (result)
  {
    v1 = result;
    v2 = *(void **)(result + 80);
    v3 = objc_msgSend(*(id *)(result + 64), "currentState");
    if (v2)
    {
      if (v3 == 2)
      {
        v4 = 4;
      }
      else if (v3 == 4)
      {
        if (objc_msgSend((id)objc_msgSend(v2, "input"), "sampleBufferSet"))
          v4 = 8;
        else
          v4 = 4;
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
    result = objc_msgSend(*(id *)(v1 + 64), "currentState");
    if ((_DWORD)v4 != (_DWORD)result)
      return objc_msgSend(*(id *)(v1 + 64), "transitionToState:", v4);
  }
  return result;
}

- (uint64_t)_process
{
  id *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  int v6;
  id v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  const void *AttachedMedia;
  const void *v16;
  const void *v17;
  NSObject *v18;
  char v19;
  int v20;
  char v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if (!result)
    return result;
  v1 = (id *)result;
  v2 = (void *)objc_msgSend(*(id *)(result + 80), "input");
  v3 = (void *)objc_msgSend(v2, "settings");
  if (objc_msgSend(v1[10], "err"))
    goto LABEL_53;
  if (!v2)
  {
    v22 = v1[10];
    v23 = 4294954514;
    goto LABEL_52;
  }
  if (!v3)
  {
    v4 = v1[10];
    goto LABEL_55;
  }
  if (!objc_msgSend(v3, "outputWidth") || !objc_msgSend(v3, "outputHeight"))
  {
    v22 = v1[10];
    v23 = 4294935586;
LABEL_52:
    objc_msgSend(v22, "setErr:", v23);
LABEL_53:
    v16 = 0;
    v3 = 0;
LABEL_56:
    v19 = 1;
    goto LABEL_38;
  }
  v3 = (void *)objc_msgSend(v2, "sampleBuffer");
  v4 = v1[10];
  if (!v3)
  {
LABEL_55:
    objc_msgSend(v4, "setErr:", 4294954516);
    v16 = 0;
    goto LABEL_56;
  }
  v5 = objc_msgSend((id)objc_msgSend(v4, "input"), "portType");
  v6 = objc_msgSend(v1[7], "type");
  v7 = v1[7];
  if (v6 == 3)
  {
    if (!+[BWDeepZoomProcessorControllerConfiguration doDeepZoomTransferForSampleBuffer:sensorConfiguration:intermediateZoomSrcRectOut:](BWDeepZoomProcessorControllerConfiguration, "doDeepZoomTransferForSampleBuffer:sensorConfiguration:intermediateZoomSrcRectOut:", v3, objc_msgSend((id)objc_msgSend(v7, "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", v5), 0))
    {
LABEL_10:
      if (dword_1EE6BE838)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        v19 = 1;
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      else
      {
        v19 = 1;
      }
      v16 = v3;
      goto LABEL_38;
    }
  }
  else if (!+[BWDeepZoomProcessorControllerConfiguration doDeepZoomStandardOrLiteForSampleBuffer:type:sensorConfiguration:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:](BWDeepZoomProcessorControllerConfiguration, "doDeepZoomStandardOrLiteForSampleBuffer:type:sensorConfiguration:intermediateZoomSrcRectOut:intermediateZoomDstRectOut:", v3, objc_msgSend(v7, "type"), objc_msgSend((id)objc_msgSend(v1[7], "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", v5), 0, 0))
  {
    goto LABEL_10;
  }
  v9 = objc_msgSend(v1[7], "mode");
  if (!objc_msgSend(v1[13], "objectForKeyedSubscript:", 0x1E4951658))
  {
    if (!v9)
      +[BWDeepZoomProcessorControllerConfiguration deepZoomProcessingModeForType:sensorConfiguration:](BWDeepZoomProcessorControllerConfiguration, "deepZoomProcessingModeForType:sensorConfiguration:", objc_msgSend(v1[7], "type"), objc_msgSend((id)objc_msgSend(v1[7], "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", v5));
    v10 = 0;
    goto LABEL_20;
  }
  if ((BWStillImageProcessingFlagsForSampleBuffer(v3) & 0x100000) == 0)
  {
    v10 = objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", &unk_1E49FCAE0);
LABEL_20:
    v11 = 160;
    goto LABEL_22;
  }
  v10 = objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", &unk_1E49FCAC8);
  v11 = 159;
LABEL_22:
  v12 = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v13 = (void *)CMGetAttachment(v3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  objc_msgSend(v13, "removeObjectForKey:", *MEMORY[0x1E0D05F80]);
  objc_msgSend(v13, "removeObjectForKey:", *MEMORY[0x1E0D05F78]);
  v14 = (void *)objc_msgSend(v1[12], "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11));
  if (!objc_msgSend((id)objc_msgSend(v14, "tuningParameters"), "objectForKeyedSubscript:", v5))
  {
    v19 = 1;
    v16 = v3;
    goto LABEL_38;
  }
  objc_msgSend(v1[10], "setErr:", objc_msgSend(v1[11], "performInferencesOnSampleBuffer:attachingResultsToSampleBuffer:skippingInferencesWithTypes:", v3, v3, v10));
  if (objc_msgSend(v1[10], "err"))
  {
    v16 = 0;
    v19 = 1;
    goto LABEL_38;
  }
  AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(v3, objc_msgSend(v14, "outputAttachedMediaKey"));
  v16 = AttachedMedia;
  if (!AttachedMedia)
  {
    objc_msgSend(v1[10], "setErr:", 4294954513);
    goto LABEL_56;
  }
  CFRetain(AttachedMedia);
  if (objc_msgSend(v1[7], "type") == 3)
  {
    v17 = (const void *)BWSampleBufferGetAttachedMedia(v3, 0x1E4951618);
    if (CMGetAttachment(v17, v12, 0) && CMGetAttachment(v16, v12, 0))
    {
      if (FigCFDictionaryGetCGRectIfPresent())
        FigCFDictionarySetCGRect();
      if (!dword_1EE6BE838)
        goto LABEL_37;
      goto LABEL_34;
    }
  }
  else if (dword_1EE6BE838)
  {
LABEL_34:
    v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_37:
    v19 = 0;
    goto LABEL_38;
  }
  v19 = 0;
LABEL_38:
  BWSampleBufferRemoveAttachedMedia(v3, 0x1E4951638);
  if (objc_msgSend(v1[7], "type") == 3)
  {
    BWSampleBufferRemoveAttachedMedia(v3, 0x1E4951658);
    BWSampleBufferRemoveAttachedMedia(v3, 0x1E4951618);
  }
  v20 = objc_msgSend(v1[10], "err", v24, v25);
  if (v3 && v20)
  {
    objc_msgSend(v1[10], "setErr:", 0);
    v16 = v3;
  }
  objc_msgSend((id)objc_msgSend(v1[10], "delegate"), "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", v1, v16, objc_msgSend(v2, "bufferType"), v2, objc_msgSend(v1[10], "err"));
  if (v16)
    v21 = v19;
  else
    v21 = 1;
  if ((v21 & 1) == 0)
    CFRelease(v16);
  return -[BWDeepZoomProcessorController _updateStateIfNeeded]((uint64_t)v1);
}

- (id)inputVideoFormatForAttachedMediaKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_videoFormatByAttachedMediaKey, "objectForKeyedSubscript:", a3);
}

- (id)inputInferenceVideoFormatForAttachedMediaKey:(id)a3
{
  return 0;
}

- (id)outputVideoFormatForAttachedMediaKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_videoFormatByAttachedMediaKey, "objectForKeyedSubscript:", a3);
}

- (BOOL)intermediateResourceTrackingAllowedForAttachedMediaKey:(id)a3
{
  return 0;
}

@end

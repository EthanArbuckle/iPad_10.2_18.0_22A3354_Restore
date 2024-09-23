@implementation BWLearnedNRProcessorController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWLearnedNRProcessorController)initWithConfiguration:(id)a3
{
  BWLearnedNRProcessorController *v4;
  FigStateMachine *v5;
  void *v6;
  int v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BWLearnedNRProcessorController;
  v4 = -[BWLearnedNRProcessorController init](&v9, sel_init);
  if (v4)
  {
    if (!objc_msgSend((id)objc_msgSend(a3, "sensorConfigurationsByPortType"), "count"))
    {
      FigDebugAssert3();
      goto LABEL_4;
    }
    v4->_configuration = (BWLearnedNRProcessorControllerConfiguration *)a3;
    v5 = -[FigStateMachine initWithLabel:stateCount:initialState:owner:]([FigStateMachine alloc], "initWithLabel:stateCount:initialState:owner:", CFSTR("BWLearnedNRController state machine"), 4, 1, v4);
    -[FigStateMachine setPerformsAtomicStateTransitions:](v5, "setPerformsAtomicStateTransitions:", 0);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("Idle"), 1);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("Ready"), 2);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("Waiting"), 4);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("Processing"), 8);
    -[FigStateMachine whenTransitioningToStates:callHandler:](v5, "whenTransitioningToStates:callHandler:", 1, &__block_literal_global_95);
    -[FigStateMachine whenTransitioningToStates:callHandler:](v5, "whenTransitioningToStates:callHandler:", 2, &__block_literal_global_201);
    -[FigStateMachine whenTransitioningToState:callHandler:](v5, "whenTransitioningToState:callHandler:", 4, &__block_literal_global_202);
    -[FigStateMachine whenTransitioningToState:callHandler:](v5, "whenTransitioningToState:callHandler:", 8, &__block_literal_global_203);
    v4->_stateMachine = v5;
    v4->_requestQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4->_inferenceConfigurationByInferenceType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = (void *)MEMORY[0x1A858DD40]();
    v7 = -[BWLearnedNRProcessorController _configureInference]((uint64_t)v4);
    objc_autoreleasePoolPop(v6);
    if (v7)
    {
LABEL_4:

      return 0;
    }
  }
  return v4;
}

- (uint64_t)_configureInference
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  BWInferenceVideoRequirement *v7;
  __CFString *v8;
  BWInferenceVideoRequirement *v9;
  __CFString *v10;
  BWInferenceVideoRequirement *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    *(_BYTE *)(result + 88) = 0;
    result = -[BWInferenceEngine initWithScheduler:priority:shareIntermediateBuffer:]([BWInferenceEngine alloc], "initWithScheduler:priority:shareIntermediateBuffer:", objc_msgSend(*(id *)(v1 + 56), "inferenceScheduler"), objc_msgSend(*(id *)(v1 + 56), "figThreadPriority"), 1);
    *(_QWORD *)(v1 + 96) = result;
    if (result)
    {
      v2 = -[BWLearnedNRProcessorController _inputFormat](v1);
      v3 = -[BWLearnedNRProcessorController _quadraInputFormat](v1);
      v4 = -[BWLearnedNRProcessorController _quadraZoomBasedInputFormat](v1);
      v5 = -[BWLearnedNRProcessorController _quadraUltraHighResolutionInputFormat](v1);
      v6 = -[BWLearnedNRProcessorController _attachedMediaKeyForOutputFormat:]((__CFString *)v1, (void *)objc_msgSend(*(id *)(v1 + 56), "outputFormat"));
      v7 = lnrpc_inferenceVideoRequirementForVideoFormat((uint64_t)v6, (void *)objc_msgSend(*(id *)(v1 + 56), "outputFormat"));
      v8 = -[BWLearnedNRProcessorController _attachedMediaKeyForOutputFormat:]((__CFString *)v1, (void *)objc_msgSend(*(id *)(v1 + 56), "zoomBasedOutputFormat"));
      v9 = lnrpc_inferenceVideoRequirementForVideoFormat((uint64_t)v8, (void *)objc_msgSend(*(id *)(v1 + 56), "zoomBasedOutputFormat"));
      v10 = -[BWLearnedNRProcessorController _attachedMediaKeyForOutputFormat:]((__CFString *)v1, (void *)objc_msgSend(*(id *)(v1 + 56), "ultraHighResolutionOutputFormat"));
      v11 = lnrpc_inferenceVideoRequirementForVideoFormat((uint64_t)v10, (void *)objc_msgSend(*(id *)(v1 + 56), "ultraHighResolutionOutputFormat"));
      if (v2)
      {
        if (!v7)
          goto LABEL_21;
        v14[0] = v7;
        result = -[BWLearnedNRProcessorController _addInferenceType:outputVideoRequirements:]((id *)v1, 170, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1));
        if ((_DWORD)result)
          return result;
      }
      if (!v3 && !v4 && !v5)
        return objc_msgSend(*(id *)(v1 + 96), "prepareForInputVideoFormat:attachedMediaKey:", -[BWLearnedNRProcessorController _primaryInputFormat](v1), CFSTR("PrimaryFormat"));
      v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v13 = v12;
      if (v3)
      {
        if (!v7)
          goto LABEL_21;
        objc_msgSend(v12, "addObject:", v7);
      }
      if (v4)
      {
        if (!v9)
          goto LABEL_21;
        objc_msgSend(v13, "addObject:", v9);
      }
      if (!v5)
        goto LABEL_18;
      if (v11)
      {
        objc_msgSend(v13, "addObject:", v11);
LABEL_18:
        result = -[BWLearnedNRProcessorController _addInferenceType:outputVideoRequirements:]((id *)v1, 171, (uint64_t)v13);
        if ((_DWORD)result)
          return result;
        return objc_msgSend(*(id *)(v1 + 96), "prepareForInputVideoFormat:attachedMediaKey:", -[BWLearnedNRProcessorController _primaryInputFormat](v1), CFSTR("PrimaryFormat"));
      }
LABEL_21:
      FigDebugAssert3();
      return 4294935585;
    }
  }
  return result;
}

- (__CFString)_attachedMediaKeyForOutputFormat:(__CFString *)result
{
  __CFString *v3;

  if (result)
  {
    v3 = result;
    if (objc_msgSend(a2, "isEqual:", objc_msgSend((id)result[1].length, "ultraHighResolutionOutputFormat")))
    {
      return CFSTR("UltraHighResLearnedNROutput");
    }
    else if (objc_msgSend(a2, "isEqual:", objc_msgSend((id)v3[1].length, "zoomBasedOutputFormat")))
    {
      return CFSTR("ZoomBasedLearnedNROutput");
    }
    else
    {
      return CFSTR("LearnedNROutput");
    }
  }
  return result;
}

- (uint64_t)_addInferenceType:(uint64_t)a3 outputVideoRequirements:
{
  BWLearnedNRInferenceConfiguration *v5;
  uint64_t v6;

  if (!a1)
    return 0;
  v5 = -[BWLearnedNRInferenceConfiguration initWithMetalCommandQueue:sensorConfigurationsByPortType:inferenceType:outputVideoRequirements:]([BWLearnedNRInferenceConfiguration alloc], "initWithMetalCommandQueue:sensorConfigurationsByPortType:inferenceType:outputVideoRequirements:", objc_msgSend(a1[7], "metalCommandQueue"), objc_msgSend(a1[7], "sensorConfigurationsByPortType"), a2, a3);
  v6 = objc_msgSend(a1[12], "addInferenceOfType:version:configuration:", a2, BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL, v5);
  if ((_DWORD)v6)
    FigDebugAssert3();
  else
    objc_msgSend(a1[13], "setObject:forKeyedSubscript:", v5, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2));
  return v6;
}

- (uint64_t)_inputFormat
{
  if (result)
    return lnrpc_formatFromInputFormatsByQSubResolutionFlavor((void *)objc_msgSend(*(id *)(result + 56), "inputFormatsByQSubResolutionFlavor"), 1, 0, 0, 0);
  return result;
}

- (uint64_t)_quadraInputFormat
{
  if (result)
    return lnrpc_formatFromInputFormatsByQSubResolutionFlavor((void *)objc_msgSend(*(id *)(result + 56), "inputFormatsByQSubResolutionFlavor"), 1, 0, 0, 1);
  return result;
}

- (uint64_t)_quadraZoomBasedInputFormat
{
  if (result)
    return lnrpc_formatFromInputFormatsByQSubResolutionFlavor((void *)objc_msgSend(*(id *)(result + 56), "inputFormatsByQSubResolutionFlavor"), 0, 1, 0, 1);
  return result;
}

- (uint64_t)_quadraUltraHighResolutionInputFormat
{
  if (result)
    return lnrpc_formatFromInputFormatsByQSubResolutionFlavor((void *)objc_msgSend(*(id *)(result + 56), "inputFormatsByQSubResolutionFlavor"), 0, 0, 1, 1);
  return result;
}

- (uint64_t)_primaryInputFormat
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    result = lnrpc_formatFromInputFormatsByQSubResolutionFlavor((void *)objc_msgSend(*(id *)(result + 56), "inputFormatsByQSubResolutionFlavor"), 1, 0, 0, 0);
    if (!result)
      return lnrpc_formatFromInputFormatsByQSubResolutionFlavor((void *)objc_msgSend(*(id *)(v1 + 56), "inputFormatsByQSubResolutionFlavor"), 0, 0, 1, 1);
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWLearnedNRProcessorController;
  -[BWStillImageProcessorController dealloc](&v3, sel_dealloc);
}

- (unint64_t)type
{
  return 11;
}

- (int)prepareWithPixelBufferPoolProvider:(id)a3
{
  int result;

  result = -[BWInferenceEngine prepareForInferenceWithFormatProvider:pixelBufferPoolProvider:](self->_inferenceEngine, "prepareForInferenceWithFormatProvider:pixelBufferPoolProvider:", self, a3);
  if (!result)
    self->_inferenceEnginePrepared = 1;
  return result;
}

- (int)enqueueInputForProcessing:(id)a3 delegate:(id)a4
{
  _QWORD *v7;

  if (!-[BWInferenceEngine isConfiguredForInference](self->_inferenceEngine, "isConfiguredForInference")
    || !self->_inferenceEnginePrepared)
  {
    return -12780;
  }
  v7 = -[BWLearnedNRRequest initWithInput:delegate:]([BWLearnedNRRequest alloc], a3, a4);
  -[NSMutableArray addObject:](self->_requestQueue, "addObject:", v7);

  if (-[FigStateMachine currentState](self->_stateMachine, "currentState") == 1)
    -[FigStateMachine transitionToState:](self->_stateMachine, "transitionToState:", 2);
  return 0;
}

- (void)cancelProcessing
{
  -[NSMutableArray removeAllObjects](self->_requestQueue, "removeAllObjects");
  -[BWLearnedNRRequest setErr:](self->_currentRequest, "setErr:", 4294950490);
  -[BWLearnedNRProcessorController _serviceNextRequest]((uint64_t)self);
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
    return -[BWLearnedNRProcessorController _updateStateIfNeeded](v1);
  }
  return result;
}

- (uint64_t)_updateStateIfNeeded
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  if (result)
  {
    v1 = result;
    v2 = *(_QWORD *)(result + 80);
    v3 = objc_msgSend(*(id *)(result + 64), "currentState");
    if (v2)
    {
      if (v3 == 2)
      {
        v4 = 4;
      }
      else if (v3 == 4)
      {
        if (objc_msgSend(*(id *)(v2 + 8), "inputFrame"))
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
  uint64_t v1;
  id *v2;
  int *v3;
  __objc2_meth_list **p_opt_class_meths;
  opaqueCMSampleBuffer *v5;
  NSObject *v6;
  CVImageBufferRef ImageBuffer;
  __CVBuffer *v8;
  void *v9;
  int64_t v10;
  double FinalCropRect;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double ValidBufferRect;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  void *v30;
  float v31;
  float v32;
  double v33;
  double v34;
  double v35;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CFDictionaryRef DictionaryRepresentation;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  void *v46;
  int v47;
  int v48;
  int v49;
  unsigned int v50;
  int v51;
  uint64_t v52;
  const void *AttachedMedia;
  CFTypeRef v54;
  const void *v55;
  id v56;
  uint64_t v57;
  NSObject *v58;
  int v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  id *v67;
  const void *v68;
  uint64_t v69;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  v73 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v2 = (id *)result;
  v3 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__rawCompressionEnabled;
  p_opt_class_meths = &OBJC_PROTOCOL___FTObservable.opt_class_meths;
  if (objc_msgSend(*(id *)(result + 80), "err"))
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v55 = 0;
    goto LABEL_33;
  }
  v5 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(v2[10], "input"), "inputFrame");
  if (dword_1EE6BE698)
  {
    v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(v5);
  if (!ImageBuffer)
  {
    v72 = v1;
    LODWORD(v71) = 0;
    FigDebugAssert3();
    goto LABEL_31;
  }
  v8 = ImageBuffer;
  v9 = (void *)CMGetAttachment(v5, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v10 = psn_pixelBufferDimensions(v8);
  FinalCropRect = FigCaptureMetadataUtilitiesGetFinalCropRect();
  FigCaptureMetadataUtilitiesDenormalizeCropRect(FinalCropRect, v12, v13, v14);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  ValidBufferRect = FigCaptureMetadataUtilitiesGetValidBufferRect();
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v30 = (void *)objc_msgSend((id)objc_msgSend(v2[7], "finalCropRectOverscanMultiplierByPortType"), "objectForKeyedSubscript:", objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]));
  if (v30)
    objc_msgSend(v30, "floatValue");
  else
    v31 = 1.0;
  v32 = FigCaptureMetadataUtilitiesScaleRect(v16, v18, v20, v22, v31);
  v74.origin.x = (float)(floorf(v32) + -2.0);
  *(float *)&v33 = v33;
  v74.origin.y = (float)(floorf(*(float *)&v33) + -2.0);
  *(float *)&v34 = v34;
  v74.size.width = (float)(ceilf(*(float *)&v34) + 4.0);
  *(float *)&v35 = v35;
  v74.size.height = (float)(ceilf(*(float *)&v35) + 4.0);
  v77.origin.x = ValidBufferRect;
  v77.origin.y = v25;
  v77.size.width = v27;
  v77.size.height = v29;
  v75 = CGRectIntersection(v74, v77);
  x = v75.origin.x;
  y = v75.origin.y;
  width = v75.size.width;
  height = v75.size.height;
  if (!CGRectIsNull(v75))
  {
    v76.origin.x = x;
    v76.origin.y = y;
    v76.size.width = width;
    v76.size.height = height;
    DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v76);
    CMSetAttachment(v5, CFSTR("LearnedNRRegionOfInterest"), DictionaryRepresentation, 0);
    if (DictionaryRepresentation)
      CFRelease(DictionaryRepresentation);
  }
  if (objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D20], v71, v72), "intValue") == 1)
  {
    v41 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2[10], "input"), "captureSettings"), "captureFlags");
    if (objc_msgSend((id)lnrpc_formatFromInputFormatsByQSubResolutionFlavor((void *)objc_msgSend(v2[7], "inputFormatsByQSubResolutionFlavor"), 1, 0, 0, 1), "width") >= (unint64_t)(int)v10)
    {
      v45 = objc_msgSend((id)lnrpc_formatFromInputFormatsByQSubResolutionFlavor((void *)objc_msgSend(v2[7], "inputFormatsByQSubResolutionFlavor"), 1, 0, 0, 1), "height");
      if ((v41 & 0x100000000) != 0)
      {
LABEL_20:
        v46 = (void *)objc_msgSend(v2[7], "inputFormatsByQSubResolutionFlavor");
        v47 = 0;
        v48 = 0;
        v49 = 1;
LABEL_23:
        v42 = (void *)lnrpc_formatFromInputFormatsByQSubResolutionFlavor(v46, v47, v48, v49, 1);
        v43 = 170;
        v44 = 171;
        goto LABEL_24;
      }
      if (v45 >= v10 >> 32)
      {
        v46 = (void *)objc_msgSend(v2[7], "inputFormatsByQSubResolutionFlavor");
        v47 = 1;
        v48 = 0;
        goto LABEL_22;
      }
    }
    else if ((v41 & 0x100000000) != 0)
    {
      goto LABEL_20;
    }
    v46 = (void *)objc_msgSend(v2[7], "inputFormatsByQSubResolutionFlavor");
    v47 = 0;
    v48 = 1;
LABEL_22:
    v49 = 0;
    goto LABEL_23;
  }
  v42 = (void *)lnrpc_formatFromInputFormatsByQSubResolutionFlavor((void *)objc_msgSend(v2[7], "inputFormatsByQSubResolutionFlavor"), 1, 0, 0, 0);
  v43 = 171;
  v44 = 170;
LABEL_24:
  v50 = objc_msgSend(v42, "width");
  if (__PAIR64__(objc_msgSend(v42, "height"), v50) != v10
    || (v51 = objc_msgSend(v42, "pixelFormat"), v51 != CVPixelBufferGetPixelFormatType(v8)))
  {
    v3 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__rawCompressionEnabled;
    v56 = v2[10];
    v57 = 4294954516;
    goto LABEL_32;
  }
  v52 = objc_msgSend(v2[12], "performInferencesOnSampleBuffer:attachingResultsToSampleBuffer:skippingInferencesWithTypes:", v5, v5, objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v43)));
  if ((_DWORD)v52)
  {
    v57 = v52;
    v3 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__rawCompressionEnabled;
    v56 = v2[10];
    goto LABEL_32;
  }
  AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(v5, objc_msgSend((id)objc_msgSend(v2[13], "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v44)), "outputAttachedMediaKeyForInputDimensions:", v10));
  if (!AttachedMedia || (v54 = CFRetain(AttachedMedia)) == 0)
  {
    v3 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__rawCompressionEnabled;
LABEL_31:
    v56 = v2[10];
    v57 = 4294954510;
LABEL_32:
    objc_msgSend(v56, "setErr:", v57, v71, v72);
    v55 = 0;
    p_opt_class_meths = &OBJC_PROTOCOL___FTObservable.opt_class_meths;
    goto LABEL_33;
  }
  v55 = v54;
  BWSampleBufferRemoveAttachedMedia(v5, 0x1E4951678);
  BWSampleBufferRemoveAttachedMedia(v5, 0x1E4951698);
  BWSampleBufferRemoveAttachedMedia(v5, 0x1E49516B8);
  BWSampleBufferRemoveAttachedMedia(v5, 0x1E49516D8);
  BWSampleBufferRemoveAttachedMedia(v55, 0x1E4951678);
  p_opt_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___FTObservable + 48);
  v3 = &OBJC_IVAR___BWMultiStreamCameraSourceNode__rawCompressionEnabled;
LABEL_33:
  if (*((_DWORD *)p_opt_class_meths + 422))
  {
    v58 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v59 = objc_msgSend(*(id *)((char *)v2 + v3[450]), "err", v71, v72);
  v60 = objc_msgSend(*(id *)((char *)v2 + v3[450]), "delegate");
  v61 = (void *)objc_msgSend(*(id *)((char *)v2 + v3[450]), "input");
  v62 = (uint64_t)v61;
  if (v59)
  {
    v63 = objc_msgSend(v61, "inputFrame");
    v64 = objc_msgSend(*(id *)((char *)v2 + v3[450]), "input");
    v65 = objc_msgSend(*(id *)((char *)v2 + v3[450]), "err");
    v66 = (void *)v60;
    v67 = v2;
    v68 = (const void *)v63;
    v69 = v64;
  }
  else
  {
    v65 = objc_msgSend(*(id *)((char *)v2 + v3[450]), "err");
    v66 = (void *)v60;
    v67 = v2;
    v68 = v55;
    v69 = v62;
  }
  objc_msgSend(v66, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", v67, v68, 1, v69, v65);
  if (v55)
    CFRelease(v55);
  return -[BWLearnedNRProcessorController _updateStateIfNeeded]((uint64_t)v2);
}

- (id)inputVideoFormatForAttachedMediaKey:(id)a3
{
  return 0;
}

- (id)inputInferenceVideoFormatForAttachedMediaKey:(id)a3
{
  uint64_t v5;

  if (!objc_msgSend(a3, "isEqualToString:", CFSTR("PrimaryFormat")))
    return 0;
  LODWORD(v5) = 0;
  return -[BWInferenceVideoFormat initWithUnderlyingFormat:isDeviceOriented:videoContentMode:includesInvalidContent:cropDescriptor:histogramRequest:rotationDegrees:]([BWInferenceVideoFormat alloc], "initWithUnderlyingFormat:isDeviceOriented:videoContentMode:includesInvalidContent:cropDescriptor:histogramRequest:rotationDegrees:", -[BWLearnedNRProcessorController _primaryInputFormat]((uint64_t)self), 0, 0, 0, 0, 0, v5);
}

- (id)outputFormatForAttachedMediaKey:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-[BWLearnedNRProcessorController outputFormatForAttachedMediaKey:] is not implemented -- please implement if it's ever used")), 0));
}

- (id)outputVideoFormatForAttachedMediaKey:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-[BWLearnedNRProcessorController outputVideoFormatForAttachedMediaKey:] is not implemented -- please implement if it's ever used")), 0));
}

- (BOOL)intermediateResourceTrackingAllowedForAttachedMediaKey:(id)a3
{
  return 0;
}

- (void)input:(id)a3 setInputFrame:(opaqueCMSampleBuffer *)a4
{
  -[BWLearnedNRRequest input](self->_currentRequest, "input", a3, a4);
  -[BWLearnedNRProcessorController _updateStateIfNeeded]((uint64_t)self);
}

@end

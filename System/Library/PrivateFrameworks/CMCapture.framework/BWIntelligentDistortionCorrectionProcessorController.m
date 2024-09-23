@implementation BWIntelligentDistortionCorrectionProcessorController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWIntelligentDistortionCorrectionProcessorController)initWithConfiguration:(id)a3
{
  BWIntelligentDistortionCorrectionProcessorController *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v13;
  float v14;
  double v15;
  int v16;
  int v17;
  CFDictionaryRef DictionaryRepresentation;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  _BOOL4 v24;
  unint64_t v25;
  size_t v26;
  uint64_t v27;
  size_t v28;
  uint64_t v29;
  const __CFDictionary *v30;
  const __CFAllocator *v31;
  FigStateMachine *v32;
  void *v33;
  BWIntelligentDistortionCorrectionProcessorController *v35;
  id obj;
  CGPoint v37;
  uint64_t v38;
  void *v39;
  CGPoint point;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[4];
  _QWORD v49[4];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v45.receiver = self;
  v45.super_class = (Class)BWIntelligentDistortionCorrectionProcessorController;
  v4 = -[BWIntelligentDistortionCorrectionProcessorController init](&v45, sel_init);
  if (v4)
  {
    if (!objc_msgSend((id)objc_msgSend(a3, "sensorConfigurationsByPortType"), "count"))
      goto LABEL_27;
    if ((int)objc_msgSend(a3, "horizontalSensorBinningFactor") > 1
      || (int)objc_msgSend(a3, "verticalSensorBinningFactor") >= 2)
    {
      v5 = objc_msgSend(a3, "horizontalSensorBinningFactor");
      if (v5 != objc_msgSend(a3, "verticalSensorBinningFactor"))
      {
LABEL_25:

        return 0;
      }
      v35 = v4;
      v39 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend((id)objc_msgSend(a3, "sensorConfigurationsByPortType"), "count"));
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      obj = (id)objc_msgSend(a3, "sensorConfigurationsByPortType");
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      if (v6)
      {
        v7 = v6;
        v38 = *(_QWORD *)v42;
        v8 = *MEMORY[0x1E0D05968];
        v9 = *MEMORY[0x1E0D05960];
        v37 = (CGPoint)*MEMORY[0x1E0C9D538];
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v42 != v38)
              objc_enumerationMutation(obj);
            v11 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
            v12 = (void *)objc_msgSend((id)objc_msgSend(a3, "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", v11);
            v13 = (id)objc_msgSend((id)objc_msgSend(v12, "cameraInfo"), "mutableCopy");
            objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", v8), "floatValue");
            *(float *)&v15 = v14 * (float)(int)objc_msgSend(a3, "horizontalSensorBinningFactor");
            objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15), v8);
            point = v37;
            if (CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v13, "objectForKeyedSubscript:", v9), &point))
            {
              v16 = objc_msgSend(a3, "horizontalSensorBinningFactor");
              point.x = point.x / (double)v16;
              v17 = objc_msgSend(a3, "verticalSensorBinningFactor");
              point.y = point.y / (double)v17;
              DictionaryRepresentation = CGPointCreateDictionaryRepresentation(point);
              objc_msgSend(v13, "setObject:forKeyedSubscript:", DictionaryRepresentation, v9);

            }
            objc_msgSend(v39, "setObject:forKeyedSubscript:", -[BWSensorConfiguration initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:]([BWSensorConfiguration alloc], "initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:", v11, objc_msgSend(v12, "sensorIDString"), objc_msgSend(v12, "sensorIDDictionary"), v13), v11);
          }
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
        }
        while (v7);
      }
      objc_msgSend(a3, "setSensorConfigurationsByPortType:", v39);
      v4 = v35;
    }
    if (objc_msgSend(a3, "depthDataCorrectionEnabled"))
    {
      v19 = objc_msgSend(a3, "primaryFormat");
      if (!v19)
        goto LABEL_27;
      v20 = (void *)v19;
      v21 = objc_msgSend(a3, "depthFormat");
      if (!v21)
        goto LABEL_27;
      v22 = (void *)v21;
      v23 = objc_msgSend(v20, "width");
      v24 = v23 < objc_msgSend(v20, "height");
      v25 = objc_msgSend(v22, "width");
      if (v24 == v25 >= objc_msgSend(v22, "height"))
      {
        v26 = objc_msgSend(v22, "height");
        v27 = objc_msgSend(v22, "width");
      }
      else
      {
        v26 = objc_msgSend(v22, "width");
        v27 = objc_msgSend(v22, "height");
      }
      v28 = v27;
      v48[0] = *MEMORY[0x1E0CA9040];
      v49[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v22, "pixelFormat"));
      v48[1] = *MEMORY[0x1E0CA90E0];
      v49[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v26);
      v48[2] = *MEMORY[0x1E0CA8FD8];
      v49[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v28);
      v48[3] = *MEMORY[0x1E0CA8FF0];
      v29 = *MEMORY[0x1E0CBC050];
      v46[0] = *MEMORY[0x1E0CBBF10];
      v46[1] = v29;
      v47[0] = &unk_1E49FC900;
      v47[1] = MEMORY[0x1E0C9AAB0];
      v49[3] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
      v30 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 4);
      v31 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v26, v28, objc_msgSend(v22, "pixelFormat"), v30, &v4->_intermediateDepthInputBuffer)|| CVPixelBufferCreate(v31, v26, v28, objc_msgSend(v22, "pixelFormat"), v30, &v4->_intermediateDepthOutputBuffer))
      {
LABEL_27:
        FigDebugAssert3();
        goto LABEL_25;
      }
    }
    v4->_configuration = (BWIntelligentDistortionCorrectionProcessorControllerConfiguration *)a3;
    v4->_requestQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v32 = -[FigStateMachine initWithLabel:stateCount:initialState:owner:]([FigStateMachine alloc], "initWithLabel:stateCount:initialState:owner:", CFSTR("BWIntelligentDistortionCorrectionProcessorController state machine"), 4, 1, v4);
    -[FigStateMachine setPerformsAtomicStateTransitions:](v32, "setPerformsAtomicStateTransitions:", 0);
    -[FigStateMachine setLabel:forState:](v32, "setLabel:forState:", CFSTR("Idle"), 1);
    -[FigStateMachine setLabel:forState:](v32, "setLabel:forState:", CFSTR("Ready"), 2);
    -[FigStateMachine setLabel:forState:](v32, "setLabel:forState:", CFSTR("WaitingForFrames"), 4);
    -[FigStateMachine setLabel:forState:](v32, "setLabel:forState:", CFSTR("ProcessIntelligentDistortionCorrection"), 8);
    -[FigStateMachine whenTransitioningToStates:callHandler:](v32, "whenTransitioningToStates:callHandler:", 1, &__block_literal_global_118);
    -[FigStateMachine whenTransitioningToStates:callHandler:](v32, "whenTransitioningToStates:callHandler:", 2, &__block_literal_global_473);
    -[FigStateMachine whenTransitioningToState:callHandler:](v32, "whenTransitioningToState:callHandler:", 4, &__block_literal_global_474);
    -[FigStateMachine whenTransitioningToState:callHandler:](v32, "whenTransitioningToState:callHandler:", 8, &__block_literal_global_475);
    v4->_stateMachine = v32;
    v4->_outputFormatDescriptionByAttachedMediaKey = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v33 = (void *)MEMORY[0x1A858DD40]();
    LODWORD(v32) = -[BWIntelligentDistortionCorrectionProcessorController _loadSetupAndPrepareProcessor]((uint64_t)v4);
    objc_autoreleasePoolPop(v33);
    if ((_DWORD)v32)
      goto LABEL_25;
  }
  return v4;
}

- (uint64_t)_loadSetupAndPrepareProcessor
{
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[5];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = objc_msgSend(*(id *)(result + 56), "intelligentDistortionCorrectionVersion");
    v3 = objc_msgSend(*(id *)(v1 + 56), "intelligentDistortionCorrectionVersion");
    v4 = (void *)objc_msgSend(*(id *)(v1 + 56), "sensorConfigurationsByPortType");
    v5 = objc_msgSend(*(id *)(v1 + 56), "metalCommandQueue");
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __85__BWIntelligentDistortionCorrectionProcessorController__loadSetupAndPrepareProcessor__block_invoke;
    v17[3] = &unk_1E49204F0;
    v17[4] = v1;
    result = BWLoadCreateSetupAndPrepareMetalImageBufferProcessor((uint64_t)CFSTR("IntelligentDistortionCorrection"), v2, (uint64_t)CFSTR("Fig"), (uint64_t)CFSTR("IntelligentDistortionCorrection"), v3, (uint64_t)&unk_1EE727C78, 1, v4, v5, 0, (uint64_t)v17, 0, (_QWORD *)(v1 + 72));
    if (!(_DWORD)result)
    {
      v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v7 = (void *)objc_msgSend(*(id *)(v1 + 56), "sensorConfigurationsByPortType");
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v14;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 56), "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11)), "sensorIDDictionary"), "objectForKeyedSubscript:", CFSTR("IntelligentDistortionCorrectionParameters")), "objectForKeyedSubscript:", CFSTR("CaptureConfiguration")), "objectForKeyedSubscript:", CFSTR("IDCMaxZoomScaleFactor")), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11));
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        }
        while (v9);
      }
      result = objc_msgSend(v6, "count");
      if (result)
      {
        v12 = v6;
        result = 0;
        *(_QWORD *)(v1 + 64) = v12;
      }
    }
  }
  return result;
}

- (void)dealloc
{
  opaqueCMFormatDescription *outputImageFormatDescription;
  objc_super v4;

  -[FigIntelligentDistortionCorrectionProcessor finishProcessing](self->_processor, "finishProcessing");
  -[BWIntelligentDistortionCorrectionProcessorController _resetProcessor]((uint64_t)self);

  outputImageFormatDescription = self->_outputImageFormatDescription;
  if (outputImageFormatDescription)
    CFRelease(outputImageFormatDescription);

  CVPixelBufferRelease(self->_intermediateDepthInputBuffer);
  CVPixelBufferRelease(self->_intermediateDepthOutputBuffer);
  v4.receiver = self;
  v4.super_class = (Class)BWIntelligentDistortionCorrectionProcessorController;
  -[BWStillImageProcessorController dealloc](&v4, sel_dealloc);
}

- (uint64_t)_resetProcessor
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 72), "setProcessIntelligentDistortionCorrection:", 0);
    objc_msgSend(*(id *)(v1 + 72), "setProcessGeometricDistortionCorrection:", 0);
    objc_msgSend(*(id *)(v1 + 72), "setApplyZoom:", 1);
    objc_msgSend(*(id *)(v1 + 72), "setApplyStereoRectificationHomography:", 0);
    objc_msgSend(*(id *)(v1 + 72), "setStereoRectificationInverseHomography:", *MEMORY[0x1E0C83FE8], *(double *)(MEMORY[0x1E0C83FE8] + 16), *(double *)(MEMORY[0x1E0C83FE8] + 32));
    objc_msgSend(*(id *)(v1 + 72), "setUseBilinearInterpolation:", 0);
    objc_msgSend(*(id *)(v1 + 72), "setGdcForwardPolynomial:", 0);
    objc_msgSend(*(id *)(v1 + 72), "setGdcInversePolynomial:", 0);
    objc_msgSend(*(id *)(v1 + 72), "setOpticalCenterOffset:", 0.0, 0.0);
    objc_msgSend(*(id *)(v1 + 72), "setUsePrecomputedPolynomialsAndOpticalCenterOffset:", 0);
    objc_msgSend(*(id *)(v1 + 72), "setInputImage:", 0);
    objc_msgSend(*(id *)(v1 + 72), "setInputImageMetadataDictionary:", 0);
    objc_msgSend(*(id *)(v1 + 72), "setLowResSegmentationMask:", 0);
    objc_msgSend(*(id *)(v1 + 72), "setFaceObservations:", 0);
    objc_msgSend(*(id *)(v1 + 72), "setDeviceWasStationaryDuringCapture:", 0);
    objc_msgSend(*(id *)(v1 + 72), "setInputImageCropRect:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    objc_msgSend(*(id *)(v1 + 72), "setOutputImage:", 0);
    objc_msgSend(*(id *)(v1 + 72), "setFinalImageDimensions:", 0);
    objc_msgSend(*(id *)(v1 + 72), "setReplicatePixelsOutsideOfFinalImageDimensions:", 0);
    return objc_msgSend(*(id *)(v1 + 72), "resetState");
  }
  return result;
}

- (unint64_t)type
{
  return 7;
}

- (void)inputReceivedNewInputData:(id)a3
{
  -[BWIntelligentDistortionCorrectionProcessorRequest input](self->_currentRequest, "input", a3);
  -[BWIntelligentDistortionCorrectionProcessorController _updateStateIfNeeded]((uint64_t)self);
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
    v2 = *(void **)(result + 112);
    v3 = objc_msgSend(*(id *)(result + 96), "currentState");
    if (v2)
    {
      if (v3 == 2)
      {
        v4 = 4;
      }
      else if (v3 == 4)
      {
        if (objc_msgSend((id)objc_msgSend(v2, "input"), "receivedAllInputs"))
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
    result = objc_msgSend(*(id *)(v1 + 96), "currentState");
    if ((_DWORD)v4 != (_DWORD)result)
      return objc_msgSend(*(id *)(v1 + 96), "transitionToState:", v4);
  }
  return result;
}

- (int)enqueueInputForProcessing:(id)a3 delegate:(id)a4
{
  _QWORD *v5;

  v5 = -[BWIntelligentDistortionCorrectionProcessorRequest initWithInput:delegate:]([BWIntelligentDistortionCorrectionProcessorRequest alloc], a3, a4);
  -[NSMutableArray addObject:](self->_requestQueue, "addObject:", v5);

  if (-[FigStateMachine currentState](self->_stateMachine, "currentState") == 1)
    -[FigStateMachine transitionToState:](self->_stateMachine, "transitionToState:", 2);
  return 0;
}

- (void)cancelProcessing
{
  -[NSMutableArray removeAllObjects](self->_requestQueue, "removeAllObjects");
  -[BWIntelligentDistortionCorrectionProcessorRequest setErr:](self->_currentRequest, "setErr:", 4294950490);
  -[BWIntelligentDistortionCorrectionProcessorController _serviceNextRequest]((uint64_t)self);
  -[BWIntelligentDistortionCorrectionProcessorController _resetProcessor]((uint64_t)self);
}

- (uint64_t)_serviceNextRequest
{
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend(*(id *)(result + 112), "delegate");
    v3 = (id)objc_msgSend(*(id *)(v1 + 112), "input");
    v4 = objc_msgSend(*(id *)(v1 + 112), "err");

    *(_QWORD *)(v1 + 112) = 0;
    objc_msgSend(v2, "processorController:didFinishProcessingInput:err:", v1, v3, v4);

    v5 = (id)objc_msgSend(*(id *)(v1 + 104), "firstObject");
    *(_QWORD *)(v1 + 112) = v5;
    if (v5)
    {
      objc_msgSend(*(id *)(v1 + 104), "removeObjectAtIndex:", 0);
      objc_msgSend((id)objc_msgSend(*(id *)(v1 + 112), "input"), "setDelegate:", v1);
    }
    return -[BWIntelligentDistortionCorrectionProcessorController _updateStateIfNeeded](v1);
  }
  return result;
}

+ (id)captureTypesWithIDCSupportWithOptionalCaptureFlags
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v3[0] = &unk_1E49FC918;
  v3[1] = &unk_1E49FC930;
  v4[0] = &unk_1E49FC900;
  v4[1] = &unk_1E49FC900;
  v3[2] = &unk_1E49FC948;
  v4[2] = &unk_1E49FC900;
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
}

- (uint64_t)_process
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  opaqueCMSampleBuffer *v4;
  void *v5;
  __CVBuffer *ImageBuffer;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t AttachedMedia;
  opaqueCMSampleBuffer *v17;
  uint64_t v18;
  __CVBuffer *v19;
  uint64_t v20;
  CFTypeRef v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  CGFloat v26;
  double FinalCropRect;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double ValidBufferRect;
  double v34;
  double v35;
  double v36;
  int v37;
  uint64_t v38;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v40;
  float v41;
  float v42;
  float v43;
  int v44;
  uint64_t v45;
  __CVBuffer *v46;
  __int16 v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  unint64_t v53;
  uint64_t v54;
  unsigned int Width;
  unsigned int Height;
  double v57;
  double v58;
  double v59;
  double v60;
  int v61;
  int v62;
  double x;
  double y;
  double v65;
  double v66;
  int v67;
  double v68;
  int v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  CGFloat v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  double v79;
  uint64_t j;
  void *v81;
  uint64_t v82;
  __CVBuffer *v83;
  CFTypeRef v84;
  int v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t k;
  unint64_t v91;
  unsigned int v92;
  NSObject *v93;
  unsigned int v94;
  unsigned int v95;
  int v96;
  uint64_t v97;
  const __CFString *v98;
  const __CFString *v99;
  uint64_t v100;
  double v101;
  double v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  double MidX;
  double MidY;
  double v109;
  CGFloat v110;
  double v111;
  BOOL v112;
  double v113;
  uint64_t v114;
  unsigned int v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  NSObject *v122;
  unsigned int v123;
  unsigned int v124;
  uint64_t v125;
  int v126;
  uint64_t v127;
  const __CFString *v128;
  const __CFString *v129;
  void *v130;
  void *v131;
  double v132;
  double v133;
  double v134;
  double v135;
  char v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  unint64_t v146;
  unsigned int v147;
  unint64_t v148;
  CGFloat v149;
  int v150;
  CMAttachmentBearerRef v151;
  __n128 v152;
  __n128 v153;
  __n128 v154;
  const void *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  float v159;
  float v160;
  float v161;
  float v162;
  float v163;
  float v164;
  uint64_t v165;
  void *v166;
  int v167;
  __CVBuffer *v168;
  __CVBuffer *v169;
  unint64_t v170;
  unsigned int v171;
  __CVBuffer *v172;
  const void *v173;
  void *v174;
  unint64_t v175;
  double v176;
  double v177;
  double v178;
  double v179;
  unint64_t v180;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  int v192;
  int v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  double v202;
  double v203;
  double v204;
  double v205;
  double v206;
  double v207;
  double v208;
  double v209;
  double TotalSensorCropRect;
  double v211;
  double v212;
  double v213;
  double v214;
  double v215;
  double v216;
  double v217;
  double v218;
  double v219;
  float v220;
  double v221;
  double v222;
  float v223;
  float v224;
  unsigned int v225;
  const char *v226;
  const void *v227;
  void *v228;
  double v229;
  double v230;
  double v231;
  double v232;
  double v233;
  double v234;
  double v235;
  double v236;
  double v237;
  double v238;
  double v239;
  double v240;
  double v241;
  double v242;
  double v243;
  uint64_t v244;
  uint64_t v245;
  double v246;
  double v247;
  double v248;
  CGFloat v249;
  CGFloat v250;
  CGFloat v251;
  CGFloat v252;
  double v253;
  CGFloat v254;
  CGFloat v255;
  CGFloat v256;
  CGFloat v257;
  CGFloat v258;
  CGFloat v259;
  CGFloat v260;
  unint64_t v261;
  CGFloat v262;
  double v263;
  double v264;
  double v265;
  double v266;
  double v267;
  double v268;
  double v269;
  double v270;
  _BYTE *v271;
  const __CFString *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  unsigned int v276;
  int v277;
  void *v278;
  __CVBuffer *v279;
  void *v280;
  unsigned int v281;
  uint64_t v282;
  float v283;
  float v284;
  float v285;
  float v286;
  double v287;
  double v288;
  double v289;
  double v290;
  double v291;
  double v292;
  void *v293;
  double v294;
  double v295;
  double v296;
  double v297;
  float v298;
  double v299;
  float v300;
  double v301;
  CGFloat v302;
  char v303;
  uint64_t v304;
  double r2;
  uint64_t r2a;
  const __CFString *r2_8;
  void *r2_16;
  void *r2_24;
  __int16 rect;
  double recta;
  __CVBuffer *v312;
  double v313;
  uint64_t v314;
  double v315;
  double v316;
  double v317;
  double v318;
  double v319;
  double v320;
  CGFloat v321;
  double v322;
  CGFloat v323;
  double v324;
  uint64_t v325;
  int v326;
  CGFloat v327;
  CGFloat v328;
  unsigned int v329;
  uint64_t v330;
  double v331;
  double v332;
  _BOOL4 v333;
  double v334;
  void *v335;
  double v336;
  void *v337;
  unsigned int v338;
  double v339;
  int v340;
  double v341;
  CGFloat v342;
  opaqueCMSampleBuffer *v343;
  double v344;
  CGFloat v345;
  void *rect2;
  unsigned int rect2a;
  double rect2b;
  CGFloat rect2d;
  double rect2c;
  uint64_t v351;
  uint64_t v352;
  id v353;
  unint64_t v354;
  double v355;
  void *v356;
  id obj;
  __int128 v358;
  __int128 v359;
  __int128 v360;
  __int128 v361;
  __int128 v362;
  __int128 v363;
  __int128 v364;
  __int128 v365;
  __int128 v366;
  __int128 v367;
  __int128 v368;
  __int128 v369;
  os_log_type_t type;
  unsigned int v371;
  __int128 v372;
  __int128 v373;
  __int128 v374;
  __int128 v375;
  CMAttachmentBearerRef target;
  _BYTE v377[128];
  _BYTE v378[12];
  __int16 v379;
  _BYTE v380[10];
  _BYTE v381[6];
  _BYTE v382[6];
  _BYTE v383[6];
  _BYTE v384[10];
  __int128 v385;
  _BYTE v386[10];
  __int16 v387;
  _BYTE v388[10];
  _BYTE v389[10];
  __int16 v390;
  int v391;
  __int16 v392;
  unsigned int v393;
  _BYTE v394[128];
  _BYTE v395[128];
  CFTypeRef cf[16];
  uint64_t v397;
  uint64_t v398;
  _BYTE v399[128];
  uint64_t v400;
  CGRect v401;
  CGRect v402;
  CGRect v403;
  CGRect v404;
  CGRect v405;
  CGRect v406;
  CGRect v407;
  CGRect v408;
  CGRect v409;
  CGRect v410;
  CGRect v411;
  CGRect v412;
  CGRect v413;
  CGRect v414;
  CGRect v415;
  CGRect v416;

  v400 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v2 = result;
  v3 = (void *)objc_msgSend(*(id *)(result + 112), "input");
  rect2 = (void *)objc_msgSend(v3, "settings");
  target = 0;
  v356 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  obj = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  r2_24 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  r2_16 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (opaqueCMSampleBuffer *)objc_msgSend(v3, "image");
  v5 = v4;
  v351 = v2;
  if (!v4)
  {
    v278 = 0;
    v46 = 0;
    v147 = -10000;
    v276 = 0;
    v277 = 0x7FFFFFFF;
    v45 = 4294954516;
LABEL_200:
    v104 = 0x7FFFFFFFLL;
    v115 = 0x7FFFFFFF;
LABEL_178:
    CMSetAttachment(v5, CFSTR("IntelligentDistortionCorrectionMakernoteEntry"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v276, v271, v274), 1u);
    if (v115 == 0x7FFFFFFF)
      v245 = v147;
    else
      v245 = v115;
    CMSetAttachment(v5, CFSTR("IntelligentDistortionCorrectionStatusCode"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v245), 1u);
    if ((_DWORD)v104 != 0x7FFFFFFF)
      CMSetAttachment(v5, CFSTR("IntelligentDistortionCorrectionGainMapProcessingStatusCode"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v104), 1u);
    if (v277 != 0x7FFFFFFF)
      CMSetAttachment(v5, CFSTR("IntelligentDistortionCorrectionCorrectionType"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), 1u);
    v2 = v351;
    goto LABEL_186;
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(v4);
  if (!ImageBuffer)
  {
    v45 = 0;
    v278 = 0;
    v46 = 0;
    v147 = -10000;
    v276 = 0;
    v277 = 0x7FFFFFFF;
    goto LABEL_200;
  }
  v312 = ImageBuffer;
  v7 = psn_pixelBufferDimensions(ImageBuffer);
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  objc_msgSend(v8, "addObject:");
  v303 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "stillImageSettings"), "captureSettings"), "captureFlags");
  if ((v303 & 4) != 0)
    objc_msgSend(v8, "addObject:", 0x1E495B0F8);
  if (objc_msgSend(*(id *)(v2 + 56), "depthDataCorrectionEnabled"))
  {
    objc_msgSend(v8, "addObject:", CFSTR("Depth"));
    v9 = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 56), "providedInferenceAttachedMediaByMode"), "objectForKeyedSubscript:", &unk_1E49FC960);
    if (v9)
      objc_msgSend(v8, "addObjectsFromArray:", v9);
  }
  objc_msgSend(v8, "addObject:");
  v10 = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 56), "providedInferenceAttachedMediaByMode"), "objectForKeyedSubscript:", &unk_1E49FC978);
  if (v10)
    objc_msgSend(v8, "addObjectsFromArray:", v10);
  v352 = v7;
  if (objc_msgSend(rect2, "constantColorEnabled"))
    objc_msgSend(v8, "addObject:", 0x1E495B438);
  v280 = v3;
  v337 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v2 + 112), "delegate"), "processorController:newInferencesForProcessorInput:", v2, v3);
  v372 = 0u;
  v373 = 0u;
  v374 = 0u;
  v375 = 0u;
  v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v372, v399, 16);
  v343 = (opaqueCMSampleBuffer *)v5;
  v353 = v8;
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v373;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v373 != v13)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v372 + 1) + 8 * i);
        AttachedMedia = BWSampleBufferGetAttachedMedia(v5, (uint64_t)v15);
        if (AttachedMedia)
        {
          v17 = (opaqueCMSampleBuffer *)AttachedMedia;
          objc_msgSend(v356, "setObject:forKeyedSubscript:", AttachedMedia, v15);
LABEL_30:
          objc_msgSend(obj, "setObject:forKeyedSubscript:", CMSampleBufferGetImageBuffer(v17), v15);
          continue;
        }
        v18 = objc_msgSend(v337, "inferenceBufferForAttachedMediaKey:", v15);
        if (v18)
        {
          v19 = (__CVBuffer *)v18;
          v20 = objc_msgSend(v337, "metadataForAttachedMediaKey:", v15);
          cf[0] = 0;
          v21 = (CFTypeRef)objc_msgSend(*(id *)(v2 + 88), "objectForKeyedSubscript:", v15);
          if (v21)
            v21 = CFRetain(v21);
          cf[0] = v21;
          v22 = BWMetadataAttachmentKeyForAttachedMediaKey(v15);
          v23 = objc_msgSend((id)objc_msgSend(v337, "inferenceAttachedMediaMetadata"), "objectForKeyedSubscript:", v15);
          v24 = 0;
          if (v22 && v23)
          {
            v397 = v22;
            v398 = v23;
            v24 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v398, &v397, 1, 0);
          }
          v5 = v343;
          BWSampleBufferSetAttachedMediaFromPixelBuffer(v343, (uint64_t)v15, v19, cf, v20, v24, 1);
          objc_msgSend(*(id *)(v2 + 88), "setObject:forKeyedSubscript:", cf[0], v15);
          if (cf[0])
            CFRelease(cf[0]);
          v8 = v353;
        }
        v17 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v5, (uint64_t)v15);
        objc_msgSend(v356, "setObject:forKeyedSubscript:", v17, v15);
        if (v17)
          goto LABEL_30;
      }
      v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v372, v399, 16);
    }
    while (v12);
  }
  r2_8 = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v25 = (void *)CMGetAttachment(v5, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v282 = objc_msgSend((id)objc_msgSend(rect2, "bravoConstituentImageDeliveryDeviceTypes"), "count");
  if (v282)
  {
    v26 = 1.0;
    FinalCropRect = 0.0;
    v28 = 0.0;
    v29 = 1.0;
  }
  else
  {
    FinalCropRect = FigCaptureMetadataUtilitiesGetFinalCropRect();
    v28 = v30;
    v26 = v31;
    v29 = v32;
  }
  ValidBufferRect = FigCaptureMetadataUtilitiesGetValidBufferRect();
  v316 = v34;
  v291 = v36;
  v292 = v35;
  v281 = objc_msgSend(v3, "processGeometricDistortionCorrection");
  v37 = objc_msgSend(v3, "processIntelligentDistortionCorrection");
  v329 = objc_msgSend(*(id *)(v2 + 56), "depthDataCorrectionEnabled");
  v38 = objc_msgSend(v337, "inferenceBufferForAttachedMediaKey:", 0x1E49511B8);
  v335 = (void *)objc_msgSend(v337, "inferenceForAttachmentKey:", 0x1E4951058);
  v314 = v38;
  if (!v37)
  {
    v333 = 0;
    goto LABEL_49;
  }
  if (!v38)
  {
    v371 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!v335)
  {
    v371 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v40 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(*(id *)(v2 + 64), "objectForKeyedSubscript:", objc_msgSend(v3, "portType", v271, v274)), "floatValue");
  v42 = v41;
  if (v41 <= 1.0)
  {
    v333 = 1;
    goto LABEL_49;
  }
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "captureSettings"), "metadata"), "totalZoomFactor");
  v333 = v43 < v42;
  if (v43 < v42)
    v44 = 1;
  else
    v44 = v281;
  if (v44 == 1)
  {
LABEL_49:
    v47 = objc_msgSend((id)objc_msgSend(v3, "captureSettings"), "sceneFlags");
    v48 = *MEMORY[0x1E0D05F18];
    if (objc_msgSend((id)objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0D05F18]), "intValue"))
      v49 = v281;
    else
      v49 = 0;
    if ((v49 & 1) != 0)
    {
      v276 = 0;
      v278 = 0;
      v46 = 0;
    }
    else
    {
      v275 = v48;
      v293 = v25;
      if (objc_msgSend(v3, "imageBufferType") == 38)
        v50 = 38;
      else
        v50 = 1;
      v46 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(v2 + 112), "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:", v2, v3, v50);
      if (!v46)
      {
        v276 = 0;
        v278 = 0;
        v147 = -10001;
LABEL_211:
        v277 = 0x7FFFFFFF;
        v104 = 0x7FFFFFFFLL;
        v115 = 0x7FFFFFFF;
LABEL_212:

        v45 = 0;
        goto LABEL_178;
      }
      if (!BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)v5, v46, (CFTypeRef *)(v2 + 80), (CMSampleBufferRef *)&target))
      {
        v278 = (void *)objc_msgSend(v25, "mutableCopy");
        CMSetAttachment(target, r2_8, v278, 1u);
        psn_pixelBufferDimensions(v46);
        v51 = objc_msgSend(v3, "imageBufferType");
        v52 = *(void **)(v2 + 56);
        rect = v47;
        if (v51 == 38)
        {
          v53 = objc_msgSend(v52, "stereoPhotoOutputDimensions");
          v54 = HIDWORD(v53);
        }
        else if (objc_msgSend(v52, "intelligentDistortionCorrectionAppliesFinalDimensions"))
        {
          LODWORD(v53) = objc_msgSend(rect2, "outputWidth");
          v54 = objc_msgSend(rect2, "outputHeight");
          if (CVPixelBufferGetWidth(v46) < (int)v53 || CVPixelBufferGetHeight(v46) < (int)v54)
          {
LABEL_209:
            v276 = 0;
            goto LABEL_210;
          }
        }
        else
        {
          Width = CVPixelBufferGetWidth(v46);
          Height = CVPixelBufferGetHeight(v46);
          FigCaptureMakeRectWithAspectRatioInsideDimensions(Width | ((unint64_t)Height << 32), 1, (float)objc_msgSend(rect2, "outputWidth")/ (float)objc_msgSend(rect2, "outputHeight"));
          LODWORD(v53) = (int)v57;
          v54 = (int)v58;
        }
        v59 = (double)objc_msgSend(rect2, "outputWidth");
        v60 = v59 / (double)objc_msgSend(rect2, "outputHeight");
        r2 = ValidBufferRect;
        if (FigCaptureVideoDimensionsAreValid(objc_msgSend(*(id *)(v2 + 56), "geometricDistortionCorrectionExpandedImageDimensions")))
        {
          v61 = objc_msgSend(*(id *)(v2 + 56), "geometricDistortionCorrectionExpandedImageDimensions");
          v62 = (unint64_t)objc_msgSend(*(id *)(v2 + 56), "geometricDistortionCorrectionExpandedImageDimensions") >> 32;
          FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect(objc_msgSend(*(id *)(v2 + 56), "geometricDistortionCorrectionExpandedImageDimensions"), (unint64_t)objc_msgSend(*(id *)(v2 + 56), "geometricDistortionCorrectionExpandedImageDimensions") >> 32, FinalCropRect, v28, v26, v29, v60);
          x = v401.origin.x;
          y = v401.origin.y;
          v65 = v401.size.width;
          v66 = v401.size.height;
          if (!CGRectIsNull(v401))
          {
            v67 = v352 - v61;
            if ((int)v352 < v61)
              ++v67;
            v68 = (double)(v67 >> 1);
            v69 = HIDWORD(v352) - v62;
            if (SHIDWORD(v352) < v62)
              ++v69;
            v70 = x + v68;
            v71 = y + (double)(v69 >> 1);
            if (!v281
              || (objc_msgSend(*(id *)(v2 + 56), "geometricDistortionCorrectionInputCropOffset"),
                  v73 == *MEMORY[0x1E0C9D538])
              && v72 == *(double *)(MEMORY[0x1E0C9D538] + 8))
            {
              v74 = v65;
            }
            else
            {
              objc_msgSend(*(id *)(v2 + 56), "geometricDistortionCorrectionInputCropOffset");
              v247 = v70 + v246;
              objc_msgSend(*(id *)(v2 + 56), "geometricDistortionCorrectionInputCropOffset");
              rect2c = v71 + v248;
              v321 = v65;
              FigCaptureMetadataUtilitiesNormalizeCropRect(v247, v71 + v248, v65, v66);
              v253 = FigCaptureMetadataUtilitiesNormalizedRectEnforcedWithinValidRegionAfterGDC(objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v2 + 56), "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", objc_msgSend(v3, "portType")), "cameraInfo"), v25, v352, v249, v250, v251, v252);
              FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect((int)v352, v352 >> 32, v253, v254, v255, v256, v60);
              v257 = v410.origin.x;
              v258 = v410.origin.y;
              v259 = v410.size.width;
              v260 = v410.size.height;
              if (CGRectIsNull(v410))
              {
                v70 = v247;
                v71 = rect2c;
                v74 = v321;
              }
              else
              {
                v411.origin.x = v257;
                v411.origin.y = v258;
                v411.size.width = v259;
                v411.size.height = v260;
                v70 = v247;
                v415.origin.x = v247;
                v415.origin.y = rect2c;
                v71 = rect2c;
                v74 = v321;
                v415.size.width = v321;
                v415.size.height = v66;
                if (!CGRectEqualToRect(v411, v415))
                {
                  v66 = v260;
                  v74 = v259;
                  v71 = v258;
                  v70 = v257;
                }
              }
            }
            goto LABEL_77;
          }
          v274 = v1;
          LODWORD(v271) = 0;
        }
        else
        {
          FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect((int)v352, v352 >> 32, FinalCropRect, v28, v26, v29, v60);
          v70 = v402.origin.x;
          v75 = v402.origin.y;
          v74 = v402.size.width;
          v66 = v402.size.height;
          if (!CGRectIsNull(v402))
          {
            v71 = v75;
LABEL_77:
            v338 = v53;
            v279 = v46;
            v368 = 0u;
            v369 = 0u;
            v366 = 0u;
            v367 = 0u;
            v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v366, v395, 16);
            v325 = v54;
            if (v76)
            {
              v77 = v76;
              v78 = *(_QWORD *)v367;
              rect2a = 0x7FFFFFFF;
              v79 = v71;
              do
              {
                for (j = 0; j != v77; ++j)
                {
                  if (*(_QWORD *)v367 != v78)
                    objc_enumerationMutation(obj);
                  v81 = *(void **)(*((_QWORD *)&v366 + 1) + 8 * j);
                  if ((objc_msgSend(v81, "isEqualToString:", CFSTR("Depth")) & 1) == 0)
                  {
                    cf[0] = 0;
                    v82 = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 112), "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:attachedMediaKey:", v2, v3, BWStillImageBufferTypeForAttachedMediaKey(v81), v81);
                    if (v82)
                    {
                      v83 = (__CVBuffer *)v82;
                      *(_QWORD *)v378 = 0;
                      v84 = (CFTypeRef)objc_msgSend(*(id *)(v2 + 88), "objectForKeyedSubscript:", v81);
                      if (v84)
                        v84 = CFRetain(v84);
                      *(_QWORD *)v378 = v84;
                      if (!BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)objc_msgSend(v356, "objectForKeyedSubscript:", v81), v83, (CFTypeRef *)v378, (CMSampleBufferRef *)cf))
                      {
                        BWCMSampleBufferCopyReattachAndReturnMutableMetadata(cf[0]);
                        objc_msgSend(*(id *)(v2 + 88), "setObject:forKeyedSubscript:", *(_QWORD *)v378, v81);
                        objc_msgSend(r2_24, "setObject:forKeyedSubscript:", cf[0], v81);
                        objc_msgSend(r2_16, "setObject:forKeyedSubscript:", v83, v81);
                        if (cf[0])
                          CFRelease(cf[0]);
                      }
                      CVPixelBufferRelease(v83);
                      if (*(_QWORD *)v378)
                        CFRelease(*(CFTypeRef *)v378);
                    }
                    if (!cf[0])
                    {
                      if (objc_msgSend(v81, "isEqualToString:", 0x1E4936818))
                        v85 = -10001;
                      else
                        v85 = rect2a;
                      rect2a = v85;
                    }
                  }
                }
                v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v366, v395, 16);
              }
              while (v77);
            }
            else
            {
              rect2a = 0x7FFFFFFF;
              v79 = v71;
            }
            v86 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
            v362 = 0u;
            v363 = 0u;
            v364 = 0u;
            v365 = 0u;
            v87 = objc_msgSend(v353, "countByEnumeratingWithState:objects:count:", &v362, v394, 16);
            if (v87)
            {
              v88 = v87;
              v89 = *(_QWORD *)v363;
              do
              {
                for (k = 0; k != v88; ++k)
                {
                  if (*(_QWORD *)v363 != v89)
                    objc_enumerationMutation(v353);
                  objc_msgSend(v86, "appendFormat:", CFSTR("%@:%d,"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v362 + 1) + 8 * k), "stringByReplacingOccurrencesOfString:withString:", CFSTR("PersonSemantics"), &stru_1E4928818), "stringByReplacingOccurrencesOfString:withString:", CFSTR("LowResPerson"), &stru_1E4928818), "lowercaseString"), objc_msgSend(obj, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v362 + 1) + 8 * k)) != 0);
                }
                v88 = objc_msgSend(v353, "countByEnumeratingWithState:objects:count:", &v362, v394, 16);
              }
              while (v88);
            }
            v91 = rect & 0x2000;
            v92 = v338;
            v5 = v343;
            v354 = v91;
            if (dword_1ECFE9AD0)
            {
              v371 = 0;
              type = OS_LOG_TYPE_DEFAULT;
              v93 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              v94 = v371;
              if (os_log_type_enabled(v93, type))
                v95 = v94;
              else
                v95 = v94 & 0xFFFFFFFE;
              if (v95)
              {
                v96 = objc_msgSend(v3, "applyZoom");
                v97 = objc_msgSend(v335, "count");
                v98 = BWStringFromCGRect(v70, v79, v74, v66);
                v99 = BWStringFromCGRect(r2, v316, v292, v291);
                *(_DWORD *)v378 = 136318722;
                *(_QWORD *)&v378[4] = "-[BWIntelligentDistortionCorrectionProcessorController _process]";
                v379 = 1026;
                *(_DWORD *)v380 = v281;
                *(_WORD *)&v380[4] = 1026;
                *(_DWORD *)&v380[6] = v333;
                *(_WORD *)v381 = 1026;
                *(_DWORD *)&v381[2] = v96;
                *(_WORD *)v382 = 1026;
                *(_DWORD *)&v382[2] = 1;
                *(_WORD *)v383 = 1026;
                *(_DWORD *)&v383[2] = v314 != 0;
                *(_WORD *)v384 = 2114;
                *(_QWORD *)&v384[2] = v86;
                LOWORD(v385) = 2050;
                *(_QWORD *)((char *)&v385 + 2) = v97;
                WORD5(v385) = 1026;
                HIDWORD(v385) = v91 >> 13;
                v91 = rect & 0x2000;
                *(_WORD *)v386 = 2114;
                *(_QWORD *)&v386[2] = v98;
                v5 = v343;
                v387 = 2114;
                *(_QWORD *)v388 = v99;
                *(_WORD *)&v388[8] = 1026;
                *(_DWORD *)v389 = 1;
                *(_WORD *)&v389[4] = 1026;
                *(_DWORD *)&v389[6] = v338;
                v390 = 1026;
                v391 = v325;
                v392 = 1026;
                v393 = v329;
                LODWORD(v274) = 112;
                v271 = v378;
                _os_log_send_and_compose_impl();
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              v92 = v338;
            }
            v100 = v351;
            v319 = v74;
            v322 = v66;
            if ((objc_msgSend(v3, "applyZoom", v271, v274) & 1) != 0)
            {
              v297 = 0.0;
              v101 = v74;
              v102 = v66;
              v296 = 0.0;
              v299 = 0.5;
              v301 = 0.5;
              v103 = v352;
              v104 = rect2a;
              v105 = v314;
              v106 = v325;
            }
            else
            {
              v403.origin.x = v70;
              v403.origin.y = v79;
              v403.size.width = v74;
              v403.size.height = v66;
              MidX = CGRectGetMidX(v403);
              v404.origin.x = v70;
              v404.origin.y = v79;
              v404.size.width = v74;
              v404.size.height = v66;
              MidY = CGRectGetMidY(v404);
              v109 = 0.5;
              v339 = MidX;
              v110 = MidX - (double)SLODWORD(MidX) * 0.5;
              v405.origin.x = v110;
              v405.origin.y = MidY - (double)(int)v325 * 0.5;
              v405.size.width = (double)SLODWORD(MidX);
              v405.size.height = (double)(int)v325;
              v413.origin.y = v316;
              v413.origin.x = r2;
              v413.size.height = v291;
              v413.size.width = v292;
              CGRectIntersection(v405, v413);
              FigCaptureMetadataUtilitiesRoundRectToEvenCoordinates();
              v101 = v406.size.width;
              v111 = v406.origin.y;
              v414.origin.x = v110;
              v414.origin.y = MidY - (double)(int)v325 * 0.5;
              v414.size.width = (double)SLODWORD(v339);
              v102 = v406.size.height;
              v414.size.height = (double)(int)v325;
              v70 = v406.origin.x;
              v112 = CGRectEqualToRect(v406, v414);
              v113 = 0.5;
              v103 = v352;
              v104 = rect2a;
              v105 = v314;
              if (!v112)
                v109 = FigCaptureTransformPointToCoordinateSpaceOfRect(v339, MidY, v70, v111, v101);
              v299 = v113;
              v301 = v109;
              v92 = (int)v101;
              v106 = (int)v102;
              v296 = v102 / v322;
              v297 = v101 / v74;
              v319 = v101;
              v322 = v102;
              v79 = v111;
            }
            objc_msgSend(*(id *)(v351 + 72), "setProcessIntelligentDistortionCorrection:", v333);
            objc_msgSend(*(id *)(v351 + 72), "setProcessGeometricDistortionCorrection:", v281);
            objc_msgSend(*(id *)(v351 + 72), "setApplyZoom:", 1);
            objc_msgSend(*(id *)(v351 + 72), "setApplyStereoRectificationHomography:", objc_msgSend(v3, "applyStereoRectificationHomography"));
            objc_msgSend(v3, "stereoRectificationInverseHomography");
            objc_msgSend(*(id *)(v351 + 72), "setStereoRectificationInverseHomography:");
            objc_msgSend(*(id *)(v351 + 72), "setUseBilinearInterpolation:", objc_msgSend(v3, "useBilinearInterpolation"));
            objc_msgSend(*(id *)(v351 + 72), "setGdcForwardPolynomial:", objc_msgSend(v3, "geometricDistortionCorrectionForwardPolynomial"));
            objc_msgSend(*(id *)(v351 + 72), "setGdcInversePolynomial:", objc_msgSend(v3, "geometricDistortionCorrectionInversePolynomial"));
            objc_msgSend(v3, "geometricDistortionCorrectionOpticalCenterOffset");
            objc_msgSend(*(id *)(v351 + 72), "setOpticalCenterOffset:");
            objc_msgSend(*(id *)(v351 + 72), "setUsePrecomputedPolynomialsAndOpticalCenterOffset:", objc_msgSend(v3, "geometricDistortionCorrectionUsePrecomputedPolynomialsAndOpticalCenterOffset"));
            objc_msgSend(*(id *)(v351 + 72), "setInputImage:", v312);
            objc_msgSend(*(id *)(v351 + 72), "setInputImageMetadataDictionary:", v293);
            objc_msgSend(*(id *)(v351 + 72), "setLowResSegmentationMask:", v105);
            objc_msgSend(*(id *)(v351 + 72), "setFaceObservations:", v335);
            objc_msgSend(*(id *)(v351 + 72), "setDeviceWasStationaryDuringCapture:", v91 != 0);
            objc_msgSend(*(id *)(v351 + 72), "setInputImageCropRect:", v70, v79, v101, v102);
            objc_msgSend(*(id *)(v351 + 72), "setOutputImage:", v279);
            v340 = v92;
            v326 = v106;
            v114 = v92 | (unint64_t)(v106 << 32);
            objc_msgSend(*(id *)(v351 + 72), "setFinalImageDimensions:", v114);
            objc_msgSend(*(id *)(v351 + 72), "setReplicatePixelsOutsideOfFinalImageDimensions:", v329);
            v115 = objc_msgSend(*(id *)(v351 + 72), "process");
            objc_msgSend(*(id *)(v351 + 72), "outputValidBufferRect");
            v313 = v117;
            v315 = v116;
            v119 = v118;
            v121 = v120;
            v276 = objc_msgSend(*(id *)(v351 + 72), "makernoteEntry");
            v277 = objc_msgSend(*(id *)(v351 + 72), "correctionType");
            v302 = v101;
            if (dword_1ECFE9AD0)
            {
              v330 = v114;
              v371 = 0;
              type = OS_LOG_TYPE_DEFAULT;
              v122 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              v123 = v371;
              if (os_log_type_enabled(v122, type))
                v124 = v123;
              else
                v124 = v123 & 0xFFFFFFFE;
              if (v124)
              {
                v125 = objc_msgSend((id)objc_msgSend(v3, "captureSettings"), "settingsID");
                v126 = objc_msgSend(v3, "applyZoom");
                v127 = objc_msgSend(v335, "count");
                v128 = BWStringFromCGRect(v70, v79, v101, v102);
                v407.origin.x = v315;
                v407.origin.y = v313;
                v407.size.width = v119;
                v407.size.height = v121;
                if (CGRectIsNull(v407))
                {
                  v129 = &stru_1E4928818;
                }
                else
                {
                  v130 = (void *)MEMORY[0x1E0CB3940];
                  v272 = BWStringFromCGRect(v315, v313, v119, v121);
                  v131 = v130;
                  v3 = v280;
                  v129 = (const __CFString *)objc_msgSend(v131, "stringWithFormat:", CFSTR("outputROI:%@"), v272);
                }
                *(_DWORD *)v378 = 136318466;
                *(_QWORD *)&v378[4] = "-[BWIntelligentDistortionCorrectionProcessorController _process]";
                v379 = 2048;
                *(_QWORD *)v380 = v125;
                *(_WORD *)&v380[8] = 1024;
                *(_DWORD *)v381 = v333;
                *(_WORD *)&v381[4] = 1024;
                *(_DWORD *)v382 = v281;
                *(_WORD *)&v382[4] = 1024;
                *(_DWORD *)v383 = v126;
                *(_WORD *)&v383[4] = 2048;
                *(_QWORD *)v384 = v127;
                *(_WORD *)&v384[8] = 1024;
                LODWORD(v385) = v354 >> 13;
                WORD2(v385) = 2112;
                *(_QWORD *)((char *)&v385 + 6) = v128;
                HIWORD(v385) = 1024;
                *(_DWORD *)v386 = v340;
                *(_WORD *)&v386[4] = 1024;
                *(_DWORD *)&v386[6] = v326;
                v387 = 1024;
                *(_DWORD *)v388 = v115;
                *(_WORD *)&v388[4] = 1024;
                *(_DWORD *)&v388[6] = v276;
                *(_WORD *)v389 = 2112;
                *(_QWORD *)&v389[2] = v129;
                v390 = 1024;
                v391 = v277;
                LODWORD(v274) = 106;
                v271 = v378;
                _os_log_send_and_compose_impl();
                v103 = v352;
                v5 = v343;
                v104 = rect2a;
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              v100 = v351;
              v114 = v330;
            }
            if (v115)
            {
              v147 = -10000;
            }
            else
            {
              v355 = v102;
              FigCaptureMetadataUtilitiesNormalizeCropRect(v70, v79, v101, v102);
              v334 = v133;
              v336 = v132;
              v331 = v135;
              v332 = v134;
              v408.origin.x = v315;
              v408.origin.y = v313;
              v408.size.width = v119;
              v408.size.height = v121;
              if (CGRectIsNull(v408))
              {
                v136 = v303;
                v137 = v119;
                recta = v121;
                v138 = v322;
                goto LABEL_143;
              }
              FigCaptureMetadataUtilitiesRoundRectToMultipleOf();
              v313 = v139;
              v315 = v141;
              v143 = v142;
              v138 = v322;
              recta = v140;
              if (v282)
              {
                v144 = v139;
                v145 = v140;
                v146 = psn_pixelBufferDimensions(v279);
                FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v278, v103, v146, v70, v79, v302, v355, v315, v144, v143, v145);
LABEL_142:
                v136 = v303;
                v137 = v143;
LABEL_143:
                v150 = objc_msgSend((id)objc_msgSend(v3, "processingSettings", v271, v274), "provideDemosaicedRaw");
                if ((v136 & 4) == 0 && (v150 & v281) != 0)
                {
                  v151 = target;
                  objc_msgSend((id)objc_msgSend(v3, "settings"), "settingsID");
                  -[BWIntelligentDistortionCorrectionProcessorController _getAndAttachGDCInformationToDemosaicedRawSampleBuffer:inputDimensions:finalImageDimensions:settingsID:](v100, v151, v103, v114);
                }
                BWSampleBufferRemoveAttachedMedia(target, 0x1E4936818);
                if (objc_msgSend(*(id *)(v100 + 72), "globalTransformIsValid"))
                {
                  if (CMGetAttachment(target, CFSTR("StillImageProcessingHomography"), 0))
                    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("BWIntelligentDistortionCorrectionProcessorController does not support merging StillImageProcessingHomography -- this support must be implemented!"), 0));
                  objc_msgSend(*(id *)(v100 + 72), "globalTransform");
                  v155 = (const void *)BWRowMajorArrayFrom3x3Matrix(v152, v153, v154);
                  CMSetAttachment(target, CFSTR("StillImageProcessingHomography"), v155, 1u);
                }
                v360 = 0u;
                v361 = 0u;
                v358 = 0u;
                v359 = 0u;
                v156 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v358, v377, 16);
                if (v156)
                {
                  v157 = v156;
                  v289 = *(double *)(MEMORY[0x1E0C9D628] + 8);
                  v290 = *MEMORY[0x1E0C9D628];
                  v287 = *(double *)(MEMORY[0x1E0C9D628] + 24);
                  v288 = *(double *)(MEMORY[0x1E0C9D628] + 16);
                  v158 = *(_QWORD *)v359;
                  v159 = v137 / v319;
                  v300 = v159;
                  v160 = recta / v138;
                  v298 = v160;
                  v161 = v292 / (double)(int)v103;
                  v162 = v291 / (double)SHIDWORD(v352);
                  v285 = v162;
                  v286 = v161;
                  v163 = r2;
                  v164 = v316;
                  v283 = v164;
                  v284 = v163;
                  v294 = v137;
                  v304 = *(_QWORD *)v359;
                  do
                  {
                    v165 = 0;
                    r2a = v157;
                    do
                    {
                      if (*(_QWORD *)v359 != v158)
                        objc_enumerationMutation(obj);
                      v166 = *(void **)(*((_QWORD *)&v358 + 1) + 8 * v165);
                      v167 = objc_msgSend(v166, "isEqualToString:", CFSTR("Depth"));
                      v168 = (__CVBuffer *)objc_msgSend(obj, "objectForKeyedSubscript:", v166);
                      v169 = v168;
                      if (v167)
                      {
                        v170 = psn_pixelBufferDimensions(v168);
                        if (-[BWIntelligentDistortionCorrectionProcessorController _applyExistingCorrectionToDepthPixelBuffer:primaryImageDimensions:](v351, v169, v103))
                        {
                          BWSampleBufferRemoveAttachedMedia(target, (uint64_t)v166);
                        }
                        else if (objc_msgSend(*(id *)(v351 + 72), "zoomWasApplied"))
                        {
                          v409.origin.y = v313;
                          v409.origin.x = v315;
                          v409.size.width = v137;
                          v409.size.height = recta;
                          if (!CGRectIsNull(v409) && !v282)
                          {
                            v227 = (const void *)BWSampleBufferGetAttachedMedia(target, (uint64_t)CFSTR("Depth"));
                            v228 = (void *)CMGetAttachment(v227, r2_8, 0);
                            FigCaptureMetadataUtilitiesDenormalizeCropRect(v336, v334, v332, v331);
                            v345 = v230;
                            rect2d = v229;
                            v342 = v231;
                            v328 = v232;
                            FigCaptureMetadataUtilitiesNormalizeCropRect(v315, v313, v294, recta);
                            FigCaptureMetadataUtilitiesDenormalizeCropRect(v233, v234, v235, v236);
                            v324 = v237;
                            v239 = v238;
                            v241 = v240;
                            v243 = v242;
                            FigCFDictionarySetCGRect();
                            FigCFDictionarySetCGRect();
                            FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v228, v170, v170, rect2d, v345, v342, v328, v324, v239, v241, v243);
                            v137 = v294;
                            FigCFDictionarySetCGRect();
                          }
                        }
                      }
                      else
                      {
                        v171 = v104;
                        v172 = (__CVBuffer *)objc_msgSend(r2_16, "objectForKeyedSubscript:", v166);
                        v173 = (const void *)objc_msgSend(r2_24, "objectForKeyedSubscript:", v166);
                        v174 = (void *)CMGetAttachment(v173, r2_8, 0);
                        v175 = psn_pixelBufferDimensions(v169);
                        FigCaptureMetadataUtilitiesDenormalizeCropRect(v336, v334, v332, v331);
                        v323 = v177;
                        v327 = v176;
                        v344 = v179;
                        rect2b = v178;
                        v180 = psn_pixelBufferDimensions(v172);
                        FigCaptureMetadataUtilitiesNormalizeCropRect(v315, v313, v137, recta);
                        FigCaptureMetadataUtilitiesDenormalizeCropRect(v181, v182, v183, v184);
                        v186 = v185;
                        v188 = v187;
                        v190 = v189;
                        v341 = v191;
                        v192 = objc_msgSend(v166, "isEqualToString:", 0x1E495B238);
                        v193 = v192 | objc_msgSend(v166, "isEqualToString:", 0x1E495B438);
                        if (v193 == 1)
                        {
                          v318 = (double)SHIDWORD(v180);
                          v320 = (double)(int)v180;
                          v198 = FigCaptureMetadataUtilitiesGetFinalCropRect();
                          FigCaptureMetadataUtilitiesDenormalizeCropRect(v198, v199, v200, v201);
                          v203 = v202;
                          v205 = v204;
                          v207 = v206;
                          v209 = v208;
                          v317 = 0.0;
                          TotalSensorCropRect = FigCaptureMetadataUtilitiesGetTotalSensorCropRect();
                          v212 = v211;
                          v214 = v213;
                          v295 = v190;
                          v216 = v215;
                          v217 = FigCaptureMetadataUtilitiesGetTotalSensorCropRect();
                          *(float *)&v218 = v218 / v214;
                          *(float *)&v219 = v219 / v216;
                          v220 = v292 / v214;
                          v195 = v291 / v216;
                          *(float *)&v195 = v291 / v216;
                          *(float *)&v217 = (v217 - TotalSensorCropRect) * v220;
                          v194 = *(float *)&v195;
                          *(float *)&v221 = (v221 - v212) * *(float *)&v195;
                          *(float *)&v194 = v286 * *(float *)&v218;
                          *(float *)&v195 = v285 * *(float *)&v219;
                          *(float *)&v196 = v284 + *(float *)&v217;
                          *(float *)&v197 = v283 + *(float *)&v221;
                          v188 = 0.0;
                          v137 = v294;
                          v222 = v295;
                        }
                        else
                        {
                          LODWORD(v196) = 0;
                          LODWORD(v194) = 1.0;
                          v320 = v190;
                          v317 = v186;
                          v318 = v341;
                          LODWORD(v195) = 1.0;
                          v205 = v289;
                          v203 = v290;
                          LODWORD(v197) = 0;
                          v209 = v287;
                          v207 = v288;
                          v222 = v190;
                        }
                        v223 = v222 / rect2b;
                        v224 = v341 / v344;
                        *(float *)&v273 = v223 / v300;
                        *((float *)&v273 + 1) = v224 / v298;
                        v225 = objc_msgSend(*(id *)(v351 + 72), "applyExistingCorrectionToSecondaryAsset:inputCrop:primaryImageDimensions:inputHorizontalSecondaryToPrimaryScaleFactor:inputVerticalSecondaryToPrimaryScaleFactor:inputHorizontalSecondaryToPrimaryShift:inputVerticalSecondaryToPrimaryShift:outputPixelBuffer:outputHorizontalAdditionalScaleFactor:outputVerticalAdditionalScaleFactor:", v169, v352, v172, v203, v205, v207, v209, v194, v195, v196, v197, v273);
                        if (!v225)
                        {
                          FigCFDictionarySetCGRect();
                          FigCFDictionarySetCGRect();
                          FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v174, v175, v180, v327, v323, rect2b, v344, v317, v188, v320, v318);
                          if (v193)
                            FigCaptureMetadataUtilitiesPreventFurtherCropping(v174, v226);
                          BWSampleBufferSetAttachedMedia(target, (uint64_t)v166, (uint64_t)v173);
                        }
                        if (objc_msgSend(v166, "isEqualToString:", 0x1E4936818))
                          v104 = v225;
                        else
                          v104 = v171;
                        v103 = v352;
                        v157 = r2a;
                        v158 = v304;
                      }
                      ++v165;
                    }
                    while (v157 != v165);
                    v244 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v358, v377, 16);
                    v157 = v244;
                  }
                  while (v244);
                }
                if (v281)
                {
                  objc_msgSend(v278, "setObject:forKeyedSubscript:", &unk_1E49FC960, v275);
                  objc_msgSend(v278, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D05FD0]);
                }

                v45 = 0;
                v115 = 0;
                v147 = -10000;
                v5 = (void *)target;
                v46 = v279;
                v3 = v280;
                goto LABEL_178;
              }
              if (!objc_msgSend(*(id *)(v100 + 72), "zoomWasApplied"))
                goto LABEL_142;
              v115 = 0;
              v147 = -10000;
              if (v315 == 0.0 && v313 == 0.0)
              {
                v115 = 0;
                if (v143 == (double)v340 && recta == (double)v326)
                {
                  if (objc_msgSend(v3, "applyZoom", (double)v326, recta))
                  {
                    FigCFDictionarySetCGRect();
                    FigCFDictionarySetCGRect();
                    v148 = psn_pixelBufferDimensions(v279);
                    v149 = v70;
                    v137 = v143;
                    FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v278, v103, v148, v149, v79, v101, v355, v315, v313, v143, recta);
                  }
                  else
                  {
                    v261 = psn_pixelBufferDimensions(v279);
                    v262 = v70;
                    v137 = v143;
                    FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v278, v103, v261, v262, v79, v101, v355, v315, v313, v143, recta);
                    FigCaptureMetadataUtilitiesNormalizeCropRect(v315, v313, v143, recta);
                    v264 = v263;
                    v266 = v265;
                    v269 = FigCaptureTransformNormalizedPointFromCoordinateSpaceOfNormalizedRect(v301, v299, v267, v268, v263);
                    v412.size.width = v264 / v297;
                    v412.size.height = v266 / v296;
                    v412.origin.x = v269 - v264 / v297 * 0.5;
                    v412.origin.y = v270 - v266 / v296 * 0.5;
                    v416.origin.x = 0.0;
                    v416.origin.y = 0.0;
                    v416.size.width = 1.0;
                    v416.size.height = 1.0;
                    CGRectIntersection(v412, v416);
                    FigCFDictionarySetCGRect();
                  }
                  v136 = v303;
                  goto LABEL_143;
                }
              }
            }
            v46 = v279;
            goto LABEL_212;
          }
          v274 = v1;
          LODWORD(v271) = 0;
        }
        FigDebugAssert3();
        goto LABEL_209;
      }
      v276 = 0;
      v278 = 0;
    }
LABEL_210:
    v147 = -10000;
    goto LABEL_211;
  }

  v45 = 0;
  v278 = 0;
  v46 = 0;
LABEL_186:
  objc_msgSend((id)objc_msgSend(*(id *)(v2 + 112), "delegate"), "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", v2, v5, objc_msgSend(v3, "imageBufferType"), v3, v45);
  -[BWIntelligentDistortionCorrectionProcessorController _resetProcessor](v2);
  if (v46)
    CFRelease(v46);
  if (target)
    CFRelease(target);

  objc_msgSend(v356, "removeAllObjects");
  objc_msgSend(obj, "removeAllObjects");
  objc_msgSend(r2_24, "removeAllObjects");
  objc_msgSend(r2_16, "removeAllObjects");
  return -[BWIntelligentDistortionCorrectionProcessorController _updateStateIfNeeded](v2);
}

- (void)_getAndAttachGDCInformationToDemosaicedRawSampleBuffer:(uint64_t)a1 inputDimensions:(const void *)a2 finalImageDimensions:(uint64_t)a3 settingsID:(uint64_t)a4
{
  opaqueCMSampleBuffer *AttachedMedia;
  opaqueCMSampleBuffer *v9;
  CFTypeRef v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  int v20;
  signed int v21;
  BOOL v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t i;
  uint64_t v34;
  const void *v35;
  const void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  double v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  _BYTE v49[128];
  uint64_t v50;
  CGRect v51;
  CGRect v52;

  v50 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a2, 0x1E495B0F8);
    if (AttachedMedia)
    {
      v9 = AttachedMedia;
      v10 = CMGetAttachment(AttachedMedia, CFSTR("RawDNGDictionary"), 0);
      if (!v10)
        goto LABEL_28;
      v11 = (void *)v10;
      v43 = 0.0;
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      if (objc_msgSend(*(id *)(a1 + 72), "getAdjustedGDCInformation:", &v39))
        goto LABEL_28;
      LODWORD(v12) = v41;
      v48[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
      LODWORD(v13) = DWORD1(v41);
      v48[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
      LODWORD(v14) = DWORD2(v41);
      v48[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
      LODWORD(v15) = HIDWORD(v41);
      v48[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
      v16 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 4);
      v17 = BWPixelBufferDimensionsFromSampleBuffer(v9);
      v18 = (void *)BWCreateDNGDictionaryWithZoomedGDCParameters(v11, v16, v17, *(CGFloat *)&v39, *((CGFloat *)&v39 + 1), *(CGFloat *)&v40, *((CGFloat *)&v40 + 1), *((double *)&v42 + 1), v43);
      if (!v18)
      {
LABEL_28:
        BWSampleBufferRemoveAttachedMedia(a2, 0x1E495B0F8);
        return;
      }
      v19 = v18;
      CMSetAttachment(v9, CFSTR("RawDNGDictionary"), v18, 1u);
      if (a3 == v17)
      {
        v20 = llround(vabdd_f64((double)(int)a4, *(double *)&v40));
        v21 = llround(vabdd_f64((double)SHIDWORD(a4), *((double *)&v40 + 1)));
        v22 = v20 <= 4 && v21 <= 4;
        v38 = v19;
        if (v22)
        {
          v51.origin.x = *(double *)&v39 - (double)(v20 / 2);
          v51.origin.y = *((double *)&v39 + 1) - (double)(v21 / 2);
          v52.origin.x = 0.0;
          v52.origin.y = 0.0;
          v52.size.width = (double)(int)a3;
          v52.size.height = (double)SHIDWORD(a3);
          v51.size.width = (double)(int)a4;
          v51.size.height = (double)SHIDWORD(a4);
          *(CGRect *)&v23 = CGRectIntersection(v51, v52);
        }
        else
        {
          FigCaptureMetadataUtilitiesRoundRectToMultipleOf();
        }
        FigCaptureMetadataUtilitiesNormalizeCropRect(v23, v24, v25, v26);
        v27 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", 0x1E495B0F8);
        v28 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "providedInferenceAttachedMediaByMode"), "objectForKeyedSubscript:", &unk_1E49FC990);
        if (objc_msgSend(v28, "count"))
          objc_msgSend(v27, "addObjectsFromArray:", v28);
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v45;
          v32 = (const __CFString *)*MEMORY[0x1E0D05CB0];
          do
          {
            for (i = 0; i != v30; ++i)
            {
              if (*(_QWORD *)v45 != v31)
                objc_enumerationMutation(v27);
              v34 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
              v35 = (const void *)BWSampleBufferGetAttachedMedia(a2, v34);
              if (v35)
              {
                v36 = v35;
                v37 = (void *)objc_msgSend((id)CMGetAttachment(v35, v32, 0), "mutableCopy");
                CMSetAttachment(v36, v32, v37, 1u);

                if (FigCFDictionarySetCGRect())
                  BWSampleBufferRemoveAttachedMedia(a2, v34);
              }
            }
            v30 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
          }
          while (v30);
        }
        v19 = v38;
      }
    }
    else
    {
      v19 = 0;
    }

  }
}

- (uint64_t)_applyExistingCorrectionToDepthPixelBuffer:(uint64_t)a3 primaryImageDimensions:
{
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v13;

  if (!a1)
    return 0;
  v6 = objc_msgSend(*(id *)(a1 + 56), "baseDepthRotationDegrees");
  v7 = FigDepthConvertRotationAndMirroringToExifOrientation(360 - v6, 0);
  v8 = FigDepthRotateBuffer(a2, *(__CVBuffer **)(a1 + 120), v7);
  if ((_DWORD)v8)
  {
    v9 = v8;
    goto LABEL_8;
  }
  v9 = objc_msgSend(*(id *)(a1 + 72), "applyExistingCorrectionToSecondaryAsset:outputPixelBuffer:primaryImageDimensions:", *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), a3);
  if ((_DWORD)v9)
  {
LABEL_8:
    FigDebugAssert3();
    return v9;
  }
  v10 = FigDepthConvertRotationAndMirroringToExifOrientation(v6, 0);
  v11 = FigDepthRotateBuffer(*(__CVBuffer **)(a1 + 128), a2, v10);
  if ((_DWORD)v11)
  {
    v13 = v11;
    FigDebugAssert3();
    return v13;
  }
  return v9;
}

uint64_t __85__BWIntelligentDistortionCorrectionProcessorController__loadSetupAndPrepareProcessor__block_invoke(uint64_t a1, void *a2)
{
  return -[BWIntelligentDistortionCorrectionProcessorController _prepareProcessor:](*(_QWORD *)(a1 + 32), a2);
}

- (uint64_t)_prepareProcessor:(uint64_t)a1
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v14;

  if (!a1)
    return 0;
  v14 = 0;
  v4 = objc_msgSend(*(id *)(a1 + 56), "processorConfig");
  v5 = (unint64_t)objc_msgSend(*(id *)(a1 + 56), "processorConfig") >> 32;
  objc_msgSend(*(id *)(a1 + 56), "processorConfig");
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 56), "processorConfig");
  if (objc_msgSend(a2, "determineWorkingBufferRequirements:maximumInputImageWidth:maximumInputImageHeight:maximumSegmentationMaskWidth:maximumSegmentationMaskHeight:", &v14, v4, v5, v7, HIDWORD(v8)))goto LABEL_11;
  if ((unint64_t)(v14 - 209715200) < 0xFFFFFFFFF3800001)
  {
    v11 = 0;
    v12 = 4294954516;
    goto LABEL_8;
  }
  v9 = (void *)objc_msgSend(MEMORY[0x1E0D08B28], "metalDevice");
  if (!v9)
  {
LABEL_11:
    v11 = 0;
LABEL_12:
    v12 = 4294954510;
    goto LABEL_8;
  }
  v10 = (void *)objc_msgSend(v9, "newBufferWithLength:options:", v14, 0);
  v11 = v10;
  if (!v10)
  {
    FigDebugAssert3();
    v12 = FigSignalErrorAt();
    goto LABEL_8;
  }
  if (objc_msgSend(a2, "setSharedMetalBuffer:offset:size:", v10, 0, objc_msgSend(v10, "allocatedSize")))
    goto LABEL_12;
  v12 = 0;
LABEL_8:

  return v12;
}

@end

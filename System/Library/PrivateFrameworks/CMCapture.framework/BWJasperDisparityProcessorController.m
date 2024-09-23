@implementation BWJasperDisparityProcessorController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWJasperDisparityProcessorController)initWithConfiguration:(id)a3
{
  BWJasperDisparityProcessorController *v4;
  FigStateMachine *v5;
  void *v6;
  int v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BWJasperDisparityProcessorController;
  v4 = -[BWJasperDisparityProcessorController init](&v9, sel_init);
  if (v4)
  {
    v4->_configuration = (BWJasperDisparityProcessorControllerConfiguration *)a3;
    v4->_requestQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = -[FigStateMachine initWithLabel:stateCount:initialState:owner:]([FigStateMachine alloc], "initWithLabel:stateCount:initialState:owner:", CFSTR("BWJasperDisparityProcessorController state machine"), 4, 1, v4);
    -[FigStateMachine setPerformsAtomicStateTransitions:](v5, "setPerformsAtomicStateTransitions:", 0);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("Idle"), 1);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("Ready"), 2);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("Waiting"), 4);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("Processing"), 8);
    -[FigStateMachine whenTransitioningToStates:callHandler:](v5, "whenTransitioningToStates:callHandler:", 1, &__block_literal_global_78);
    -[FigStateMachine whenTransitioningToStates:callHandler:](v5, "whenTransitioningToStates:callHandler:", 2, &__block_literal_global_198);
    -[FigStateMachine whenTransitioningToState:callHandler:](v5, "whenTransitioningToState:callHandler:", 4, &__block_literal_global_199);
    -[FigStateMachine whenTransitioningToState:callHandler:](v5, "whenTransitioningToState:callHandler:", 8, &__block_literal_global_200);
    v4->_stateMachine = v5;
    *(_DWORD *)v4->_anon_70 = 1065353216;
    *(_DWORD *)&v4->_anon_70[20] = 1065353216;
    *(_DWORD *)&v4->_anon_70[40] = 1065353216;
    v4->_pointClouds = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4->_pointCloudsLock._os_unfair_lock_opaque = 0;
    v6 = (void *)MEMORY[0x1A858DD40]();
    v7 = -[BWJasperDisparityProcessorController _setupJasperDisparityProcessor](v4, "_setupJasperDisparityProcessor");
    objc_autoreleasePoolPop(v6);
    if (v7)
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  opaqueCMFormatDescription *depthFormatDescription;
  objc_super v4;

  depthFormatDescription = self->_depthFormatDescription;
  if (depthFormatDescription)
    CFRelease(depthFormatDescription);
  v4.receiver = self;
  v4.super_class = (Class)BWJasperDisparityProcessorController;
  -[BWStillImageProcessorController dealloc](&v4, sel_dealloc);
}

- (unint64_t)type
{
  return 13;
}

- (int)enqueueInputForProcessing:(id)a3 delegate:(id)a4
{
  BWJasperDisparityProcessorRequest *v5;

  v5 = -[BWJasperDisparityProcessorRequest initWithInput:delegate:]([BWJasperDisparityProcessorRequest alloc], "initWithInput:delegate:", a3, a4);
  -[NSMutableArray addObject:](self->_requestQueue, "addObject:", v5);

  if (-[FigStateMachine currentState](self->_stateMachine, "currentState") == 1)
    -[FigStateMachine transitionToState:](self->_stateMachine, "transitionToState:", 2);
  return 0;
}

- (BOOL)finishProcessingCurrentInputNow
{
  BWJasperDisparityProcessorRequest *v2;
  BOOL v3;

  v2 = self->_currentRequest;
  -[BWJasperDisparityProcessorInput executeNow](-[BWJasperDisparityProcessorRequest input](v2, "input"), "executeNow");
  v3 = -[BWJasperDisparityProcessorRequest err](v2, "err") == 0;

  return v3;
}

- (void)addPointCloudToTimeMachine:(opaqueCMSampleBuffer *)a3
{
  os_unfair_lock_s *p_pointCloudsLock;
  unint64_t v6;

  if (a3)
  {
    p_pointCloudsLock = &self->_pointCloudsLock;
    os_unfair_lock_lock(&self->_pointCloudsLock);
    -[NSMutableArray addObject:](self->_pointClouds, "addObject:", a3);
    v6 = -[NSMutableArray count](self->_pointClouds, "count");
    if (v6 > -[BWJasperDisparityProcessorControllerConfiguration pointCloudTimeMachineCapacity](self->_configuration, "pointCloudTimeMachineCapacity"))-[NSMutableArray removeObjectAtIndex:](self->_pointClouds, "removeObjectAtIndex:", 0);
    os_unfair_lock_unlock(p_pointCloudsLock);
  }
  else
  {
    FigDebugAssert3();
  }
}

- (void)cancelProcessing
{
  -[NSMutableArray removeAllObjects](self->_requestQueue, "removeAllObjects");
  -[BWJasperDisparityProcessorRequest setErr:](self->_currentRequest, "setErr:", 4294950490);
  -[BWJasperDisparityProcessorController _serviceNextRequest](self, "_serviceNextRequest");
}

- (id)jasperPointCloudForColorBuffer:(id)a3
{
  os_unfair_lock_s *p_pointCloudsLock;
  CFStringRef *v6;
  uint64_t *v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const void *v9;
  const __CFString *v10;
  double v11;
  double v12;
  const void *v13;
  void *v14;
  uint64_t v15;
  double Seconds;
  unint64_t v17;
  double v18;
  double v19;
  unint64_t v20;
  const void *v21;
  const __CFDictionary *v22;
  const void *v23;
  const __CFDictionary *v24;
  double v25;
  double v26;
  NSObject *v27;
  opaqueCMSampleBuffer *v28;
  CFTypeRef CVDataBuffer;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  CMTime time;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  p_pointCloudsLock = &self->_pointCloudsLock;
  os_unfair_lock_lock(&self->_pointCloudsLock);
  if (objc_msgSend(a3, "colorBuffer") && -[NSMutableArray count](self->_pointClouds, "count"))
  {
    v6 = (CFStringRef *)MEMORY[0x1E0D05CB0];
    v7 = (uint64_t *)MEMORY[0x1E0D05D00];
    if (dword_1EE6BEA78)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v9 = (const void *)objc_msgSend(a3, "colorBuffer", v32, v34);
    v10 = *v6;
    objc_msgSend((id)objc_msgSend((id)CMGetAttachment(v9, *v6, 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06A20]), "doubleValue");
    v12 = v11;
    v13 = (const void *)objc_msgSend(a3, "colorBuffer");
    if (v13)
    {
      v14 = (void *)CMGetAttachment(v13, v10, 0);
      v15 = *v7;
      CMTimeMakeFromDictionary(&time, (CFDictionaryRef)objc_msgSend(v14, "objectForKeyedSubscript:", *v7));
      Seconds = CMTimeGetSeconds(&time);
    }
    else
    {
      v15 = *v7;
      Seconds = 0.0;
    }
    v17 = 0;
    v18 = v12 * 0.5 + Seconds;
    v19 = 0.0;
    do
    {
      v20 = v17;
      if (-[NSMutableArray count](self->_pointClouds, "count") - 1 <= v17)
        break;
      if (v19 == 0.0)
      {
        v21 = (const void *)-[NSMutableArray objectAtIndexedSubscript:](self->_pointClouds, "objectAtIndexedSubscript:", v17);
        if (v21)
        {
          v22 = (const __CFDictionary *)objc_msgSend((id)CMGetAttachment(v21, v10, 0), "objectForKeyedSubscript:", v15);
          CMTimeMakeFromDictionary(&time, v22);
          v19 = CMTimeGetSeconds(&time);
        }
        else
        {
          v19 = 0.0;
        }
      }
      ++v17;
      v23 = (const void *)-[NSMutableArray objectAtIndexedSubscript:](self->_pointClouds, "objectAtIndexedSubscript:", v20 + 1);
      if (v23)
      {
        v24 = (const __CFDictionary *)objc_msgSend((id)CMGetAttachment(v23, v10, 0), "objectForKeyedSubscript:", v15);
        CMTimeMakeFromDictionary(&time, v24);
        v25 = CMTimeGetSeconds(&time);
      }
      else
      {
        v25 = 0.0;
      }
      v26 = vabdd_f64(v18, v19);
      v19 = v25;
    }
    while (v26 > vabdd_f64(v18, v25));
    if (dword_1EE6BEA78)
    {
      v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v28 = (opaqueCMSampleBuffer *)-[NSMutableArray objectAtIndexedSubscript:](self->_pointClouds, "objectAtIndexedSubscript:", v20, v33, v35);
    os_unfair_lock_unlock(p_pointCloudsLock);
    CVDataBuffer = BWSampleBufferGetCVDataBuffer(v28);
    return (id)objc_msgSend(objc_alloc((Class)getADJasperPointCloudClass()), "initWithDataBuffer:", CVDataBuffer);
  }
  else
  {
    v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    os_unfair_lock_unlock(p_pointCloudsLock);
    return 0;
  }
}

- (void)_updateStateIfNeeded
{
  BWJasperDisparityProcessorRequest *currentRequest;
  unsigned int v4;
  uint64_t v5;

  currentRequest = self->_currentRequest;
  v4 = -[FigStateMachine currentState](self->_stateMachine, "currentState");
  if (currentRequest)
  {
    if (v4 == 2)
    {
      v5 = 4;
    }
    else if (v4 == 4)
    {
      if (-[BWJasperDisparityProcessorInput isReadyToExecute](-[BWJasperDisparityProcessorRequest input](currentRequest, "input"), "isReadyToExecute"))
      {
        v5 = 8;
      }
      else
      {
        v5 = 4;
      }
    }
    else
    {
      v5 = 2;
    }
  }
  else
  {
    v5 = 1;
  }
  if ((_DWORD)v5 != -[FigStateMachine currentState](self->_stateMachine, "currentState"))
    -[FigStateMachine transitionToState:](self->_stateMachine, "transitionToState:", v5);
}

- (void)_serviceNextRequest
{
  BWJasperDisparityProcessorControllerDelegate *v3;
  BWJasperDisparityProcessorInput *v4;
  uint64_t v5;
  BWJasperDisparityProcessorRequest *v6;

  v3 = -[BWJasperDisparityProcessorRequest delegate](self->_currentRequest, "delegate");
  v4 = -[BWJasperDisparityProcessorRequest input](self->_currentRequest, "input");
  v5 = -[BWJasperDisparityProcessorRequest err](self->_currentRequest, "err");

  self->_currentRequest = 0;
  -[BWJasperDisparityProcessorControllerDelegate processorController:didFinishProcessingInput:err:](v3, "processorController:didFinishProcessingInput:err:", self, v4, v5);

  v6 = (BWJasperDisparityProcessorRequest *)(id)-[NSMutableArray firstObject](self->_requestQueue, "firstObject");
  self->_currentRequest = v6;
  if (v6)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_requestQueue, "removeObjectAtIndex:", 0);
    -[BWJasperDisparityProcessorInput setDelegate:](-[BWJasperDisparityProcessorRequest input](self->_currentRequest, "input"), "setDelegate:", self);
  }
  -[BWJasperDisparityProcessorController _updateStateIfNeeded](self, "_updateStateIfNeeded");
}

- (void)_execute
{
  opaqueCMSampleBuffer *v3;
  BWJasperDisparityProcessorRequest *currentRequest;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  BOOL v9;
  void *v10;
  CVImageBufferRef ImageBuffer;
  id v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  double v21[2];
  os_log_type_t type;
  int v23;
  CFTypeRef value;
  void *v25;
  CMAttachmentBearerRef target[21];

  target[20] = *(CMAttachmentBearerRef *)MEMORY[0x1E0C80C00];
  v25 = 0;
  target[0] = 0;
  value = 0;
  v3 = -[BWJasperDisparityProcessorInput colorBuffer](-[BWJasperDisparityProcessorRequest input](self->_currentRequest, "input"), "colorBuffer");
  currentRequest = self->_currentRequest;
  if (!v3)
    goto LABEL_20;
  if (-[BWJasperDisparityProcessorRequest err](currentRequest, "err"))
    goto LABEL_17;
  if (!-[BWJasperDisparityProcessorInput skipProcessing](-[BWJasperDisparityProcessorRequest input](self->_currentRequest, "input"), "skipProcessing"))
  {
    v5 = objc_msgSend((id)CMGetAttachment(v3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
    v6 = *MEMORY[0x1E0D05A20];
    v7 = -[NSDictionary objectForKeyedSubscript:](-[BWStillImageProcessorControllerConfiguration sensorConfigurationsByPortType](self->_configuration, "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", v5);
    v8 = -[NSDictionary objectForKeyedSubscript:](-[BWStillImageProcessorControllerConfiguration sensorConfigurationsByPortType](self->_configuration, "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", v6);
    if (v7)
      v9 = v8 == 0;
    else
      v9 = 1;
    if (v9)
      goto LABEL_17;
    v10 = v8;
    ImageBuffer = CMSampleBufferGetImageBuffer(v3);
    currentRequest = self->_currentRequest;
    if (ImageBuffer)
    {
      v12 = -[BWJasperDisparityProcessorController jasperPointCloudForColorBuffer:](self, "jasperPointCloudForColorBuffer:", -[BWJasperDisparityProcessorRequest input](currentRequest, "input"));
      currentRequest = self->_currentRequest;
      if (v12)
      {
        target[0] = (CMAttachmentBearerRef)-[BWJasperDisparityProcessorControllerDelegate processorController:newOutputPixelBufferForProcessorInput:type:](-[BWJasperDisparityProcessorRequest delegate](currentRequest, "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:", self, -[BWJasperDisparityProcessorRequest input](self->_currentRequest, "input"), 2001);
        if (target[0])
        {
          v20 = 0u;
          *(_OWORD *)v21 = 0u;
          v18 = 0u;
          v19 = 0u;
          -[BWJasperDisparityProcessorRequest setErr:](self->_currentRequest, "setErr:", FigCaptureCreateJasperToColorCameraTransformForJasperSensorConfiguration(v10, (uint64_t)&v18));
          if (!-[BWJasperDisparityProcessorRequest err](self->_currentRequest, "err"))
          {
            -[BWJasperDisparityProcessorRequest setErr:](self->_currentRequest, "setErr:", FigCaptureCreateColorCameraCalibrationForColorSampleBuffer(v3, v7, -[BWJasperDisparityProcessorControllerConfiguration horizontalSensorBinningFactor](self->_configuration, "horizontalSensorBinningFactor"), -[BWJasperDisparityProcessorControllerConfiguration verticalSensorBinningFactor](self->_configuration, "verticalSensorBinningFactor"), &v25));
            if (!-[BWJasperDisparityProcessorRequest err](self->_currentRequest, "err"))
            {
              if (v25)
              {
                -[BWJasperDisparityProcessorRequest setErr:](self->_currentRequest, "setErr:", FigCaptureCreateDepthMetadataForColorCameraCalibration(v25, -[FigCaptureStillImageSettings depthDataFiltered](-[BWStillImageProcessorControllerInput settings](-[BWJasperDisparityProcessorRequest input](self->_currentRequest, "input"), "settings"), "depthDataFiltered"), &value));
                if (!-[BWJasperDisparityProcessorRequest err](self->_currentRequest, "err"))
                {
                  objc_msgSend((id)objc_msgSend((id)-[ADJasperColorV2Executor executorParameters](self->_adStillImageExecutor, "executorParameters"), "pipelineParameters"), "setOutputHighConfidencePixelsOnly:", -[FigCaptureStillImageSettings depthDataFiltered](-[BWStillImageProcessorControllerInput settings](-[BWJasperDisparityProcessorRequest input](self->_currentRequest, "input"), "settings"), "depthDataFiltered") ^ 1);
                  -[BWJasperDisparityProcessorRequest setErr:](self->_currentRequest, "setErr:", -[ADJasperColorV2Executor executeWithColor:pointCloud:jasperToColorTransform:colorCamera:outputDepthMap:outputConfidenceMap:](self->_adStillImageExecutor, "executeWithColor:pointCloud:jasperToColorTransform:colorCamera:outputDepthMap:outputConfidenceMap:", ImageBuffer, v12, v25, target, 0, *(double *)&v18, *(double *)&v19, *(double *)&v20, v21[0]));
                  if (!-[BWJasperDisparityProcessorRequest err](self->_currentRequest, "err"))
                  {
                    v13 = (const __CFString *)*MEMORY[0x1E0D086F0];
                    CMSetAttachment(target[0], (CFStringRef)*MEMORY[0x1E0D086F0], value, 1u);
                    CMSetAttachment(v3, v13, value, 1u);
                    BWSampleBufferSetAttachedMediaFromPixelBuffer(v3, (uint64_t)CFSTR("Depth"), (__CVBuffer *)target[0], (CFTypeRef *)&self->_depthFormatDescription, 0, 0, 1);
                  }
                }
              }
            }
          }
          goto LABEL_17;
        }
        currentRequest = self->_currentRequest;
        v14 = 4294954510;
LABEL_24:
        -[BWJasperDisparityProcessorRequest setErr:](currentRequest, "setErr:", v14);
        goto LABEL_17;
      }
    }
LABEL_20:
    v14 = 4294954516;
    goto LABEL_24;
  }
  if (dword_1EE6BEA78)
  {
    v23 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_17:
  -[BWJasperDisparityProcessorControllerDelegate processorController:didFinishProcessingSampleBuffer:type:processorInput:err:](-[BWJasperDisparityProcessorRequest delegate](self->_currentRequest, "delegate", v16, v17), "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", self, v3, -[BWJasperDisparityProcessorInput colorBufferType](-[BWJasperDisparityProcessorRequest input](self->_currentRequest, "input"), "colorBufferType"), -[BWJasperDisparityProcessorRequest input](self->_currentRequest, "input"), -[BWJasperDisparityProcessorRequest err](self->_currentRequest, "err"));
  if (target[0])
    CFRelease(target[0]);

  -[BWJasperDisparityProcessorController _updateStateIfNeeded](self, "_updateStateIfNeeded");
}

- (int)_setupJasperDisparityProcessor
{
  ADJasperColorV2Executor *v3;
  int v4;

  if (self->_adStillImageExecutor)
    return 0;
  if (!FigCapturePixelFormatIsDepthData(-[BWVideoFormat pixelFormat](-[BWJasperDisparityProcessorControllerConfiguration outputDepthFormat](self->_configuration, "outputDepthFormat"), "pixelFormat")))
  {
    v4 = -12780;
    goto LABEL_5;
  }
  v3 = (ADJasperColorV2Executor *)objc_msgSend(objc_alloc((Class)getADJasperColorV2ExecutorClass()), "initWithInputPrioritization:engineType:", 3, 4);
  self->_adStillImageExecutor = v3;
  if (!v3)
  {
    FigDebugAssert3();
    v4 = -12786;
    goto LABEL_5;
  }
  v4 = -[ADJasperColorV2Executor prepareForColorROI:](self->_adStillImageExecutor, "prepareForColorROI:", 0.0, 0.0, (double)-[BWVideoFormat width](-[BWJasperDisparityProcessorControllerConfiguration inputColorFormat](self->_configuration, "inputColorFormat"), "width"), (double)-[BWVideoFormat height](-[BWJasperDisparityProcessorControllerConfiguration inputColorFormat](self->_configuration, "inputColorFormat"), "height"));
  if (v4)
  {
LABEL_5:

    self->_adStillImageExecutor = 0;
  }
  return v4;
}

@end

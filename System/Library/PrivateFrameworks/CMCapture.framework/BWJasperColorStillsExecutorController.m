@implementation BWJasperColorStillsExecutorController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWJasperColorStillsExecutorController)initWithConfiguration:(id)a3
{
  BWJasperColorStillsExecutorController *v4;
  FigStateMachine *v5;
  CGSize v6;
  void *v7;
  int v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BWJasperColorStillsExecutorController;
  v4 = -[BWJasperColorStillsExecutorController init](&v10, sel_init);
  if (v4)
  {
    v4->_configuration = (BWJasperColorStillsExecutorControllerConfiguration *)a3;
    v4->_requestQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = -[FigStateMachine initWithLabel:stateCount:initialState:owner:]([FigStateMachine alloc], "initWithLabel:stateCount:initialState:owner:", CFSTR("BWJasperColorStillsExecutorController state machine"), 4, 1, v4);
    -[FigStateMachine setPerformsAtomicStateTransitions:](v5, "setPerformsAtomicStateTransitions:", 0);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("Idle"), 1);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("Ready"), 2);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("Waiting"), 4);
    -[FigStateMachine setLabel:forState:](v5, "setLabel:forState:", CFSTR("Processing"), 8);
    -[FigStateMachine whenTransitioningToStates:callHandler:](v5, "whenTransitioningToStates:callHandler:", 1, &__block_literal_global_32);
    -[FigStateMachine whenTransitioningToStates:callHandler:](v5, "whenTransitioningToStates:callHandler:", 2, &__block_literal_global_210);
    -[FigStateMachine whenTransitioningToState:callHandler:](v5, "whenTransitioningToState:callHandler:", 4, &__block_literal_global_211);
    -[FigStateMachine whenTransitioningToState:callHandler:](v5, "whenTransitioningToState:callHandler:", 8, &__block_literal_global_212);
    v4->_stateMachine = v5;
    *(_DWORD *)v4->_anon_70 = 1065353216;
    *(_DWORD *)&v4->_anon_70[20] = 1065353216;
    *(_DWORD *)&v4->_anon_70[40] = 1065353216;
    v6 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v4->_inputROI.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v4->_inputROI.size = v6;
    if ((objc_msgSend(a3, "postponeProcessorSetup") & 1) == 0)
    {
      v7 = (void *)MEMORY[0x1A858DD40]();
      v8 = -[BWJasperColorStillsExecutorController _setupJasperColorStillsExecutor]((uint64_t)v4);
      objc_autoreleasePoolPop(v7);
      if (v8)
      {

        return 0;
      }
    }
  }
  return v4;
}

- (uint64_t)_setupJasperColorStillsExecutor
{
  uint64_t v2;
  double v3;
  double v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!a1 || *(_QWORD *)(a1 + 72))
    return 0;
  if (!FigCapturePixelFormatIsDepthData(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "outputDepthFormat"), "pixelFormat")))
  {
    v8 = 4294954516;
LABEL_9:

    *(_QWORD *)(a1 + 72) = 0;
    return v8;
  }
  v2 = objc_msgSend(objc_alloc((Class)getADJasperColorStillsExecutorClass()), "init");
  *(_QWORD *)(a1 + 72) = v2;
  if (!v2)
  {
    FigDebugAssert3();
    v8 = 4294954510;
    goto LABEL_9;
  }
  *(_QWORD *)(a1 + 80) = 3;
  if (-[BWJasperColorStillsExecutorController _sourceDimensionsAreTargetDimensions](a1))
  {
    v3 = (double)(unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "inputColorFormat"), "width");
    v4 = (double)(unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "inputColorFormat"), "height");
    *(_QWORD *)(a1 + 176) = 0;
    *(_QWORD *)(a1 + 184) = 0;
    *(double *)(a1 + 192) = v3;
  }
  else
  {
    v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "inputColorFormat"), "width");
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "inputColorFormat"), "height");
    *(double *)(a1 + 176) = FigCaptureMetadataUtilitiesDenormalizedRectWithinBoundingDimensionsCenteredOnPoint(v5, objc_msgSend(*(id *)(a1 + 64), "standardFormatDimensions"), 0.5);
    *(_QWORD *)(a1 + 184) = v6;
    *(_QWORD *)(a1 + 192) = v7;
  }
  *(double *)(a1 + 200) = v4;
  v8 = objc_msgSend(*(id *)(a1 + 72), "prepareForEngineType:inputROI:", *(_QWORD *)(a1 + 80), *(double *)(a1 + 176), *(double *)(a1 + 184), *(double *)(a1 + 192), *(double *)(a1 + 200));
  if ((_DWORD)v8)
    goto LABEL_9;
  return v8;
}

- (void)dealloc
{
  opaqueCMFormatDescription *depthFormatDescription;
  objc_super v4;

  depthFormatDescription = self->_depthFormatDescription;
  if (depthFormatDescription)
    CFRelease(depthFormatDescription);
  v4.receiver = self;
  v4.super_class = (Class)BWJasperColorStillsExecutorController;
  -[BWStillImageProcessorController dealloc](&v4, sel_dealloc);
}

- (unint64_t)type
{
  return 9;
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
    v2 = *(void **)(result + 96);
    v3 = objc_msgSend(*(id *)(result + 56), "currentState");
    if (v2)
    {
      if (v3 == 2)
      {
        v4 = 4;
      }
      else if (v3 == 4)
      {
        if (objc_msgSend((id)objc_msgSend(v2, "input"), "isReadyToExecute"))
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
    result = objc_msgSend(*(id *)(v1 + 56), "currentState");
    if ((_DWORD)v4 != (_DWORD)result)
      return objc_msgSend(*(id *)(v1 + 56), "transitionToState:", v4);
  }
  return result;
}

- (int)enqueueInputForProcessing:(id)a3 delegate:(id)a4
{
  _QWORD *v5;

  v5 = -[BWJasperColorStillsExecutorRequest initWithInput:delegate:]([BWJasperColorStillsExecutorRequest alloc], a3, a4);
  -[NSMutableArray addObject:](self->_requestQueue, "addObject:", v5);

  if (-[FigStateMachine currentState](self->_stateMachine, "currentState") == 1)
    -[FigStateMachine transitionToState:](self->_stateMachine, "transitionToState:", 2);
  return 0;
}

- (BOOL)finishProcessingCurrentInputNow
{
  BWJasperColorStillsExecutorRequest *v2;
  uint64_t v3;
  BOOL v4;

  v2 = self->_currentRequest;
  v3 = -[BWJasperColorStillsExecutorRequest input](v2, "input");
  if (v3)
    objc_msgSend(*(id *)(v3 + 40), "inputReadyToExecute:", v3);
  v4 = -[BWJasperColorStillsExecutorRequest err](v2, "err") == 0;

  return v4;
}

- (void)cancelProcessing
{
  -[NSMutableArray removeAllObjects](self->_requestQueue, "removeAllObjects");
  -[BWJasperColorStillsExecutorRequest setErr:](self->_currentRequest, "setErr:", 4294950490);
  -[BWJasperColorStillsExecutorController _serviceNextRequest]((uint64_t)self);
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
    v2 = (void *)objc_msgSend(*(id *)(result + 96), "delegate");
    v3 = (id)objc_msgSend(*(id *)(v1 + 96), "input");
    v4 = objc_msgSend(*(id *)(v1 + 96), "err");

    *(_QWORD *)(v1 + 96) = 0;
    objc_msgSend(v2, "processorController:didFinishProcessingInput:err:", v1, v3, v4);

    v5 = (id)objc_msgSend(*(id *)(v1 + 88), "firstObject");
    *(_QWORD *)(v1 + 96) = v5;
    if (v5)
    {
      objc_msgSend(*(id *)(v1 + 88), "removeObjectAtIndex:", 0);
      objc_msgSend((id)objc_msgSend(*(id *)(v1 + 96), "input"), "setDelegate:", v1);
    }
    return -[BWJasperColorStillsExecutorController _updateStateIfNeeded](v1);
  }
  return result;
}

- (void)purgeResources
{

  self->_adStillImageExecutor = 0;
}

- (uint64_t)_execute
{
  uint64_t v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __CVBuffer *ImageBuffer;
  void *v10;
  uint64_t v11;
  int v12;
  CGSize v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double v24;
  double v25;
  double v26;
  double v27;
  const __CFString *v28;
  const void *AttachedMedia;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  double v40[2];
  os_log_type_t type;
  int v42;
  CFTypeRef value;
  void *v44;
  CMAttachmentBearerRef target;
  CGRect v46;
  uint64_t v47;
  CGRect v48;

  v47 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v1 = result;
  v44 = 0;
  target = 0;
  value = 0;
  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(result + 96), "input"), "colorBuffer");
  v3 = *(void **)(v1 + 96);
  if (!v2)
    goto LABEL_25;
  if (!objc_msgSend(v3, "err"))
  {
    if (objc_msgSend((id)objc_msgSend(*(id *)(v1 + 96), "input"), "skipProcessing"))
    {
      if (dword_1EE6BE558)
      {
        v42 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      goto LABEL_21;
    }
    v4 = (const __CFString *)*MEMORY[0x1E0D05CB0];
    v5 = objc_msgSend((id)CMGetAttachment(v2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
    v6 = *MEMORY[0x1E0D05A20];
    v7 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 64), "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 64), "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", v6);
    ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v2);
    v3 = *(void **)(v1 + 96);
    if (ImageBuffer)
    {
      v10 = -[BWJasperColorStillsExecutorInput jasperPointCloudsForColorBuffer](objc_msgSend(v3, "input"));
      v11 = objc_msgSend(v10, "count");
      v3 = *(void **)(v1 + 96);
      if (v11)
      {
        target = (CMAttachmentBearerRef)objc_msgSend((id)objc_msgSend(v3, "delegate"), "processorController:newOutputPixelBufferForProcessorInput:type:", v1, objc_msgSend(*(id *)(v1 + 96), "input"), 2001);
        if (target)
        {
          v39 = 0u;
          *(_OWORD *)v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          objc_msgSend(*(id *)(v1 + 96), "setErr:", FigCaptureCreateJasperToColorCameraTransformForJasperSensorConfiguration(v8, (uint64_t)&v37));
          if (!objc_msgSend(*(id *)(v1 + 96), "err"))
          {
            objc_msgSend(*(id *)(v1 + 96), "setErr:", FigCaptureCreateColorCameraCalibrationForColorSampleBuffer(v2, v7, objc_msgSend(*(id *)(v1 + 64), "horizontalSensorBinningFactor"), objc_msgSend(*(id *)(v1 + 64), "verticalSensorBinningFactor"), &v44));
            if (!objc_msgSend(*(id *)(v1 + 96), "err"))
            {
              if (v44)
              {
                objc_msgSend(*(id *)(v1 + 96), "setErr:", FigCaptureCreateDepthMetadataForColorCameraCalibration(v44, 1, &value));
                if (!objc_msgSend(*(id *)(v1 + 96), "err"))
                {
                  if ((-[BWJasperColorStillsExecutorController _sourceDimensionsAreTargetDimensions](v1) & 1) != 0)
                    goto LABEL_18;
                  v12 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 64), "inputColorFormat"), "width");
                  objc_msgSend((id)objc_msgSend(*(id *)(v1 + 64), "inputColorFormat"), "height");
                  v13 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
                  v46.origin = (CGPoint)*MEMORY[0x1E0C9D628];
                  v46.size = v13;
                  if (FigCFDictionaryGetCGRectIfPresent())
                  {
                    y = v46.origin.y;
                    x = v46.origin.x;
                    height = v46.size.height;
                    width = v46.size.width;
                  }
                  else
                  {
                    v46.origin = 0uLL;
                    __asm { FMOV            V0.2D, #1.0 }
                    v46.size = _Q0;
                    y = 0.0;
                    height = 1.0;
                    width = 1.0;
                    x = 0.0;
                  }
                  MidX = CGRectGetMidX(*(CGRect *)&x);
                  CGRectGetMidY(v46);
                  v48.origin.x = FigCaptureMetadataUtilitiesDenormalizedRectWithinBoundingDimensionsCenteredOnPoint(v12, objc_msgSend(*(id *)(v1 + 64), "standardFormatDimensions"), MidX);
                  v24 = v48.origin.x;
                  v25 = v48.origin.y;
                  v26 = v48.size.width;
                  v27 = v48.size.height;
                  if (CGRectEqualToRect(v48, *(CGRect *)(v1 + 176))
                    || (*(double *)(v1 + 176) = v24,
                        *(double *)(v1 + 184) = v25,
                        *(double *)(v1 + 192) = v26,
                        *(double *)(v1 + 200) = v27,
                        objc_msgSend(*(id *)(v1 + 96), "setErr:", objc_msgSend(*(id *)(v1 + 72), "prepareForEngineType:inputROI:", *(_QWORD *)(v1 + 80), v24, v25, v26, v27)), !objc_msgSend(*(id *)(v1 + 96), "err")))
                  {
LABEL_18:
                    objc_msgSend(*(id *)(v1 + 96), "setErr:", objc_msgSend(*(id *)(v1 + 72), "executeWithColor:pointCloudArray:pointCloud2ColorTransform:colorCameraCalibration:outDepthMap:", ImageBuffer, v10, v44, &target, *(double *)&v37, *(double *)&v38, *(double *)&v39, v40[0]));
                    if (!objc_msgSend(*(id *)(v1 + 96), "err"))
                    {
                      v28 = (const __CFString *)*MEMORY[0x1E0D086F0];
                      CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E0D086F0], value, 1u);
                      CMSetAttachment(v2, v28, value, 1u);
                      BWSampleBufferSetAttachedMediaFromPixelBuffer((opaqueCMSampleBuffer *)v2, (uint64_t)CFSTR("Depth"), (__CVBuffer *)target, (CFTypeRef *)(v1 + 104), 0, 0, 1);
                      if ((-[BWJasperColorStillsExecutorController _sourceDimensionsAreTargetDimensions](v1) & 1) == 0)
                      {
                        AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(v2, (uint64_t)CFSTR("Depth"));
                        v30 = (void *)CMGetAttachment(AttachedMedia, v4, 0);
                        v31 = psn_pixelBufferDimensions(ImageBuffer);
                        v32 = psn_pixelBufferDimensions((__CVBuffer *)target);
                        FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v30, v31, v32, *(CGFloat *)(v1 + 176), *(CGFloat *)(v1 + 184), *(CGFloat *)(v1 + 192), *(CGFloat *)(v1 + 200), *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
                      }
                    }
                  }
                }
              }
            }
          }
          goto LABEL_21;
        }
        v3 = *(void **)(v1 + 96);
        v33 = 4294954510;
        goto LABEL_29;
      }
    }
LABEL_25:
    v33 = 4294954516;
LABEL_29:
    objc_msgSend(v3, "setErr:", v33);
  }
LABEL_21:
  objc_msgSend((id)objc_msgSend(*(id *)(v1 + 96), "delegate", v35, v36), "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", v1, v2, objc_msgSend((id)objc_msgSend(*(id *)(v1 + 96), "input"), "colorBufferType"), objc_msgSend(*(id *)(v1 + 96), "input"), objc_msgSend(*(id *)(v1 + 96), "err"));
  if (target)
    CFRelease(target);

  return -[BWJasperColorStillsExecutorController _updateStateIfNeeded](v1);
}

- (uint64_t)_sourceDimensionsAreTargetDimensions
{
  uint64_t v1;
  _BOOL4 v2;
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v5;

  if (result)
  {
    v1 = result;
    v2 = FigCaptureVideoDimensionsAreValid(objc_msgSend(*(id *)(result + 64), "standardFormatDimensions"));
    v3 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 64), "inputColorFormat"), "width");
    if (v3 == (int)objc_msgSend(*(id *)(v1 + 64), "standardFormatDimensions"))
    {
      v4 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 64), "inputColorFormat"), "width");
      v5 = v4 == objc_msgSend(*(id *)(v1 + 64), "standardFormatDimensions");
    }
    else
    {
      v5 = 0;
    }
    return !v2 | v5;
  }
  return result;
}

@end

@implementation BWPocketDetectionNode

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWPocketDetectionNode)initWithMetalCommandQueue:(id)a3 clientApplicationID:(id)a4
{
  BWPocketDetectionNode *v6;
  BWPocketDetectionNode *v7;
  BWNodeInput *v8;
  BWNodeOutput *v9;
  id v10;
  BWCoreMotionSuppressionStateMonitor *v11;
  uint64_t v12;
  BWPocketDetectionFFTProcessor *v13;
  uint64_t v14;
  _QWORD v16[5];
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)BWPocketDetectionNode;
  v6 = -[BWNode init](&v17, sel_init);
  v7 = v6;
  if (!a3 || !a4)
    goto LABEL_13;
  if (v6)
  {
    v8 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v6);
    -[BWNodeInput setFormatRequirements:](v8, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeInput setPassthroughMode:](v8, "setPassthroughMode:", 1);
    -[BWNodeInputMediaConfiguration setRetainedBufferCount:](-[BWNodeInput primaryMediaConfiguration](v8, "primaryMediaConfiguration"), "setRetainedBufferCount:", 1);
    -[BWNode addInput:](v7, "addInput:", v8);
    v9 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v7);
    -[BWNodeOutput setFormatRequirements:](v9, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeOutput setPassthroughMode:](v9, "setPassthroughMode:", 1);
    -[BWNode addOutput:](v7, "addOutput:", v9);
    v7->_coreMotionSuppressionStateLock._os_unfair_lock_opaque = 0;
    v10 = +[FigWeakReference weakReferenceToObject:](FigWeakReference, "weakReferenceToObject:", v7);
    v11 = [BWCoreMotionSuppressionStateMonitor alloc];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __71__BWPocketDetectionNode_initWithMetalCommandQueue_clientApplicationID___block_invoke;
    v16[3] = &unk_1E491F130;
    v16[4] = v10;
    v12 = -[BWCoreMotionSuppressionStateMonitor initWithSuppressionStateChangeHandler:](v11, "initWithSuppressionStateChangeHandler:", v16);
    v7->_coreMotionSuppressionStateMonitor = (BWCoreMotionSuppressionStateMonitor *)v12;
    if (v12)
    {
      v13 = -[BWPocketDetectionFFTProcessor initWithMetalCommandQueue:]([BWPocketDetectionFFTProcessor alloc], "initWithMetalCommandQueue:", a3);
      v7->_fftProcessor = v13;
      if (v13)
      {
        v7->_detectionQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
        v7->_cumulativeEnergyHistory = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v7->_cumulativeEnergyHistoryLength = 10;
        HIDWORD(v7->_lastDetectionFramePTS.epoch) = 1036831949;
        HIDWORD(v7->_firstFramePts.epoch) = 1088421888;
        *(_DWORD *)&v7->_stopDetection = 1089260749;
        LOBYTE(v7->_cumulativeEnergyInPocketThreshold) = 1;
        v7->_sbMitigationSessionDurationInSeconds = 5.0;
        v7->_suppressFacedownSetdownAccidentals = 1;
        if (!LOBYTE(v7->_cumulativeEnergyInPocketThreshold)
          || (!objc_msgSend(MEMORY[0x1E0DAAD50], "instancesRespondToSelector:", sel_initWithBundleIdentifier_callOutQueue_)? (v7->_sbAccidentalActivationMitigationUsesDetectionQueue = 0, v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0DAAD50]), "initWithBundleIdentifier:", a4)): (v7->_sbAccidentalActivationMitigationUsesDetectionQueue = 1, v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0DAAD50]), "initWithBundleIdentifier:callOutQueue:", a4, v7->_detectionQueue)), (v7->_sbAccidentalActivationMitigationClientSession = (SBSAccidentalActivationMitigationClientSession *)v14) != 0))
        {
          v7->_suppressionStateStrings = (NSArray *)&unk_1E4A00278;
          return v7;
        }
      }
    }
LABEL_13:
    FigDebugAssert3();

    return 0;
  }
  return v7;
}

void __71__BWPocketDetectionNode_initWithMetalCommandQueue_clientApplicationID___block_invoke(uint64_t a1, int a2, int a3, double a4)
{
  uint64_t v7;

  v7 = objc_msgSend(*(id *)(a1 + 32), "referencedObject");
  os_unfair_lock_lock((os_unfair_lock_t)(v7 + 128));
  *(_DWORD *)(v7 + 104) = a2;
  *(double *)(v7 + 112) = a4;
  *(_DWORD *)(v7 + 120) = a3;
  os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 128));
}

- (void)dealloc
{
  objc_super v3;

  if (self->_resourcesAllocated)
    -[BWPocketDetectionNode _cleanupResources](self, "_cleanupResources");

  if (LOBYTE(self->_cumulativeEnergyInPocketThreshold))
  v3.receiver = self;
  v3.super_class = (Class)BWPocketDetectionNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)nodeSubType
{
  return CFSTR("PocketDetection");
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3, a4);
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;
  os_log_type_t type;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[BWVideoFormat width](-[BWNodeInput videoFormat](self->super._input, "videoFormat"), "width") < 0x2D0
    || -[BWVideoFormat height](-[BWNodeInput videoFormat](self->super._input, "videoFormat"), "height") <= 0x2CF)
  {
    if (dword_1EE6BE938)
    {
      v9 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    LOBYTE(self->_detectionEnabledDurationInSeconds) = 1;
  }
  if (dword_1EE6BE938)
  {
    v9 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[BWCoreMotionSuppressionStateMonitor start](self->_coreMotionSuppressionStateMonitor, "start", v5, v6);
  v7.receiver = self;
  v7.super_class = (Class)BWPocketDetectionNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v7, sel_prepareForCurrentConfigurationToBecomeLive);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  void *v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  BOOL *p_previousDetectionComplete;
  NSObject *detectionQueue;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t *v13;
  opaqueCMSampleBuffer *value;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[6];
  CMSampleBufferRef sampleBufferOut;
  CMTime v20;
  CMTime v21;
  uint64_t v22;
  uint64_t v23;
  CMTime v24;
  CMTime v25;
  _QWORD block[5];
  CMTime time1;
  CMTime v28;
  CMTime v29;
  os_log_type_t type;
  CMTime rhs;
  CMTime lhs;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = (void *)CMGetAttachment(a3, CFSTR("CaptureInitiatedOnce"), 0);
  if (!LOBYTE(self->_detectionEnabledDurationInSeconds))
  {
    if (objc_msgSend(v6, "BOOLValue"))
    {
      LOBYTE(self->_detectionEnabledDurationInSeconds) = 1;
      self->_inPocketConsolidatedDecision = 0;
      self->_ppsData.inPocket = 0;
      if (dword_1EE6BE938)
      {
        LODWORD(sampleBufferOut) = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    memset(&v29, 0, sizeof(v29));
    CMSampleBufferGetPresentationTimeStamp(&v29, a3);
    p_previousDetectionComplete = &self->_previousDetectionComplete;
    if ((self->_firstFramePts.timescale & 1) == 0)
    {
      *(_OWORD *)p_previousDetectionComplete = *(_OWORD *)&v29.value;
      *(_QWORD *)&self->_firstFramePts.flags = v29.epoch;
      self->_ppsData.detectionSessionStartTime = CFAbsoluteTimeGetCurrent();
    }
    memset(&v28, 0, sizeof(v28));
    CMTimeMakeWithSeconds(&v28, 4.0, v29.timescale);
    lhs = v29;
    *(_OWORD *)&rhs.value = *(_OWORD *)p_previousDetectionComplete;
    rhs.epoch = *(_QWORD *)&self->_firstFramePts.flags;
    CMTimeSubtract(&time1, &lhs, &rhs);
    lhs = v28;
    if (CMTimeCompare(&time1, &lhs) >= 1)
    {
      if (!self->_resourcesAllocated)
      {
        *(CMTime *)(&self->_inPocketConsolidatedDecision + 4) = v29;
        LOBYTE(self->_detectionIntervalInSeconds) = 0;
        detectionQueue = self->_detectionQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __53__BWPocketDetectionNode_renderSampleBuffer_forInput___block_invoke;
        block[3] = &unk_1E491E720;
        block[4] = self;
        dispatch_async(detectionQueue, block);
        self->_resourcesAllocated = 1;
      }
      memset(&v25, 0, sizeof(v25));
      CMTimeMakeWithSeconds(&v25, *((float *)&self->_firstFramePts.epoch + 1), v29.timescale);
      lhs = v29;
      *(_OWORD *)&rhs.value = *(_OWORD *)p_previousDetectionComplete;
      rhs.epoch = *(_QWORD *)&self->_firstFramePts.flags;
      CMTimeSubtract(&v24, &lhs, &rhs);
      lhs = v25;
      if (CMTimeCompare(&v24, &lhs) >= 1)
      {
        LOBYTE(self->_detectionEnabledDurationInSeconds) = 1;
        self->_ppsData.inPocket = self->_inPocketConsolidatedDecision;
        if (dword_1EE6BE938)
        {
          LODWORD(sampleBufferOut) = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v10, type);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        if (LOBYTE(self->_cumulativeEnergyInPocketThreshold) && self->_inPocketConsolidatedDecision)
        {
          v11 = self->_detectionQueue;
          if (self->_sbAccidentalActivationMitigationUsesDetectionQueue)
          {
            v23 = MEMORY[0x1E0C809B0];
            v12 = __53__BWPocketDetectionNode_renderSampleBuffer_forInput___block_invoke_37;
            v13 = &v23;
          }
          else
          {
            v22 = MEMORY[0x1E0C809B0];
            v12 = __53__BWPocketDetectionNode_renderSampleBuffer_forInput___block_invoke_38;
            v13 = &v22;
          }
          v13[1] = 3221225472;
          v13[2] = (uint64_t)v12;
          v13[3] = (uint64_t)&unk_1E491E720;
          v13[4] = (uint64_t)self;
          dispatch_async(v11, v13);
        }
      }
      memset(&v21, 0, sizeof(v21));
      lhs = v29;
      rhs = *(CMTime *)(&self->_inPocketConsolidatedDecision + 4);
      CMTimeSubtract(&v21, &lhs, &rhs);
      memset(&v20, 0, sizeof(v20));
      CMTimeMakeWithSeconds(&v20, *((float *)&self->_lastDetectionFramePTS.epoch + 1), v29.timescale);
      lhs = v21;
      rhs = v20;
      if (CMTimeCompare(&lhs, &rhs) >= 1
        && !LOBYTE(self->_detectionEnabledDurationInSeconds)
        && LOBYTE(self->_detectionIntervalInSeconds))
      {
        LOBYTE(self->_detectionIntervalInSeconds) = 0;
        *(CMTime *)(&self->_inPocketConsolidatedDecision + 4) = v29;
        lhs.value = 0;
        rhs.value = 0;
        BWOverCaptureSampleBufferUnpackAndRetain(a3, 0, &rhs, (CFTypeRef *)&lhs, 0, 0);
        value = (opaqueCMSampleBuffer *)lhs.value;
        if (rhs.value
          && objc_msgSend((id)objc_msgSend((id)CMGetAttachment((CMAttachmentBearerRef)rhs.value, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06EB8]), "BOOLValue"))
        {
          value = (opaqueCMSampleBuffer *)rhs.value;
        }
        sampleBufferOut = 0;
        BWCMSampleBufferCreateCopyIncludingMetadata(value, &sampleBufferOut);
        v15 = self->_detectionQueue;
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __53__BWPocketDetectionNode_renderSampleBuffer_forInput___block_invoke_39;
        v18[3] = &unk_1E491F158;
        v18[4] = self;
        v18[5] = sampleBufferOut;
        dispatch_async(v15, v18);
        if (lhs.value)
          CFRelease((CFTypeRef)lhs.value);
        if (rhs.value)
          CFRelease((CFTypeRef)rhs.value);
      }
    }
  }
  -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3, v16, v17);
}

uint64_t __53__BWPocketDetectionNode_renderSampleBuffer_forInput___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_allocateResources");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 200) = 1;
  return result;
}

uint64_t __53__BWPocketDetectionNode_renderSampleBuffer_forInput___block_invoke_37(uint64_t a1)
{
  uint64_t v2;
  double v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(double *)(v2 + 264);
  if (dword_1EE6BE938)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 248), "addObserver:", v6, v7);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "activateSessionWithDuration:accidentalActivationMitigationSessionCancellationPolicyClassName:", 0, v3);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 257) = 1;
  return result;
}

void __53__BWPocketDetectionNode_renderSampleBuffer_forInput___block_invoke_38(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__BWPocketDetectionNode_renderSampleBuffer_forInput___block_invoke_2;
  block[3] = &unk_1E491E720;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_sync(MEMORY[0x1E0C80D38], block);
}

uint64_t __53__BWPocketDetectionNode_renderSampleBuffer_forInput___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  double v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(double *)(v2 + 264);
  if (dword_1EE6BE938)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 248), "addObserver:", v6, v7);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "activateSessionWithDuration:accidentalActivationMitigationSessionCancellationPolicyClassName:", 0, v3);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 257) = 1;
  return result;
}

void __53__BWPocketDetectionNode_renderSampleBuffer_forInput___block_invoke_39(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;

  v2 = *(_BYTE **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v2[232])
  {
    if (v3)
      CFRelease(*(CFTypeRef *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v2, "_detectPocket:", v3);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 200) = 1;
}

- (void)didReachEndOfDataForInput:(id)a3
{
  uint64_t v5;
  NSObject *detectionQueue;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  objc_super v9;
  os_log_type_t type;
  int v11;
  _QWORD block[5];
  _QWORD v13[4];
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[BWCoreMotionSuppressionStateMonitor stop](self->_coreMotionSuppressionStateMonitor, "stop");
  -[BWPocketDetectionNode _waitForDetectionToComplete](self, "_waitForDetectionToComplete");
  v5 = MEMORY[0x1E0C809B0];
  if (LOBYTE(self->_cumulativeEnergyInPocketThreshold))
  {
    if (self->_sbAccidentalActivationMitigationUsesDetectionQueue)
      detectionQueue = self->_detectionQueue;
    else
      detectionQueue = MEMORY[0x1E0C80D38];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__BWPocketDetectionNode_didReachEndOfDataForInput___block_invoke;
    block[3] = &unk_1E491E720;
    block[4] = self;
    dispatch_sync(detectionQueue, block);
  }
  if (-[SBSAccidentalActivationMitigationClientSession state](self->_sbAccidentalActivationMitigationClientSession, "state") == 3&& dword_1EE6BE938 != 0)
  {
    v11 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  self->_ppsData.detectionSessionStopTime = CFAbsoluteTimeGetCurrent();
  v14 = *(_OWORD *)&self->_ppsData.detectionSessionStartTime;
  v15 = *(_QWORD *)&self->_ppsData.inPocket;
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __pdn_sendPPSData_block_invoke;
  v13[3] = &__block_descriptor_56_e5_v8__0l;
  dispatch_async(MEMORY[0x1E0C80D38], v13);
  v9.receiver = self;
  v9.super_class = (Class)BWPocketDetectionNode;
  -[BWNode didReachEndOfDataForInput:](&v9, sel_didReachEndOfDataForInput_, a3);
}

uint64_t __51__BWPocketDetectionNode_didReachEndOfDataForInput___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 257))
    return objc_msgSend(*(id *)(v1 + 248), "removeObserver:");
  return result;
}

- (int)_detectPocket:(opaqueCMSampleBuffer *)a3
{
  __CVBuffer *ImageBuffer;
  void *v6;
  CGFloat v7;
  double v8;
  float v9;
  BOOL suppressFacedownSetdownAccidentals;
  float v12;
  CGRect rect;

  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  v6 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  rect.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
  rect.origin.y = v7;
  rect.size.width = (double)CVPixelBufferGetWidth(ImageBuffer);
  rect.size.height = (double)CVPixelBufferGetHeight(ImageBuffer);
  CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06F48]), &rect);
  v12 = 0.0;
  -[BWPocketDetectionFFTProcessor processFFTOnInputPixelBuffer:usingSourceRect:cumulativeScoreOut:](self->_fftProcessor, "processFFTOnInputPixelBuffer:usingSourceRect:cumulativeScoreOut:", ImageBuffer, &v12, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
  self->_cumulativeEnergy = log10f(v12);
  if (-[NSMutableArray count](self->_cumulativeEnergyHistory, "count") == self->_cumulativeEnergyHistoryLength)
    -[NSMutableArray removeObjectAtIndex:](self->_cumulativeEnergyHistory, "removeObjectAtIndex:", 0);
  *(float *)&v8 = self->_cumulativeEnergy;
  -[NSMutableArray addObject:](self->_cumulativeEnergyHistory, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8));
  objc_msgSend((id)-[NSMutableArray valueForKeyPath:](self->_cumulativeEnergyHistory, "valueForKeyPath:", CFSTR("@max.floatValue")), "floatValue");
  self->_cumulativeEnergyFiltered = v9;
  if (self->_coreMotionSuppressionState != 1)
    goto LABEL_9;
  if ((unint64_t)-[NSMutableArray count](self->_cumulativeEnergyHistory, "count") >= 5
    && self->_cumulativeEnergyFiltered < *(float *)&self->_stopDetection)
  {
    goto LABEL_8;
  }
  suppressFacedownSetdownAccidentals = self->_suppressFacedownSetdownAccidentals;
  if (!suppressFacedownSetdownAccidentals)
    goto LABEL_10;
  if (self->_coreMotionFacedownState == 1)
LABEL_8:
    suppressFacedownSetdownAccidentals = 1;
  else
LABEL_9:
    suppressFacedownSetdownAccidentals = 0;
LABEL_10:
  self->_inPocketConsolidatedDecision = suppressFacedownSetdownAccidentals;
  if (a3)
    CFRelease(a3);
  return 0;
}

- (void)accidentalActivationMitigationSessionStateDidChange:(id)a3
{
  uint64_t v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v3 = -[SBSAccidentalActivationMitigationClientSession state](self->_sbAccidentalActivationMitigationClientSession, "state", a3);
  if (v3 == 3)
  {
    if (!dword_1EE6BE938)
      return;
    goto LABEL_9;
  }
  if (v3 == 2)
  {
    if (!dword_1EE6BE938)
      return;
    goto LABEL_9;
  }
  if (v3 == 1 && dword_1EE6BE938)
  {
LABEL_9:
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)_waitForDetectionToComplete
{
  dispatch_sync((dispatch_queue_t)self->_detectionQueue, &__block_literal_global_10);
}

- (int)_allocateResources
{
  uint64_t v2;
  int v4;
  int v5;
  uint64_t v7;
  uint64_t v8;

  v4 = -[BWPocketDetectionFFTProcessor allocateResources](self->_fftProcessor, "allocateResources");
  v5 = v4;
  if (!self->_fftProcessor)
  {
    v8 = v2;
    LODWORD(v7) = 0;
    FigDebugAssert3();
    if (!v5)
      return v5;
    goto LABEL_3;
  }
  if (v4)
LABEL_3:
    -[BWPocketDetectionNode _cleanupResources](self, "_cleanupResources", v7, v8);
  return v5;
}

- (void)_cleanupResources
{
  -[BWPocketDetectionFFTProcessor cleanupResources](self->_fftProcessor, "cleanupResources");
  self->_resourcesAllocated = 0;
}

@end

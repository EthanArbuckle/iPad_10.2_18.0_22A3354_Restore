@implementation BWPreviewTimeMachineSinkNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWPreviewTimeMachineSinkNode)initWithCaptureDevice:(id)a3 processingQueuePriority:(unsigned int)a4 timeMachineCapacity:(int)a5 smartCameraMotionDetectionEnabled:(BOOL)a6 sinkID:(id)a7
{
  _BOOL4 v7;
  BWPreviewTimeMachineSinkNode *v10;
  BWNodeInput *v11;
  BWVideoFormatRequirements *v12;
  BWVideoFormatRequirements *v13;
  _OWORD *v14;
  objc_super v16;

  v7 = a6;
  v16.receiver = self;
  v16.super_class = (Class)BWPreviewTimeMachineSinkNode;
  v10 = -[BWSinkNode initWithSinkID:](&v16, sel_initWithSinkID_, a7);
  if (v10)
  {
    v11 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v10);
    v12 = objc_alloc_init(BWVideoFormatRequirements);
    v13 = v12;
    if (v7)
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v12, "setSupportedPixelFormats:", &unk_1E4A00320);
    -[BWNodeInput setFormatRequirements:](v11, "setFormatRequirements:", v13);
    v10->_timeMachineCapacity = a5;
    -[BWNodeInput setRetainedBufferCount:](v11, "setRetainedBufferCount:", (a5 + 1));
    -[BWNode addInput:](v10, "addInput:", v11);

    objc_msgSend(a3, "setPreviewTimeMachineProcessor:", v10);
    v10->_device = (BWFigVideoCaptureDevice *)a3;
    v10->_processingQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v10->_timeMachineFrames = (NSMutableArray *)objc_opt_new();
    v10->_timeMachineLock._os_unfair_lock_opaque = 0;
    v14 = (_OWORD *)MEMORY[0x1E0CA2E18];
    v10->_earliestAllowedPTS.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    *(_OWORD *)&v10->_earliestAllowedPTS.value = *v14;
    v10->_smartCameraMotionDetectionEnabled = v7;
    -[BWPreviewTimeMachineSinkNode _setupStateMachine]((uint64_t)v10);
  }
  return v10;
}

- (uint64_t)_setupStateMachine
{
  uint64_t v1;
  FigStateMachine *v2;

  if (result)
  {
    v1 = result;
    v2 = -[FigStateMachine initWithLabel:stateCount:initialState:owner:]([FigStateMachine alloc], "initWithLabel:stateCount:initialState:owner:", CFSTR("BWPreviewTimeMachineStateMachine"), 3, 1, result);
    *(_QWORD *)(v1 + 200) = v2;
    -[FigStateMachine setPerformsAtomicStateTransitions:](v2, "setPerformsAtomicStateTransitions:", 0);
    objc_msgSend(*(id *)(v1 + 200), "setLabel:forState:", CFSTR("Running"), 1);
    objc_msgSend(*(id *)(v1 + 200), "setLabel:forState:", CFSTR("Suspending"), 2);
    return objc_msgSend(*(id *)(v1 + 200), "setLabel:forState:", CFSTR("Suspended"), 4);
  }
  return result;
}

- (void)dealloc
{
  id suspendCompletionHandler;
  objc_super v4;

  -[BWFigVideoCaptureDevice setPreviewTimeMachineProcessor:](self->_device, "setPreviewTimeMachineProcessor:", 0);

  suspendCompletionHandler = 0;
  if (self->_suspendCompletionHandler)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    suspendCompletionHandler = self->_suspendCompletionHandler;
  }

  v4.receiver = self;
  v4.super_class = (Class)BWPreviewTimeMachineSinkNode;
  -[BWSinkNode dealloc](&v4, sel_dealloc);
}

- (id)nodeSubType
{
  return CFSTR("SmartCamPreviewTimeMachine");
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  FigCaptureImageMotionDetector *v3;
  double v4;
  objc_super v5;

  v3 = -[FigCaptureImageMotionDetector initWithWidth:height:]([FigCaptureImageMotionDetector alloc], "initWithWidth:height:", -[BWVideoFormat width](-[BWNodeInput videoFormat](self->super.super._input, "videoFormat"), "width"), -[BWVideoFormat height](-[BWNodeInput videoFormat](self->super.super._input, "videoFormat"), "height"));
  self->_motionDetector = v3;
  LODWORD(v4) = 1065017672;
  -[FigCaptureImageMotionDetector setStationaryThreshold:](v3, "setStationaryThreshold:", v4);
  self->_faceMotionDetectionEnabled = 1;
  v5.receiver = self;
  v5.super_class = (Class)BWPreviewTimeMachineSinkNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v5, sel_prepareForCurrentConfigurationToBecomeLive);
}

- (void)setEarliestAllowedPTS:(id *)a3
{
  os_unfair_lock_s *p_timeMachineLock;
  int64_t var3;
  CMTime v7;
  CMTime start;
  CMTimeRange v9;

  p_timeMachineLock = &self->_timeMachineLock;
  os_unfair_lock_lock(&self->_timeMachineLock);
  var3 = a3->var3;
  *(_OWORD *)&self->_earliestAllowedPTS.value = *(_OWORD *)&a3->var0;
  self->_earliestAllowedPTS.epoch = var3;
  start = *(CMTime *)a3;
  v7 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E30];
  CMTimeRangeMake(&v9, &start, &v7);
  -[BWPreviewTimeMachineSinkNode _trimToTimeRange:]((uint64_t)self, (__int128 *)&v9.start.value);
  os_unfair_lock_unlock(p_timeMachineLock);
}

- (uint64_t)_trimToTimeRange:(uint64_t)result
{
  uint64_t v2;
  void *v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;
  __int128 v7;
  __int128 v8;

  if (result)
  {
    v2 = result;
    v3 = *(void **)(result + 184);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __49__BWPreviewTimeMachineSinkNode__trimToTimeRange___block_invoke;
    v5[3] = &__block_descriptor_80_e15_B32__0_8Q16_B24l;
    v4 = a2[1];
    v6 = *a2;
    v7 = v4;
    v8 = a2[2];
    return objc_msgSend(*(id *)(v2 + 184), "removeObjectsAtIndexes:", objc_msgSend(v3, "indexesOfObjectsPassingTest:", v5));
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)earliestAllowedPTS
{
  os_unfair_lock_s *p_timeMachineLock;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  p_timeMachineLock = &self->_timeMachineLock;
  os_unfair_lock_lock(&self->_timeMachineLock);
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = self->_earliestAllowedPTS;
  os_unfair_lock_unlock(p_timeMachineLock);
  return result;
}

- ($2825F4736939C4A6D3AD43837233062D)frameDimensions
{
  BWVideoFormat *v2;
  unsigned int v3;

  v2 = -[BWNodeInput videoFormat](self->super.super._input, "videoFormat");
  v3 = -[BWVideoFormat width](v2, "width");
  return ($2825F4736939C4A6D3AD43837233062D)(v3 | ((unint64_t)-[BWVideoFormat height](v2, "height") << 32));
}

- (void)detectMotionOnStoredFramesWithSmartCameraDiagnostics:(id)a3 completionHandler:(id)a4
{
  NSMutableArray *timeMachineFrames;
  NSObject *processingQueue;
  NSObject *v9;
  _QWORD block[8];
  _QWORD v11[5];

  if (a4)
  {
    if (self->_smartCameraMotionDetectionEnabled)
    {
      os_unfair_lock_lock(&self->_timeMachineLock);
      timeMachineFrames = self->_timeMachineFrames;
      self->_timeMachineFrames = (NSMutableArray *)objc_opt_new();
      os_unfair_lock_unlock(&self->_timeMachineLock);
      processingQueue = self->_processingQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __103__BWPreviewTimeMachineSinkNode_detectMotionOnStoredFramesWithSmartCameraDiagnostics_completionHandler___block_invoke_2;
      block[3] = &unk_1E491F6A8;
      block[4] = timeMachineFrames;
      block[5] = self;
      block[6] = a3;
      block[7] = a4;
      dispatch_async(processingQueue, block);

    }
    else
    {
      v9 = self->_processingQueue;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __103__BWPreviewTimeMachineSinkNode_detectMotionOnStoredFramesWithSmartCameraDiagnostics_completionHandler___block_invoke;
      v11[3] = &unk_1E491ECB8;
      v11[4] = a4;
      dispatch_async(v9, v11);
    }
  }
}

uint64_t __103__BWPreviewTimeMachineSinkNode_detectMotionOnStoredFramesWithSmartCameraDiagnostics_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __103__BWPreviewTimeMachineSinkNode_detectMotionOnStoredFramesWithSmartCameraDiagnostics_completionHandler___block_invoke_2(uint64_t a1)
{
  CGSize v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CVImageBufferRef ImageBuffer;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _OWORD v30[2];
  CGRect v31;
  _BYTE v32[128];
  uint64_t v33;
  CGRect v34;

  v33 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "count"))
    return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 0);
  v2 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  v31.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  v31.size = v2;
  v30[0] = v31.origin;
  v30[1] = v2;
  v3 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v3 + 296)
    && (v4 = -[BWPreviewTimeMachineSinkNode _computeMotionDetectionFaceRectForSampleBuffers:faceMotionRectOut:](v3, *(void **)(a1 + 32), &v31.origin.x), v3 = *(_QWORD *)(a1 + 40), v4))
  {
    v5 = objc_msgSend((id)v3, "frameDimensions");
    v34.size.width = (double)(int)v5;
    v34.size.height = (double)SHIDWORD(v5);
    v34.origin.x = 0.0;
    v34.origin.y = 0.0;
    v31 = CGRectIntersection(v31, v34);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 288), "setRoi:actualROI:", v30);
  }
  else
  {
    objc_msgSend(*(id *)(v3 + 288), "setCentralROIAndGetRect:", v30);
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = *(void **)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v27;
    while (2)
    {
      v11 = 0;
      v12 = v9;
      v9 += v8;
      do
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v6);
        ImageBuffer = CMSampleBufferGetImageBuffer(*(CMSampleBufferRef *)(*((_QWORD *)&v26 + 1) + 8 * v11));
        if (ImageBuffer
          && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 288), "processPixelBuffer:", ImageBuffer))
        {
          v24 = 0u;
          v25 = 0u;
          v22 = 0u;
          v23 = 0u;
          v14 = *(void **)(*(_QWORD *)(a1 + 40) + 288);
          if (v14)
          {
            objc_msgSend(v14, "motionStatistics");
            if (BYTE9(v25))
            {
              if (BYTE8(v25))
              {
                v17 = *(void **)(a1 + 48);
                v18 = v22;
                v19 = v23;
                v20 = v24;
                v21 = v25;
                objc_msgSend(v17, "addMotionStats:", &v18);
                goto LABEL_23;
              }
            }
          }
          if (v12 + v11 == objc_msgSend(*(id *)(a1 + 32), "count") - 1)
          {
            v15 = *(void **)(a1 + 48);
            v18 = v22;
            v19 = v23;
            v20 = v24;
            v21 = v25;
            objc_msgSend(v15, "addMotionStats:", &v18);
          }
        }
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_23:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 288), "resetProcessingState");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (uint64_t)_computeMotionDetectionFaceRectForSampleBuffers:(double *)a3 faceMotionRectOut:
{
  uint64_t v3;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t i;
  const void *v13;
  CFTypeRef v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  CGSize v29;
  double v30;
  CGFloat width;
  CGFloat height;
  double v33;
  double v34;
  int v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  double v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat x;
  CGFloat y;
  double MidX;
  double v50;
  double v51;
  double v52;
  double v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  int v57;
  double v58;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v66;
  CGAffineTransform v67;
  CGRect rect;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;

  v75 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (!*(_BYTE *)(a1 + 298))
  {
    fig_log_get_emitter();
    v55 = v3;
    LODWORD(v54) = 0;
    FigDebugAssert3();
  }
  v6 = (void *)objc_opt_new();
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v7 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v61;
    v11 = (const __CFString *)*MEMORY[0x1E0D05CB0];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v61 != v10)
          objc_enumerationMutation(a2);
        v13 = *(const void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        v14 = CMGetAttachment(v13, v11, 0);
        if (v14)
        {
          objc_msgSend(v6, "addObject:", v14);
          if (!v9)
            v9 = objc_msgSend((id)CMGetAttachment(v13, CFSTR("UprightExifOrientation"), 0), "intValue");
        }
      }
      v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
    }
    while (v8);
  }
  if (objc_msgSend(v6, "count", v54, v55))
  {
    v15 = objc_msgSend((id)a1, "frameDimensions");
    if (v6 && (v16 = v15, v17 = *(_DWORD *)(a1 + 300), v18 = *(unsigned __int8 *)(a1 + 304), objc_msgSend(v6, "count")))
    {
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      v19 = (void *)objc_msgSend(v6, "reverseObjectEnumerator");
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
      if (v20)
      {
        v21 = v20;
        v56 = v18;
        v57 = v17;
        v22 = *(_QWORD *)v70;
        v23 = *MEMORY[0x1E0D06AA8];
        v24 = *MEMORY[0x1E0D06AA0];
        v25 = MEMORY[0x1E0C9D628];
LABEL_19:
        v26 = 0;
        while (1)
        {
          if (*(_QWORD *)v70 != v22)
            objc_enumerationMutation(v19);
          v27 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v26);
          if (objc_msgSend((id)objc_msgSend(v27, "objectForKeyedSubscript:", v23), "intValue") == 2)
          {
            v28 = (void *)objc_msgSend(v27, "objectForKeyedSubscript:", v24);
            v29 = *(CGSize *)(v25 + 16);
            rect.origin = *(CGPoint *)v25;
            rect.size = v29;
            if (CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v28, "firstObject"), &rect))
              break;
          }
          if (v21 == ++v26)
          {
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
            if (v21)
              goto LABEL_19;
            goto LABEL_40;
          }
        }
        memset(&v67, 0, sizeof(v67));
        BWGetAffineTransformFromSensorToPreview(v57, v56 != 0, v27, (uint64_t)&v67);
        v30 = (double)SHIDWORD(v16);
        CGAffineTransformMakeScale(&t2, (double)(int)v16, (double)SHIDWORD(v16));
        t1 = v67;
        CGAffineTransformConcat(&v66, &t1, &t2);
        v67 = v66;
        v76 = CGRectApplyAffineTransform(rect, &v66);
        width = v76.size.width;
        height = v76.size.height;
        v33 = v76.size.width * 1.4;
        v34 = v76.size.height * 1.4;
        if ((int)v16 <= SHIDWORD(v16))
          v35 = HIDWORD(v16);
        else
          v35 = v16;
        v36 = (double)v35;
        if (v33 <= v34)
          v37 = v76.size.height * 1.4;
        else
          v37 = v76.size.width * 1.4;
        if (v33 >= v34)
          v38 = v76.size.height * 1.4;
        else
          v38 = v76.size.width * 1.4;
        v39 = v36 * 0.5;
        v40 = v36 * 0.5 / v37;
        if (v37 <= v36 * 0.5)
          v40 = 1.0;
        v41 = v36 * 0.25;
        if (v38 < v41)
        {
          if (v37 > v39)
            goto LABEL_40;
          v40 = v41 / v38;
        }
        v58 = v33 * v40;
        v44 = v34 * v40;
        v45 = width;
        v46 = height;
        x = v76.origin.x;
        y = v76.origin.y;
        MidX = CGRectGetMidX(v76);
        v77.origin.x = x;
        v77.origin.y = y;
        v77.size.width = width;
        v77.size.height = height;
        v50 = MidX - v58 * 0.5;
        v51 = CGRectGetMidY(v77) - v44 * 0.5;
        v78.origin.x = 0.0;
        v78.origin.y = 0.0;
        v78.size.width = (double)(int)v16;
        v78.size.height = (double)SHIDWORD(v16);
        v82.origin.x = v50;
        v82.origin.y = v51;
        v82.size.width = v58;
        v82.size.height = v44;
        v79 = CGRectIntersection(v78, v82);
        v83.origin.x = v50;
        v83.origin.y = v51;
        v83.size.width = v58;
        v83.size.height = v44;
        if (!CGRectEqualToRect(v79, v83))
        {
          v52 = (double)(int)v16;
          if (v50 >= 0.0)
            v53 = v50;
          else
            v53 = 0.0;
          v80.origin.x = v53;
          v80.origin.y = v51;
          v80.size.width = v58;
          v80.size.height = v44;
          if (CGRectGetMaxX(v80) <= v52)
            v50 = v53;
          else
            v50 = v52 - v58;
          if (v51 < 0.0)
            v51 = 0.0;
          v81.origin.x = v50;
          v81.origin.y = v51;
          v81.size.width = v58;
          v81.size.height = v44;
          if (CGRectGetMaxY(v81) > v30)
            v51 = v30 - v44;
        }
        if (a3)
        {
          *a3 = v50;
          a3[1] = v51;
          v42 = 1;
          a3[2] = v58;
          a3[3] = v44;
        }
        else
        {
          v42 = 1;
        }
        goto LABEL_41;
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
LABEL_40:
  v42 = 0;
LABEL_41:

  return v42;
}

- (void)suspendWithPTSRange:(id *)a3 completionHandler:(id)a4
{
  int v7;
  NSObject *processingQueue;
  _BOOL4 v9;
  __int128 v10;
  __int128 v11;
  id suspendCompletionHandler;
  _QWORD block[5];

  if ((a3->var0.var2 & 1) == 0 || (a3->var1.var2 & 1) == 0 || a3->var1.var3 || a3->var1.var0 < 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v7 = 1;
    if (!a4)
      return;
    goto LABEL_5;
  }
  os_unfair_lock_lock(&self->_timeMachineLock);
  v9 = -[FigStateMachine transitionToState:fromState:](self->_stateMachine, "transitionToState:fromState:", 2, 1);
  if (v9)
  {
    v11 = *(_OWORD *)&a3->var0.var3;
    v10 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&self->_requestedSuspendPTSRange.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&self->_requestedSuspendPTSRange.start.epoch = v11;
    *(_OWORD *)&self->_requestedSuspendPTSRange.duration.timescale = v10;
    suspendCompletionHandler = self->_suspendCompletionHandler;
    if (suspendCompletionHandler)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      suspendCompletionHandler = self->_suspendCompletionHandler;
    }

    self->_suspendCompletionHandler = (id)objc_msgSend(a4, "copy");
  }
  v7 = !v9;
  os_unfair_lock_unlock(&self->_timeMachineLock);
  if (a4)
  {
LABEL_5:
    if (v7)
    {
      processingQueue = self->_processingQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __70__BWPreviewTimeMachineSinkNode_suspendWithPTSRange_completionHandler___block_invoke;
      block[3] = &unk_1E491ECB8;
      block[4] = a4;
      dispatch_async(processingQueue, block);
    }
  }
}

uint64_t __70__BWPreviewTimeMachineSinkNode_suspendWithPTSRange_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t (*v7)(uint64_t, _QWORD, _QWORD, _QWORD, _OWORD *, uint64_t);
  __int128 v8;
  _OWORD v10[3];

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _OWORD *, uint64_t))(v6 + 16);
  v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v10[0] = *MEMORY[0x1E0C9BAA8];
  v10[1] = v8;
  v10[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return v7(v6, 0, 0, 0, v10, a6);
}

- (void)resume
{
  os_unfair_lock_s *p_timeMachineLock;

  p_timeMachineLock = &self->_timeMachineLock;
  os_unfair_lock_lock(&self->_timeMachineLock);
  -[FigStateMachine currentState](self->_stateMachine, "currentState");
  -[FigStateMachine transitionToState:](self->_stateMachine, "transitionToState:", 1);
  os_unfair_lock_unlock(p_timeMachineLock);
}

- (void)didReachEndOfDataForInput:(id)a3
{
  NSObject *processingQueue;
  objc_super v6;
  _QWORD block[5];

  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__BWPreviewTimeMachineSinkNode_didReachEndOfDataForInput___block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_sync(processingQueue, block);
  v6.receiver = self;
  v6.super_class = (Class)BWPreviewTimeMachineSinkNode;
  -[BWSinkNode didReachEndOfDataForInput:](&v6, sel_didReachEndOfDataForInput_, a3);
}

void __58__BWPreviewTimeMachineSinkNode_didReachEndOfDataForInput___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, _QWORD, _QWORD, _QWORD, _OWORD *);
  __int128 v5;
  _OWORD v6[3];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "setPreviewTimeMachineProcessor:", 0);

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) = 0;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 192));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 280);
  if (v3)
  {
    v4 = *(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _OWORD *))(v3 + 16);
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v6[0] = *MEMORY[0x1E0C9BAA8];
    v6[1] = v5;
    v6[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v4(v3, 0, 0, 0, v6);

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280) = 0;
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 184), "removeAllObjects");

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 192));
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  os_unfair_lock_s *p_timeMachineLock;
  unsigned int v7;
  _BOOL4 v8;
  unsigned int v9;
  CFTypeRef v10;
  CVImageBufferRef ImageBuffer;
  CMTimeEpoch v12;
  __int128 v13;
  double SampleBufferPTS;
  CMTimeRange *p_start;
  CMTimeRange *p_lhs;
  $95D729B680665BEAEFA1D6FCA8238556 *p_earliestAllowedPTS;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  int v21;
  int v22;
  int32_t v23;
  id suspendCompletionHandler;
  NSObject *processingQueue;
  __int128 v26;
  _QWORD block[6];
  CMTimeRange v28;
  CMTime v29;
  BOOL v30;
  CMTime v31;
  CMTime time;
  CMTimeRange rhs;
  CMTimeRange lhs;
  CMTimeRange start;
  CMTime v36;
  CMTime v37;
  CMTimeRange time2;
  __int128 v39;
  CMTimeEpoch epoch;
  CMTime v41;
  CMTime time1;

  p_timeMachineLock = &self->_timeMachineLock;
  os_unfair_lock_lock(&self->_timeMachineLock);
  v7 = -[FigStateMachine currentState](self->_stateMachine, "currentState");
  if (v7 == 4)
  {
    os_unfair_lock_unlock(p_timeMachineLock);
    v8 = 0;
  }
  else
  {
    v9 = v7;
    if ((self->_earliestAllowedPTS.flags & 1) != 0
      && (ptmsn_getSampleBufferPTS(a3, (uint64_t)&time1),
          *(_OWORD *)&time2.start.value = *(_OWORD *)&self->_earliestAllowedPTS.value,
          time2.start.epoch = self->_earliestAllowedPTS.epoch,
          CMTimeCompare(&time1, &time2.start) < 0)
      || (-[NSMutableArray addObject:](self->_timeMachineFrames, "addObject:", a3),
          -[NSMutableArray count](self->_timeMachineFrames, "count") <= (unint64_t)self->_timeMachineCapacity))
    {
      v8 = v9 == 2;
      os_unfair_lock_unlock(p_timeMachineLock);
    }
    else
    {
      v10 = CFRetain((CFTypeRef)-[NSMutableArray firstObject](self->_timeMachineFrames, "firstObject"));
      -[NSMutableArray removeObjectAtIndex:](self->_timeMachineFrames, "removeObjectAtIndex:", 0);
      v8 = v9 == 2;
      os_unfair_lock_unlock(p_timeMachineLock);
      if (v10)
        CFRelease(v10);
    }
  }
  if (!self->_haveFrameRotationAndMirror)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    if (ImageBuffer)
    {
      BWGetPixelBufferRotationAndMirroring(ImageBuffer, &self->_frameRotationDegrees, &self->_frameMirrored);
      self->_haveFrameRotationAndMirror = 1;
    }
  }
  if (v8)
  {
    memset(&v41, 0, sizeof(v41));
    CMTimeMake(&v41, 1, 1000);
    os_unfair_lock_lock(p_timeMachineLock);
    if (-[FigStateMachine currentState](self->_stateMachine, "currentState") == 2)
    {
      v26 = *MEMORY[0x1E0CA2E68];
      v39 = *MEMORY[0x1E0CA2E68];
      v12 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      epoch = v12;
      v13 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
      *(_OWORD *)&time2.start.value = *MEMORY[0x1E0CA2E40];
      *(_OWORD *)&time2.start.epoch = v13;
      *(_OWORD *)&time2.duration.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
      if (!-[NSMutableArray count](self->_timeMachineFrames, "count"))
      {
        p_earliestAllowedPTS = &self->_earliestAllowedPTS;
        if ((self->_earliestAllowedPTS.flags & 1) == 0)
        {
LABEL_20:
          *(_OWORD *)&lhs.start.value = *(_OWORD *)&time2.start.value;
          lhs.start.epoch = time2.start.epoch;
          rhs.start = v41;
          CMTimeSubtract(&start.start, &lhs.start, &rhs.start);
          *(_OWORD *)&time2.start.value = *(_OWORD *)&start.start.value;
          time2.start.epoch = start.start.epoch;
          start.start = v41;
          CMTimeMultiply(&v36, &start.start, 2);
          lhs.start = time2.duration;
          CMTimeAdd(&start.start, &lhs.start, &v36);
          time2.duration = start.start;
          v18 = *(_OWORD *)&self->_requestedSuspendPTSRange.start.epoch;
          *(_OWORD *)&start.start.value = *(_OWORD *)&self->_requestedSuspendPTSRange.start.value;
          *(_OWORD *)&start.start.epoch = v18;
          v20 = *(_OWORD *)&self->_requestedSuspendPTSRange.start.value;
          v19 = *(_OWORD *)&self->_requestedSuspendPTSRange.start.epoch;
          *(_OWORD *)&start.duration.timescale = *(_OWORD *)&self->_requestedSuspendPTSRange.duration.timescale;
          lhs = time2;
          *(_OWORD *)&rhs.start.value = v20;
          *(_OWORD *)&rhs.start.epoch = v19;
          *(_OWORD *)&rhs.duration.timescale = *(_OWORD *)&self->_requestedSuspendPTSRange.duration.timescale;
          v21 = CMTimeRangeContainsTimeRange(&lhs, &rhs);
          lhs = start;
          CMTimeRangeGetEnd(&time, &lhs);
          lhs = time2;
          v22 = CMTimeRangeContainsTime(&lhs, &time);
          lhs = start;
          CMTimeRangeGetEnd(&v31, &lhs);
          *(_OWORD *)&lhs.start.value = v39;
          lhs.start.epoch = epoch;
          v23 = CMTimeCompare(&v31, &lhs.start);
          if (v21 || v22 || v23 < 0)
          {
            -[FigStateMachine transitionToState:](self->_stateMachine, "transitionToState:", 4);
            suspendCompletionHandler = self->_suspendCompletionHandler;
            self->_suspendCompletionHandler = 0;
            if (suspendCompletionHandler)
            {
              processingQueue = self->_processingQueue;
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __60__BWPreviewTimeMachineSinkNode_renderSampleBuffer_forInput___block_invoke;
              block[3] = &unk_1E491F6D0;
              v28 = start;
              v29 = v41;
              block[4] = self;
              block[5] = suspendCompletionHandler;
              v30 = v21 != 0;
              dispatch_async(processingQueue, block);
            }
          }
          goto LABEL_25;
        }
        v39 = *(_OWORD *)&p_earliestAllowedPTS->value;
        epoch = self->_earliestAllowedPTS.epoch;
        *(_OWORD *)&start.start.value = *(_OWORD *)&p_earliestAllowedPTS->value;
        start.start.epoch = self->_earliestAllowedPTS.epoch;
        *(_OWORD *)&lhs.start.value = v26;
        lhs.start.epoch = v12;
        p_start = &start;
        p_lhs = &lhs;
LABEL_19:
        CMTimeRangeMake(&time2, &p_start->start, &p_lhs->start);
        goto LABEL_20;
      }
      SampleBufferPTS = ptmsn_getSampleBufferPTS((void *)-[NSMutableArray firstObject](self->_timeMachineFrames, "firstObject"), (uint64_t)&v39);
      memset(&start, 0, 24);
      ptmsn_getSampleBufferPTS((void *)-[NSMutableArray lastObject](self->_timeMachineFrames, "lastObject", SampleBufferPTS), (uint64_t)&start);
      *(_OWORD *)&lhs.start.value = v39;
      lhs.start.epoch = epoch;
      *(_OWORD *)&rhs.start.value = *(_OWORD *)&start.start.value;
      rhs.start.epoch = start.start.epoch;
      if (CMTimeCompare(&lhs.start, &rhs.start) <= 0)
      {
        *(_OWORD *)&lhs.start.value = *(_OWORD *)&start.start.value;
        lhs.start.epoch = start.start.epoch;
        *(_OWORD *)&rhs.start.value = v39;
        rhs.start.epoch = epoch;
        CMTimeSubtract(&v37, &lhs.start, &rhs.start);
        *(_OWORD *)&lhs.start.value = v39;
        lhs.start.epoch = epoch;
        p_start = &lhs;
        p_lhs = (CMTimeRange *)&v37;
        goto LABEL_19;
      }
      fig_log_get_emitter();
      FigDebugAssert3();
    }
LABEL_25:
    os_unfair_lock_unlock(p_timeMachineLock);
  }
}

void __60__BWPreviewTimeMachineSinkNode_renderSampleBuffer_forInput___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  __int128 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t i;
  void *v14;
  CFTypeRef v15;
  __int128 v16;
  uint64_t v17;
  void (*v18)(void);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CMTime time;
  CMTimeRange lhs;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CMTime v29;
  CMTime rhs;
  CMTime v31[2];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 192));
  v4 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&v31[0].value = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&v31[0].epoch = v4;
  v5 = *(_OWORD *)(a1 + 96);
  *(_OWORD *)&v31[1].timescale = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&lhs.start.value = *(_OWORD *)&v31[0].value;
  lhs.start.epoch = *(_QWORD *)(a1 + 64);
  *(_OWORD *)&rhs.value = v5;
  rhs.epoch = *(_QWORD *)(a1 + 112);
  CMTimeSubtract(v31, &lhs.start, &rhs);
  *(_OWORD *)&lhs.start.value = *(_OWORD *)(a1 + 96);
  lhs.start.epoch = *(_QWORD *)(a1 + 112);
  CMTimeMultiply(&v29, &lhs.start, 2);
  rhs = v31[1];
  CMTimeAdd(&lhs.start, &rhs, &v29);
  v31[1] = lhs.start;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v22 = a1;
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v26;
    v12 = (const __CFString *)*MEMORY[0x1E0D05CB0];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        memset(&rhs, 0, sizeof(rhs));
        ptmsn_getSampleBufferPTS(v14, (uint64_t)&rhs);
        lhs = *(CMTimeRange *)&v31[0].value;
        time = rhs;
        if (CMTimeRangeContainsTime(&lhs, &time))
        {
          v15 = CMGetAttachment(v14, v12, 0);
          if (v15)
          {
            objc_msgSend(v2, "addObject:", v15);
            objc_msgSend(v3, "addObject:", v14);
          }
        }
        else
        {
          objc_msgSend(v6, "addIndex:", v10 + i);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
      v10 += i;
    }
    while (v9);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(v22 + 32) + 184), "removeObjectsAtIndexes:", v6);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(v22 + 32) + 192));
  v16 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v31[0].value = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v31[0].epoch = v16;
  *(_OWORD *)&v31[1].timescale = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  if (objc_msgSend(v2, "count"))
  {
    v17 = *(_QWORD *)(v22 + 32);
    if (!*(_BYTE *)(v17 + 298))
    {
      fig_log_get_emitter();
      v20 = v21;
      LODWORD(v19) = 0;
      FigDebugAssert3();
      v17 = *(_QWORD *)(v22 + 32);
    }
    BWGetAffineTransformFromSensorToPreview(*(_DWORD *)(v17 + 300), *(unsigned __int8 *)(v17 + 304), (void *)objc_msgSend(v2, "lastObject", v19, v20), (uint64_t)v31);
  }
  v18 = *(void (**)(void))(*(_QWORD *)(v22 + 40) + 16);
  lhs = *(CMTimeRange *)&v31[0].value;
  v18();

}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  NSMutableArray *timeMachineFrames;
  objc_super v8;

  if (objc_msgSend((id)objc_msgSend(a3, "reason"), "isEqualToString:", 0x1E494EF98))
  {
    os_unfair_lock_lock(&self->_timeMachineLock);
    if (-[NSMutableArray count](self->_timeMachineFrames, "count"))
    {
      timeMachineFrames = self->_timeMachineFrames;
      self->_timeMachineFrames = (NSMutableArray *)objc_opt_new();
    }
    else
    {
      timeMachineFrames = 0;
    }
    os_unfair_lock_unlock(&self->_timeMachineLock);

  }
  v8.receiver = self;
  v8.super_class = (Class)BWPreviewTimeMachineSinkNode;
  -[BWNode handleDroppedSample:forInput:](&v8, sel_handleDroppedSample_forInput_, a3, a4);
}

BOOL __49__BWPreviewTimeMachineSinkNode__trimToTimeRange___block_invoke(_OWORD *a1, void *a2)
{
  __int128 v3;
  CMTimeRange v5;
  CMTime time;

  ptmsn_getSampleBufferPTS(a2, (uint64_t)&time);
  v3 = a1[3];
  *(_OWORD *)&v5.start.value = a1[2];
  *(_OWORD *)&v5.start.epoch = v3;
  *(_OWORD *)&v5.duration.timescale = a1[4];
  return CMTimeRangeContainsTime(&v5, &time) == 0;
}

@end

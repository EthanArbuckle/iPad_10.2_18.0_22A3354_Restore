@implementation BWImageQueueSinkNode

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  const __CFDictionary *v6;
  __CVBuffer *ImageBuffer;
  IOSurfaceRef IOSurface;
  BOOL v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v11;
  NSObject *v12;
  int liveSyncStrategy;
  double InsertionTime;
  double Seconds;
  Float64 v16;
  CFTimeInterval v17;
  unint64_t v18;
  BWStats *frameDisplayLatencyStats;
  double v20;
  double v21;
  CFTypeRef v22;
  int v23;
  double v24;
  uint64_t inserted;
  _QWORD *v26;
  void *v27;
  uint64_t v28;
  int savedSyncStrategy;
  CMCaptureFrameSenderService *frameSender;
  BWImageQueueSinkNodePreviewTapDelegate *previewTapDelegate;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  CMTime v36;
  CMTime v37;
  CMTime v38;
  CMTime v39;
  CMTime lhs;
  os_log_type_t type;
  int v42;
  CMTime v43;
  CMTime rhs;
  CMTime time;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  memset(&v43, 0, sizeof(v43));
  if (a3)
  {
    v6 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05D00], 0);
    CMTimeMakeFromDictionary(&v43, v6);
  }
  else
  {
    v43 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  }
  if ((v43.flags & 1) == 0)
  {
    CMSampleBufferGetPresentationTimeStamp(&time, a3);
    v43 = time;
  }
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    time = v43;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  if (a3)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    IOSurface = CVPixelBufferGetIOSurface(ImageBuffer);
    pthread_mutex_lock((pthread_mutex_t *)self->_surfaceRegistrationMutex);
    v35 = -[BWImageQueueSinkNode _bufferIDForSurface:]((uint64_t)self, (uint64_t)IOSurface);
    pthread_mutex_unlock((pthread_mutex_t *)self->_surfaceRegistrationMutex);
    ++self->_numFramesReceived;
    if (objc_msgSend((id)CMGetAttachment(a3, CFSTR("FrameIsBlackened"), 0), "BOOLValue"))
    {
      v9 = 1;
      if (!self->_receivingBlackenedFrames && dword_1ECFE9710)
      {
        v42 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        v9 = 1;
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    else
    {
      v9 = 0;
      if (self->_receivingBlackenedFrames && dword_1ECFE9710)
      {
        v42 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v9 = 0;
      }
    }
    self->_receivingBlackenedFrames = v9;
    if (!self->_didCallFirstFrameAtHostTimeCallback)
    {
      if ((self->_firstFramePTS.flags & 1) == 0)
        self->_firstFramePTS = ($95D729B680665BEAEFA1D6FCA8238556)v43;
      if (self->_firstDisplayedFrameHostTime)
      {
        if (*MEMORY[0x1E0CA1FC0])
        {
          mach_absolute_time();
          if (*MEMORY[0x1E0CA1FC0] == 1)
          {
            FigHostTimeToNanoseconds();
            time = (CMTime)self->_firstDisplayedFramePTS;
            CMTimeGetSeconds(&time);
            kdebug_trace();
          }
        }
        if (!self->_didCallFirstFrameCallback)
        {
          -[BWImageQueueSinkNodePreviewTapDelegate imageQueueSinkNodeDidDisplayFirstFrame:](self->_previewTapDelegate, "imageQueueSinkNodeDidDisplayFirstFrame:", self);
          self->_didCallFirstFrameCallback = 1;
          if (dword_1ECFE9710)
          {
            v42 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            v34 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
        }
        -[BWImageQueueSinkNodePreviewTapDelegate imageQueueSinkNodeDidDisplayFirstFrame:atHostTime:](self->_previewTapDelegate, "imageQueueSinkNodeDidDisplayFirstFrame:atHostTime:", self, self->_firstDisplayedFrameHostTime, v32, v33);
        self->_didCallFirstFrameAtHostTimeCallback = 1;
      }
    }
    if (self->_firstOverCaptureDisplayedFrameHostTime && *MEMORY[0x1E0CA1FC0] && !self->_didLogFirstOverCaptureFrame)
    {
      mach_absolute_time();
      if (*MEMORY[0x1E0CA1FC0] == 1)
      {
        FigHostTimeToNanoseconds();
        time = *(CMTime *)(&self->_didCallFirstFrameCallback + 3);
        CMTimeGetSeconds(&time);
        kdebug_trace();
      }
      self->_didLogFirstOverCaptureFrame = 1;
    }
    if (!self->_didCallFirstFrameCallback
      && self->_numFramesReceived >= self->_numFramesReceivedBeforeFirstDisplayTimeout)
    {
      -[BWImageQueueSinkNodePreviewTapDelegate imageQueueSinkNodeDidDisplayFirstFrame:](self->_previewTapDelegate, "imageQueueSinkNodeDidDisplayFirstFrame:", self);
      self->_didCallFirstFrameCallback = 1;
      if (dword_1ECFE9710)
      {
        v42 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    if (self->_fenceSupportEnabled)
    {
      if (self->_fencePortGenerationIDWillChange)
      {
        self->_fencePortGenerationIDWillChange = 0;
        self->_framesSinceLastFenceIDWillChange = 0;
        if (!self->_savedSyncStrategy)
          self->_savedSyncStrategy = self->_liveSyncStrategy;
        self->_liveSyncStrategy = 1;
      }
      else
      {
        savedSyncStrategy = self->_savedSyncStrategy;
        if (savedSyncStrategy && self->_framesSinceLastFenceIDWillChange >= 16 && self->_framesSinceLastFence >= 16)
        {
          self->_liveSyncStrategy = savedSyncStrategy;
          self->_savedSyncStrategy = 0;
        }
      }
      ++self->_framesSinceLastFenceIDWillChange;
    }
    liveSyncStrategy = self->_liveSyncStrategy;
    if (liveSyncStrategy == 3)
    {
      time = v43;
      Seconds = CMTimeGetSeconds(&time);
      InsertionTime = -[BWImageQueueSinkNode _displayTimeSyncedWithFramePTS:]((uint64_t)self, Seconds);
    }
    else
    {
      if (liveSyncStrategy != 2)
      {
        v16 = -1.0e10;
        goto LABEL_51;
      }
      if (self->_resetPreviewSynchronizerOnNextFrame)
      {
        BWPreviewSynchronizerReset((uint64_t)self->_previewSynchronizer);
        self->_resetPreviewSynchronizerOnNextFrame = 0;
      }
      InsertionTime = BWPreviewSynchronizerGetInsertionTime((double *)self->_previewSynchronizer, a3);
    }
    v16 = InsertionTime;
LABEL_51:
    v17 = CACurrentMediaTime();
    if (self->_imageQueueCurrentFreeSlots <= self->_imageQueueRequiredFreeSlots)
    {
      v18 = CAImageQueueCollect();
      self->_imageQueueCurrentFreeSlots = v18;
      if (v18 <= self->_imageQueueRequiredFreeSlots)
        -[BWImageQueueSinkNode _collectUnconsumedBuffersWithReason:collectMostFutureBuffers:]((uint64_t)self);
    }
    if (-[BWFigVideoCaptureDevice cinematicVideoEnabled](self->_captureDevice, "cinematicVideoEnabled", v32, v33))
    {
      memset(&time, 0, sizeof(time));
      CMTimeMakeWithSeconds(&lhs, v16, 1000000000);
      rhs = v43;
      CMTimeSubtract(&time, &lhs, &rhs);
      frameDisplayLatencyStats = self->_frameDisplayLatencyStats;
      rhs = time;
      -[BWStats addDataPoint:](frameDisplayLatencyStats, "addDataPoint:", CMTimeGetSeconds(&rhs));
      -[BWStats average](self->_frameDisplayLatencyStats, "average");
      *(float *)&v20 = v20;
      -[BWFigVideoCaptureDevice setCinematicVideoAverageRenderingTime:](self->_captureDevice, "setCinematicVideoAverageRenderingTime:", v20);
      -[BWStats max](self->_frameDisplayLatencyStats, "max");
      *(float *)&v21 = v21;
      -[BWFigVideoCaptureDevice setCinematicVideoWorstCaseRenderingTime:](self->_captureDevice, "setCinematicVideoWorstCaseRenderingTime:", v21);
    }
    v22 = CMGetAttachment(a3, CFSTR("CAContextFencePortSendRight"), 0);
    v23 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D060A8]), "BOOLValue");
    if (self->_imageQueueCurrentFreeSlots > self->_imageQueueRequiredFreeSlots || v22 || v23)
    {
      BWSampleBufferRemoveAllAttachedMedia(a3);
      time = v43;
      v26 = -[BWImageQueueSinkNode _createContextForBuffer:bufferId:framePTS:]((uint64_t)self, a3, v35, (__int128 *)&time.value);
      if (self->_fenceSupportEnabled)
      {
        v27 = (void *)CMGetAttachment(a3, CFSTR("CAContextFencePortSendRight"), 0);
        v28 = objc_msgSend((id)CMGetAttachment(a3, CFSTR("CAContextFencePortGenerationID"), 0), "longLongValue");
        objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
        objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);
        if (v27 && v28 > self->_lastFencedGenerationID)
        {
          -[CAContext setFencePort:](self->_imageQueueContext, "setFencePort:", objc_msgSend(v27, "port"));
          objc_msgSend(v27, "port");
          objc_msgSend(v27, "invalidate");
          self->_lastFencedGenerationID = v28;
          self->_framesSinceLastFence = 0;
        }
        ++self->_framesSinceLastFence;
        ++self->_framesSinceLastFenceIDWillChange;
      }
      if (*MEMORY[0x1E0CA1FC0] == 1)
      {
        time = v43;
        CMTimeGetSeconds(&time);
        CMTimeMakeWithSeconds(&v38, v17, 1000000000);
        time = v43;
        CMTimeSubtract(&v39, &v38, &time);
        time = v39;
        CMTimeGetSeconds(&time);
        CMTimeMakeWithSeconds(&v36, v16, 1000000000);
        time = v43;
        CMTimeSubtract(&v37, &v36, &time);
        time = v37;
        CMTimeGetSeconds(&time);
        kdebug_trace();
        if (*MEMORY[0x1E0CA1FC0] == 1)
        {
          time = v43;
          CMTimeGetSeconds(&time);
          kdebug_trace();
        }
      }
      FigCaptureTransformFlipAppliedBeforeRotationToAfter(self->_transform.mirrored, self->_transform.rotationDegrees);
      inserted = CAImageQueueInsertImageWithRotation();
      if ((inserted & 1) != 0)
      {
        os_unfair_lock_lock(&self->_clientPIDLock);
        frameSender = self->_frameSender;
        if (frameSender)
          -[CMCaptureFrameSenderService sendFrame:](frameSender, "sendFrame:", a3);
        else
          -[BWLimitedGMErrorLogger logErrorNumber:errorString:](self->_limitedGMErrorLogger, "logErrorNumber:errorString:", 0xFFFFFFFFLL, CFSTR("Frame sender is nil during render.  Skipping sending frame."));
        os_unfair_lock_unlock(&self->_clientPIDLock);
        pthread_mutex_lock((pthread_mutex_t *)self->_surfaceRegistrationMutex);
        -[NSMutableArray addObject:](self->_bufferIDsInQueue, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v35));
        pthread_mutex_unlock((pthread_mutex_t *)self->_surfaceRegistrationMutex);
      }
      else
      {
        iqsn_cleanupBufferContext((uint64_t)v26);
        iqsn_releaseBufferContext(v26);
      }
      if (self->_fenceSupportEnabled)
        objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      self->_imageQueueCurrentFreeSlots = CAImageQueueCollect();
      v24 = -[BWImageQueueSinkNode _processReleasedContexts]((uint64_t)self);
      if ((inserted & 1) != 0)
        goto LABEL_83;
    }
    else
    {
      inserted = 0;
    }
    if (*MEMORY[0x1E0CA1FC0] == 1)
    {
      time = v43;
      CMTimeGetSeconds(&time);
      kdebug_trace();
    }
LABEL_83:
    previewTapDelegate = self->_previewTapDelegate;
    if (previewTapDelegate)
      -[BWImageQueueSinkNodePreviewTapDelegate imageQueueSinkNode:didAttemptToEnqueuePreviewSampleBuffer:withSuccess:](previewTapDelegate, "imageQueueSinkNode:didAttemptToEnqueuePreviewSampleBuffer:withSuccess:", self, a3, inserted, v24);
  }
}

- (double)_processReleasedContexts
{
  unint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  double result;
  CMTime v7;
  CMTime time1;

  if (a1)
  {
    do
    {
      if (!*(_QWORD *)(a1 + 432))
        break;
      v2 = 0;
      v3 = 0;
      v4 = 0;
      do
      {
        v5 = *(_QWORD *)(*(_QWORD *)(a1 + 424) + 8 * v2);
        if (*(_QWORD *)(v5 + 24) && *(_DWORD *)(v5 + 120) == 1)
        {
          if (!v3 || (time1 = *(CMTime *)(v3 + 32), v7 = *(CMTime *)(v5 + 32), CMTimeCompare(&time1, &v7) >= 1))
            v3 = *(_QWORD *)(*(_QWORD *)(a1 + 424) + 8 * v2);
          v4 = 1;
        }
        ++v2;
      }
      while (*(_QWORD *)(a1 + 432) > v2);
      if (v3)
        result = -[BWImageQueueSinkNode _processBufferContext:](a1, v3);
    }
    while ((v4 & 1) != 0);
  }
  return result;
}

- (_DWORD)_createContextForBuffer:(uint64_t)a3 bufferId:(__int128 *)a4 framePTS:
{
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  unint64_t v12;
  __int128 v13;

  if (!a1)
    return 0;
  v8 = *(_QWORD *)(a1 + 432);
  if (!v8)
    goto LABEL_10;
  v9 = 0;
  do
  {
    v10 = *(_QWORD *)(a1 + 424);
    if (*(_QWORD *)(*(_QWORD *)(v10 + 8 * v9) + 24))
      v11 = 0;
    else
      v11 = *(_DWORD **)(v10 + 8 * v9);
    ++v9;
  }
  while (v8 > v9 && !v11);
  if (!v11)
  {
LABEL_10:
    v12 = v8 + 1;
    *(_QWORD *)(a1 + 432) = v12;
    *(_QWORD *)(a1 + 424) = malloc_type_realloc(*(void **)(a1 + 424), 8 * v12, 0x2004093837F09uLL);
    v11 = malloc_type_calloc(0x80uLL, 1uLL, 0xC7BFA803uLL);
    *(_QWORD *)(*(_QWORD *)(a1 + 424) + 8 * *(_QWORD *)(a1 + 432) - 8) = v11;
    v11[30] = 1;
  }
  *(_QWORD *)v11 = cf;
  CFRetain(cf);
  *((_QWORD *)v11 + 2) = a3;
  *((_QWORD *)v11 + 3) = a1;
  *((_QWORD *)v11 + 1) = 0;
  v13 = *a4;
  *((_QWORD *)v11 + 6) = *((_QWORD *)a4 + 2);
  *((_OWORD *)v11 + 2) = v13;
  ++v11[30];
  return v11;
}

- (uint64_t)_bufferIDForSurface:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  if (!a1)
    return 0;
  v4 = *(void **)(a1 + 384);
  if (!v4)
  {
    *(_QWORD *)(a1 + 384) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v4, "indexOfObjectIdenticalTo:", a2);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_6:
    v6 = CAImageQueueRegisterIOSurfaceBuffer();
    v7 = *(_QWORD *)(a1 + 400) + 1;
    *(_QWORD *)(a1 + 400) = v7;
    v8 = malloc_type_realloc(*(void **)(a1 + 392), 8 * v7, 0x100004000313F17uLL);
    *(_QWORD *)(a1 + 392) = v8;
    v8[*(_QWORD *)(a1 + 400) - 1] = v6;
    objc_msgSend(*(id *)(a1 + 384), "addObject:", a2);
    return v6;
  }
  return *(_QWORD *)(*(_QWORD *)(a1 + 392) + 8 * v5);
}

- (double)_processBufferContext:(uint64_t)a1
{
  uint64_t v4;
  int64_t v5;
  CFTimeInterval v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  double result;
  _QWORD v11[6];
  CMTime v12;
  BOOL v13;
  CMTime rhs;
  CMTime v15;
  CMTime v16;
  CMTime v17;
  CMTime v18;
  CMTime time;

  if (a1)
  {
    if (*(_QWORD *)(a2 + 24) == a1)
    {
      v18 = *(CMTime *)(a2 + 32);
      v4 = *(_QWORD *)(a2 + 80);
      memset(&v17, 0, sizeof(v17));
      v5 = FigHostTimeToNanoseconds();
      CMTimeMake(&v17, v5, 1000000000);
      memset(&v16, 0, sizeof(v16));
      v6 = CACurrentMediaTime();
      CMTimeMakeWithSeconds(&v16, v6, 1000000000);
      if (*MEMORY[0x1E0CA1FC0] == 1)
      {
        time = v18;
        CMTimeGetSeconds(&time);
        time = v17;
        CMTimeGetSeconds(&time);
        time = v16;
        rhs = v17;
        CMTimeSubtract(&v15, &time, &rhs);
        time = v15;
        CMTimeGetSeconds(&time);
        kdebug_trace();
      }
      if (v4 && *(_QWORD *)(a1 + 440))
      {
        if (*(_DWORD *)(a2 + 56))
        {
          v7 = *(_QWORD *)(a2 + 80);
          CMGetAttachment(*(CMAttachmentBearerRef *)a2, CFSTR("IsOverCaptureFrame"), 0);
          v8 = FigCFEqual();
          v9 = *(NSObject **)(a1 + 456);
          v11[0] = MEMORY[0x1E0C809B0];
          v11[1] = 3221225472;
          v11[2] = __46__BWImageQueueSinkNode__processBufferContext___block_invoke;
          v11[3] = &unk_1E4926708;
          v12 = v18;
          v11[4] = a1;
          v11[5] = v7;
          v13 = v8 != 0;
          dispatch_async(v9, v11);
        }
      }
      -[BWImageQueueSinkNode _removeBufferFromInternalQueues:bufferId:](a1, *(opaqueCMSampleBuffer **)a2, *(_QWORD *)(a2 + 16));
    }
    return iqsn_cleanupBufferContext(a2);
  }
  return result;
}

- (uint64_t)_removeBufferFromInternalQueues:(uint64_t)a3 bufferId:
{
  uint64_t v5;
  uint64_t v6;
  __CVBuffer *ImageBuffer;
  IOSurfaceRef IOSurface;
  void *v9;

  if (result)
  {
    v5 = result;
    pthread_mutex_lock(*(pthread_mutex_t **)(result + 408));
    v6 = objc_msgSend(*(id *)(v5 + 416), "indexOfObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3));
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(*(id *)(v5 + 416), "removeObjectAtIndex:", v6);
    pthread_mutex_unlock(*(pthread_mutex_t **)(v5 + 408));
    ImageBuffer = CMSampleBufferGetImageBuffer(a2);
    IOSurface = CVPixelBufferGetIOSurface(ImageBuffer);
    v9 = *(void **)(v5 + 384);
    if (!v9)
      return CAImageQueueUnregisterBuffer();
    result = objc_msgSend(v9, "indexOfObject:", IOSurface);
    if (result == 0x7FFFFFFFFFFFFFFFLL)
      return CAImageQueueUnregisterBuffer();
  }
  return result;
}

void __46__BWImageQueueSinkNode__processBufferContext___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  CMTime v4;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(unsigned __int8 *)(a1 + 72);
  v4 = *(CMTime *)(a1 + 48);
  -[BWImageQueueSinkNode _storePreviewPTS:withHostTime:isOverCaptureFrame:](v2, &v4, v1, v3);
}

- (void)_storePreviewPTS:(uint64_t)a3 withHostTime:(int)a4 isOverCaptureFrame:
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  void *context;
  CMTime time2;
  CMTime rhs;
  CMTime lhs;
  CMTime v22;
  _BYTE time1[32];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CMTimeEpoch epoch;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    context = (void *)MEMORY[0x1A858DD40]();
    v28 = *(_OWORD *)&a2->value;
    epoch = a2->epoch;
    v30 = a3;
    v6 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v28, "{_PreviewPTSInfo={?=qiIq}Q}");
    pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 448));
    objc_msgSend(*(id *)(a1 + 440), "addObject:", v6);
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v8 = *(void **)(a1 + 440);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v25;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v12);
        memset(time1, 0, sizeof(time1));
        objc_msgSend(v13, "getValue:", time1);
        memset(&v22, 0, sizeof(v22));
        lhs = *a2;
        rhs = *(CMTime *)time1;
        CMTimeSubtract(&v22, &lhs, &rhs);
        CMTimeMake(&time2, 3, 1);
        lhs = v22;
        if (CMTimeCompare(&lhs, &time2) <= 0)
          break;
        objc_msgSend(v7, "addObject:", v13);
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
          if (v10)
            goto LABEL_4;
          break;
        }
      }
    }
    objc_msgSend(*(id *)(a1 + 440), "removeObjectsInArray:", v7);
    if (!*(_QWORD *)(a1 + 488))
    {
      *(_OWORD *)time1 = *(_OWORD *)&a2->value;
      *(_QWORD *)&time1[16] = a2->epoch;
      v22 = *(CMTime *)(a1 + 464);
      if ((CMTimeCompare((CMTime *)time1, &v22) & 0x80000000) == 0)
      {
        *(_QWORD *)(a1 + 488) = a3;
        v14 = *(_OWORD *)&a2->value;
        *(_QWORD *)(a1 + 512) = a2->epoch;
        *(_OWORD *)(a1 + 496) = v14;
      }
    }
    if (!*(_QWORD *)(a1 + 552))
    {
      *(_OWORD *)time1 = *(_OWORD *)&a2->value;
      *(_QWORD *)&time1[16] = a2->epoch;
      v22 = *(CMTime *)(a1 + 464);
      if ((CMTimeCompare((CMTime *)time1, &v22) & 0x80000000) == 0)
      {
        if (a4)
        {
          *(_QWORD *)(a1 + 552) = a3;
          v15 = *(_OWORD *)&a2->value;
          *(_QWORD *)(a1 + 540) = a2->epoch;
          *(_OWORD *)(a1 + 524) = v15;
        }
      }
    }
    pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 448));
    objc_autoreleasePoolPop(context);
  }
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  objc_super v7;

  if (objc_msgSend((id)objc_msgSend(a3, "reason"), "isEqualToString:", 0x1E494EF98))
    -[BWImageQueueSinkNode _collectUnconsumedBuffersWithReason:collectMostFutureBuffers:]((uint64_t)self);
  v7.receiver = self;
  v7.super_class = (Class)BWImageQueueSinkNode;
  -[BWNode handleDroppedSample:forInput:](&v7, sel_handleDroppedSample_forInput_, a3, a4);
}

- (void)setPreviewTapDelegate:(id)a3
{
  self->_previewTapDelegate = (BWImageQueueSinkNodePreviewTapDelegate *)a3;
}

- (void)setMaxLossyCompressionLevel:(int)a3
{
  if (self->_maxLossyCompressionLevel != a3)
  {
    self->_maxLossyCompressionLevel = a3;
    -[BWImageQueueSinkNode _updateInputRequirements]((uint64_t)self);
  }
}

- (void)setVideoHDRImageStatisticsEnabled:(BOOL)a3
{
  self->_videoHDRImageStatisticsEnabled = a3;
}

- (void)setTransform:(FigCaptureVideoTransform)a3
{
  self->_transform = a3;
}

- (void)setSyncStrategy:(int)a3
{
  self->_syncStrategy = a3;
}

- (void)setFenceSupportEnabled:(BOOL)a3
{
  self->_fenceSupportEnabled = a3;
}

- (void)setCaptureDevice:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 632);
}

- (unsigned)imageQueueSlot
{
  -[BWImageQueueSinkNode _ensureImageQueue]((uint64_t)self);
  return self->_imageQueueSlot;
}

- (BWImageQueueSinkNode)initWithHFRSupport:(BOOL)a3 ispJitterCompensationEnabled:(BOOL)a4 clientAuditToken:(id *)a5 sinkID:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  BWImageQueueSinkNode *v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  __int128 v13;
  BOOL v14;
  BWNodeInput *v15;
  BWVideoFormatRequirements *v16;
  __int128 v17;
  __int128 v18;
  BWLimitedGMErrorLogger *v19;
  __int128 v21;
  __int128 v22;
  objc_super v23;

  v7 = a4;
  v8 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BWImageQueueSinkNode;
  v9 = -[BWSinkNode initWithSinkID:](&v23, sel_initWithSinkID_, a6);
  v10 = (uint64_t)v9;
  if (v9)
  {
    if (v8)
      v11 = 5;
    else
      v11 = 3;
    v12 = v11 + (v8 && v7);
    v9->_imageQueueCapacity = v12;
    v9->_imageQueueRequiredFreeSlots = v12 - 3;
    v9->_imageQueueCurrentFreeSlots = v9->_imageQueueCapacity;
    v9->_imageQueueWidth = 640;
    v9->_imageQueueHeight = 480;
    v9->_resetPreviewSynchronizerOnNextFrame = 0;
    v9->_bufferIDsInQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *(_QWORD *)(v10 + 440) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *(_QWORD *)(v10 + 448) = FigSimpleMutexCreate();
    *(_QWORD *)(v10 + 456) = FigDispatchQueueCreateWithPriority();
    *(_QWORD *)(v10 + 360) = 40;
    v13 = *(_OWORD *)&a5->var0[4];
    v21 = *(_OWORD *)a5->var0;
    v22 = v13;
    if (FigCaptureClientIsRunningInXCTest(&v21))
      *(_QWORD *)(v10 + 360) = 0;
    v14 = (int)FigCapturePlatformIdentifier() > 5;
    *(_BYTE *)(v10 + 336) = v14;
    *(_BYTE *)(v10 + 337) = v14;
    *(_BYTE *)(v10 + 338) = v14;
    *(_BYTE *)(v10 + 339) = v14;
    v15 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v10);
    v16 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedCacheModes:](v16, "setSupportedCacheModes:", +[BWVideoFormatRequirements cacheModesForOptimizedDisplayAccess](BWVideoFormatRequirements, "cacheModesForOptimizedDisplayAccess"));
    -[BWNodeInput setFormatRequirements:](v15, "setFormatRequirements:", v16);
    -[BWNodeInput setRetainedBufferCount:](v15, "setRetainedBufferCount:", *(unsigned int *)(v10 + 168));
    objc_msgSend((id)v10, "addInput:", v15);

    -[BWImageQueueSinkNode _updateInputRequirements](v10);
    objc_msgSend((id)v10, "setSupportsLiveReconfiguration:", 1);
    *(_QWORD *)(v10 + 408) = FigSimpleMutexCreate();
    *(_QWORD *)(v10 + 624) = objc_alloc_init(BWStats);
    v17 = *(_OWORD *)&a5->var0[4];
    v21 = *(_OWORD *)a5->var0;
    v22 = v17;
    *(_DWORD *)(v10 + 640) = FigCaptureGetPIDFromAuditToken(&v21);
    v18 = *(_OWORD *)&a5->var0[4];
    *(_OWORD *)(v10 + 644) = *(_OWORD *)a5->var0;
    *(_OWORD *)(v10 + 660) = v18;
    *(_DWORD *)(v10 + 676) = 0;
    *(_QWORD *)&v18 = -1;
    *((_QWORD *)&v18 + 1) = -1;
    *(_OWORD *)(v10 + 216) = v18;
    *(_OWORD *)(v10 + 232) = v18;
    v19 = [BWLimitedGMErrorLogger alloc];
    *(_QWORD *)(v10 + 688) = -[BWLimitedGMErrorLogger initWithName:maxLoggingCount:](v19, "initWithName:maxLoggingCount:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("''%@"), v10), 5);
  }
  return (BWImageQueueSinkNode *)v10;
}

- (uint64_t)_updateInputRequirements
{
  uint64_t v1;
  void *v2;
  void *v3;

  if (result)
  {
    v1 = result;
    v2 = (void *)objc_msgSend(*(id *)(result + 8), "formatRequirements");
    FigGetAlignmentForIOSurfaceOutput();
    objc_msgSend(v2, "setBytesPerRowAlignment:", 0);
    objc_msgSend(v2, "setPlaneAlignment:", 0);
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    objc_msgSend(v3, "addObjectsFromArray:", &unk_1E4A01A60);
    objc_msgSend(v3, "addObjectsFromArray:", FigCaptureSupportedPixelFormatsForCompressionType(4, 1, 0, *(_DWORD *)(v1 + 600)));
    objc_msgSend(v2, "setSupportedPixelFormats:", v3);
    return objc_msgSend(v2, "setMemoryPoolUseAllowed:", 0);
  }
  return result;
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWImageQueueSinkNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v3, sel_prepareForCurrentConfigurationToBecomeLive);
  self->_lastDisplayVSyncInterval = 0.0;
  self->_lastDisplaySamplingTime = 0.0;
  self->_lastFramePTS = 0.0;
  self->_lastDisplayTime = 0.0;
  self->_lateFrameIntervalStartPTS = 0.0;
  self->_lastHarmonicFractionalVSyncInterval = NAN;
  self->_previousFrameDuration = 0.0;
  self->_framesSinceLastHarmonicCompensation = 0;
  self->_lastFencedGenerationID = 0;
  pthread_mutex_lock((pthread_mutex_t *)self->_previewPTSHistoryMutex);
  -[NSMutableArray removeAllObjects](self->_previewPTSHistory, "removeAllObjects");
  self->_firstFramePTS = *($95D729B680665BEAEFA1D6FCA8238556 *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  self->_firstDisplayedFrameHostTime = 0;
  self->_didCallFirstFrameAtHostTimeCallback = 0;
  self->_didCallFirstFrameCallback = 0;
  self->_firstOverCaptureDisplayedFrameHostTime = 0;
  self->_didLogFirstOverCaptureFrame = 0;
  pthread_mutex_unlock((pthread_mutex_t *)self->_previewPTSHistoryMutex);
  -[BWImageQueueSinkNode _ensureImageQueue]((uint64_t)self);
  if (self->_fenceSupportEnabled)
    self->_imageQueueContext = (CAContext *)FPSupport_CopyCAContext();
  -[BWImageQueueSinkNode _createFrameSender]((uint64_t)self);
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  unsigned int v9;
  unsigned int v10;
  __int128 v11;
  const void **previewSynchronizer;
  objc_super v13;
  _OWORD v14[2];

  if (a4)
  {
    v9 = objc_msgSend(a4, "width");
    v10 = objc_msgSend(a4, "height");
    self->_imageQueueWidth = v9;
    self->_imageQueueHeight = v10;
    -[BWImageQueueSinkNode _ensureImageQueue]((uint64_t)self);
    os_unfair_lock_lock(&self->_clientPIDLock);
    if (!self->_holdingBuffersForClientAssertion)
    {
      v11 = *(_OWORD *)&self->_clientAuditToken.val[4];
      v14[0] = *(_OWORD *)self->_clientAuditToken.val;
      v14[1] = v11;
      if (FigCaptureAuditTokenIsValid((uint64_t)v14))
        self->_holdingBuffersForClientAssertion = (OS_os_transaction *)FigOSTransactionCreate();
    }
    os_unfair_lock_unlock(&self->_clientPIDLock);
    goto LABEL_7;
  }
  if (self)
  {
LABEL_7:
    self->_liveSyncStrategy = self->_syncStrategy;
    self->_savedSyncStrategy = 0;
    self->_liveVideoHDRImageStatisticsEnabled = self->_videoHDRImageStatisticsEnabled;
    self->_cleanupImageQueueAtEndOfData = 0;
  }
  self->_resetPreviewSynchronizerOnNextFrame = 0;
  previewSynchronizer = (const void **)self->_previewSynchronizer;
  if (self->_liveSyncStrategy == 2)
  {
    if (previewSynchronizer)
      BWPreviewSynchronizerReset((uint64_t)previewSynchronizer);
    else
      self->_previewSynchronizer = (OpaqueBWPreviewSynchronizer *)BWPreviewSynchronizerCreate(self->_imageQueue);
    self->_imageQueueRequiredFreeSlots = 0;
  }
  else
  {
    BWPreviewSynchronizerDestroy(previewSynchronizer);
    self->_previewSynchronizer = 0;
    if (self->_liveSyncStrategy == 3)
    {
      self->_imageQueueRequiredFreeSlots = 0;
      self->_lastFramePTS = 0.0;
      self->_lastDisplayTime = 0.0;
    }
    else
    {
      self->_imageQueueRequiredFreeSlots = self->_imageQueueCapacity - 3;
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)BWImageQueueSinkNode;
  -[BWSinkNode configurationWithID:updatedFormat:didBecomeLiveForInput:](&v13, sel_configurationWithID_updatedFormat_didBecomeLiveForInput_, a3, a4, a5);
}

- (uint64_t)_ensureImageQueue
{
  if (result)
  {
    FPSupport_EnsureCAImageQueue();
    CAImageQueueGetFlags();
    CAImageQueueSetFlags();
    return CAImageQueueSetEnhancementMode();
  }
  return result;
}

- (void)fencePortGenerationIDWillChange
{
  if (self->_fenceSupportEnabled)
    self->_fencePortGenerationIDWillChange = 1;
}

- (void)registerSurfacesFromSourcePool:(id)a3
{
  _QWORD v4[5];

  if (self->_imageQueue)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __55__BWImageQueueSinkNode_registerSurfacesFromSourcePool___block_invoke;
    v4[3] = &unk_1E49266E0;
    v4[4] = self;
    objc_msgSend(a3, "enumerateSurfacesUsingBlock:", v4);
    pthread_mutex_lock((pthread_mutex_t *)self->_surfaceRegistrationMutex);
    if (-[BWVideoFormat colorSpaceProperties](-[BWNodeInput videoFormat](self->super.super._input, "videoFormat"), "colorSpaceProperties"))
    {
      -[BWImageQueueSinkNode _cleanupIOSurfaces]((uint64_t)self);
    }
    pthread_mutex_unlock((pthread_mutex_t *)self->_surfaceRegistrationMutex);
  }
}

- (void)_cleanupIOSurfaces
{
  uint64_t v2;
  uint64_t i;

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 400);
    if (v2)
    {
      for (i = 0; i != v2; ++i)
      {
        if ((objc_msgSend(*(id *)(a1 + 416), "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)(a1 + 392) + 8 * i))) & 1) == 0)CAImageQueueUnregisterBuffer();
      }
    }
    *(_QWORD *)(a1 + 400) = 0;
    free(*(void **)(a1 + 392));
    *(_QWORD *)(a1 + 392) = 0;

    *(_QWORD *)(a1 + 384) = 0;
  }
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
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  _CAImageQueue *imageQueue;
  _EnqueuedBufferContext **enqueuedBufferContexts;
  unint64_t v8;
  objc_super v9;

  self->_previewPTSHistory = 0;
  FigSimpleMutexDestroy();
  BWPreviewSynchronizerDestroy((const void **)self->_previewSynchronizer);
  self->_previewSynchronizer = 0;
  v3 = -[NSMutableArray count](self->_bufferIDsInQueue, "count");
  if (v3)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_bufferIDsInQueue, "objectAtIndexedSubscript:", i), "unsignedLongLongValue");
      CAImageQueueUnregisterBuffer();
    }
  }
  -[BWImageQueueSinkNode _cleanupIOSurfaces]((uint64_t)self);
  -[BWImageQueueSinkNode _cleanupImageQueueContext]((uint64_t)self);
  imageQueue = self->_imageQueue;
  if (imageQueue)
    CFRelease(imageQueue);

  self->_bufferIDsInQueue = 0;
  enqueuedBufferContexts = self->_enqueuedBufferContexts;
  if (enqueuedBufferContexts)
  {
    if (self->_enqueuedBufferContextCount)
    {
      v8 = 0;
      do
      {
        iqsn_releaseBufferContext(self->_enqueuedBufferContexts[v8]);
        self->_enqueuedBufferContexts[v8++] = 0;
      }
      while (v8 < self->_enqueuedBufferContextCount);
      enqueuedBufferContexts = self->_enqueuedBufferContexts;
    }
    free(enqueuedBufferContexts);
  }

  if (self->_imageQueueSlot)
  {
    FPSupport_DeleteCASlot();
    self->_imageQueueSlot = 0;
  }

  self->_holdingBuffersForClientAssertion = 0;
  FigSimpleMutexDestroy();

  v9.receiver = self;
  v9.super_class = (Class)BWImageQueueSinkNode;
  -[BWSinkNode dealloc](&v9, sel_dealloc);
}

- (uint64_t)_cleanupImageQueueContext
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (*(_QWORD *)(result + 592))
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "activateBackground:", 1);

      *(_QWORD *)(v1 + 592) = 0;
      return objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }
  }
  return result;
}

- (_CAImageQueue)imageQueue
{
  -[BWImageQueueSinkNode _ensureImageQueue]((uint64_t)self);
  return self->_imageQueue;
}

- (int)syncStrategy
{
  return self->_syncStrategy;
}

- (BOOL)fenceSupportEnabled
{
  return self->_fenceSupportEnabled;
}

- (int)maxLossyCompressionLevel
{
  return self->_maxLossyCompressionLevel;
}

- (FigCaptureVideoTransform)transform
{
  FigCaptureVideoTransform *p_transform;
  uint64_t v3;
  $470D365275581EF16070F5A11344F73E dimensions;
  FigCaptureVideoTransform result;

  p_transform = &self->_transform;
  v3 = *(_QWORD *)&self->_transform.mirrored;
  dimensions = p_transform->dimensions;
  result.dimensions = dimensions;
  result.mirrored = v3;
  result.rotationDegrees = HIDWORD(v3);
  return result;
}

- (BOOL)videoHDRImageStatisticsEnabled
{
  return self->_videoHDRImageStatisticsEnabled;
}

- (id)nodeSubType
{
  return CFSTR("ImageQueue");
}

- (__n128)_createFrameSender
{
  __int128 v2;
  __int128 v3;
  int v4;
  __n128 result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CMCaptureFrameSenderService *v10;
  __int128 v11;
  _OWORD v12[2];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 676));
    v2 = *(_OWORD *)(a1 + 660);
    v15 = *(_OWORD *)(a1 + 644);
    v16 = v2;
    v3 = *(_OWORD *)(a1 + 232);
    v17 = *(_OWORD *)(a1 + 216);
    v18 = v3;
    v4 = *(_DWORD *)(a1 + 640);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 676));
    v13 = v15;
    v14 = v16;
    if (FigCaptureAuditTokenIsValid((uint64_t)&v13))
    {
      v13 = v15;
      v14 = v16;
      v12[0] = v17;
      v12[1] = v18;
      if (!FigCaptureAuditTokensAreEqual(&v13, v12))
      {
        v6 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v15, 32);
        v7 = getpid();
        if (v4 == (_DWORD)v7)
        {
          v8 = 0;
          v9 = 0;
        }
        else
        {
          v8 = v7;
          v13 = 0u;
          v14 = 0u;
          v9 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v13, 32, FigCaptureGetCurrentProcessAuditToken(&v13));
        }
        v10 = -[CMCaptureFrameSenderService initWithEndpointType:endpointPID:endpointProxyPID:endpointAuditToken:endpointProxyAuditToken:endpointCameraUniqueID:]([CMCaptureFrameSenderService alloc], "initWithEndpointType:endpointPID:endpointProxyPID:endpointAuditToken:endpointProxyAuditToken:endpointCameraUniqueID:", CFSTR("VideoPreview"), *(unsigned int *)(a1 + 640), v8, v6, v9, objc_msgSend((id)objc_msgSend(*(id *)(a1 + 632), "captureStream"), "uniqueID"));
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 676));

        *(_QWORD *)(a1 + 208) = v10;
        v11 = v16;
        *(_OWORD *)(a1 + 216) = v15;
        *(_OWORD *)(a1 + 232) = v11;
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 676));
      }
    }
  }
  return result;
}

- (BOOL)hasNonLiveConfigurationChanges
{
  return 0;
}

uint64_t __55__BWImageQueueSinkNode_registerSurfacesFromSourcePool___block_invoke(uint64_t a1, uint64_t a2)
{
  pthread_mutex_lock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 408));
  -[BWImageQueueSinkNode _bufferIDForSurface:](*(_QWORD *)(a1 + 32), a2);
  return pthread_mutex_unlock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 408));
}

- (void)inputConnectionWillBeEnabled
{
  if (self->_previewSynchronizer)
    self->_resetPreviewSynchronizerOnNextFrame = 1;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)previewPTSDisplayedAtHostTime:(SEL)a3 allowingExtrapolation:(unint64_t)a4
{
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _BOOL4 v20;
  BWImageQueueSinkNode *v22;
  CMTime v23;
  CMTime rhs;
  CMTime lhs;
  CMTime v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v20 = a5;
  v34 = *MEMORY[0x1E0C80C00];
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  pthread_mutex_lock((pthread_mutex_t *)self->_previewPTSHistoryMutex);
  v7 = -[NSMutableArray count](self->_previewPTSHistory, "count");
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v22 = self;
  v8 = (void *)-[NSMutableArray reverseObjectEnumerator](self->_previewPTSHistory, "reverseObjectEnumerator");
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v30;
    while (2)
    {
      v13 = 0;
      v14 = v7;
      v7 -= v10;
      do
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v13);
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v15, "getValue:", &v27);
        v16 = *((_QWORD *)&v28 + 1);
        v17 = a4 - *((_QWORD *)&v28 + 1);
        if (a4 >= *((_QWORD *)&v28 + 1))
        {
          *(_OWORD *)&retstr->var0 = v27;
          retstr->var3 = v28;
          if (!(v11 & 1 | (v14 < 2)) && v20)
          {
            v27 = 0u;
            v28 = 0u;
            objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](v22->_previewPTSHistory, "objectAtIndexedSubscript:", (v14 - 2)), "getValue:", &v27);
            *(_OWORD *)&rhs.value = v27;
            rhs.epoch = v28;
            memset(&v26, 0, sizeof(v26));
            lhs = (CMTime)*retstr;
            v18 = v17 / (v16 - *((_QWORD *)&v28 + 1));
            CMTimeSubtract(&v26, &lhs, &rhs);
            memset(&lhs, 0, sizeof(lhs));
            rhs = v26;
            CMTimeMultiply(&v23, &rhs, v18);
            rhs = (CMTime)*retstr;
            CMTimeAdd(&lhs, &rhs, &v23);
            FigHostTimeToNanoseconds();
            FigHostTimeToNanoseconds();
            FigHostTimeToNanoseconds();
            *(CMTime *)retstr = lhs;
          }
          return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)pthread_mutex_unlock((pthread_mutex_t *)v22->_previewPTSHistoryMutex);
        }
        ++v13;
        --v14;
        v11 = 1;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v10)
        continue;
      break;
    }
  }
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)pthread_mutex_unlock((pthread_mutex_t *)v22->_previewPTSHistoryMutex);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)previewPTSAtHostTime:(SEL)a3
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  pthread_mutex_lock((pthread_mutex_t *)self->_previewPTSHistoryMutex);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = (void *)-[NSMutableArray reverseObjectEnumerator](self->_previewPTSHistory, "reverseObjectEnumerator");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v14 = 0u;
        v15 = 0u;
        objc_msgSend(v12, "getValue:", &v14);
        if (*((_QWORD *)&v15 + 1) <= a4)
        {
          *(_OWORD *)&retstr->var0 = v14;
          retstr->var3 = v15;
          return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)pthread_mutex_unlock((pthread_mutex_t *)self->_previewPTSHistoryMutex);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)pthread_mutex_unlock((pthread_mutex_t *)self->_previewPTSHistoryMutex);
}

- (void)updateClientAuditToken:(id *)a3
{
  os_unfair_lock_s *p_clientPIDLock;
  __int128 v6;
  __int128 v7;
  OS_os_transaction *holdingBuffersForClientAssertion;
  _OWORD v9[2];

  p_clientPIDLock = &self->_clientPIDLock;
  os_unfair_lock_lock(&self->_clientPIDLock);
  v6 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_clientAuditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_clientAuditToken.val[4] = v6;
  v7 = *(_OWORD *)&a3->var0[4];
  v9[0] = *(_OWORD *)a3->var0;
  v9[1] = v7;
  self->_clientPID = FigCaptureGetPIDFromAuditToken(v9);
  holdingBuffersForClientAssertion = self->_holdingBuffersForClientAssertion;
  self->_holdingBuffersForClientAssertion = (OS_os_transaction *)FigOSTransactionCreate();

  os_unfair_lock_unlock(p_clientPIDLock);
  -[BWImageQueueSinkNode _createFrameSender]((uint64_t)self);
}

- (void)didReachEndOfDataForInput:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __int128 v6;
  objc_super v7;
  os_log_type_t type;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  mach_absolute_time();
  FigHostTimeToNanoseconds();
  if (dword_1ECFE9710)
  {
    v9 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[BWImageQueueSinkNode _collectUnconsumedBuffersWithReason:collectMostFutureBuffers:]((uint64_t)self);
  -[BWImageQueueSinkNode _processReleasedContexts]((uint64_t)self);
  -[BWImageQueueSinkNode _cleanupIOSurfaces]((uint64_t)self);
  -[BWImageQueueSinkNode _cleanupImageQueueContext]((uint64_t)self);
  -[BWImageQueueSinkNode _transferIOSurfaceOwnershipToEnqueuedBufferContext]((uint64_t)self);
  os_unfair_lock_lock(&self->_clientPIDLock);

  self->_frameSender = 0;
  *(_QWORD *)&v6 = -1;
  *((_QWORD *)&v6 + 1) = -1;
  *(_OWORD *)self->_frameSenderClientAuditToken.val = v6;
  *(_OWORD *)&self->_frameSenderClientAuditToken.val[4] = v6;
  os_unfair_lock_unlock(&self->_clientPIDLock);
  pthread_mutex_lock((pthread_mutex_t *)self->_previewPTSHistoryMutex);
  -[NSMutableArray removeAllObjects](self->_previewPTSHistory, "removeAllObjects");
  pthread_mutex_unlock((pthread_mutex_t *)self->_previewPTSHistoryMutex);
  self->_numFramesReceived = 0;
  self->_receivingBlackenedFrames = 0;
  self->_firstDisplayedFrameHostTime = 0;
  self->_didCallFirstFrameAtHostTimeCallback = 0;
  self->_didCallFirstFrameCallback = 0;
  self->_firstOverCaptureDisplayedFrameHostTime = 0;
  self->_didLogFirstOverCaptureFrame = 0;
  -[BWLimitedGMErrorLogger resetCurrentLoggingCounter](self->_limitedGMErrorLogger, "resetCurrentLoggingCounter");
  self->_cleanupImageQueueAtEndOfData = 0;
  v7.receiver = self;
  v7.super_class = (Class)BWImageQueueSinkNode;
  -[BWSinkNode didReachEndOfDataForInput:](&v7, sel_didReachEndOfDataForInput_, a3);
}

- (uint64_t)_collectUnconsumedBuffersWithReason:(uint64_t)result collectMostFutureBuffers:
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (*(_DWORD *)(result + 252) != 1)
      CACurrentMediaTime();
    CAImageQueueConsumeUnconsumedInRange();
    result = CAImageQueueCollect();
    *(_QWORD *)(v1 + 200) = result;
  }
  return result;
}

- (void)_transferIOSurfaceOwnershipToEnqueuedBufferContext
{
  unint64_t v2;
  uint64_t v3;
  __CVBuffer *ImageBuffer;
  const void *IOSurface;

  if (a1 && *(_QWORD *)(a1 + 432))
  {
    v2 = 0;
    do
    {
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 424) + 8 * v2);
      if (v3 && *(_QWORD *)v3)
      {
        ImageBuffer = CMSampleBufferGetImageBuffer(*(CMSampleBufferRef *)v3);
        IOSurface = CVPixelBufferGetIOSurface(ImageBuffer);
        if (IOSurface)
          IOSurface = CFRetain(IOSurface);
        *(_QWORD *)(v3 + 8) = IOSurface;
        if (*(_QWORD *)v3)
        {
          CFRelease(*(CFTypeRef *)v3);
          *(_QWORD *)v3 = 0;
        }
      }
      ++v2;
    }
    while (*(_QWORD *)(a1 + 432) > v2);
  }
}

- (double)_displayTimeSyncedWithFramePTS:(uint64_t)a1
{
  double v4;
  double v5;
  double v6;
  unint64_t Times;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  unint64_t v22;
  double v23;
  double v24;
  double v26;
  double *v27;
  double v28;
  unint64_t v29;
  float v30;
  float v31;
  unint64_t v32;
  BOOL v33;
  double v34;
  float v35;
  float v36;
  double v37;
  double v39;
  unint64_t v40;
  double v41[25];

  v41[24] = *(double *)MEMORY[0x1E0C80C00];
  if (!a1)
    return 0.0;
  v4 = CACurrentMediaTime();
  v5 = a2 - *(double *)(a1 + 296);
  v6 = v5 + *(double *)(a1 + 304);
  Times = CAImageQueueGetTimes();
  if (Times)
  {
    if (Times == 1)
    {
      v8 = 0.0166666667;
    }
    else
    {
      v16 = v41[0];
      v8 = v41[1] - v41[0];
      if (*(_BYTE *)(a1 + 336))
      {
        v17 = *(double *)(a1 + 272);
        if (v17 > 0.0)
        {
          v18 = v41[0] - v17;
          v19 = round(v18 / v8);
          v20 = v19 >= 1.0 ? v18 / v19 : *(double *)(a1 + 280);
          if (vabdd_f64(v20, v8) / v8 <= 0.1)
          {
            *(double *)(a1 + 280) = v20;
            v8 = v20;
          }
        }
        *(double *)(a1 + 272) = v16;
      }
      if (v8 <= 0.001)
        goto LABEL_62;
      if (Times > 0x17)
      {
LABEL_7:
        v10 = v5 / v8;
        v11 = round(v5 / v8);
        v12 = *(double *)(a1 + 304);
        if (v5 / v8 >= 1.0)
          v13 = v11;
        else
          v13 = v5 / v8;
        v6 = v12 + v8 * v13;
        v14 = vabdd_f64(1.0 / *(double *)(a1 + 320), 1.0 / v5);
        if ((v6 - a2 > 0.166 || *(_BYTE *)(a1 + 337) && v6 - v4 > v5 * 3.0) && v12 > 0.0)
        {
          if (v10 < 1.5 && *(_BYTE *)(a1 + 338))
          {
            v15 = v12 + v8 * 0.01;
            if (v15 <= v41[0])
              v6 = v41[0];
            else
              v6 = v15;
            if (*MEMORY[0x1E0CA1FC0] == 1)
              kdebug_trace();
          }
          else
          {
            v6 = v8 + v12;
          }
        }
        v21 = fmod(v5, v8);
        if (v14 <= 0.9)
        {
          v28 = v21 / v8;
          if (v28 < 0.1 || v28 > 0.9)
          {
            if (*(_BYTE *)(a1 + 339))
            {
              v35 = v10 - v13;
              v36 = *(double *)(a1 + 288);
              v37 = BWModifiedMovingAverage(fabsf(v35), v36, 0.01);
              *(double *)(a1 + 288) = v37;
            }
            else
            {
              v37 = vabdd_f64(v10, v13);
            }
            v39 = 1.0;
            v40 = *(_QWORD *)(a1 + 328) + 1;
            *(_QWORD *)(a1 + 328) = v40;
            if (vcvtad_u64_f64(1.0 / v37) - 1 < v40)
            {
              *(_QWORD *)(a1 + 328) = 0;
              if (v13 > 1.0)
                v39 = -1.0;
              v6 = v6 + v8 * v13 * v39;
            }
          }
          else
          {
            v29 = *(_QWORD *)(a1 + 328) + 1;
            *(_QWORD *)(a1 + 328) = v29;
            if (*(_BYTE *)(a1 + 339))
            {
              v30 = v28;
              v31 = *(double *)(a1 + 288);
              v28 = BWModifiedMovingAverage(v30, v31, 0.01);
              *(double *)(a1 + 288) = v28;
              v29 = *(_QWORD *)(a1 + 328);
            }
            v32 = vcvtad_u64_f64(1.0 / v28);
            if (v29 >= v32)
            {
              *(_QWORD *)(a1 + 328) = 0;
              v33 = v32 <= 2 || v13 > 1.0;
              v34 = -1.0;
              if (!v33)
                v34 = 1.0;
              v6 = v6 + v8 * v34;
            }
          }
        }
        else
        {
          *(_QWORD *)(a1 + 328) = 0;
          *(_QWORD *)(a1 + 288) = 0x7FF8000000000000;
        }
        v22 = 0;
        v23 = -v8;
        while (1)
        {
          v24 = v41[v22];
          if (v6 < v24 && v4 < v24 + v23 * 0.5)
            break;
          if (++v22 == 24)
            goto LABEL_62;
        }
        if (v22 < 2 || (v26 = v41[v22 - 1], v4 >= v26 + v23 * 0.5))
        {
          v27 = (double *)(a1 + 312);
          v26 = v24;
        }
        else
        {
          v27 = (double *)(a1 + 312);
          if (a2 - *(double *)(a1 + 312) <= 2.0)
            goto LABEL_52;
        }
        *v27 = a2;
        v24 = v26;
LABEL_52:
        v6 = v24 + v23 * 0.25;
        goto LABEL_62;
      }
    }
    v9 = v41[Times - 1];
    do
    {
      v9 = v8 + v9;
      v41[Times++] = v9;
    }
    while (Times != 24);
    goto LABEL_7;
  }
LABEL_62:
  *(double *)(a1 + 296) = a2;
  *(double *)(a1 + 304) = v6;
  *(double *)(a1 + 320) = v5;
  return v6;
}

- (BWImageQueueSinkNodePreviewTapDelegate)previewTapDelegate
{
  return self->_previewTapDelegate;
}

- (BWFigVideoCaptureDevice)captureDevice
{
  return self->_captureDevice;
}

- (BOOL)cleanupImageQueueAtEndOfData
{
  return self->_cleanupImageQueueAtEndOfData;
}

- (void)setCleanupImageQueueAtEndOfData:(BOOL)a3
{
  self->_cleanupImageQueueAtEndOfData = a3;
}

@end

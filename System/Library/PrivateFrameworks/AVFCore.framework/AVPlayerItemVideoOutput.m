@implementation AVPlayerItemVideoOutput

- (BOOL)hasNewPixelBufferForItemTime:(CMTime *)itemTime
{
  OpaqueFigVisualContext *vc;
  unsigned int (*v4)(OpaqueFigVisualContext *, CMTime *);
  BOOL result;
  CMTime v6;
  CMTime v7;

  result = 0;
  if ((itemTime->flags & 0x1D) == 1)
  {
    vc = self->_videoOutputInternal->vc;
    v6 = *itemTime;
    v4 = *(unsigned int (**)(OpaqueFigVisualContext *, CMTime *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                           + 40);
    if (v4)
    {
      v7 = v6;
      if (v4(vc, &v7))
        return 1;
    }
  }
  return result;
}

void __AVPlayerItemVideoOutput_timebaseNotificationCallback_block_invoke(uint64_t a1)
{
  uint64_t v2;
  Float64 v3;
  double Rate;
  uint64_t v5;
  double v6;
  dispatch_time_t v7;
  CMTime v8;
  CMTime v9;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(double *)(v2 + 72);
  v9 = *(CMTime *)(v2 + 84);
  Rate = CMTimebaseGetRate(*(CMTimebaseRef *)(v2 + 8));
  v5 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v5 + 80))
  {
    if (!*(_BYTE *)(v5 + 108) || *(double *)(v5 + 16) != 0.0 || Rate == 0.0)
      goto LABEL_12;
LABEL_11:
    objc_msgSend(*(id *)(a1 + 40), "_dispatchOutputMediaDataWillChange");
    goto LABEL_12;
  }
  v6 = *(double *)(v5 + 16);
  if (v6 == Rate)
    goto LABEL_12;
  if (v6 == 0.0 && Rate != 0.0)
    goto LABEL_11;
  if (v6 == 0.0 || Rate != 0.0)
  {
    v8 = v9;
    v7 = AVPlayerItemVideoOutputConvertImageTimeToDispatchTimeWithInterval(v5, &v8, v3);
    dispatch_source_set_timer(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 64), v7, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(Rate / 10.0));
  }
LABEL_12:
  *(double *)(*(_QWORD *)(a1 + 32) + 16) = Rate;
}

uint64_t __61__AVPlayerItemVideoOutput__dispatchOutputMediaDataWillChange__block_invoke(uint64_t result, void *a2)
{
  uint64_t v3;

  if (a2)
  {
    v3 = result;
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(a2, "outputMediaDataWillChange:", *(_QWORD *)(v3 + 32));
  }
  return result;
}

uint64_t __52__AVPlayerItemVideoOutput_suppressesPlayerRendering__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 16)
                                                                            + 120);
  return result;
}

- (BOOL)suppressesPlayerRendering
{
  NSObject *stateQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_videoOutputInternal->stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__AVPlayerItemVideoOutput_suppressesPlayerRendering__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (CVPixelBufferRef)copyPixelBufferForItemTime:(CMTime *)itemTime itemTimeForDisplay:(CMTime *)outItemTimeForDisplay
{
  CMTime v5;

  v5 = *itemTime;
  return -[AVPlayerItemVideoOutput _copyPixelBufferForItemTimeWithOptions:itemTimeForDisplay:options:](self, "_copyPixelBufferForItemTimeWithOptions:itemTimeForDisplay:options:", &v5, outItemTimeForDisplay, 1);
}

- (OpaqueFigVisualContext)_visualContext
{
  return self->_videoOutputInternal->vc;
}

- (void)_dispatchOutputMediaDataWillChange
{
  AVPlayerItemVideoOutputInternal *videoOutputInternal;
  AVWeakReferencingDelegateStorage *delegateStorage;
  _QWORD v5[5];

  videoOutputInternal = self->_videoOutputInternal;
  if (BYTE4(videoOutputInternal->wakeUpImageTime.epoch) || videoOutputInternal->advanceWakeUpIntervalIsValid)
  {
    delegateStorage = videoOutputInternal->delegateStorage;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __61__AVPlayerItemVideoOutput__dispatchOutputMediaDataWillChange__block_invoke;
    v5[3] = &unk_1E3032B48;
    v5[4] = self;
    -[AVWeakReferencingDelegateStorage invokeDelegateCallbackWithBlock:](delegateStorage, "invokeDelegateCallbackWithBlock:", v5);
    videoOutputInternal = self->_videoOutputInternal;
  }
  videoOutputInternal->advanceWakeUpInterval = 0.0;
  self->_videoOutputInternal->advanceWakeUpIntervalIsValid = 0;
  BYTE4(self->_videoOutputInternal->wakeUpImageTime.epoch) = 0;
}

- (__CVBuffer)_copyPixelBufferForItemTimeWithOptions:(id *)a3 itemTimeForDisplay:(id *)a4 options:(unsigned int)a5
{
  uint64_t v5;
  __int128 v7;
  AVPlayerItemVideoOutputInternal *videoOutputInternal;
  OpaqueFigVisualContext *vc;
  unsigned int (*v10)(OpaqueFigVisualContext *, uint64_t, $3CC8671D27C23BF42ADDB32F2B5E48AE *, uint64_t, CFTypeRef *, _QWORD, __int128 *);
  uint64_t v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13;
  __int128 v14;
  int64_t v15;
  __CVBuffer *v16;
  CFTypeRef cf;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v18;

  v5 = *(_QWORD *)&a5;
  v16 = 0;
  cf = 0;
  v7 = *MEMORY[0x1E0CA2E18];
  v15 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  videoOutputInternal = self->_videoOutputInternal;
  v14 = v7;
  vc = videoOutputInternal->vc;
  v13 = *a3;
  v10 = *(unsigned int (**)(OpaqueFigVisualContext *, uint64_t, $3CC8671D27C23BF42ADDB32F2B5E48AE *, uint64_t, CFTypeRef *, _QWORD, __int128 *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
  if (v10)
  {
    v11 = *MEMORY[0x1E0C9AE00];
    v18 = v13;
    if (!v10(vc, v11, &v18, v5, &cf, 0, &v14))
    {
      if (a4)
      {
        if ((BYTE12(v14) & 0x1D) != 1)
          goto LABEL_8;
        *(_OWORD *)&a4->var0 = v14;
        a4->var3 = v15;
      }
      if (VTPixelBufferConformerCopyConformedPixelBuffer())
        v16 = 0;
    }
  }
LABEL_8:
  if (cf)
    CFRelease(cf);
  return v16;
}

- (BOOL)setUpWithOutputSettings:(id)a3 outputSettingsArePixelBufferAttributes:(BOOL)a4 withExceptionReason:(id *)a5
{
  AVPlayerItemVideoOutputInternal *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  OpaqueFigVisualContext *vc;
  unsigned int (*v20)(OpaqueFigVisualContext *, void (*)(uint64_t, __int128 *, char, void *), id);
  NSObject *delegateWakeupSource;
  uint64_t v23;
  _QWORD handler[6];

  v10 = objc_alloc_init(AVPlayerItemVideoOutputInternal);
  self->_videoOutputInternal = v10;
  if (v10)
  {
    CFRetain(v10);
    if (!a4)
    {
      *(_QWORD *)&self->_videoOutputInternal->suppressesPlayerRendering = +[AVVideoOutputSettings _videoOutputSettingsWithVideoSettingsDictionary:exceptionReason:](AVVideoOutputSettings, "_videoOutputSettingsWithVideoSettingsDictionary:exceptionReason:", a3, a5);
      v10 = *(AVPlayerItemVideoOutputInternal **)&self->_videoOutputInternal->suppressesPlayerRendering;
      if (!v10)
        return (char)v10;
      if (-[AVPlayerItemVideoOutputInternal willYieldCompressedSamples](v10, "willYieldCompressedSamples"))
      {
        if (a5)
        {
          v16 = (void *)AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("AVPlayerItemVideoOutput does not support compressed output"), v11, v12, v13, v14, v15, v23);
          LOBYTE(v10) = 0;
          *a5 = v16;
          return (char)v10;
        }
LABEL_9:
        LOBYTE(v10) = 0;
        return (char)v10;
      }
      objc_msgSend(*(id *)&self->_videoOutputInternal->suppressesPlayerRendering, "pixelBufferAttributes");
    }
    if (!VTPixelBufferConformerCreateWithAttributes())
    {
      if (self->_videoOutputInternal->pixelBufferConformer)
      {
        v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.015);
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v17, *MEMORY[0x1E0CC67A0], 0);
        v18 = -[AVPlayerItemOutput _weakReference](self, "_weakReference");
        if (!FigVisualContextCreateRemote())
        {
          vc = self->_videoOutputInternal->vc;
          if (vc)
          {
            v20 = *(unsigned int (**)(OpaqueFigVisualContext *, void (*)(uint64_t, __int128 *, char, void *), id))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
            if (v20)
            {
              if (!v20(vc, AVPlayerItemVideoOutput_figVCSequentialAvailableCallback, v18))
              {
                self->_videoOutputInternal->stateQueue = (OS_dispatch_queue *)dispatch_queue_create("AVPlayerItemOutput queue", 0);
                self->_videoOutputInternal->delegateStorage = objc_alloc_init(AVWeakReferencingDelegateStorage);
                self->_videoOutputInternal->delegateWakeupSource = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_videoOutputInternal->stateQueue);
                self->_videoOutputInternal->advanceWakeUpInterval = 0.0;
                self->_videoOutputInternal->advanceWakeUpIntervalIsValid = 0;
                BYTE4(self->_videoOutputInternal->wakeUpImageTime.epoch) = 0;
                *(_QWORD *)&self->_videoOutputInternal->immediateWakeUp = 0;
                delegateWakeupSource = self->_videoOutputInternal->delegateWakeupSource;
                handler[0] = MEMORY[0x1E0C809B0];
                handler[1] = 3221225472;
                handler[2] = __110__AVPlayerItemVideoOutput_setUpWithOutputSettings_outputSettingsArePixelBufferAttributes_withExceptionReason___block_invoke;
                handler[3] = &unk_1E302FCE8;
                handler[4] = delegateWakeupSource;
                handler[5] = v18;
                dispatch_source_set_event_handler(delegateWakeupSource, handler);
                dispatch_resume((dispatch_object_t)self->_videoOutputInternal->delegateWakeupSource);
                LOBYTE(v10) = 1;
                return (char)v10;
              }
            }
          }
        }
      }
    }
    goto LABEL_9;
  }
  return (char)v10;
}

uint64_t __110__AVPlayerItemVideoOutput_setUpWithOutputSettings_outputSettingsArePixelBufferAttributes_withExceptionReason___block_invoke(uint64_t a1)
{
  dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "referencedObject"), "_dispatchOutputMediaDataWillChange");
}

- (AVPlayerItemVideoOutput)init
{
  return -[AVPlayerItemVideoOutput initWithPixelBufferAttributes:](self, "initWithPixelBufferAttributes:", 0);
}

- (AVPlayerItemVideoOutput)initWithPixelBufferAttributes:(NSDictionary *)pixelBufferAttributes
{
  AVPlayerItemVideoOutput *v5;
  AVPlayerItemVideoOutput *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AVPlayerItemVideoOutput;
  v5 = -[AVPlayerItemOutput init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    v15 = 0;
    if (!-[AVPlayerItemVideoOutput setUpWithOutputSettings:outputSettingsArePixelBufferAttributes:withExceptionReason:](v5, "setUpWithOutputSettings:outputSettingsArePixelBufferAttributes:withExceptionReason:", pixelBufferAttributes, 1, &v15))
    {

      if (v15)
      {
        v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v6, a2, v15, v7, v8, v9, v10, v11, v14), 0);
        objc_exception_throw(v13);
      }
      return 0;
    }
  }
  return v6;
}

- (AVPlayerItemVideoOutput)initWithOutputSettings:(NSDictionary *)outputSettings
{
  AVPlayerItemVideoOutput *v5;
  AVPlayerItemVideoOutput *v6;
  AVPlayerItemVideoOutput *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)AVPlayerItemVideoOutput;
  v5 = -[AVPlayerItemOutput init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    v16 = 0;
    if (!-[AVPlayerItemVideoOutput setUpWithOutputSettings:outputSettingsArePixelBufferAttributes:withExceptionReason:](v5, "setUpWithOutputSettings:outputSettingsArePixelBufferAttributes:withExceptionReason:", outputSettings, 0, &v16))
    {
      v7 = v6;
      if (v16)
      {
        v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v6, a2, v16, v8, v9, v10, v11, v12, v15), 0);
        objc_exception_throw(v14);
      }
      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  AVPlayerItemVideoOutputInternal *videoOutputInternal;
  NSObject *delegateWakeupSource;
  OpaqueVTPixelBufferConformer *pixelBufferConformer;
  OpaqueFigVisualContext *vc;
  void (*v7)(OpaqueFigVisualContext *, _QWORD, _QWORD);
  OpaqueFigVisualContext *v8;
  void (*v9)(OpaqueFigVisualContext *);
  AVPlayerItemVideoOutputInternal *v10;
  OpaqueFigVisualContext *v11;
  AVPlayerItemVideoOutputInternal *v12;
  NSObject *v13;
  NSObject *stateQueue;
  objc_super v15;

  videoOutputInternal = self->_videoOutputInternal;
  delegateWakeupSource = videoOutputInternal->delegateWakeupSource;
  if (delegateWakeupSource)
  {
    dispatch_source_cancel(delegateWakeupSource);
    videoOutputInternal = self->_videoOutputInternal;
  }
  pixelBufferConformer = videoOutputInternal->pixelBufferConformer;
  if (pixelBufferConformer)
  {
    CFRelease(pixelBufferConformer);
    videoOutputInternal = self->_videoOutputInternal;
  }

  vc = self->_videoOutputInternal->vc;
  if (vc)
  {
    v7 = *(void (**)(OpaqueFigVisualContext *, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                         + 16);
    if (v7)
      v7(vc, 0, 0);
    v8 = self->_videoOutputInternal->vc;
    if (v8)
    {
      v9 = *(void (**)(OpaqueFigVisualContext *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
      if (v9)
        v9(v8);
    }
  }
  v10 = self->_videoOutputInternal;
  v11 = v10->vc;
  if (v11)
  {
    CFRelease(v11);
    v10 = self->_videoOutputInternal;
  }

  v12 = self->_videoOutputInternal;
  v13 = v12->delegateWakeupSource;
  if (v13)
  {
    dispatch_release(v13);
    v12 = self->_videoOutputInternal;
  }
  stateQueue = v12->stateQueue;
  if (stateQueue)
  {
    dispatch_release(stateQueue);
    v12 = self->_videoOutputInternal;
  }

  CFRelease(self->_videoOutputInternal);
  v15.receiver = self;
  v15.super_class = (Class)AVPlayerItemVideoOutput;
  -[AVPlayerItemOutput dealloc](&v15, sel_dealloc);
}

- (int64_t)clientStateOnRequestedMediaDataChangeNotification
{
  return *(_QWORD *)&self->_videoOutputInternal->immediateWakeUp;
}

- (id)_pixelBufferAttributes
{
  return (id)VTPixelBufferConformerGetAttributes();
}

- (BOOL)_attachToPlayerItem:(id)a3
{
  NSObject *stateQueue;
  _QWORD v6[6];

  stateQueue = self->_videoOutputInternal->stateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__AVPlayerItemVideoOutput__attachToPlayerItem___block_invoke;
  v6[3] = &unk_1E302FCE8;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(stateQueue, v6);
  -[AVPlayerItemVideoOutput _respondToPlayerItemFormatDescriptionsChange](self, "_respondToPlayerItemFormatDescriptionsChange");
  return 1;
}

id __47__AVPlayerItemVideoOutput__attachToPlayerItem___block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1 + 40), "_weakReference");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 32) = result;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 112) = 1;
  return result;
}

- (void)_detachFromPlayerItem
{
  NSObject *stateQueue;
  _QWORD block[5];

  stateQueue = self->_videoOutputInternal->stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__AVPlayerItemVideoOutput__detachFromPlayerItem__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

_QWORD *__48__AVPlayerItemVideoOutput__detachFromPlayerItem__block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 32) = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 112) = 0;
  result = *(_QWORD **)(a1 + 32);
  v3 = result[2];
  if (*(_BYTE *)(v3 + 80))
  {
    dispatch_source_set_timer(*(dispatch_source_t *)(v3 + 64), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    result = *(_QWORD **)(a1 + 32);
    v3 = result[2];
    if (*(_BYTE *)(v3 + 80))
      return (_QWORD *)objc_msgSend(result, "_dispatchOutputMediaDataWillChange");
  }
  if (*(_BYTE *)(v3 + 108))
    return (_QWORD *)objc_msgSend(result, "_dispatchOutputMediaDataWillChange");
  return result;
}

- (void)setDelegate:(id)delegate queue:(dispatch_queue_t)delegateQueue
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;

  if (delegateQueue)
    v8 = 1;
  else
    v8 = delegate == 0;
  if (!v8)
    delegateQueue = (dispatch_queue_t)MEMORY[0x1E0C80D38];
  if (delegate)
  {
    if (!delegateQueue)
    {
      v9 = (void *)MEMORY[0x1E0C99DA0];
      v10 = *MEMORY[0x1E0C99778];
      v11 = "newDelegateQueue != NULL";
      goto LABEL_12;
    }
  }
  else if (delegateQueue)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    v11 = "newDelegateQueue == NULL";
LABEL_12:
    v12 = (void *)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)delegateQueue, v4, v5, v6, v7, (uint64_t)v11), 0);
    objc_exception_throw(v12);
  }
  -[AVWeakReferencingDelegateStorage setDelegate:queue:](self->_videoOutputInternal->delegateStorage, "setDelegate:queue:");
}

- (id)delegate
{
  return -[AVWeakReferencingDelegateStorage delegate](self->_videoOutputInternal->delegateStorage, "delegate");
}

- (dispatch_queue_t)delegateQueue
{
  return (dispatch_queue_t)-[AVWeakReferencingDelegateStorage delegateQueue](self->_videoOutputInternal->delegateStorage, "delegateQueue");
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)earliestAvailablePixelBufferItemTime
{
  uint64_t v5;
  int64_t v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  OpaqueFigVisualContext *vc;
  uint64_t (*v9)(OpaqueFigVisualContext *, __int128 *);
  __int128 v10;
  __int128 v11;
  int64_t var3;
  __int128 v13;
  int64_t v14;

  v5 = MEMORY[0x1E0CA2E18];
  v10 = *MEMORY[0x1E0CA2E18];
  *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E18];
  v6 = *(_QWORD *)(v5 + 16);
  retstr->var3 = v6;
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)FigVisualContextGetEarliestSequentialImageTime();
  if ((retstr->var2 & 0x1D) == 1)
  {
    vc = self->_videoOutputInternal->vc;
    v11 = *(_OWORD *)&retstr->var0;
    var3 = retstr->var3;
    result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMBaseObjectGetVTable();
    v9 = *(uint64_t (**)(OpaqueFigVisualContext *, __int128 *))(result->var3 + 40);
    if (!v9 || (v13 = v11, v14 = var3, result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)v9(vc, &v13), !(_DWORD)result))
    {
      *(_OWORD *)&retstr->var0 = v10;
      retstr->var3 = v6;
    }
  }
  return result;
}

- (void)requestNotificationOfMediaDataChangeWithAdvanceInterval:(NSTimeInterval)interval
{
  NSObject *stateQueue;
  _QWORD v4[6];

  stateQueue = self->_videoOutputInternal->stateQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__AVPlayerItemVideoOutput_requestNotificationOfMediaDataChangeWithAdvanceInterval___block_invoke;
  v4[3] = &unk_1E302FE78;
  v4[4] = self;
  *(NSTimeInterval *)&v4[5] = interval;
  dispatch_sync(stateQueue, v4);
}

void __83__AVPlayerItemVideoOutput_requestNotificationOfMediaDataChangeWithAdvanceInterval___block_invoke(uint64_t a1)
{
  uint64_t v2;
  OpaqueCMClock *HostTimeClock;
  CMClockRef v4;
  const void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, _QWORD, CMTime *, CMTime *, char *);
  uint64_t v10;
  Float64 v11;
  dispatch_time_t v12;
  CMTime v13;
  CMTime v14;
  char v15;
  CMTime v16;
  CMTime rhs;
  CMTime v18;
  CMTime v19;
  CMTime lhs;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 72) = *(_QWORD *)(a1 + 40);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 80) = 1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 112) = 2;
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (*(_BYTE *)(v2 + 108))
  {
    *(_BYTE *)(v2 + 108) = 0;
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  }
  if (*(double *)(v2 + 16) != 0.0)
  {
    memset(&v19, 0, sizeof(v19));
    HostTimeClock = CMClockGetHostTimeClock();
    CMClockGetTime(&v19, HostTimeClock);
    memset(&v18, 0, sizeof(v18));
    CMTimeMakeWithSeconds(&rhs, *(Float64 *)(a1 + 40), v19.timescale);
    lhs = v19;
    CMTimeAdd(&v18, &lhs, &rhs);
    memset(&v16, 0, sizeof(v16));
    v4 = CMClockGetHostTimeClock();
    v5 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 8);
    lhs = v18;
    CMSyncConvertTime(&v16, &lhs, v4, v5);
    v6 = *(void **)(a1 + 32);
    lhs = v16;
    if (objc_msgSend(v6, "hasNewPixelBufferForItemTime:", &lhs))
    {
      dispatch_source_set_timer(*(dispatch_source_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 64), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
      objc_msgSend(*(id *)(a1 + 32), "_dispatchOutputMediaDataWillChange");
    }
    else
    {
      v14 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      v15 = 0;
      v8 = *(_QWORD *)(v7 + 24);
      v13 = v16;
      v9 = *(void (**)(uint64_t, _QWORD, CMTime *, CMTime *, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                              + 64);
      if (!v9 || (lhs = v13, v9(v8, 0, &lhs, &v14, &v15), !v15))
      {
        if ((v14.flags & 0x1D) == 1)
        {
          v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
          v11 = *(double *)(a1 + 40);
          lhs = v14;
          v12 = AVPlayerItemVideoOutputConvertImageTimeToDispatchTimeWithInterval(v10, &lhs, v11);
          dispatch_source_set_timer(*(dispatch_source_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 64), v12, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16) / 10.0));
        }
      }
    }
  }
}

- (void)requestNotificationOfMediaDataChangeAsSoonAsPossible
{
  NSObject *stateQueue;
  _QWORD block[5];

  stateQueue = self->_videoOutputInternal->stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__AVPlayerItemVideoOutput_requestNotificationOfMediaDataChangeAsSoonAsPossible__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

uint64_t __79__AVPlayerItemVideoOutput_requestNotificationOfMediaDataChangeAsSoonAsPossible__block_invoke(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 16) + 108) = 1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 16) + 112) = 3;
  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 16);
  if (*(_BYTE *)(v1 + 80))
    *(_BYTE *)(v1 + 80) = 0;
  return result;
}

- (__CVBuffer)copyPixelBufferForItemTime:(id *)a3 remove:(BOOL)a4 itemTimeForDisplay:(id *)a5
{
  uint64_t v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  if (a4)
    v6 = 3;
  else
    v6 = 1;
  v8 = *a3;
  return -[AVPlayerItemVideoOutput _copyPixelBufferForItemTimeWithOptions:itemTimeForDisplay:options:](self, "_copyPixelBufferForItemTimeWithOptions:itemTimeForDisplay:options:", &v8, a5, v6);
}

- (void)setSuppressesPlayerRendering:(BOOL)a3
{
  NSObject *stateQueue;
  _QWORD block[6];
  BOOL v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__35;
  v11 = __Block_byref_object_dispose__35;
  v12 = 0;
  stateQueue = self->_videoOutputInternal->stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__AVPlayerItemVideoOutput_setSuppressesPlayerRendering___block_invoke;
  block[3] = &unk_1E3031820;
  v6 = a3;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(stateQueue, block);
  objc_msgSend((id)objc_msgSend((id)v8[5], "referencedObject"), "_renderingSuppressionDidChangeForOutput:", self);

  _Block_object_dispose(&v7, 8);
}

id __56__AVPlayerItemVideoOutput_setSuppressesPlayerRendering___block_invoke(uint64_t a1)
{
  id result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 120) = *(_BYTE *)(a1 + 48);
  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 32);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_respondToPlayerItemFormatDescriptionsChange
{
  NSObject *stateQueue;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD block[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__35;
  v14 = __Block_byref_object_dispose__35;
  v15 = 0;
  stateQueue = self->_videoOutputInternal->stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__AVPlayerItemVideoOutput__respondToPlayerItemFormatDescriptionsChange__block_invoke;
  block[3] = &unk_1E302FD60;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(stateQueue, block);
  v4 = (void *)v11[5];
  if (v4)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = 0;
    v8 = 0;
    v6 = 0;
    objc_msgSend(*(id *)&self->_videoOutputInternal->suppressesPlayerRendering, "colorPropertiesConsideringFormatDescriptions:colorPrimaries:transferFunction:ycbcrMatrix:", objc_msgSend((id)v11[5], "_enabledTrackFormatDescriptions"), &v8, &v7, &v6);
    if (v8)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CA8D68]);
    if (v7)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CA8E98]);
    if (v6)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CA8EE8]);
    VTPixelBufferConformerSetColorProperties();
    v4 = (void *)v11[5];
  }

  _Block_object_dispose(&v10, 8);
}

id __71__AVPlayerItemVideoOutput__respondToPlayerItemFormatDescriptionsChange__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 32), "referencedObject");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_setTagBuffersWithConversionInformation
{
  BYTE1(self->_videoOutputInternal->clientStateOnRequestedMediaDataChangeNotification) = 1;
}

- (void)_stopObservingTimebaseNotificationsForTimebase:(OpaqueCMTimebase *)a3
{
  id v5;
  id v6;

  if (a3)
  {
    v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v6 = -[AVPlayerItemOutput _weakReference](self, "_weakReference");
    objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", v6, AVPlayerItemVideoOutput_timebaseNotificationCallback, *MEMORY[0x1E0CA2E78], a3);
  }
}

- (void)_startObservingTimebaseNotificationsForTimebase:(OpaqueCMTimebase *)a3
{
  id v5;
  id v6;

  if (a3)
  {
    v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v6 = -[AVPlayerItemOutput _weakReference](self, "_weakReference");
    objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", v6, AVPlayerItemVideoOutput_timebaseNotificationCallback, *MEMORY[0x1E0CA2E78], a3, 0);
  }
}

- (void)_setTimebase:(OpaqueCMTimebase *)a3
{
  NSObject *stateQueue;
  _QWORD v6[6];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVPlayerItemVideoOutput;
  -[AVPlayerItemOutput _setTimebase:](&v7, sel__setTimebase_);
  stateQueue = self->_videoOutputInternal->stateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__AVPlayerItemVideoOutput__setTimebase___block_invoke;
  v6[3] = &unk_1E302FE78;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(stateQueue, v6);
}

uint64_t __40__AVPlayerItemVideoOutput__setTimebase___block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t v3;
  const void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_stopObservingTimebaseNotificationsForTimebase:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 8));
  v2 = *(const void **)(a1 + 40);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = *(const void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;
  if (v2)
    CFRetain(v2);
  if (v4)
    CFRelease(v4);
  return objc_msgSend(*(id *)(a1 + 32), "_startObservingTimebaseNotificationsForTimebase:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 8));
}

- (void)_dispatchOutputSequenceWasFlushed
{
  AVWeakReferencingDelegateStorage *delegateStorage;
  _QWORD v3[5];

  delegateStorage = self->_videoOutputInternal->delegateStorage;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__AVPlayerItemVideoOutput__dispatchOutputSequenceWasFlushed__block_invoke;
  v3[3] = &unk_1E3032B48;
  v3[4] = self;
  -[AVWeakReferencingDelegateStorage invokeDelegateCallbackWithBlock:](delegateStorage, "invokeDelegateCallbackWithBlock:", v3);
}

uint64_t __60__AVPlayerItemVideoOutput__dispatchOutputSequenceWasFlushed__block_invoke(uint64_t result, void *a2)
{
  uint64_t v3;

  if (a2)
  {
    v3 = result;
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(a2, "outputSequenceWasFlushed:", *(_QWORD *)(v3 + 32));
  }
  return result;
}

- (BOOL)isDefunct
{
  NSObject *stateQueue;
  BOOL v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_videoOutputInternal->stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__AVPlayerItemVideoOutput_isDefunct__block_invoke;
  v5[3] = &unk_1E302FDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = *((_BYTE *)v7 + 24) == 1;
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__AVPlayerItemVideoOutput_isDefunct__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  _QWORD *v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t v7;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 24);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = CMBaseObjectGetVTable();
  v5 = *(_QWORD **)(result + 8);
  if (*v5 < 5uLL)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    v6 = (uint64_t (*)(uint64_t, uint64_t))v5[11];
    if (v6)
    {
      result = v6(v2, v3 + 24);
      LOBYTE(v6) = (_DWORD)result == 0;
    }
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (!*(_BYTE *)(v7 + 24) && (v6 & 1) == 0)
    *(_BYTE *)(v7 + 24) = 1;
  return result;
}

uint64_t __AVPlayerItemVideoOutput_figVCSequentialAvailableCallback_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dispatchOutputMediaDataWillChange");
}

uint64_t __AVPlayerItemVideoOutput_figVCSequentialAvailableCallback_block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 80))
  {
    dispatch_source_set_timer(*(dispatch_source_t *)(v2 + 64), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    objc_msgSend(*(id *)(a1 + 40), "_dispatchOutputMediaDataWillChange");
  }
  return objc_msgSend(*(id *)(a1 + 40), "_dispatchOutputSequenceWasFlushed");
}

void __AVPlayerItemVideoOutput_figVCSequentialAvailableCallback_block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  Float64 v2;
  int v3;
  double v4;
  uint64_t v5;
  CMTime *v7;
  uint64_t v8;
  dispatch_time_t v9;
  CMTime v10;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(double *)(v1 + 72);
  v3 = *(unsigned __int8 *)(v1 + 80);
  v4 = *(double *)(v1 + 16);
  v5 = *(_QWORD *)(a1 + 56);
  *(_OWORD *)(v1 + 84) = *(_OWORD *)(a1 + 40);
  *(_QWORD *)(v1 + 100) = v5;
  if (v3)
  {
    if (v4 != 0.0)
    {
      v7 = (CMTime *)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 32);
      v10 = *v7;
      v9 = AVPlayerItemVideoOutputConvertImageTimeToDispatchTimeWithInterval(v8, &v10, v2);
      dispatch_source_set_timer(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 64), v9, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(*(double *)(*(_QWORD *)(a1 + 32) + 16) / 10.0));
    }
  }
}

@end

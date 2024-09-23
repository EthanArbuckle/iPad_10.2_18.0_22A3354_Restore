@implementation AVSampleBufferVideoOutput

- (BOOL)setUpWithOutputSettings:(id)a3 outputSettingsArePixelBufferAttributes:(BOOL)a4 withExceptionReason:(id *)a5
{
  uint64_t v7;
  id v8;
  OpaqueFigVisualContext *vc;
  unsigned int (*v10)(OpaqueFigVisualContext *, void (*)(uint64_t, __int128 *, char, void *), id);

  self->_videoOutputInternal->lastImageTime = *($95D729B680665BEAEFA1D6FCA8238556 *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  if (VTPixelBufferConformerCreateWithAttributes())
    return 0;
  if (!self->_videoOutputInternal->pixelBufferConformer)
    return 0;
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.015);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v7, *MEMORY[0x1E0CC67A0], 0);
  v8 = -[AVSampleBufferVideoOutput _weakReference](self, "_weakReference");
  if (FigVisualContextCreateRemote())
    return 0;
  vc = self->_videoOutputInternal->vc;
  if (!vc)
    return 0;
  v10 = *(unsigned int (**)(OpaqueFigVisualContext *, void (*)(uint64_t, __int128 *, char, void *), id))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v10 || v10(vc, AVSampleBufferVideoOutput_figVCAvailableImmediate, v8))
    return 0;
  self->_videoOutputInternal->stateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.avsamplebuffervideooutput", 0);
  return 1;
}

- (AVSampleBufferVideoOutput)init
{
  AVSampleBufferVideoOutput *v2;
  AVSampleBufferVideoOutputInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVSampleBufferVideoOutput;
  v2 = -[AVSampleBufferVideoOutput init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AVSampleBufferVideoOutputInternal);
    v2->_videoOutputInternal = v3;
    if (!v3
      || (v2->_videoOutputInternal->delegateStorage = objc_alloc_init(AVWeakReferencingDelegateStorage),
          v2->_videoOutputInternal->weakReference = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v2), !-[AVSampleBufferVideoOutput setUpWithOutputSettings:outputSettingsArePixelBufferAttributes:withExceptionReason:](v2, "setUpWithOutputSettings:outputSettingsArePixelBufferAttributes:withExceptionReason:", 0, 1, 0)))
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  AVSampleBufferVideoOutputInternal *videoOutputInternal;
  OpaqueVTPixelBufferConformer *pixelBufferConformer;
  OpaqueFigVisualContext *vc;
  void (*v6)(OpaqueFigVisualContext *, _QWORD, _QWORD);
  OpaqueFigVisualContext *v7;
  void (*v8)(OpaqueFigVisualContext *);
  OpaqueFigVisualContext *v9;
  AVSampleBufferVideoOutputInternal *v10;
  NSObject *stateQueue;
  objc_super v12;

  videoOutputInternal = self->_videoOutputInternal;
  if (videoOutputInternal)
  {
    pixelBufferConformer = videoOutputInternal->pixelBufferConformer;
    if (pixelBufferConformer)
    {
      CFRelease(pixelBufferConformer);
      videoOutputInternal = self->_videoOutputInternal;
    }
    vc = videoOutputInternal->vc;
    if (vc)
    {
      v6 = *(void (**)(OpaqueFigVisualContext *, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                           + 8);
      if (v6)
        v6(vc, 0, 0);
      v7 = self->_videoOutputInternal->vc;
      if (v7)
      {
        v8 = *(void (**)(OpaqueFigVisualContext *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
        if (v8)
          v8(v7);
      }
      videoOutputInternal = self->_videoOutputInternal;
      v9 = videoOutputInternal->vc;
      if (v9)
      {
        CFRelease(v9);
        videoOutputInternal = self->_videoOutputInternal;
      }
    }

    v10 = self->_videoOutputInternal;
    stateQueue = v10->stateQueue;
    if (stateQueue)
    {
      dispatch_release(stateQueue);
      v10 = self->_videoOutputInternal;
    }

  }
  v12.receiver = self;
  v12.super_class = (Class)AVSampleBufferVideoOutput;
  -[AVSampleBufferVideoOutput dealloc](&v12, sel_dealloc);
}

- (id)_weakReference
{
  AVSampleBufferVideoOutputInternal *videoOutputInternal;

  videoOutputInternal = self->_videoOutputInternal;
  if (videoOutputInternal)
    return videoOutputInternal->weakReference;
  else
    return 0;
}

- (void)setOutputDelegate:(id)a3 queue:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  void *v11;

  if (a3)
  {
    if (!a4)
    {
      v8 = (void *)MEMORY[0x1E0C99DA0];
      v9 = *MEMORY[0x1E0C99778];
      v10 = "delegateQueue != NULL";
      goto LABEL_7;
    }
  }
  else if (a4)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = "delegateQueue == NULL";
LABEL_7:
    v11 = (void *)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)a4, v4, v5, v6, v7, (uint64_t)v10), 0);
    objc_exception_throw(v11);
  }
  -[AVWeakReferencingDelegateStorage setDelegate:queue:](self->_videoOutputInternal->delegateStorage, "setDelegate:queue:");
}

- (AVSampleBufferVideoOutputPullDelegate)outputDelegate
{
  return (AVSampleBufferVideoOutputPullDelegate *)-[AVWeakReferencingDelegateStorage delegate](self->_videoOutputInternal->delegateStorage, "delegate");
}

- (OS_dispatch_queue)delegateQueue
{
  return -[AVWeakReferencingDelegateStorage delegateQueue](self->_videoOutputInternal->delegateStorage, "delegateQueue");
}

- (__CVBuffer)_copyPixelBufferForItemTimeWithOptions:(id *)a3 itemTimeForDisplay:(id *)a4 options:(unsigned int)a5
{
  uint64_t v5;
  OpaqueFigVisualContext *vc;
  unsigned int (*v8)(OpaqueFigVisualContext *, uint64_t, $3CC8671D27C23BF42ADDB32F2B5E48AE *, uint64_t, CFTypeRef *, _QWORD, __int128 *);
  uint64_t v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;
  __int128 v12;
  int64_t v13;
  __CVBuffer *v14;
  CFTypeRef cf;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v16;

  v5 = *(_QWORD *)&a5;
  v14 = 0;
  cf = 0;
  v13 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v12 = *MEMORY[0x1E0CA2E18];
  vc = self->_videoOutputInternal->vc;
  v11 = *a3;
  v8 = *(unsigned int (**)(OpaqueFigVisualContext *, uint64_t, $3CC8671D27C23BF42ADDB32F2B5E48AE *, uint64_t, CFTypeRef *, _QWORD, __int128 *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
  if (v8)
  {
    v9 = *MEMORY[0x1E0C9AE00];
    v16 = v11;
    if (!v8(vc, v9, &v16, v5, &cf, 0, &v12))
    {
      if (a4)
      {
        if ((BYTE12(v12) & 0x1D) != 1)
          goto LABEL_8;
        *(_OWORD *)&a4->var0 = v12;
        a4->var3 = v13;
      }
      if (VTPixelBufferConformerCopyConformedPixelBuffer())
        v14 = 0;
    }
  }
LABEL_8:
  if (cf)
    CFRelease(cf);
  return v14;
}

- (BOOL)hasNewPixelBufferForSourceTime:(id *)a3
{
  OpaqueFigVisualContext *vc;
  unsigned int (*v4)(OpaqueFigVisualContext *, $3CC8671D27C23BF42ADDB32F2B5E48AE *);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  if ((a3->var2 & 0x1D) != 1)
    return 0;
  vc = self->_videoOutputInternal->vc;
  v6 = *a3;
  v4 = *(unsigned int (**)(OpaqueFigVisualContext *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (!v4)
    return 0;
  v7 = v6;
  return v4(vc, &v7) != 0;
}

- (__CVBuffer)copyPixelBufferForSourceTime:(id *)a3 sourceTimeForDisplay:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  v5 = *a3;
  return -[AVSampleBufferVideoOutput _copyPixelBufferForItemTimeWithOptions:itemTimeForDisplay:options:](self, "_copyPixelBufferForItemTimeWithOptions:itemTimeForDisplay:options:", &v5, a4, 1);
}

- (__CVBuffer)copyLastPixelBuffer:(id *)a3
{
  NSObject *stateQueue;
  __CVBuffer *v6;
  __CVBuffer *v7;
  __int128 v9;
  uint64_t v10;
  _QWORD block[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  int64_t v17;
  __int128 v18;
  int64_t v19;

  v18 = *MEMORY[0x1E0CA2E18];
  v19 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3810000000;
  v15 = &unk_1935931BF;
  v16 = v18;
  v17 = v19;
  stateQueue = self->_videoOutputInternal->stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__AVSampleBufferVideoOutput_copyLastPixelBuffer___block_invoke;
  block[3] = &unk_1E302FD60;
  block[4] = self;
  block[5] = &v12;
  dispatch_sync(stateQueue, block);
  v6 = 0;
  if ((*((_DWORD *)v13 + 11) & 0x1D) == 1)
  {
    v9 = *((_OWORD *)v13 + 2);
    v10 = v13[6];
    v7 = -[AVSampleBufferVideoOutput copyPixelBufferForSourceTime:sourceTimeForDisplay:](self, "copyPixelBufferForSourceTime:sourceTimeForDisplay:", &v9, &v18);
    v6 = v7;
    if (a3)
    {
      if (v7 && (BYTE12(v18) & 0x1D) == 1)
      {
        *(_OWORD *)&a3->var0 = v18;
        a3->var3 = v19;
      }
    }
  }
  _Block_object_dispose(&v12, 8);
  return v6;
}

__n128 __49__AVSampleBufferVideoOutput_copyLastPixelBuffer___block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 *v2;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  v2 = *(__n128 **)(*(_QWORD *)(a1 + 32) + 8);
  result = v2[3];
  v1[3].n128_u64[0] = v2[4].n128_u64[0];
  v1[2] = result;
  return result;
}

- (BOOL)_configureWithVideoQueue:(OpaqueFigVideoQueue *)a3
{
  const __CFAllocator *v3;
  CFArrayRef v4;
  uint64_t CMBaseObject;
  uint64_t (*v6)(uint64_t, _QWORD, CFArrayRef);
  int v7;
  BOOL v8;
  uint64_t v9;
  unsigned int (*v10)(uint64_t, _QWORD, CFArrayRef);

  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v4 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&self->_videoOutputInternal->vc, 1, MEMORY[0x1E0C9B378]);
  CMBaseObject = FigVideoQueueGetCMBaseObject();
  v6 = *(uint64_t (**)(uint64_t, _QWORD, CFArrayRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (!v6)
    goto LABEL_6;
  v7 = v6(CMBaseObject, *MEMORY[0x1E0CC6480], v4);
  CFRelease(v4);
  if (!v7)
  {
    v4 = CFArrayCreate(v3, MEMORY[0x1E0C9B0D0], 1, MEMORY[0x1E0C9B378]);
    v9 = FigVideoQueueGetCMBaseObject();
    v10 = *(unsigned int (**)(uint64_t, _QWORD, CFArrayRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v10)
    {
      v8 = v10(v9, *MEMORY[0x1E0CC6488], v4) == 0;
LABEL_7:
      CFRelease(v4);
      return v8;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  return 0;
}

- (void)_resetLastImageTime
{
  NSObject *stateQueue;
  _QWORD block[5];

  stateQueue = self->_videoOutputInternal->stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__AVSampleBufferVideoOutput__resetLastImageTime__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

__n128 __48__AVSampleBufferVideoOutput__resetLastImageTime__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  __n128 result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = MEMORY[0x1E0CA2E18];
  result = *(__n128 *)MEMORY[0x1E0CA2E18];
  *(_OWORD *)(v1 + 48) = *MEMORY[0x1E0CA2E18];
  *(_QWORD *)(v1 + 64) = *(_QWORD *)(v2 + 16);
  return result;
}

- (OpaqueFigVisualContext)_visualContext
{
  return self->_videoOutputInternal->vc;
}

- (void)_dispatchOutputSequenceWasFlushed
{
  AVWeakReferencingDelegateStorage *delegateStorage;
  _QWORD v3[5];

  delegateStorage = self->_videoOutputInternal->delegateStorage;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__AVSampleBufferVideoOutput__dispatchOutputSequenceWasFlushed__block_invoke;
  v3[3] = &unk_1E3032B48;
  v3[4] = self;
  -[AVWeakReferencingDelegateStorage invokeDelegateCallbackWithBlock:](delegateStorage, "invokeDelegateCallbackWithBlock:", v3);
}

uint64_t __62__AVSampleBufferVideoOutput__dispatchOutputSequenceWasFlushed__block_invoke(uint64_t result, void *a2)
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

__n128 __AVSampleBufferVideoOutput_figVCAvailableImmediate_block_invoke(uint64_t a1)
{
  uint64_t v2;
  __n128 result;
  CMTime v4;
  CMTime time1;

  v2 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v2 + 60) & 1) != 0)
  {
    time1 = *(CMTime *)(a1 + 40);
    v4 = *(CMTime *)(v2 + 48);
    if (CMTimeCompare(&time1, &v4) < 1)
      return result;
    v2 = *(_QWORD *)(a1 + 32);
  }
  result = *(__n128 *)(a1 + 40);
  *(_QWORD *)(v2 + 64) = *(_QWORD *)(a1 + 56);
  *(__n128 *)(v2 + 48) = result;
  return result;
}

uint64_t __AVSampleBufferVideoOutput_figVCAvailableImmediate_block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dispatchOutputSequenceWasFlushed");
}

@end

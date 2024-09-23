@implementation AVSampleBufferGeneratorBatch

+ (void)initialize
{
  objc_opt_class();
}

- (AVSampleBufferGeneratorBatch)initWithGenerator:(id)a3
{
  AVSampleBufferGeneratorBatch *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  AVSampleBufferGeneratorBatch *v11;
  uint64_t v12;
  _QWORD *v13;
  void (*v14)(uint64_t, _QWORD, OpaqueFigSampleGeneratorBatch **);
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)AVSampleBufferGeneratorBatch;
  v5 = -[AVSampleBufferGeneratorBatch init](&v17, sel_init);
  v11 = v5;
  if (v5)
  {
    if (!a3)
    {
      v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v5, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v6, v7, v8, v9, v10, (uint64_t)"generator != nil"), 0);
      objc_exception_throw(v16);
    }
    v5->_sampleGenerator = (AVSampleBufferGenerator *)a3;
    v12 = objc_msgSend(a3, "_figSampleGenerator");
    v13 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
    if (*v13 >= 2uLL)
    {
      v14 = (void (*)(uint64_t, _QWORD, OpaqueFigSampleGeneratorBatch **))v13[4];
      if (v14)
        v14(v12, *MEMORY[0x1E0C9AE00], &v11->_sampleGeneratorBatch);
    }
    v11->_openToRequests = 1;
    v11->_completionHandler = 0;
    v11->_stateMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  }
  return v11;
}

- (AVSampleBufferGeneratorBatch)init
{
  return -[AVSampleBufferGeneratorBatch initWithGenerator:](self, "initWithGenerator:", 0);
}

- (void)dealloc
{
  OpaqueFigSampleGeneratorBatch *sampleGeneratorBatch;
  objc_super v4;

  CMNotificationCenterGetDefaultLocalCenter();
  FigNotificationCenterRemoveWeakListener();
  sampleGeneratorBatch = self->_sampleGeneratorBatch;
  if (sampleGeneratorBatch)
    CFRelease(sampleGeneratorBatch);

  FigSimpleMutexDestroy();
  v4.receiver = self;
  v4.super_class = (Class)AVSampleBufferGeneratorBatch;
  -[AVSampleBufferGeneratorBatch dealloc](&v4, sel_dealloc);
}

- (AVSampleBufferGenerator)_generator
{
  return self->_sampleGenerator;
}

- (id)_completionHandler
{
  return self->_completionHandler;
}

- (BOOL)isOpenToRequests
{
  BOOL openToRequests;

  MEMORY[0x194033BF8](self->_stateMutex, a2);
  openToRequests = self->_openToRequests;
  MEMORY[0x194033C04](self->_stateMutex);
  return openToRequests;
}

- (opaqueCMSampleBuffer)createAndAddSampleBufferForRequest:(id)a3 error:(id *)a4
{
  OpaqueFigSampleGeneratorBatch *sampleGeneratorBatch;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(OpaqueFigSampleGeneratorBatch *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *(*)(void *, uint64_t, opaqueCMSampleBuffer *), id, _QWORD, opaqueCMSampleBuffer **);
  signed int v15;
  opaqueCMSampleBuffer *v17;

  v17 = 0;
  sampleGeneratorBatch = self->_sampleGeneratorBatch;
  v7 = objc_msgSend((id)objc_msgSend(a3, "startCursor"), "_figSampleCursor");
  v8 = objc_msgSend(a3, "preferredMinSampleCount");
  v9 = objc_msgSend(a3, "maxSampleCount");
  v10 = objc_msgSend(a3, "direction");
  v11 = objc_msgSend((id)objc_msgSend(a3, "limitCursor"), "_figSampleCursor");
  v12 = objc_msgSend(a3, "_figSampleGeneratorReadPolicy");
  v13 = objc_msgSend(a3, "_figSampleGeneratorReadFlags");
  v14 = *(uint64_t (**)(OpaqueFigSampleGeneratorBatch *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *(*)(void *, uint64_t, opaqueCMSampleBuffer *), id, _QWORD, opaqueCMSampleBuffer **))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (v14)
  {
    v15 = v14(sampleGeneratorBatch, v7, v8, v9, v10, v11, v12, v13, AVSampleBufferGenerator_remapSampleBufferTiming, a3, 0, &v17);
    if (!a4)
      return v17;
  }
  else
  {
    v15 = -12782;
    if (!a4)
      return v17;
  }
  if (v15)
    *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v15, 0);
  return v17;
}

- (void)makeDataReadyWithCompletionHandler:(void *)completionHandler
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  OpaqueFigSampleGeneratorBatch *sampleGeneratorBatch;
  uint64_t (*v13)(OpaqueFigSampleGeneratorBatch *);
  signed int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17[5];
  _QWORD block[5];

  MEMORY[0x194033BF8](self->_stateMutex);
  if (!self->_openToRequests)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("makeDataReadyWithCompletionHandler should only be called once."), v6, v7, v8, v9, v10, v17[0]), 0);
    objc_exception_throw(v16);
  }
  self->_openToRequests = 0;
  MEMORY[0x194033C04](self->_stateMutex);
  self->_completionHandler = (id)objc_msgSend(completionHandler, "copy");
  if (sAVSampleBufferGeneratorBatch_SetupOnce != -1)
    dispatch_once(&sAVSampleBufferGeneratorBatch_SetupOnce, &__block_literal_global_90);
  v11 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__AVSampleBufferGeneratorBatch_makeDataReadyWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)sAVSampleBufferGeneratorBatch_DispatchQueue, block);
  CMNotificationCenterGetDefaultLocalCenter();
  FigNotificationCenterAddWeakListener();
  sampleGeneratorBatch = self->_sampleGeneratorBatch;
  v13 = *(uint64_t (**)(OpaqueFigSampleGeneratorBatch *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
  if (!v13)
  {
    v14 = -12782;
    goto LABEL_8;
  }
  v14 = v13(sampleGeneratorBatch);
  if (v14)
  {
LABEL_8:
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = (uint64_t)__67__AVSampleBufferGeneratorBatch_makeDataReadyWithCompletionHandler___block_invoke_3;
    v17[3] = (uint64_t)&unk_1E302FA10;
    v17[4] = (uint64_t)self;
    dispatch_sync((dispatch_queue_t)sAVSampleBufferGeneratorBatch_DispatchQueue, v17);
    v15 = AVLocalizedErrorWithUnderlyingOSStatus(v14, 0);
    (*((void (**)(void *, uint64_t))completionHandler + 2))(completionHandler, v15);
  }
}

dispatch_queue_t __67__AVSampleBufferGeneratorBatch_makeDataReadyWithCompletionHandler___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t result;

  sAVSampleBufferGeneratorBatch_PendingCompletion = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E20]);
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  result = dispatch_queue_create("com.apple.avfoundation.avsamplebuffergenerator.batch-ready-notifications", v0);
  sAVSampleBufferGeneratorBatch_DispatchQueue = (uint64_t)result;
  return result;
}

uint64_t __67__AVSampleBufferGeneratorBatch_makeDataReadyWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)sAVSampleBufferGeneratorBatch_PendingCompletion, "addObject:", *(_QWORD *)(a1 + 32));
}

uint64_t __67__AVSampleBufferGeneratorBatch_makeDataReadyWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend((id)sAVSampleBufferGeneratorBatch_PendingCompletion, "removeObject:", *(_QWORD *)(a1 + 32));
}

- (void)cancel
{
  OpaqueFigSampleGeneratorBatch *sampleGeneratorBatch;
  void (*v4)(OpaqueFigSampleGeneratorBatch *);

  MEMORY[0x194033BF8](self->_stateMutex, a2);
  self->_openToRequests = 0;
  MEMORY[0x194033C04](self->_stateMutex);
  sampleGeneratorBatch = self->_sampleGeneratorBatch;
  v4 = *(void (**)(OpaqueFigSampleGeneratorBatch *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (v4)
    v4(sampleGeneratorBatch);
}

uint64_t __AVSampleBufferGeneratorBatch_BatchCompleted_block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_completionHandler");
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
  if (v5)
    v5(v3, v4 + 24);
  return objc_msgSend((id)sAVSampleBufferGeneratorBatch_PendingCompletion, "removeObject:", *(_QWORD *)(a1 + 32));
}

@end

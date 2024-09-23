@implementation AVSampleBufferGenerator

+ (void)initialize
{
  objc_opt_class();
}

- (AVSampleBufferGenerator)initWithAsset:(AVAsset *)asset timebase:(CMTimebaseRef)timebase
{
  AVSampleBufferGenerator *result;
  AVSampleBufferGenerator *v7;
  OpaqueFigAsset *v8;
  OpaqueFigFormatReader *v9;
  AVSampleBufferGeneratorInternal *v10;
  BOOL v11;
  BOOL v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AVSampleBufferGenerator;
  result = -[AVSampleBufferGenerator init](&v13, sel_init);
  if (result)
  {
    v7 = result;
    v8 = -[AVAsset _figAsset](asset, "_figAsset");
    v9 = -[AVAsset _copyFormatReader](asset, "_copyFormatReader");
    v10 = objc_alloc_init(AVSampleBufferGeneratorInternal);
    v7->_generator = v10;
    if (v10
      && (CFRetain(v10), asset)
      && (v7->_generator ? (v11 = v8 == 0) : (v11 = 1), !v11 ? (v12 = v9 == 0) : (v12 = 1), !v12))
    {
      v7->_generator->weakReferenceToAsset = (AVWeakReference *)-[AVAsset _weakReference](asset, "_weakReference");
      if (timebase)
        CFRetain(timebase);
      v7->_generator->timebase = timebase;
      FigSampleGeneratorRemoteCreateForFormatReader();
      if (!v7->_generator->figSampleGenerator)
      {

        v7 = 0;
      }
    }
    else
    {

      v7 = 0;
      result = 0;
      if (!v9)
        return result;
    }
    CFRelease(v9);
    return v7;
  }
  return result;
}

- (AVSampleBufferGenerator)init
{
  return -[AVSampleBufferGenerator initWithAsset:timebase:](self, "initWithAsset:timebase:", 0, 0);
}

- (void)dealloc
{
  AVSampleBufferGeneratorInternal *generator;
  AVSampleBufferGeneratorInternal *v4;
  objc_super v5;

  generator = self->_generator;
  if (generator)
  {

    v4 = self->_generator;
    if (v4->timebase)
    {
      CFRelease(v4->timebase);
      v4 = self->_generator;
    }
    if (v4->figSampleGenerator)
    {
      CFRelease(v4->figSampleGenerator);
      v4 = self->_generator;
    }
    CFRelease(v4);

  }
  v5.receiver = self;
  v5.super_class = (Class)AVSampleBufferGenerator;
  -[AVSampleBufferGenerator dealloc](&v5, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[AVSampleBufferGenerator initWithAsset:timebase:]([AVSampleBufferGenerator alloc], "initWithAsset:timebase:", -[AVWeakReference referencedObject](self->_generator->weakReferenceToAsset, "referencedObject"), self->_generator->timebase);
}

- (OpaqueFigSampleGenerator)_figSampleGenerator
{
  return self->_generator->figSampleGenerator;
}

- (AVSampleBufferGeneratorBatch)makeBatch
{
  return -[AVSampleBufferGeneratorBatch initWithGenerator:]([AVSampleBufferGeneratorBatch alloc], "initWithGenerator:", self);
}

- (CMSampleBufferRef)createSampleBufferForRequest:(AVSampleBufferRequest *)request error:(NSError *)outError
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  OpaqueFigSampleGenerator *figSampleGenerator;
  OpaqueFigSampleCursor *v11;
  NSInteger v12;
  NSInteger v13;
  AVSampleBufferRequestDirection v14;
  OpaqueFigSampleCursor *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(OpaqueFigSampleGenerator *, OpaqueFigSampleCursor *, NSInteger, NSInteger, AVSampleBufferRequestDirection, OpaqueFigSampleCursor *, uint64_t, uint64_t, void *(*)(void *, uint64_t, opaqueCMSampleBuffer *), AVSampleBufferRequest *, _QWORD, opaqueCMSampleBuffer **);
  signed int v19;
  void *v21;
  opaqueCMSampleBuffer *v22;

  if (!request)
  {
    v21 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)outError, v4, v5, v6, v7, (uint64_t)"request != nil"), 0);
    objc_exception_throw(v21);
  }
  v22 = 0;
  figSampleGenerator = self->_generator->figSampleGenerator;
  v11 = -[AVSampleCursor _figSampleCursor](-[AVSampleBufferRequest startCursor](request, "startCursor"), "_figSampleCursor");
  v12 = -[AVSampleBufferRequest preferredMinSampleCount](request, "preferredMinSampleCount");
  v13 = -[AVSampleBufferRequest maxSampleCount](request, "maxSampleCount");
  v14 = -[AVSampleBufferRequest direction](request, "direction");
  v15 = -[AVSampleCursor _figSampleCursor](-[AVSampleBufferRequest limitCursor](request, "limitCursor"), "_figSampleCursor");
  v16 = -[AVSampleBufferRequest _figSampleGeneratorReadPolicy](request, "_figSampleGeneratorReadPolicy");
  v17 = -[AVSampleBufferRequest _figSampleGeneratorReadFlags](request, "_figSampleGeneratorReadFlags");
  v18 = *(uint64_t (**)(OpaqueFigSampleGenerator *, OpaqueFigSampleCursor *, NSInteger, NSInteger, AVSampleBufferRequestDirection, OpaqueFigSampleCursor *, uint64_t, uint64_t, void *(*)(void *, uint64_t, opaqueCMSampleBuffer *), AVSampleBufferRequest *, _QWORD, opaqueCMSampleBuffer **))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (v18)
  {
    v19 = v18(figSampleGenerator, v11, v12, v13, v14, v15, v16, v17, AVSampleBufferGenerator_remapSampleBufferTiming, request, 0, &v22);
    if (!outError)
      return v22;
  }
  else
  {
    v19 = -12782;
    if (!outError)
      return v22;
  }
  if (v19)
    *outError = (NSError *)AVLocalizedErrorWithUnderlyingOSStatus(v19, 0);
  return v22;
}

- (CMSampleBufferRef)createSampleBufferForRequest:(AVSampleBufferRequest *)request
{
  return -[AVSampleBufferGenerator createSampleBufferForRequest:error:](self, "createSampleBufferForRequest:error:", request, 0);
}

- (CMSampleBufferRef)createSampleBufferForRequest:(AVSampleBufferRequest *)request addingToBatch:(AVSampleBufferGeneratorBatch *)batch error:(NSError *)outError
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;

  if (!request)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
    v16 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)batch, (uint64_t)outError, v5, v6, v7, (uint64_t)"request != nil");
    goto LABEL_11;
  }
  if (!batch)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
    v17 = CFSTR("batch cannot be nil");
LABEL_10:
    v16 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v17, (uint64_t)batch, (uint64_t)outError, v5, v6, v7, v18);
LABEL_11:
    objc_exception_throw((id)objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, v16, 0));
  }
  if (-[AVSampleBufferGeneratorBatch _generator](batch, "_generator") != self)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
    v17 = CFSTR("batch does not belong to this generator");
    goto LABEL_10;
  }
  if (!-[AVSampleBufferGeneratorBatch isOpenToRequests](batch, "isOpenToRequests"))
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
    v17 = CFSTR("createSampleBufferForRequest must only be called before makeDataReadyWithCompletionHandler.");
    goto LABEL_10;
  }
  return -[AVSampleBufferGeneratorBatch createAndAddSampleBufferForRequest:error:](batch, "createAndAddSampleBufferForRequest:error:", request, outError);
}

+ (void)notifyOfDataReadyForSampleBuffer:(CMSampleBufferRef)sbuf completionHandler:(void *)completionHandler
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[6];
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  _QWORD block[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;
  OSStatus statusOut;

  statusOut = 0;
  if (CMSampleBufferDataIsReady(sbuf))
  {
    (*((void (**)(void *, uint64_t, _QWORD))completionHandler + 2))(completionHandler, 1, 0);
    return;
  }
  if (CMSampleBufferHasDataFailed(sbuf, &statusOut))
  {
    v6 = AVLocalizedErrorWithUnderlyingOSStatus(statusOut, 0);
    (*((void (**)(void *, _QWORD, uint64_t))completionHandler + 2))(completionHandler, 0, v6);
    return;
  }
  if (sAVSampleBufferGenerator_SetupOnce != -1)
    dispatch_once(&sAVSampleBufferGenerator_SetupOnce, &__block_literal_global_26);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3052000000;
  v23 = __Block_byref_object_copy__26;
  v24 = __Block_byref_object_dispose__26;
  v25 = 0;
  v25 = objc_msgSend(completionHandler, "copy");
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__AVSampleBufferGenerator_notifyOfDataReadyForSampleBuffer_completionHandler___block_invoke_20;
  block[3] = &unk_1E3031EB8;
  block[4] = &v20;
  block[5] = sbuf;
  dispatch_sync((dispatch_queue_t)sAVSampleBufferGenerator_DispatchQueue, block);
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterAddListener();
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterAddListener();
  if (CMSampleBufferDataIsReady(sbuf))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3052000000;
    v16 = __Block_byref_object_copy__26;
    v17 = __Block_byref_object_dispose__26;
    v18 = 0;
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __78__AVSampleBufferGenerator_notifyOfDataReadyForSampleBuffer_completionHandler___block_invoke_2;
    v12[3] = &unk_1E3031EB8;
    v12[4] = &v13;
    v12[5] = sbuf;
    dispatch_sync((dispatch_queue_t)sAVSampleBufferGenerator_DispatchQueue, v12);
    v8 = v14[5];
    if (v8)
    {
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v8 + 16))(v8, 1, 0);

    }
LABEL_13:
    _Block_object_dispose(&v13, 8);
    goto LABEL_14;
  }
  if (CMSampleBufferHasDataFailed(sbuf, &statusOut))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3052000000;
    v16 = __Block_byref_object_copy__26;
    v17 = __Block_byref_object_dispose__26;
    v18 = 0;
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __78__AVSampleBufferGenerator_notifyOfDataReadyForSampleBuffer_completionHandler___block_invoke_3;
    v11[3] = &unk_1E3031EB8;
    v11[4] = &v13;
    v11[5] = sbuf;
    dispatch_sync((dispatch_queue_t)sAVSampleBufferGenerator_DispatchQueue, v11);
    v9 = v14[5];
    if (v9)
    {
      v10 = AVLocalizedErrorWithUnderlyingOSStatus(statusOut, 0);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v9 + 16))(v9, 0, v10);

    }
    goto LABEL_13;
  }
LABEL_14:

  _Block_object_dispose(&v20, 8);
}

dispatch_queue_t __78__AVSampleBufferGenerator_notifyOfDataReadyForSampleBuffer_completionHandler___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t result;

  sAVSampleBufferGenerator_CMSampleBufferToCompletionHandler = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  result = dispatch_queue_create("com.apple.avfoundation.avsamplebuffergenerator.data-ready-notifications", v0);
  sAVSampleBufferGenerator_DispatchQueue = (uint64_t)result;
  return result;
}

void __78__AVSampleBufferGenerator_notifyOfDataReadyForSampleBuffer_completionHandler___block_invoke_20(uint64_t a1)
{
  CFDictionarySetValue((CFMutableDictionaryRef)sAVSampleBufferGenerator_CMSampleBufferToCompletionHandler, *(const void **)(a1 + 40), *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

void __78__AVSampleBufferGenerator_notifyOfDataReadyForSampleBuffer_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  if (CFDictionaryGetValueIfPresent((CFDictionaryRef)sAVSampleBufferGenerator_CMSampleBufferToCompletionHandler, *(const void **)(a1 + 40), (const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)))
  {
    v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    CFDictionaryRemoveValue((CFMutableDictionaryRef)sAVSampleBufferGenerator_CMSampleBufferToCompletionHandler, *(const void **)(a1 + 40));
  }
}

void __78__AVSampleBufferGenerator_notifyOfDataReadyForSampleBuffer_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2;

  if (CFDictionaryGetValueIfPresent((CFDictionaryRef)sAVSampleBufferGenerator_CMSampleBufferToCompletionHandler, *(const void **)(a1 + 40), (const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)))
  {
    v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    CFDictionaryRemoveValue((CFMutableDictionaryRef)sAVSampleBufferGenerator_CMSampleBufferToCompletionHandler, *(const void **)(a1 + 40));
  }
}

void __AVSampleBufferGenerator_dataBecameReady_block_invoke(uint64_t a1)
{
  id v2;

  if (CFDictionaryGetValueIfPresent((CFDictionaryRef)sAVSampleBufferGenerator_CMSampleBufferToCompletionHandler, *(const void **)(a1 + 40), (const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)))
  {
    v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    CFDictionaryRemoveValue((CFMutableDictionaryRef)sAVSampleBufferGenerator_CMSampleBufferToCompletionHandler, *(const void **)(a1 + 40));
  }
}

void __AVSampleBufferGenerator_dataFailed_block_invoke(uint64_t a1)
{
  id v2;

  if (CFDictionaryGetValueIfPresent((CFDictionaryRef)sAVSampleBufferGenerator_CMSampleBufferToCompletionHandler, *(const void **)(a1 + 40), (const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)))
  {
    v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    CFDictionaryRemoveValue((CFMutableDictionaryRef)sAVSampleBufferGenerator_CMSampleBufferToCompletionHandler, *(const void **)(a1 + 40));
  }
}

@end

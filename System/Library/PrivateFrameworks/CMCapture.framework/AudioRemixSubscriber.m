@implementation AudioRemixSubscriber

- (AudioRemixSubscriber)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("AudioRemixSubscriber: illegal call to init"));
  return 0;
}

- (AudioRemixSubscriber)initWithSession:(id)a3 andNodeMetadataOutput:(id)a4 completionHandler:(id)a5
{
  char *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  CFTypeRef v11;
  CFTypeRef v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)AudioRemixSubscriber;
  v8 = -[AudioRemixSubscriber init](&v17, sel_init);
  if (v8)
  {
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = dispatch_queue_create("com.apple.cameracapture.audioremixanalysis.subscriber", v9);
    v8[24] = 0;
    *((_QWORD *)v8 + 1) = 0;
    *((_QWORD *)v8 + 2) = v10;
    *((_QWORD *)v8 + 5) = a3;
    if (a4)
      v11 = CFRetain(a4);
    else
      v11 = 0;
    *((_QWORD *)v8 + 6) = v11;
    *((_QWORD *)v8 + 4) = _Block_copy(a5);
    *((_QWORD *)v8 + 7) = 0;
    *((_QWORD *)v8 + 8) = 0;
    v12 = (CFTypeRef)objc_msgSend((id)objc_msgSend(*((id *)v8 + 6), "format"), "formatDescription");
    if (v12)
      v12 = CFRetain(v12);
    *((_QWORD *)v8 + 9) = v12;
    v13 = MEMORY[0x1E0CA2E18];
    v14 = *MEMORY[0x1E0CA2E18];
    *((_OWORD *)v8 + 5) = *MEMORY[0x1E0CA2E18];
    v15 = *(_QWORD *)(v13 + 16);
    *((_QWORD *)v8 + 12) = v15;
    *(_OWORD *)(v8 + 104) = v14;
    *((_QWORD *)v8 + 15) = v15;
  }
  return (AudioRemixSubscriber *)v8;
}

- (void)dealloc
{
  SNMovieRemixSubscriptionProtocol *subscription;
  opaqueCMFormatDescription *audioMetadataFormatDescription;
  objc_super v5;

  subscription = self->_subscription;
  if (subscription)
  {
    -[SNMovieRemixSubscriptionProtocol cancel](subscription, "cancel");

    self->_subscription = 0;
  }

  self->_session = 0;
  dispatch_release((dispatch_object_t)self->_workQueue);
  self->_workQueue = 0;
  _Block_release(self->_subscriptionCompletionHandler);
  self->_subscriptionCompletionHandler = 0;

  self->_nodeMetadataOutput = 0;
  audioMetadataFormatDescription = self->_audioMetadataFormatDescription;
  if (audioMetadataFormatDescription)
    CFRelease(audioMetadataFormatDescription);
  self->_audioMetadataFormatDescription = 0;
  v5.receiver = self;
  v5.super_class = (Class)AudioRemixSubscriber;
  -[AudioRemixSubscriber dealloc](&v5, sel_dealloc);
}

- (int)finishAndGetResultsBlockingWithStartingPTS:(id *)a3 andEndingPTS:(id *)a4
{
  __int128 v7;
  __int128 v8;
  NSObject *resultHandlerSemaphore;
  dispatch_time_t v10;
  intptr_t v11;
  NSObject *completionHandlerSemaphore;
  dispatch_time_t v13;
  intptr_t v14;
  CMTime v16;
  CMTime time1;

  if (self->_resultHandlerSemaphore || self->_completionHandlerSemaphore)
    return FigSignalErrorAt();
  if ((a3->var2 & 1) == 0)
    return -16992;
  if ((a4->var2 & 1) == 0)
    return -16992;
  time1 = *(CMTime *)a3;
  v16 = *(CMTime *)a4;
  if ((CMTimeCompare(&time1, &v16) & 0x80000000) == 0)
    return -16992;
  v7 = *(_OWORD *)&a3->var0;
  self->_startingPTS.epoch = a3->var3;
  *(_OWORD *)&self->_startingPTS.value = v7;
  v8 = *(_OWORD *)&a4->var0;
  self->_endingPTS.epoch = a4->var3;
  *(_OWORD *)&self->_endingPTS.value = v8;
  self->_resultHandlerSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  self->_completionHandlerSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  -[SNMovieRemixSession finishWithError:](self->_session, "finishWithError:", 0);
  resultHandlerSemaphore = self->_resultHandlerSemaphore;
  v10 = dispatch_time(0, 2000000000);
  v11 = dispatch_semaphore_wait(resultHandlerSemaphore, v10);
  dispatch_release((dispatch_object_t)self->_resultHandlerSemaphore);
  self->_resultHandlerSemaphore = 0;
  if (v11)
    return FigSignalErrorAt();
  completionHandlerSemaphore = self->_completionHandlerSemaphore;
  v13 = dispatch_time(0, 2000000000);
  v14 = dispatch_semaphore_wait(completionHandlerSemaphore, v13);
  dispatch_release((dispatch_object_t)self->_completionHandlerSemaphore);
  self->_completionHandlerSemaphore = 0;
  if (v14)
    return FigSignalErrorAt();
  else
    return 0;
}

- (int)handleReceiveResult:(id)a3
{
  NSObject *workQueue;
  int v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__AudioRemixSubscriber_handleReceiveResult___block_invoke;
  block[3] = &unk_1E491F368;
  block[4] = self;
  block[5] = a3;
  block[6] = &v7;
  dispatch_sync(workQueue, block);
  v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __44__AudioRemixSubscriber_handleReceiveResult___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unsigned int v3;
  int v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unsigned int v11;
  const __CFAllocator *v12;
  __int128 v13;
  CMTimeEpoch v14;
  __int128 v15;
  uint64_t v16;
  CMTimeEpoch v17;
  void *v18;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CMBlockBufferRef *blockBufferOut;
  uint64_t v21;
  size_t sampleSizeArray;
  CMSampleTimingInfo v23;
  CFTypeRef cf;
  CMBlockBufferRef theBuffer;
  CMTime rhs;
  CMTime lhs;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  cf = 0;
  theBuffer = 0;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
  {
    v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "dspParameters"), "count");
    v3 = v2;
    v4 = 8 * v2;
    v5 = ((8 * v2) & 0x7FFFFFFF8) + 50;
    v6 = (char *)malloc_type_malloc(v5, 0xA0B4CA81uLL);
    *(_DWORD *)v6 = bswap32(v5);
    *((_DWORD *)v6 + 1) = 0x1000000;
    *((_DWORD *)v6 + 2) = bswap32(v4 + 42);
    *(_OWORD *)(v6 + 12) = xmmword_1A32A2800;
    *((_DWORD *)v6 + 7) = 0;
    *((_DWORD *)v6 + 8) = 0;
    *((_DWORD *)v6 + 9) = bswap32(v4 + 14);
    *((_QWORD *)v6 + 5) = *(_QWORD *)"cnpm";
    *((_WORD *)v6 + 24) = bswap32(v3) >> 16;
    v7 = v3;
    if (v3)
    {
      v8 = 0;
      do
      {
        v9 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "dspParameters"), "objectAtIndexedSubscript:", v8);
        v10 = objc_msgSend(v9, "key");
        objc_msgSend(v9, "value");
        *(_QWORD *)&v6[8 * v8++ + 50] = bswap64(v11 | (unint64_t)(v10 << 32));
      }
      while (v7 != v8);
    }
    v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v6, v5, (CFAllocatorRef)*MEMORY[0x1E0C9AE10], 0, 0, v5, 0, &theBuffer);
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      goto LABEL_18;
    if (!theBuffer)
      goto LABEL_13;
    v13 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
    *(_OWORD *)&v23.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
    *(_OWORD *)&v23.decodeTimeStamp.value = v13;
    v14 = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
    v15 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
    *(_OWORD *)&v23.duration.value = *MEMORY[0x1E0CA2E90];
    *(_OWORD *)&v23.duration.epoch = v15;
    v16 = *(_QWORD *)(a1 + 32);
    *(_OWORD *)&v23.presentationTimeStamp.value = *(_OWORD *)(v16 + 80);
    v17 = *(_QWORD *)(v16 + 96);
    v23.decodeTimeStamp.epoch = v14;
    v23.presentationTimeStamp.epoch = v17;
    lhs = *(CMTime *)(v16 + 104);
    rhs = *(CMTime *)(v16 + 80);
    CMTimeSubtract(&v23.duration, &lhs, &rhs);
    sampleSizeArray = CMBlockBufferGetDataLength(theBuffer);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = CMSampleBufferCreate(v12, theBuffer, 1u, 0, 0, *(CMFormatDescriptionRef *)(*(_QWORD *)(a1 + 32)+ 72), 1, 1, &v23, 1, &sampleSizeArray, (CMSampleBufferRef *)&cf);
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
LABEL_18:
      FigDebugAssert3();
    }
    else
    {
      if (!cf)
        goto LABEL_15;
      v18 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
      if (v18)
      {
        if (dword_1EE6BE978)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          v18 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
        }
        objc_msgSend(v18, "emitSampleBuffer:", blockBufferOut, v21);
      }
    }
  }
LABEL_13:
  if (cf)
    CFRelease(cf);
LABEL_15:
  if (theBuffer)
    CFRelease(theBuffer);
}

- (int)handleReceiveCompletion:(id)a3
{
  NSObject *workQueue;
  int v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__AudioRemixSubscriber_handleReceiveCompletion___block_invoke;
  v7[3] = &unk_1E491F390;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = &v8;
  v7[7] = &v12;
  dispatch_sync(workQueue, v7);
  if (*((_BYTE *)v9 + 24))
    (*((void (**)(void))self->_subscriptionCompletionHandler + 2))();
  v5 = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

_QWORD *__48__AudioRemixSubscriber_handleReceiveCompletion___block_invoke(_QWORD *result)
{
  uint64_t v1;
  _QWORD *v2;

  v1 = result[4];
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24) = 1;
    if (result[5])
    {
      result = (_QWORD *)FigSignalErrorAt();
      *(_DWORD *)(*(_QWORD *)(v2[7] + 8) + 24) = (_DWORD)result;
    }
  }
  return result;
}

- (void)cancelSubscription
{
  NSObject *workQueue;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__AudioRemixSubscriber_cancelSubscription__block_invoke;
  v4[3] = &unk_1E491F1A0;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(workQueue, v4);
  if (*((_BYTE *)v6 + 24))
    (*((void (**)(void))self->_subscriptionCompletionHandler + 2))();
  _Block_object_dispose(&v5, 8);
}

void __42__AudioRemixSubscriber_cancelSubscription__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    if (v3)
    {
      objc_msgSend(v3, "cancel");

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
    }
  }
}

- (void)registerSubscription:(id)a3
{
  NSObject *workQueue;
  _QWORD v4[6];

  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__AudioRemixSubscriber_registerSubscription___block_invoke;
  v4[3] = &unk_1E491E748;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(workQueue, v4);
}

_QWORD *__45__AudioRemixSubscriber_registerSubscription___block_invoke(_QWORD *result)
{
  uint64_t v1;

  v1 = result[4];
  if (!*(_QWORD *)(v1 + 8))
  {
    *(_QWORD *)(v1 + 8) = result[5];
    return *(id *)(result[4] + 8);
  }
  return result;
}

- (void)activate
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__AudioRemixSubscriber_activate__block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_sync(workQueue, block);
}

void __32__AudioRemixSubscriber_activate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id location;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 8) && !*(_BYTE *)(v1 + 24))
  {
    objc_initWeak(&location, (id)v1);
    v3 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __32__AudioRemixSubscriber_activate__block_invoke_2;
    v8[3] = &unk_1E491F3B8;
    objc_copyWeak(&v9, &location);
    v8[4] = *(_QWORD *)(a1 + 32);
    v5[0] = v3;
    v5[1] = 3221225472;
    v5[2] = __32__AudioRemixSubscriber_activate__block_invoke_3;
    v5[3] = &unk_1E491F3E0;
    objc_copyWeak(&v7, &location);
    v6 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = objc_msgSend(*(id *)(v6 + 40), "subscribeWithFinalResultHandler:completionHandler:", v8, v5);
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

NSObject *__32__AudioRemixSubscriber_activate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id Weak;
  NSObject *result;

  Weak = objc_loadWeak((id *)(a1 + 40));
  if (Weak)
  {
    if (objc_msgSend(Weak, "handleReceiveResult:", a2))
      FigDebugAssert3();
  }
  else
  {
    FigSignalErrorAt();
  }
  result = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
  if (result)
    return dispatch_semaphore_signal(result);
  return result;
}

NSObject *__32__AudioRemixSubscriber_activate__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id Weak;
  NSObject *result;

  Weak = objc_loadWeak((id *)(a1 + 40));
  if (Weak)
  {
    if (objc_msgSend(Weak, "handleReceiveCompletion:", a2))
      FigDebugAssert3();
  }
  else
  {
    FigSignalErrorAt();
  }
  result = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
  if (result)
    return dispatch_semaphore_signal(result);
  return result;
}

@end

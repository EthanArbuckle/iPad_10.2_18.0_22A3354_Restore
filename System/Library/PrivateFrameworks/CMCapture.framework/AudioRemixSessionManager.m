@implementation AudioRemixSessionManager

- (double)sampleRate
{
  return self->_sampleRate;
}

- (unsigned)channelCount
{
  return self->_channelCount;
}

- (BOOL)sessionReady
{
  return self->_session != 0;
}

- (AudioRemixSessionManager)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("AudioRemixSessionManager: illegal call to init"));
  return 0;
}

- (AudioRemixSessionManager)initWithNodeMetadataOutput:(id)a3
{
  AudioRemixSessionManager *v4;
  NSObject *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AudioRemixSessionManager;
  v4 = -[AudioRemixSessionManager init](&v7, sel_init);
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4->_workQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.cameracapture.audioremixanalysis.application", v5);
    v4->_subscriber = 0;
    v4->_session = 0;
    v4->_nodeMetadataOutput = (BWNodeOutput *)a3;
    v4->_sampleRate = 0.0;
    v4->_channelCount = 0;
  }
  return v4;
}

- (int)finishAndGetResultsBlockingWithStartingPTS:(id *)a3 andEndingPTS:(id *)a4
{
  AudioRemixSubscriber *subscriber;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  subscriber = self->_subscriber;
  if (!subscriber)
    return FigSignalErrorAt();
  v7 = *a3;
  v6 = *a4;
  return -[AudioRemixSubscriber finishAndGetResultsBlockingWithStartingPTS:andEndingPTS:](subscriber, "finishAndGetResultsBlockingWithStartingPTS:andEndingPTS:", &v7, &v6);
}

- (void)dealloc
{
  NSObject *workQueue;
  objc_super v4;

  -[AudioRemixSessionManager abortSessionIfNeeded](self, "abortSessionIfNeeded");
  workQueue = self->_workQueue;
  if (workQueue)
  {
    dispatch_release(workQueue);
    self->_workQueue = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AudioRemixSessionManager;
  -[AudioRemixSessionManager dealloc](&v4, sel_dealloc);
}

- (void)setFormatSampleRate:(double)a3 andChannelCount:(unsigned int)a4
{
  self->_sampleRate = a3;
  self->_channelCount = a4;
}

- (int)startNewSessionBlocking
{
  void *v3;
  NSObject *v4;
  dispatch_time_t v5;
  intptr_t v6;
  int v7;
  _QWORD v9[6];
  id v10;
  id location;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  dispatch_semaphore_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  -[AudioRemixSessionManager abortSessionIfNeeded](self, "abortSessionIfNeeded");
  v3 = (void *)objc_msgSend(objc_alloc((Class)getSNMovieRemixRequestClass()), "initWithInputAudioSampleRate:inputAudioChannelCount:", (uint64_t)self->_sampleRate, self->_channelCount);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__7;
  v16 = __Block_byref_object_dispose__7;
  v17 = 0;
  v17 = dispatch_semaphore_create(0);
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__AudioRemixSessionManager_startNewSessionBlocking__block_invoke;
  v9[3] = &unk_1E491F408;
  objc_copyWeak(&v10, &location);
  v9[4] = &v18;
  v9[5] = &v12;
  objc_msgSend((id)getSNMovieRemixClass(), "runRequest:completionHandler:", v3, v9);
  v4 = v13[5];
  v5 = dispatch_time(0, 2000000000);
  v6 = dispatch_semaphore_wait(v4, v5);
  dispatch_release((dispatch_object_t)v13[5]);
  v13[5] = 0;
  if (v6)
    *((_DWORD *)v19 + 6) = FigSignalErrorAt();

  v7 = *((_DWORD *)v19 + 6);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v7;
}

intptr_t __51__AudioRemixSessionManager_startNewSessionBlocking__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id Weak;

  Weak = objc_loadWeak((id *)(a1 + 48));
  if (!a3 && Weak && a2)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(Weak, "_handleSessionCreated:", a2);
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      FigDebugAssert3();
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigSignalErrorAt();
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)abortSessionIfNeeded
{
  SNMovieRemixSession *session;
  AudioRemixSubscriber *subscriber;

  session = self->_session;
  if (session)
  {
    subscriber = self->_subscriber;
    if (subscriber)
    {

      self->_subscriber = 0;
      session = self->_session;
    }
    -[SNMovieRemixSession finishWithError:](session, "finishWithError:", 0);

    self->_session = 0;
  }
}

- (int)_handleSubscriberCompletedFromCancellation:(BOOL)a3
{
  int result;

  result = 0;
  if (a3)
    return FigSignalErrorAt();
  return result;
}

- (int)_handleSessionCreated:(id)a3
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
  block[2] = __50__AudioRemixSessionManager__handleSessionCreated___block_invoke;
  block[3] = &unk_1E491F458;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(workQueue, block);
  v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __50__AudioRemixSessionManager__handleSessionCreated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id location;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 24)
    || (*(_QWORD *)(v2 + 24) = *(_QWORD *)(a1 + 40), (v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24)) == 0))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = FigSignalErrorAt();
  }
  else
  {
    v4 = v3;
    objc_initWeak(&location, *(id *)(a1 + 32));
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __50__AudioRemixSessionManager__handleSessionCreated___block_invoke_2;
    v5[3] = &unk_1E491F430;
    v5[4] = *(_QWORD *)(a1 + 48);
    objc_copyWeak(&v6, &location);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = -[AudioRemixSubscriber initWithSession:andNodeMetadataOutput:completionHandler:]([AudioRemixSubscriber alloc], "initWithSession:andNodeMetadataOutput:completionHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "activate");
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

uint64_t __50__AudioRemixSessionManager__handleSessionCreated___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id Weak;
  uint64_t result;

  if (a3 || (Weak = objc_loadWeak((id *)(a1 + 40))) == 0)
  {
    result = FigSignalErrorAt();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  }
  else
  {
    result = objc_msgSend(Weak, "_handleSubscriberCompletedFromCancellation:", a2);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      return FigDebugAssert3();
  }
  return result;
}

- (void)submitAudioBuffer:(id)a3
{
  if (a3)
    -[SNMovieRemixSession yieldBuffer:](self->_session, "yieldBuffer:");
}

@end

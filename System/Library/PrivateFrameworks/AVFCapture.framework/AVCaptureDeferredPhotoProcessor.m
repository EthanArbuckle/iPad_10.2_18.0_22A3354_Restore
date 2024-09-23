@implementation AVCaptureDeferredPhotoProcessor

- (void)_handleNotification:(__CFString *)a3 payload:(id)a4
{
  _BOOL4 requestsWillBeReenqueued;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  AVCaptureDeferredPhotoProxy *v17;
  AVCaptureDeferredPhotoProxy *v18;
  AVCaptureDeferredPhotoProcessor *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1A1AF1298](self->_requestsLock, a2);
  requestsWillBeReenqueued = self->_requestsWillBeReenqueued;
  MEMORY[0x1A1AF12A4](self->_requestsLock);
  if (!FigCFEqual())
  {
    if (FigCFEqual())
    {
      if (requestsWillBeReenqueued)
        -[AVCaptureDeferredPhotoProcessor _handleServerConnectionDiedAndRequestsWillBeReenqueued](self, "_handleServerConnectionDiedAndRequestsWillBeReenqueued");
      else
        -[AVCaptureDeferredPhotoProcessor _handleServerConnectionDiedSendingClientNotification:](self, "_handleServerConnectionDiedSendingClientNotification:", 1);
    }
    else
    {
      v7 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D03F68]);
      if (v7)
      {
        v8 = v7;
        v9 = -[AVCaptureDeferredPhotoProcessor _processingRequestForCaptureRequestIdentifier:](self, "_processingRequestForCaptureRequestIdentifier:", v7);
        if (v9)
        {
          v10 = v9;
          if (FigCFEqual())
          {
            v19 = self;
            v11 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D03FC8]);
            v21 = 0u;
            v22 = 0u;
            v23 = 0u;
            v24 = 0u;
            obj = v11;
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
            if (v12)
            {
              v13 = v12;
              v14 = *(_QWORD *)v22;
              do
              {
                for (i = 0; i != v13; ++i)
                {
                  if (*(_QWORD *)v22 != v14)
                    objc_enumerationMutation(obj);
                  v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
                  v17 = [AVCaptureDeferredPhotoProxy alloc];
                  v18 = -[AVCaptureDeferredPhotoProxy initWithDeferredPhotoIdentifier:](v17, "initWithDeferredPhotoIdentifier:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v8, v16));
                  objc_msgSend(v10, "addProxy:", v18);

                }
                v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
              }
              while (v13);
            }
            -[AVCaptureDeferredPhotoProcessor _handleWillBeginProcessingPhotoProxyNotificationWithPayload:forRequest:](v19, "_handleWillBeginProcessingPhotoProxyNotificationWithPayload:forRequest:", a4, v10);
          }
          else if (FigCFEqual())
          {
            if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D03F80]), "intValue") == -16823)
            {
              if (!requestsWillBeReenqueued)
                -[AVCaptureDeferredPhotoProcessor _handleWillAbortProcessingDueToPriorityInversion](self, "_handleWillAbortProcessingDueToPriorityInversion");
            }
            else
            {
              -[AVCaptureDeferredPhotoProcessor _handleDidFinishProcessingPhotoProxyNotificationWithPayload:forRequest:](self, "_handleDidFinishProcessingPhotoProxyNotificationWithPayload:forRequest:", a4, v10);
            }
          }
        }
      }
    }
  }
}

- (void)_setFigCaptureDeferredPhotoProcessor:(OpaqueFigCaptureDeferredPhotoProcessor *)a3
{
  OpaqueFigCaptureDeferredPhotoProcessor *fcdpp;
  OpaqueFigCaptureDeferredPhotoProcessor *v6;

  if (!_FigIsCurrentDispatchQueue())
    FigDebugAssert3();
  fcdpp = self->_fcdpp;
  if (fcdpp != a3)
  {
    if (fcdpp)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "removeListenerWithWeakReference:callback:name:object:", self->_weakReference, avcdpp_NotificationCallback, 0, self->_fcdpp);
      v6 = self->_fcdpp;
      if (v6)
      {
        CFRelease(v6);
        self->_fcdpp = 0;
      }
    }
    if (a3)
    {
      self->_fcdpp = (OpaqueFigCaptureDeferredPhotoProcessor *)CFRetain(a3);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "addListenerWithWeakReference:callback:name:object:flags:", self->_weakReference, avcdpp_NotificationCallback, 0, a3, 0);
    }
  }
}

+ (id)sharedPhotoProcessor
{
  void *v3;

  if ((AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementDeferredPhotoProcessor) & 1) != 0)
  {
    if (sharedPhotoProcessor_sInstanceOnceToken != -1)
      dispatch_once(&sharedPhotoProcessor_sInstanceOnceToken, &__block_literal_global_18);
    return (id)sInstance;
  }
  else
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v3);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
    return 0;
  }
}

_QWORD *__61__AVCaptureDeferredPhotoProcessor__establishServerConnection__block_invoke(_QWORD *result)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, _QWORD, _QWORD, uint64_t);

  v1 = *(_QWORD *)(result[4] + 24);
  if (v1)
  {
    v2 = result;
    v3 = *(_QWORD *)(result[5] + 8);
    result = (_QWORD *)CMBaseObjectGetVTable();
    v4 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(result[1] + 48);
    if (v4)
      result = (_QWORD *)v4(v1, *MEMORY[0x1E0D04048], *MEMORY[0x1E0C9AE00], v3 + 24);
    *(_BYTE *)(*(_QWORD *)(v2[6] + 8) + 24) = 1;
  }
  return result;
}

- (void)prewarmWithSettings:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  OpaqueFigCaptureDeferredPhotoProcessor *fcdpp;
  void (*v10)(OpaqueFigCaptureDeferredPhotoProcessor *, uint64_t, uint64_t);
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (FigCaptureDeferredPhotoProcessorIsAllowedToPrewarm())
  {
    if (!-[AVCaptureDeferredPhotoProcessor _establishServerConnection](self, "_establishServerConnection"))
    {
      v5 = objc_msgSend(a3, "captureSettings");
      if (v5)
      {
        v6 = v5;
        v7 = objc_msgSend(a3, "serializedProcessingSettings");
        if (v7)
        {
          v8 = v7;
          fcdpp = self->_fcdpp;
          v10 = *(void (**)(OpaqueFigCaptureDeferredPhotoProcessor *, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                                  + 48);
          if (v10)
            v10(fcdpp, v6, v8);
        }
      }
    }
  }
  else if (dword_1ECFED5C0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (int)_establishServerConnection
{
  NSObject *fcdppQueue;
  uint64_t v4;
  NSObject *v5;
  int v6;
  _QWORD v8[6];
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = *MEMORY[0x1E0C9AE40];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  fcdppQueue = self->_fcdppQueue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__AVCaptureDeferredPhotoProcessor__establishServerConnection__block_invoke;
  block[3] = &unk_1E42180A0;
  block[4] = self;
  block[5] = &v14;
  block[6] = &v10;
  dispatch_sync(fcdppQueue, block);
  if (v15[3] == *MEMORY[0x1E0C9AE50])
  {
    -[AVCaptureDeferredPhotoProcessor _handleServerConnectionDiedSendingClientNotification:](self, "_handleServerConnectionDiedSendingClientNotification:", 0);
    *((_BYTE *)v11 + 24) = 0;
LABEL_5:
    v5 = self->_fcdppQueue;
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __61__AVCaptureDeferredPhotoProcessor__establishServerConnection__block_invoke_2;
    v8[3] = &unk_1E4217A60;
    v8[4] = self;
    v8[5] = &v18;
    dispatch_sync(v5, v8);
    goto LABEL_6;
  }
  if (!*((_BYTE *)v11 + 24))
    goto LABEL_5;
LABEL_6:
  v6 = *((_DWORD *)v19 + 6);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v6;
}

- (void)_handleServerConnectionDiedSendingClientNotification:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  const __CFString *v17;
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1A1AF1298](self->_requestsLock, a2);
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_requests);
  -[NSMutableArray removeAllObjects](self->_requests, "removeAllObjects");
  MEMORY[0x1A1AF12A4](self->_requestsLock);
  v6 = AVLocalizedErrorWithUnderlyingOSStatus();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        -[AVCaptureDeferredPhotoProcessor _dispatchFailureCallbacks:forProcessingRequest:error:](self, "_dispatchFailureCallbacks:forProcessingRequest:error:", 3, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10++), v6);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v8);
  }
  -[AVCaptureDeferredPhotoProcessor _resetFigCaptureDeferredPhotoProcessor](self, "_resetFigCaptureDeferredPhotoProcessor");
  if (v3)
  {
    v11 = AVLocalizedError();
    v12 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = CFSTR("AVCaptureDeferredPhotoProcessorCriticalErrorKey");
    v18 = v11;
    objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("AVCaptureDeferredPhotoProcessorCriticalErrorNotification"), self, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
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

AVCaptureDeferredPhotoProcessor *__55__AVCaptureDeferredPhotoProcessor_sharedPhotoProcessor__block_invoke()
{
  AVCaptureDeferredPhotoProcessor *result;

  result = -[AVCaptureDeferredPhotoProcessor initWithApplicationIDOverride:]([AVCaptureDeferredPhotoProcessor alloc], "initWithApplicationIDOverride:", 0);
  sInstance = (uint64_t)result;
  return result;
}

- (AVCaptureDeferredPhotoProcessor)initWithApplicationIDOverride:(id)a3
{
  AVCaptureDeferredPhotoProcessor *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  objc_super v9;

  if ((AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementDeferredPhotoProcessor) & 1) != 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)AVCaptureDeferredPhotoProcessor;
    v4 = -[AVCaptureDeferredPhotoProcessor init](&v9, sel_init);
    if (v4)
    {
      v4->_weakReference = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", v4);
      v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v4->_fcdppQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.deferredphotoprocessor.queue", v5);
      v4->_requests = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v4->_requestsLock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
      v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v4->_processPhotoProxyQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.deferredphotoprocessor.processphoto.queue", v6);
    }
  }
  else
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
    return 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[AVCaptureDeferredPhotoProcessor _resetFigCaptureDeferredPhotoProcessor](self, "_resetFigCaptureDeferredPhotoProcessor");

  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureDeferredPhotoProcessor;
  -[AVCaptureDeferredPhotoProcessor dealloc](&v3, sel_dealloc);
}

- (NSArray)persistentlyStoredDeferredPhotoProxies
{
  OpaqueFigCaptureDeferredPhotoProcessor *fcdpp;
  uint64_t (*v4)(OpaqueFigCaptureDeferredPhotoProcessor *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  AVCaptureDeferredPhotoProxy *v20;
  uint64_t v21;
  AVCaptureDeferredPhotoProxy *v22;
  id obj;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  NSArray *v33;
  CMTime v34;
  CMTime v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (-[AVCaptureDeferredPhotoProcessor _establishServerConnection](self, "_establishServerConnection"))
  {
    v33 = 0;
  }
  else
  {
    fcdpp = self->_fcdpp;
    v4 = *(uint64_t (**)(OpaqueFigCaptureDeferredPhotoProcessor *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                            + 8);
    if (v4)
      v5 = (void *)v4(fcdpp);
    else
      v5 = 0;
    v33 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = v5;
    v29 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v29)
    {
      v27 = *MEMORY[0x1E0D04050];
      v28 = *(_QWORD *)v41;
      v25 = *MEMORY[0x1E0D04068];
      v26 = *MEMORY[0x1E0D04058];
      v32 = *MEMORY[0x1E0D04070];
      v6 = *MEMORY[0x1E0D04060];
      v7 = *MEMORY[0x1E0D04078];
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v41 != v28)
            objc_enumerationMutation(obj);
          v30 = v8;
          v9 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v8);
          v10 = objc_msgSend(v9, "objectForKeyedSubscript:", v27);
          v11 = objc_msgSend(v9, "objectForKeyedSubscript:", v26);
          v12 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", v25);
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v31 = v12;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v37;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v37 != v15)
                  objc_enumerationMutation(v31);
                v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
                memset(&v35, 0, sizeof(v35));
                CMTimeMakeFromDictionary(&v35, (CFDictionaryRef)objc_msgSend(v17, "objectForKeyedSubscript:", v32));
                v18 = objc_msgSend(v17, "objectForKeyedSubscript:", v6);
                v19 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", v7);
                v20 = [AVCaptureDeferredPhotoProxy alloc];
                v21 = objc_msgSend(v19, "unsignedIntValue");
                v34 = v35;
                v22 = -[AVCaptureDeferredPhotoProxy initWithApplicationIdentifier:captureRequestIdentifier:photoIdentifier:timestamp:expectedPhotoProcessingFlags:](v20, "initWithApplicationIdentifier:captureRequestIdentifier:photoIdentifier:timestamp:expectedPhotoProcessingFlags:", v10, v11, v18, &v34, v21);
                -[NSArray addObject:](v33, "addObject:", v22);

              }
              v14 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            }
            while (v14);
          }
          v8 = v30 + 1;
        }
        while (v30 + 1 != v29);
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v29);
    }

  }
  if (v33)
    return v33;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)processPhotoProxy:(id)a3 queuePosition:(id)a4 delegate:(id)a5
{
  NSObject *processPhotoProxyQueue;
  _QWORD v6[8];

  processPhotoProxyQueue = self->_processPhotoProxyQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__AVCaptureDeferredPhotoProcessor_processPhotoProxy_queuePosition_delegate___block_invoke;
  v6[3] = &unk_1E421CF38;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_sync(processPhotoProxyQueue, v6);
}

uint64_t __76__AVCaptureDeferredPhotoProcessor_processPhotoProxy_queuePosition_delegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processPhotoProxy:queuePosition:delegate:delegateQueue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), MEMORY[0x1E0C80D38]);
}

- (void)processPhotoProxy:(id)a3 queuePosition:(id)a4 delegate:(id)a5 delegateQueue:(id)a6
{
  NSObject *processPhotoProxyQueue;
  _QWORD block[9];

  processPhotoProxyQueue = self->_processPhotoProxyQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__AVCaptureDeferredPhotoProcessor_processPhotoProxy_queuePosition_delegate_delegateQueue___block_invoke;
  block[3] = &unk_1E421CF60;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = a5;
  block[8] = a6;
  dispatch_sync(processPhotoProxyQueue, block);
}

uint64_t __90__AVCaptureDeferredPhotoProcessor_processPhotoProxy_queuePosition_delegate_delegateQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processPhotoProxy:queuePosition:delegate:delegateQueue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_processPhotoProxy:(id)a3 queuePosition:(id)a4 delegate:(id)a5 delegateQueue:(id)a6
{
  NSMutableArray *requests;
  AVCaptureDeferredPhotoProcessingRequest *v12;
  void *v13;
  qos_class_t v14;
  int v15;
  NSMutableArray *v16;
  _BOOL4 requestsWillBeReenqueued;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  OpaqueFigCaptureDeferredPhotoProcessor *fcdpp;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(OpaqueFigCaptureDeferredPhotoProcessor *, uint64_t, uint64_t, id, _QWORD);
  int v23;
  int v24;
  NSObject *v25;
  _QWORD v26[6];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0x7FFFFFFFFFFFFFFFLL;
  if (-[AVCaptureDeferredPhotoProcessor _establishServerConnection](self, "_establishServerConnection"))
  {
    v12 = 0;
    goto LABEL_28;
  }
  if (a3)
  {
    MEMORY[0x1A1AF1298](self->_requestsLock);
    requests = self->_requests;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __91__AVCaptureDeferredPhotoProcessor__processPhotoProxy_queuePosition_delegate_delegateQueue___block_invoke;
    v26[3] = &unk_1E421CF88;
    v26[4] = a3;
    v26[5] = &v27;
    -[NSMutableArray enumerateObjectsUsingBlock:](requests, "enumerateObjectsUsingBlock:", v26);
    if (v28[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = -[AVCaptureDeferredPhotoProcessingRequest initWithPhotoProxy:delegate:delegateQueue:qosClass:]([AVCaptureDeferredPhotoProcessingRequest alloc], "initWithPhotoProxy:delegate:delegateQueue:qosClass:", a3, a5, a6, qos_class_self());
    }
    else
    {
      v12 = (AVCaptureDeferredPhotoProcessingRequest *)(id)-[NSMutableArray objectAtIndexedSubscript:](self->_requests, "objectAtIndexedSubscript:");
      -[NSMutableArray removeObjectAtIndex:](self->_requests, "removeObjectAtIndex:", v28[3]);
      -[AVCaptureDeferredPhotoProcessingRequest addDelegate:](v12, "addDelegate:", a5);
      v14 = -[AVCaptureDeferredPhotoProcessingRequest qosClass](v12, "qosClass");
      if (v14 < qos_class_self())
        -[AVCaptureDeferredPhotoProcessingRequest setQosClass:](v12, "setQosClass:", qos_class_self());
    }
    v15 = objc_msgSend(a4, "isEqualToString:", CFSTR("Head"));
    v16 = self->_requests;
    if (v15)
      -[NSMutableArray insertObject:atIndex:](v16, "insertObject:atIndex:", v12, 0);
    else
      -[NSMutableArray addObject:](v16, "addObject:", v12);
    requestsWillBeReenqueued = self->_requestsWillBeReenqueued;
    MEMORY[0x1A1AF12A4](self->_requestsLock);
    if (dword_1ECFED5C0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (requestsWillBeReenqueued)
      goto LABEL_28;
    fcdpp = self->_fcdpp;
    v20 = objc_msgSend(a3, "captureRequestIdentifier");
    v21 = objc_msgSend(a3, "persistentStorageUUID");
    v22 = *(uint64_t (**)(OpaqueFigCaptureDeferredPhotoProcessor *, uint64_t, uint64_t, id, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
    if (!v22)
      goto LABEL_27;
    v23 = v22(fcdpp, v20, v21, a4, 0);
    if (v23 <= -16157)
    {
      if (v23 != -16823)
      {
        v24 = -16822;
LABEL_23:
        if (v23 != v24)
        {
LABEL_27:
          -[AVCaptureDeferredPhotoProcessor _dispatchFailureCallbacks:forProcessingRequest:error:](self, "_dispatchFailureCallbacks:forProcessingRequest:error:", 3, v12, AVLocalizedErrorWithUnderlyingOSStatus());
          goto LABEL_28;
        }
LABEL_24:
        if (dword_1ECFED5C0)
        {
          v25 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        goto LABEL_27;
      }
      -[AVCaptureDeferredPhotoProcessor _handleWillAbortProcessingDueToPriorityInversion](self, "_handleWillAbortProcessingDueToPriorityInversion");
    }
    else
    {
      if ((v23 + 16156) < 2)
        goto LABEL_24;
      if (v23)
      {
        v24 = -12785;
        goto LABEL_23;
      }
    }
LABEL_28:

    goto LABEL_29;
  }
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v13);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v13);
LABEL_29:
  _Block_object_dispose(&v27, 8);
}

uint64_t __91__AVCaptureDeferredPhotoProcessor__processPhotoProxy_queuePosition_delegate_delegateQueue___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)objc_msgSend(a2, "photoProxies", 0);
  result = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (result)
  {
    v9 = result;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if (objc_msgSend((id)objc_msgSend(v12, "captureRequestIdentifier"), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "captureRequestIdentifier")))
        {
          if (objc_msgSend((id)objc_msgSend(v12, "persistentStorageUUID"), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "persistentStorageUUID")))
          {
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
            *a4 = 1;
          }
        }
        ++v11;
      }
      while (v9 != v11);
      result = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v9 = result;
    }
    while (result);
  }
  return result;
}

- (BOOL)cancelProcessingForPhotoProxy:(id)a3 error:(id *)a4
{
  int v7;
  OpaqueFigCaptureDeferredPhotoProcessor *fcdpp;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(OpaqueFigCaptureDeferredPhotoProcessor *, uint64_t, uint64_t);

  v7 = -[AVCaptureDeferredPhotoProcessor _establishServerConnection](self, "_establishServerConnection");
  if (!v7)
  {
    fcdpp = self->_fcdpp;
    v9 = objc_msgSend(a3, "captureRequestIdentifier");
    v10 = objc_msgSend(a3, "persistentStorageUUID");
    v11 = *(uint64_t (**)(OpaqueFigCaptureDeferredPhotoProcessor *, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                               + 32);
    if (v11)
    {
      v7 = v11(fcdpp, v9, v10);
      if (!a4)
        return v7 == 0;
    }
    else
    {
      v7 = -12782;
      if (!a4)
        return v7 == 0;
    }
    if (v7)
    {
      *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus();
      v7 = 1;
    }
  }
  return v7 == 0;
}

- (void)deletePersistentStorageForPhotoProxy:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  OpaqueFigCaptureDeferredPhotoProcessor *fcdpp;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(OpaqueFigCaptureDeferredPhotoProcessor *, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!-[AVCaptureDeferredPhotoProcessor _establishServerConnection](self, "_establishServerConnection"))
  {
    if (dword_1ECFED5C0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    fcdpp = self->_fcdpp;
    v7 = objc_msgSend(a3, "captureRequestIdentifier", v10, v11);
    v8 = objc_msgSend(a3, "persistentStorageUUID");
    v9 = *(void (**)(OpaqueFigCaptureDeferredPhotoProcessor *, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                           + 64);
    if (v9)
      v9(fcdpp, v7, v8);
  }
}

- (id)prettyPrintDescriptionForContainer:(id)a3
{
  OpaqueFigCaptureDeferredPhotoProcessor *fcdpp;
  uint64_t (*v6)(OpaqueFigCaptureDeferredPhotoProcessor *, id);

  if (-[AVCaptureDeferredPhotoProcessor _establishServerConnection](self, "_establishServerConnection"))
    return 0;
  fcdpp = self->_fcdpp;
  v6 = *(uint64_t (**)(OpaqueFigCaptureDeferredPhotoProcessor *, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                              + 72);
  if (!v6)
    return 0;
  else
    return (id)v6(fcdpp, a3);
}

- (void)cancelAllPrewarming
{
  OpaqueFigCaptureDeferredPhotoProcessor *fcdpp;
  void (*v4)(OpaqueFigCaptureDeferredPhotoProcessor *);
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (FigCaptureDeferredPhotoProcessorIsAllowedToPrewarm())
  {
    if (!-[AVCaptureDeferredPhotoProcessor _establishServerConnection](self, "_establishServerConnection"))
    {
      fcdpp = self->_fcdpp;
      v4 = *(void (**)(OpaqueFigCaptureDeferredPhotoProcessor *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                           + 56);
      if (v4)
        v4(fcdpp);
    }
  }
  else if (dword_1ECFED5C0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  OpaqueFigCaptureDeferredPhotoProcessor *fcdpp;
  uint64_t v6;
  void (*v7)(OpaqueFigCaptureDeferredPhotoProcessor *, _QWORD, uint64_t);

  v3 = a3;
  if (!-[AVCaptureDeferredPhotoProcessor _establishServerConnection](self, "_establishServerConnection"))
  {
    fcdpp = self->_fcdpp;
    v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v7 = *(void (**)(OpaqueFigCaptureDeferredPhotoProcessor *, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                          + 56);
    if (v7)
      v7(fcdpp, *MEMORY[0x1E0D04040], v6);
  }
}

- (BOOL)_getValueForBooleanProperty:(__CFString *)a3
{
  const void *v5;
  OpaqueFigCaptureDeferredPhotoProcessor *fcdpp;
  void (*v7)(OpaqueFigCaptureDeferredPhotoProcessor *, __CFString *, _QWORD, const void **);
  BOOL v8;
  const void *v10;

  if (-[AVCaptureDeferredPhotoProcessor _establishServerConnection](self, "_establishServerConnection"))
    return 0;
  v5 = (const void *)*MEMORY[0x1E0C9AE40];
  v10 = (const void *)*MEMORY[0x1E0C9AE40];
  fcdpp = self->_fcdpp;
  v7 = *(void (**)(OpaqueFigCaptureDeferredPhotoProcessor *, __CFString *, _QWORD, const void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v7)
  {
    v7(fcdpp, a3, *MEMORY[0x1E0C9AE00], &v10);
    v5 = v10;
  }
  v8 = v5 == (const void *)*MEMORY[0x1E0C9AE50];
  if (v5)
    CFRelease(v5);
  return v8;
}

- (BOOL)isPaused
{
  return -[AVCaptureDeferredPhotoProcessor _getValueForBooleanProperty:](self, "_getValueForBooleanProperty:", *MEMORY[0x1E0D04040]);
}

- (BOOL)lastJobReusedGraph
{
  return -[AVCaptureDeferredPhotoProcessor _getValueForBooleanProperty:](self, "_getValueForBooleanProperty:", *MEMORY[0x1E0D04038]);
}

- (void)_resetFigCaptureDeferredPhotoProcessor
{
  NSObject *fcdppQueue;
  _QWORD block[5];

  fcdppQueue = self->_fcdppQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__AVCaptureDeferredPhotoProcessor__resetFigCaptureDeferredPhotoProcessor__block_invoke;
  block[3] = &unk_1E42165A8;
  block[4] = self;
  dispatch_sync(fcdppQueue, block);
}

uint64_t __73__AVCaptureDeferredPhotoProcessor__resetFigCaptureDeferredPhotoProcessor__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureDeferredPhotoProcessor:", 0);
}

void __61__AVCaptureDeferredPhotoProcessor__establishServerConnection__block_invoke_2(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = FigCaptureDeferredPhotoProcessorRemoteCopyPhotoProcessor();
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "_setFigCaptureDeferredPhotoProcessor:", 0);
}

- (id)_processingRequestForCaptureRequestIdentifier:(id)a3
{
  NSMutableArray *requests;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1A1AF1298](self->_requestsLock, a2);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  requests = self->_requests;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](requests, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(requests);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "photoProxies"), "firstObject"), "captureRequestIdentifier"), "isEqualToString:", a3))
        {
          v11 = v10;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](requests, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:
  MEMORY[0x1A1AF12A4](self->_requestsLock);
  return v11;
}

- (void)_handleWillBeginProcessingPhotoProxyNotificationWithPayload:(id)a3 forRequest:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id obj;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[7];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  MEMORY[0x1A1AF1298](self->_requestsLock, a2, a3);
  objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 1);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = (id)objc_msgSend(a4, "delegatesStorage");
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v15)
  {
    v14 = *(_QWORD *)v25;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v25 != v14)
        {
          v7 = v6;
          objc_enumerationMutation(obj);
          v6 = v7;
        }
        v16 = v6;
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v6);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v9 = (void *)objc_msgSend(a4, "photoProxies");
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v19;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v19 != v11)
                objc_enumerationMutation(v9);
              v22[0] = 0;
              v22[1] = v22;
              v22[2] = 0x3052000000;
              v22[3] = __Block_byref_object_copy__6;
              v22[4] = __Block_byref_object_dispose__6;
              v23 = 0;
              v23 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
              v17[0] = MEMORY[0x1E0C809B0];
              v17[1] = 3221225472;
              v17[2] = __106__AVCaptureDeferredPhotoProcessor__handleWillBeginProcessingPhotoProxyNotificationWithPayload_forRequest___block_invoke;
              v17[3] = &unk_1E421CFB0;
              v17[5] = self;
              v17[6] = v22;
              v17[4] = a4;
              objc_msgSend(v8, "invokeDelegateCallbackWithBlock:", v17);
              _Block_object_dispose(v22, 8);
              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
          }
          while (v10);
        }
        v6 = v16 + 1;
      }
      while (v16 + 1 != v15);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v15);
  }
  MEMORY[0x1A1AF12A4](self->_requestsLock);
}

uint64_t __106__AVCaptureDeferredPhotoProcessor__handleWillBeginProcessingPhotoProxyNotificationWithPayload_forRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    if ((objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "deferredPhotoIdentifier"), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "originalDeferredPhotoIdentifier")) & 1) == 0)*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = -[AVCaptureDeferredPhotoProxy initWithDeferredPhotoIdentifier:]([AVCaptureDeferredPhotoProxy alloc], "initWithDeferredPhotoIdentifier:", objc_msgSend(*(id *)(a1 + 32), "originalDeferredPhotoIdentifier"));
    return objc_msgSend(a2, "processor:willBeginProcessingPhotoProxy:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }
  return result;
}

- (void)_handleDidFinishProcessingPhotoProxyNotificationWithPayload:(id)a3 forRequest:(id)a4
{
  int v6;
  const __CFDictionary *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  int v21;
  AVCaptureDeferredPhotoProxy *v22;
  const void *v23;
  const void *v24;
  const void *v25;
  const void *v26;
  const void *v27;
  const void *v28;
  void *v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  id v33;
  id v34;
  id obj;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  int v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  CFTypeRef v50;
  CFTypeRef cf;
  _QWORD v52[23];
  CMTime v53;
  int v54;
  int v55;
  int v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  void (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  uint64_t v70;
  CMTime v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03F80]), "intValue");
  if (v6)
    v48 = AVLocalizedErrorWithUnderlyingOSStatus();
  else
    v48 = 0;
  cf = (CFTypeRef)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03FF8]);
  v47 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04000]), "unsignedIntegerValue");
  v46 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03FA8]);
  v71 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  v7 = (const __CFDictionary *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03FE0]);
  if (v7)
    CMTimeMakeFromDictionary(&v71, v7);
  v8 = v6 == 0;
  v45 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03FB0]), "unsignedLongValue");
  v44 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03FB8]), "intValue");
  v50 = (CFTypeRef)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04018]);
  v9 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03F68]);
  v10 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03FC0]);
  v65 = 0;
  v66 = &v65;
  v67 = 0x3052000000;
  v68 = __Block_byref_object_copy__6;
  v69 = __Block_byref_object_dispose__6;
  v70 = 0;
  v34 = a4;
  if (v8)
  {
    v12 = v10;
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v13 = (void *)objc_msgSend(a4, "photoProxies");
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v62;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v62 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          v18 = (void *)objc_msgSend(v17, "deferredPhotoIdentifier");
          if (objc_msgSend(v18, "isEqualToString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v9, v12)))
          {
            v11 = v17;
            goto LABEL_18;
          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
        if (v14)
          continue;
        break;
      }
    }
  }
  else
  {
    v11 = (id)objc_msgSend((id)objc_msgSend(a4, "photoProxies"), "firstObject");
LABEL_18:
    v66[5] = (uint64_t)v11;
  }
  v19 = (void *)objc_msgSend(v34, "photoProxies");
  objc_msgSend(v19, "removeObject:", v66[5]);
  objc_msgSend(v34, "setFiredPhotoCallbacksCount:", objc_msgSend(v34, "firedPhotoCallbacksCount") + 1);
  v20 = v34;
  v43 = objc_msgSend((id)v66[5], "expectedPhotoProcessingFlags");
  MEMORY[0x1A1AF1298](self->_requestsLock);
  v21 = objc_msgSend(v34, "firedPhotoCallbacksCount");
  if (v21 == objc_msgSend(v34, "expectedPhotoCount"))
  {
    -[NSMutableArray removeObject:](self->_requests, "removeObject:", v34);
    objc_msgSend(v34, "setFiredCallbackFlags:", objc_msgSend(v34, "firedCallbackFlags") | 2);
  }
  if ((objc_msgSend((id)objc_msgSend((id)v66[5], "deferredPhotoIdentifier"), "isEqualToString:", objc_msgSend(v34, "originalDeferredPhotoIdentifier")) & 1) == 0)
  {

    v22 = -[AVCaptureDeferredPhotoProxy initWithDeferredPhotoIdentifier:]([AVCaptureDeferredPhotoProxy alloc], "initWithDeferredPhotoIdentifier:", objc_msgSend(v34, "originalDeferredPhotoIdentifier"));
    v66[5] = (uint64_t)v22;
  }
  v23 = (const void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03F70]);
  v42 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03F78]);
  v24 = (const void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03FD8]);
  v41 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03FD0]);
  v25 = (const void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03FA0]);
  v40 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03F98]);
  v26 = (const void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03FF0]);
  v39 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03FE8]);
  v27 = (const void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04010]);
  v38 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04008]);
  v28 = (const void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03F90]);
  v37 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03F88]);
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v29 = (void *)objc_msgSend(v34, "delegatesStorage");
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
  if (v30)
  {
    v36 = *(_QWORD *)v58;
    obj = v29;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v58 != v36)
          objc_enumerationMutation(obj);
        v32 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
        if (cf)
          CFRetain(cf);
        if (v50)
          CFRetain(v50);
        if (v23)
          CFRetain(v23);
        if (v24)
          CFRetain(v24);
        if (v25)
          CFRetain(v25);
        if (v26)
          CFRetain(v26);
        if (v27)
          CFRetain(v27);
        if (v28)
          CFRetain(v28);
        v33 = (id)v66[5];
        v52[0] = MEMORY[0x1E0C809B0];
        v52[1] = 3221225472;
        v52[2] = __106__AVCaptureDeferredPhotoProcessor__handleDidFinishProcessingPhotoProxyNotificationWithPayload_forRequest___block_invoke;
        v52[3] = &unk_1E421CFD8;
        v53 = v71;
        v52[14] = cf;
        v52[15] = v47;
        v54 = v44;
        v55 = v45;
        v52[16] = v50;
        v52[17] = v23;
        v52[4] = v46;
        v52[5] = v42;
        v52[18] = v24;
        v52[19] = v25;
        v52[6] = v41;
        v52[7] = v40;
        v52[20] = v26;
        v52[21] = v27;
        v52[8] = v39;
        v52[9] = v38;
        v52[22] = v28;
        v56 = v43;
        v52[10] = v37;
        v52[11] = v48;
        v52[13] = &v65;
        v52[12] = self;
        objc_msgSend(v32, "invokeDelegateCallbackWithBlock:", v52);
      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
    }
    while (v30);
  }
  MEMORY[0x1A1AF12A4](self->_requestsLock);

  _Block_object_dispose(&v65, 8);
}

void __106__AVCaptureDeferredPhotoProcessor__handleDidFinishProcessingPhotoProxyNotificationWithPayload_forRequest___block_invoke(uint64_t a1, void *a2)
{
  AVCapturePhoto *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  AVCapturePhoto *v23;
  void *v24;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const void *v26;
  const void *v27;
  const void *v28;
  const void *v29;
  const void *v30;
  const void *v31;
  const void *v32;
  const void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 112))
  {
    v4 = [AVCapturePhoto alloc];
    v5 = *(_QWORD *)(a1 + 112);
    v6 = *(_QWORD *)(a1 + 120);
    v7 = +[AVCapturePhoto AVFileTypeFromFigCaptureStillImageSettingsFileType:codec:unresolvedSettings:](AVCapturePhoto, "AVFileTypeFromFigCaptureStillImageSettingsFileType:codec:unresolvedSettings:", *(unsigned int *)(a1 + 208), *(unsigned int *)(a1 + 212), 0);
    v8 = *(_QWORD *)(a1 + 128);
    v9 = *(_QWORD *)(a1 + 136);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 144);
    v13 = *(_QWORD *)(a1 + 152);
    v14 = *(_QWORD *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 56);
    v16 = *(_QWORD *)(a1 + 160);
    v17 = *(_QWORD *)(a1 + 168);
    v19 = *(_QWORD *)(a1 + 64);
    v18 = *(_QWORD *)(a1 + 72);
    v20 = *(_QWORD *)(a1 + 176);
    v21 = *(_QWORD *)(a1 + 80);
    v22 = *(_DWORD *)(a1 + 216);
    v37 = *(_OWORD *)(a1 + 184);
    v38 = *(_QWORD *)(a1 + 200);
    LODWORD(v36) = v22;
    v23 = -[AVCapturePhoto initWithTimestamp:photoSurface:photoSurfaceSize:processedFileType:previewPhotoSurface:embeddedThumbnailSourceSurface:metadata:depthDataSurface:depthMetadataDictionary:portraitEffectsMatteSurface:portraitEffectsMatteMetadataDictionary:hairSegmentationMatteSurface:hairSegmentationMatteMetadataDictionary:skinSegmentationMatteSurface:skinSegmentationMatteMetadataDictionary:teethSegmentationMatteSurface:teethSegmentationMatteMetadataDictionary:glassesSegmentationMatteSurface:glassesSegmentationMatteMetadataDictionary:constantColorConfidenceMapSurface:constantColorMetadataDictionary:captureRequest:bracketSettings:sequenceCount:photoCount:expectedPhotoProcessingFlags:sourceDeviceType:](v4, "initWithTimestamp:photoSurface:photoSurfaceSize:processedFileType:previewPhotoSurface:embeddedThumbnailSourceSurface:metadata:depthDataSurface:depthMetadataDictionary:portraitEffectsMatteSurface:portraitEffectsMatteMetadataDictionary:hairSegmentationMatteSurface:hairSegmentationMatteMetadataDictionary:skinSegmentationMatteSurface:skinSegmentationMatteMetadataDictionary:teethSegmentationMatteSurface:teethSegmentationMatteMetadataDictionary:glassesSegmentationMatteSurface:glassesSegmentationMatteMetadataDictionary:constantColorConfidenceMapSurface:constantColorMetadataDictionary:captureRequest:bracketSettings:sequenceCount:photoCount:expectedPhotoProcessingFlags:sourceDeviceType:", &v37, v5, v6, v7, 0, v8, v10, v9, v11, v12, v14,
            v13,
            v15,
            v16,
            v19,
            v17,
            v18,
            v20,
            v21,
            0,
            0,
            0,
            0,
            1,
            1,
            v36,
            CFSTR("AVCaptureDeviceTypeBuiltInDualCamera"));
  }
  else
  {
    v23 = 0;
  }
  v24 = (void *)objc_msgSend(*(id *)(a1 + 88), "userInfo");
  objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  if (dword_1ECFED5C0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(a2, "processor:didFinishProcessingPhotoProxy:finalPhoto:error:", *(_QWORD *)(a1 + 96), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), v23, *(_QWORD *)(a1 + 88), v34, v35);

  v26 = *(const void **)(a1 + 112);
  if (v26)
    CFRelease(v26);
  v27 = *(const void **)(a1 + 128);
  if (v27)
    CFRelease(v27);
  v28 = *(const void **)(a1 + 136);
  if (v28)
    CFRelease(v28);
  v29 = *(const void **)(a1 + 144);
  if (v29)
    CFRelease(v29);
  v30 = *(const void **)(a1 + 152);
  if (v30)
    CFRelease(v30);
  v31 = *(const void **)(a1 + 160);
  if (v31)
    CFRelease(v31);
  v32 = *(const void **)(a1 + 168);
  if (v32)
    CFRelease(v32);
  v33 = *(const void **)(a1 + 176);
  if (v33)
    CFRelease(v33);
}

- (void)_handleWillAbortProcessingDueToPriorityInversion
{
  MEMORY[0x1A1AF1298](self->_requestsLock, a2);
  if (!self->_requestsWillBeReenqueued)
    self->_requestsWillBeReenqueued = 1;
  JUMPOUT(0x1A1AF12A4);
}

- (void)_handleServerConnectionDiedAndRequestsWillBeReenqueued
{
  NSObject *processPhotoProxyQueue;
  _QWORD block[5];

  -[AVCaptureDeferredPhotoProcessor _resetFigCaptureDeferredPhotoProcessor](self, "_resetFigCaptureDeferredPhotoProcessor");
  processPhotoProxyQueue = self->_processPhotoProxyQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__AVCaptureDeferredPhotoProcessor__handleServerConnectionDiedAndRequestsWillBeReenqueued__block_invoke;
  block[3] = &unk_1E42165A8;
  block[4] = self;
  dispatch_sync(processPhotoProxyQueue, block);
}

uint64_t __89__AVCaptureDeferredPhotoProcessor__handleServerConnectionDiedAndRequestsWillBeReenqueued__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reenqueueRequestsAfterPriorityInversion");
}

- (void)_reenqueueRequestsAfterPriorityInversion
{
  uint64_t v2;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  dispatch_qos_class_t v13;
  dispatch_block_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD block[6];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!_FigIsCurrentDispatchQueue())
  {
    v16 = v2;
    LODWORD(v15) = 0;
    FigDebugAssert3();
  }
  MEMORY[0x1A1AF1298](self->_requestsLock);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_requests);
  -[NSMutableArray removeAllObjects](self->_requests, "removeAllObjects");
  self->_requestsWillBeReenqueued = 0;
  MEMORY[0x1A1AF12A4](self->_requestsLock);
  v5 = (void *)objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_117);
  v6 = dispatch_queue_create("com.apple.coremedia.deferredmediad.reenqueuerequests", 0);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "qosClass", v15, v16);
        block[0] = v10;
        block[1] = 3221225472;
        block[2] = __75__AVCaptureDeferredPhotoProcessor__reenqueueRequestsAfterPriorityInversion__block_invoke_2;
        block[3] = &unk_1E4216408;
        block[4] = v12;
        block[5] = self;
        v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v13, 0, block);
        dispatch_async(v6, v14);

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }
  dispatch_sync(v6, &__block_literal_global_120);

}

uint64_t __75__AVCaptureDeferredPhotoProcessor__reenqueueRequestsAfterPriorityInversion__block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v5;
  unsigned int v7;

  v5 = objc_msgSend(a2, "qosClass");
  if (v5 == objc_msgSend(a3, "qosClass"))
    return 0;
  v7 = objc_msgSend(a2, "qosClass");
  if (v7 > objc_msgSend(a3, "qosClass"))
    return -1;
  else
    return 1;
}

uint64_t __75__AVCaptureDeferredPhotoProcessor__reenqueueRequestsAfterPriorityInversion__block_invoke_2(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  os_log_type_t type;
  int v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFED5C0)
  {
    v15 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "delegatesStorage", v8, v9, 0);
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 40), "_processPhotoProxy:queuePosition:delegate:delegateQueue:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "photoProxies"), "firstObject"), CFSTR("Tail"), objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "delegate"), objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "delegateQueue"));
        ++v7;
      }
      while (v5 != v7);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

void __75__AVCaptureDeferredPhotoProcessor__reenqueueRequestsAfterPriorityInversion__block_invoke_119()
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (dword_1ECFED5C0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)_dispatchFailureCallbacks:(unsigned int)a3 forProcessingRequest:(id)a4 error:(id)a5
{
  char v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id obj;
  _QWORD v18[7];
  int v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend(a4, "firedCallbackFlags");
  if ((((v9 & 2) == 0) & (a3 >> 1)) != 0)
    v10 = a3 & ((v9 & 1) == 0) | 2;
  else
    v10 = a3 & ((v9 & 1) == 0);
  MEMORY[0x1A1AF1298](self->_requestsLock);
  objc_msgSend(a4, "setFiredCallbackFlags:", v10 | objc_msgSend(a4, "firedCallbackFlags"));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = (id)objc_msgSend(a4, "delegatesStorage");
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    v14 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v18[0] = v14;
        v18[1] = 3221225472;
        v18[2] = __88__AVCaptureDeferredPhotoProcessor__dispatchFailureCallbacks_forProcessingRequest_error___block_invoke;
        v18[3] = &unk_1E421D060;
        v19 = v10;
        v18[4] = a4;
        v18[5] = self;
        v18[6] = a5;
        objc_msgSend(v16, "invokeDelegateCallbackWithBlock:", v18);
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }
  -[NSMutableArray removeObject:](self->_requests, "removeObject:", a4);
  MEMORY[0x1A1AF12A4](self->_requestsLock);
}

uint64_t __88__AVCaptureDeferredPhotoProcessor__dispatchFailureCallbacks_forProcessingRequest_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  int v6;
  signed int v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id obj;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = (id)objc_msgSend(*(id *)(a1 + 32), "photoProxies");
  result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  v15 = result;
  if (result)
  {
    v14 = *(_QWORD *)v19;
    v12 = *MEMORY[0x1E0CB3388];
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(obj);
        v16 = v4;
        v5 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v4);
        if ((*(_BYTE *)(a1 + 56) & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(a2, "processor:willBeginProcessingPhotoProxy:", *(_QWORD *)(a1 + 40), v5);
        if ((*(_BYTE *)(a1 + 56) & 2) != 0)
        {
          objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "userInfo"), "objectForKeyedSubscript:", v12);
          v6 = objc_msgSend(*(id *)(a1 + 32), "expectedPhotoCount");
          if (v6 > (int)objc_msgSend(*(id *)(a1 + 32), "firedPhotoCallbacksCount"))
          {
            v7 = 0;
            do
            {
              if (dword_1ECFED5C0)
              {
                os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              objc_msgSend(a2, "processor:didFinishProcessingPhotoProxy:finalPhoto:error:", *(_QWORD *)(a1 + 40), v5, 0, *(_QWORD *)(a1 + 48), v10, v11);
              ++v7;
              v9 = objc_msgSend(*(id *)(a1 + 32), "expectedPhotoCount");
            }
            while (v7 < (int)(v9 - objc_msgSend(*(id *)(a1 + 32), "firedPhotoCallbacksCount")));
          }
        }
        v4 = v16 + 1;
      }
      while (v16 + 1 != v15);
      result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v15 = result;
    }
    while (result);
  }
  return result;
}

@end

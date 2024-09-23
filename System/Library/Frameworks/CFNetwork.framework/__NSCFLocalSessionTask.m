@implementation __NSCFLocalSessionTask

- (void)_setConnectionCacheKey:(void *)a3
{
  void *connKey;

  if (a3)
    (*(void (**)(void *, SEL))(*(_QWORD *)a3 + 40))(a3, a2);
  os_unfair_lock_lock(&self->_connKeyLock);
  connKey = self->_connKey;
  self->_connKey = a3;
  os_unfair_lock_unlock(&self->_connKeyLock);
  if (connKey)
    (*(void (**)(void *))(*(_QWORD *)connKey + 48))(connKey);
}

- (void)localSession
{
  void *v1;
  uint8_t v2[16];

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "session");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "local tasks should have local sessions", v2, 2u);
    }
    return (void *)objc_msgSend(v1, "session");
  }
  return result;
}

- (void)_onqueue_startResourceTimer:(uint64_t)a1
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int64_t v10;
  NSObject *v11;
  NSObject *v12;

  objc_msgSend((id)a1, "startTime");
  if (v4 != 0.0 && !*(_QWORD *)(a1 + 816))
  {
    if (*(double *)(a1 + 840) == 0.0)
    {
      if (a2 <= 0.0)
        return;
    }
    else
    {
      objc_msgSend((id)objc_msgSend((id)a1, "currentRequest"), "_payloadTransmissionTimeout");
      if (a2 <= 0.0 || v5 != 0.0)
        return;
    }
    objc_msgSend((id)a1, "startTime");
    v7 = v6 + a2;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v9 = v7 - v8;
    if (v9 <= 31536000.0)
    {
      v10 = (uint64_t)(v9 * 1000000000.0);
      if (v10 < 1)
      {
        objc_msgSend((id)a1, "_onqueue_cancel_with_error:", -[__NSCFLocalSessionTask timeoutErrorWithStreamErrorCode:]((void *)a1, 4294965193));
      }
      else
      {
        v11 = objc_msgSend((id)a1, "workQueue");
        v12 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v11);
        *(_QWORD *)(a1 + 816) = v12;
        -[__NSCFLocalSessionTask _onqueue_startTimer:withTimeoutInNanos:streamErrorCode:]((void *)a1, v12, v10, -2103);
      }
    }
  }
}

- (void)_task_onqueue_didFinish
{
  NSString *v3;
  void *connKey;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  id *v10;
  _QWORD *v11;
  _QWORD v12[5];
  _QWORD context[5];

  v3 = -[NSError domain](-[NSURLSessionTask error](self, "error"), "domain");
  if (-[NSString isEqualToString:](v3, "isEqualToString:", *MEMORY[0x1E0CB32E8])
    && -[NSError code](-[NSURLSessionTask error](self, "error"), "code") == -999)
  {
    os_unfair_lock_lock(&self->_connKeyLock);
    connKey = self->_connKey;
    if (connKey)
    {
      (*(void (**)(void *))(*(_QWORD *)connKey + 40))(self->_connKey);
      os_unfair_lock_unlock(&self->_connKeyLock);
      v5 = -[__NSCFLocalSessionTask localSession](self);
      if (v5)
      {
        v6 = v5[21];
        if (v6)
        {
          pthread_mutex_lock((pthread_mutex_t *)(v6 + 40));
          context[0] = MEMORY[0x1E0C809B0];
          context[1] = 3221225472;
          context[2] = ___ZN12XTubeManager38invalidateUnpurgeableConnectionsForKeyEP22HTTPConnectionCacheKey_block_invoke;
          context[3] = &__block_descriptor_40_e136_v24__0r__CoreSchedulingSet________CFAllocator_i______opaque_pthread_t_i____CFSet___os_unfair_lock_s_I_____CFRunLoop_____CFString_i_8_v16l;
          context[4] = connKey;
          CFDictionaryApplyFunction(*(CFDictionaryRef *)(v6 + 32), (CFDictionaryApplierFunction)RetainableTypedDict<CoreSchedulingSet const*,GlueTubeManager *>::_visit, context);
          pthread_mutex_unlock((pthread_mutex_t *)(v6 + 40));
        }
      }
      (*(void (**)(void *))(*(_QWORD *)connKey + 48))(connKey);
    }
    else
    {
      os_unfair_lock_unlock(&self->_connKeyLock);
    }
    -[NSURLSessionTask _finishProgressReporting](self, "_finishProgressReporting");
  }
  else
  {
    -[NSURLSessionTask _finishProgressReporting](self, "_finishProgressReporting");
    if (!self)
      goto LABEL_13;
  }
  if (self->_pendingResponseDisposition)
  {
    self->_pendingResponseDisposition_didFinish = 1;
    return;
  }
LABEL_13:
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49____NSCFLocalSessionTask__task_onqueue_didFinish__block_invoke;
  v12[3] = &unk_1E14FE118;
  v12[4] = self;
  -[__CFN_TaskMetrics completeWithError:]((uint64_t)-[NSURLSessionTask _metrics](self, "_metrics"), -[NSURLSessionTask error](self, "error"));
  if (-[__NSCFLocalSessionTask _needSendingMetrics](self, "_needSendingMetrics"))
  {
    -[__NSCFLocalSessionTask _didSendMetrics](self, "_didSendMetrics");
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __49____NSCFLocalSessionTask__task_onqueue_didFinish__block_invoke_3;
    v9[3] = &unk_1E14FE070;
    v9[4] = self;
    v10 = -[NSURLSessionTaskMetrics initWithMetrics:]((id *)[NSURLSessionTaskMetrics alloc], -[NSURLSessionTask _metrics](self, "_metrics"));
    v11 = v12;
    -[NSURLSessionTaskMetrics collectWithCompletionHandler:queue:]((uint64_t)v10, v9, -[NSURLSessionTask workQueue](self, "workQueue"));
  }
  else
  {
    __49____NSCFLocalSessionTask__task_onqueue_didFinish__block_invoke((uint64_t)v12, v8);
  }
  -[NSURLSessionTask setState:](self, "setState:", 3);
}

- (BOOL)_needSendingMetrics
{
  return !self->_sentDidFinishCollectingMetrics;
}

- (void)_didSendMetrics
{
  self->_sentDidFinishCollectingMetrics = 1;
}

- (void)_onqueue_didFinishWithError:(id)a3
{
  if (!-[NSURLSessionTask error](self, "error"))
  {
    -[NSURLSessionTask setError:](self, "setError:", a3);
    -[__NSCFLocalSessionTask _task_onqueue_didFinish](self, "_task_onqueue_didFinish");
  }
}

- (void)_onqueue_suspend
{
  unint64_t suspendCount;

  if (!self || (suspendCount = self->_suspendCount, self->_suspendCount = suspendCount + 1, !suspendCount))
  {
    -[NSURLSessionTask setState:](self, "setState:", 1);
    if (-[__NSCFLocalSessionTask cfConn](self, "cfConn"))
      -[__NSCFURLSessionConnection suspend](-[__NSCFLocalSessionTask cfConn](self, "cfConn"), "suspend");
  }
}

- (void)_private_onqueue_didReceiveResponseDisposition:(int64_t)a3 completion:(id)a4
{
  TransportConnection *v6;
  __NSCFURLSessionDelegateWrapper *internalDelegateWrapper;
  const char *v8;
  __NSCFURLSessionConnection *v9;
  __NSCFLocalDownloadTask *v10;
  __NSCFLocalSessionTask *v11;
  __NSCFLocalSessionTask *v12;
  __NSCFURLSessionConnection *v13;
  const char *v14;
  __NSCFURLSessionConnection *v15;
  const char *v16;
  NSObject *pendingResponseBytes;
  __NSCFURLSessionDelegateWrapper *v18;
  const char *v19;
  id *v20;
  __NSCFURLSessionConnection *v21;
  void *v22;
  __NSCFURLLocalTCPIOStreamTaskFromDataTask *v23;
  __shared_weak_count *cntrl;
  unint64_t *v25;
  unint64_t v26;
  OS_dispatch_data *extraBytes;
  __NSCFURLLocalStreamTaskFromDataTask *v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  __NSCFURLSessionDelegateWrapper *v36;
  id *v37;
  __NSCFURLSessionDelegateWrapper *publicDelegateWrapper;
  __int128 v39;
  uint64_t v40;
  _QWORD v41[6];
  _QWORD v42[5];
  objc_super v43;
  void (*v44)(uint64_t);
  void *v45;
  __NSCFLocalSessionTask *v46;
  __NSCFURLLocalStreamTaskFromDataTask *v47;
  __NSCFURLSessionConnection *v48;
  id v49;
  void *v50;
  uint64_t v51;
  void (*v52)(uint64_t, uint64_t);
  void *v53;
  id *v54;
  __NSCFURLSessionConnection *v55;
  TransportConnection *ptr;
  __shared_weak_count *v57;

  switch(a3)
  {
    case 0:
      goto LABEL_2;
    case 1:
      if (self)
        goto LABEL_18;
      goto LABEL_19;
    case 2:
      if (!self)
        goto LABEL_2;
      internalDelegateWrapper = self->super._internalDelegateWrapper;
      if (!internalDelegateWrapper)
      {
        internalDelegateWrapper = self->super._publicDelegateWrapper;
        if (!internalDelegateWrapper)
          goto LABEL_2;
      }
      if ((-[__NSCFURLSessionDelegateWrapper check_didBecomeDownloadTask]((unsigned __int8 *)internalDelegateWrapper, a2) & 1) == 0&& (-[__NSCFURLSessionDelegateWrapper check_didBecomeDownloadTask]((unsigned __int8 *)internalDelegateWrapper->_fallbackDelegateWrapper, v8) & 1) == 0)
      {
        goto LABEL_2;
      }
      v9 = -[__NSCFLocalSessionTask cfConn](self, "cfConn");
      -[__NSCFLocalSessionTask setConnection:](self, 0);
      v10 = [__NSCFLocalDownloadTask alloc];
      if (!v10)
        goto LABEL_53;
      v10->_initialResumeSize = -1;
      v43.receiver = v10;
      v43.super_class = (Class)__NSCFLocalSessionTask;
      v11 = -[NSURLSessionTask initWithTask:](&v43, sel_initWithTask_, self);
      v12 = v11;
      if (v11)
      {
        v11->_connKeyLock._os_unfair_lock_opaque = 0;
        v11->_suspendCount = 1;
        -[__NSCFLocalSessionTask setConnection:](v11, (uint64_t)-[__NSCFLocalSessionTask cfConn](self, "cfConn"));
        -[NSURLSessionTask setState:](v12, "setState:", 1);
        -[__NSCFLocalSessionTask setCfConn:](v12, "setCfConn:", v9);
        v13 = -[__NSCFLocalSessionTask cfConn](v12, "cfConn");
        if (v13)
          objc_setProperty_atomic_copy(v13, v14, v12, 8);
        v15 = -[__NSCFLocalSessionTask cfConn](v12, "cfConn");
        if (v15)
          objc_setProperty_atomic(v15, v16, v12, 24);
        -[__NSCFURLSessionConnection setIsDownload:](-[__NSCFLocalSessionTask cfConn](v12, "cfConn"), "setIsDownload:", 1);
        -[NSURLSessionTask setPrefersIncrementalDelivery:](v12, "setPrefersIncrementalDelivery:", 0);
        if (-[__NSCFLocalDownloadTask setupForNewDownload:](v12, 0))
        {
          v12->_suspendCount = 1;
          -[NSURLSessionTask setState:](v12, "setState:", 1);
        }
        else
        {

LABEL_53:
          v12 = 0;
        }
      }

      v37 = (id *)-[__NSCFLocalSessionTask localSession](self);
      -[__NSURLSessionLocal replaceTask:withTask:](v37, self, v12);
      publicDelegateWrapper = self->super._internalDelegateWrapper;
      if (!publicDelegateWrapper)
        publicDelegateWrapper = self->super._publicDelegateWrapper;
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __84____NSCFLocalSessionTask__private_onqueue_didReceiveResponseDisposition_completion___block_invoke_2;
      v41[3] = &unk_1E14FDE88;
      v41[4] = self;
      v41[5] = v12;
      -[__NSCFURLSessionDelegateWrapper dataTask:didBecomeDownloadTask:completionHandler:]((uint64_t)publicDelegateWrapper, self, v12, v41);
      goto LABEL_57;
    case 3:
      if (self)
      {
        v18 = self->super._internalDelegateWrapper;
        if ((v18 || (v18 = self->super._publicDelegateWrapper) != 0)
          && ((-[__NSCFURLSessionDelegateWrapper check_didBecomeStreamTask]((unsigned __int8 *)v18, a2) & 1) != 0
           || (-[__NSCFURLSessionDelegateWrapper check_didBecomeStreamTask]((unsigned __int8 *)v18->_fallbackDelegateWrapper, v19) & 1) != 0))
        {
          v20 = (id *)-[__NSCFLocalSessionTask localSession](self);
          v21 = -[__NSCFLocalSessionTask cfConn](self, "cfConn");
          v22 = (void *)MEMORY[0x1E0C809B0];
          if (self->_connectionForUpgrade.__ptr_)
          {
            if (self->_pendingResponseBytes)
              __assert_rtn("-[__NSCFLocalSessionTask _private_onqueue_becomeStreamTaskWithCompletionHandler:]", "LocalSessionTask.mm", 525, "_pendingResponseBytes == nil");
            v23 = [__NSCFURLLocalTCPIOStreamTaskFromDataTask alloc];
            cntrl = self->_connectionForUpgrade.__cntrl_;
            ptr = self->_connectionForUpgrade.__ptr_;
            v57 = cntrl;
            if (cntrl)
            {
              v25 = (unint64_t *)((char *)cntrl + 8);
              do
                v26 = __ldxr(v25);
              while (__stxr(v26 + 1, v25));
            }
            extraBytes = self->_extraBytes;
            v50 = v22;
            v51 = 3221225472;
            v52 = __81____NSCFLocalSessionTask__private_onqueue_becomeStreamTaskWithCompletionHandler___block_invoke;
            v53 = &unk_1E14F6900;
            v54 = v20;
            v55 = v21;
            v28 = -[__NSCFURLLocalTCPIOStreamTaskFromDataTask initWithTask:connection:extraBytes:disavow:](v23, "initWithTask:connection:extraBytes:disavow:", self, &ptr, extraBytes, &v50);
            v29 = (std::__shared_weak_count *)v57;
            if (v57)
            {
              v30 = (unint64_t *)((char *)v57 + 8);
              do
                v31 = __ldaxr(v30);
              while (__stlxr(v31 - 1, v30));
              if (!v31)
              {
                ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
                std::__shared_weak_count::__release_weak(v29);
              }
            }
          }
          else
          {
            v50 = (void *)MEMORY[0x1E0C809B0];
            v51 = 3221225472;
            v52 = __81____NSCFLocalSessionTask__private_onqueue_becomeStreamTaskWithCompletionHandler___block_invoke_2;
            v53 = &unk_1E14F6900;
            v54 = v20;
            v55 = v21;
            v28 = -[__NSCFURLLocalStreamTaskFromDataTask initWithTask:disavow:]([__NSCFURLLocalStreamTaskFromDataTask alloc], "initWithTask:disavow:", self, &v50);
          }
          v32 = objc_opt_class();
          if (v32 == objc_opt_class())
          {
            if (!v21)
            {
LABEL_49:
              -[__NSCFLocalSessionTask setConnection:](self, 0);
              -[__NSURLSessionLocal replaceTask:withTask:](v20, self, v28);
              v36 = self->super._internalDelegateWrapper;
              if (!v36)
                v36 = self->super._publicDelegateWrapper;
              v43.receiver = v22;
              v43.super_class = (Class)3221225472;
              v44 = __81____NSCFLocalSessionTask__private_onqueue_becomeStreamTaskWithCompletionHandler___block_invoke_3;
              v45 = &unk_1E14FCA28;
              v46 = self;
              v47 = v28;
              v48 = v21;
              v49 = a4;
              -[__NSCFURLSessionDelegateWrapper dataTask:didBecomeStreamTask:completionHandler:]((uint64_t)v36, self, v28, &v43);
              return;
            }
          }
          else
          {
            v34 = objc_opt_class();
            if (v34 != objc_opt_class() || v21 == 0)
              goto LABEL_49;
          }
          objc_setProperty_atomic(v21, v33, v28, 24);
          goto LABEL_49;
        }
      }
LABEL_2:
      -[__NSCFLocalSessionTask _onqueue_cancel](self, "_onqueue_cancel");
      v6 = self->_connectionForUpgrade.__ptr_;
      if (v6)
        (*(void (**)(TransportConnection *, _QWORD))(*(_QWORD *)v6 + 152))(v6, 0);
LABEL_18:
      self->_pendingResponseDisposition = 0;
LABEL_19:
      pendingResponseBytes = self->_pendingResponseBytes;
      if (pendingResponseBytes)
      {
        self->_pendingResponseBytes = 0;
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __84____NSCFLocalSessionTask__private_onqueue_didReceiveResponseDisposition_completion___block_invoke;
        v42[3] = &unk_1E14FE118;
        v42[4] = self;
        -[__NSCFLocalSessionTask _task_onqueue_didReceiveDispatchData:completionHandler:](self, "_task_onqueue_didReceiveDispatchData:completionHandler:", pendingResponseBytes, v42);
        dispatch_release(pendingResponseBytes);
      }
      else
      {
        if (self->_suspendedForDisposition)
          -[__NSCFLocalSessionTask _onqueue_resume](self, "_onqueue_resume");
        if (self->_pendingResponseDisposition_didFinish)
        {
          self->_pendingResponseDisposition_didFinish = 0;
          -[__NSCFLocalSessionTask _task_onqueue_didFinish](self, "_task_onqueue_didFinish");
        }
      }
LABEL_57:
      v40 = 0;
      v39 = xmmword_18411DB20;
      (*((void (**)(id, __int128 *))a4 + 2))(a4, &v39);
      return;
    default:
      goto LABEL_57;
  }
}

- (void)_onqueue_completeInitialization
{
  id Property;
  void (**v4)(void *, __NSCFLocalSessionTask *, uint64_t);
  SEL v5;

  if (self)
  {
    Property = objc_getProperty(self, a2, 808, 1);
    v4 = (void (**)(void *, __NSCFLocalSessionTask *, uint64_t))_Block_copy(Property);
    objc_setProperty_atomic_copy(self, v5, 0, 808);
  }
  else
  {
    v4 = (void (**)(void *, __NSCFLocalSessionTask *, uint64_t))_Block_copy(0);
  }
  v4[2](v4, self, 1);
  _Block_release(v4);
}

- (id)_onqueue_strippedMutableRequest
{
  void *v3;

  v3 = (void *)-[NSURLRequest mutableCopy](-[NSURLSessionTask currentRequest](self, "currentRequest"), "mutableCopy");
  objc_msgSend(v3, "setHTTPBody:", 0);
  objc_msgSend(v3, "setHTTPBodyStream:", 0);
  objc_msgSend(v3, "setValue:forHTTPHeaderField:", 0, CFSTR("Transfer-Encoding"));
  -[NSURLSessionTask updateCurrentRequest:](self, "updateCurrentRequest:", v3);
  return v3;
}

- (void)_onqueue_cancel
{
  id v3;

  if (self)
    v3 = -[__NSCFLocalSessionTask error:code:](self, "error:code:", *MEMORY[0x1E0CB32E8], -999);
  else
    v3 = 0;
  -[__NSCFLocalSessionTask _onqueue_cancel_with_error:](self, "_onqueue_cancel_with_error:", v3);
}

- (id)error:(id)a3 code:(int64_t)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB39B8], "_web_errorWithDomain:code:URL:", a3, a4, -[NSURLSessionTask currentRequest_URL](self, "currentRequest_URL"));
}

- (void)dealloc
{
  void *v3;
  id dataTaskCompletion;
  NSObject *dataTaskData;
  NSObject *pendingResponseBytes;
  id async_initialization;
  void *connKey;
  NSInputStream *socketReadStreamForUpgrade;
  NSOutputStream *socketWriteStreamForUpgrade;
  NSOperationQueue *connectionWorkQueue;
  NSObject *extraBytes;
  objc_super v13;

  if (self->_resourceTimeout)
    __assert_rtn("-[__NSCFLocalSessionTask dealloc]", "LocalSessionTask.mm", 384, "_resourceTimeout == NULL");
  v3 = -[__NSCFLocalSessionTask localSession](self);
  -[__NSURLSessionLocal removeUnresumedTask:]((uint64_t)v3, (uint64_t)self);

  dataTaskCompletion = self->_dataTaskCompletion;
  if (dataTaskCompletion)
    _Block_release(dataTaskCompletion);
  dataTaskData = self->_dataTaskData;
  if (dataTaskData)
    dispatch_release(dataTaskData);
  pendingResponseBytes = self->_pendingResponseBytes;
  if (pendingResponseBytes)
    dispatch_release(pendingResponseBytes);
  async_initialization = self->_async_initialization;
  if (async_initialization)
    _Block_release(async_initialization);
  connKey = self->_connKey;
  if (connKey)
    (*(void (**)(void *))(*(_QWORD *)connKey + 48))(connKey);
  socketReadStreamForUpgrade = self->_socketReadStreamForUpgrade;
  if (socketReadStreamForUpgrade)
  {
    -[NSInputStream close](socketReadStreamForUpgrade, "close");

    self->_socketReadStreamForUpgrade = 0;
  }
  socketWriteStreamForUpgrade = self->_socketWriteStreamForUpgrade;
  if (socketWriteStreamForUpgrade)
  {
    -[NSOutputStream close](socketWriteStreamForUpgrade, "close");

    self->_socketWriteStreamForUpgrade = 0;
  }
  connectionWorkQueue = self->_connectionWorkQueue;
  if (connectionWorkQueue)
  {

    self->_connectionWorkQueue = 0;
  }
  extraBytes = self->_extraBytes;
  if (extraBytes)
  {
    dispatch_release(extraBytes);
    self->_extraBytes = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)__NSCFLocalSessionTask;
  -[NSURLSessionTask dealloc](&v13, sel_dealloc);
}

- (void)_onqueue_adjustBytesPerSecondLimit:(int64_t)a3
{
  if (-[__NSCFLocalSessionTask cfConn](self, "cfConn"))
    -[__NSCFURLSessionConnection setBytesPerSecondLimit:](-[__NSCFLocalSessionTask cfConn](self, "cfConn"), "setBytesPerSecondLimit:", a3);
}

- (void)_onqueue_cancel_with_error:(id)a3
{
  const char *v5;
  const char *v6;
  id Property;
  void (**v8)(void *, __NSCFLocalSessionTask *, _QWORD);
  SEL v9;

  if (-[NSURLSessionTask state](self, "state") <= NSURLSessionTaskStateCanceling
    && !-[NSURLSessionTask error](self, "error"))
  {
    -[NSURLSessionTask setState:](self, "setState:", 2);
    if (self && objc_getProperty(self, v5, 808, 1))
    {
      Property = objc_getProperty(self, v6, 808, 1);
      v8 = (void (**)(void *, __NSCFLocalSessionTask *, _QWORD))_Block_copy(Property);
      objc_setProperty_atomic_copy(self, v9, 0, 808);
      v8[2](v8, self, 0);
      _Block_release(v8);
    }
    else if (-[__NSCFLocalSessionTask cfConn](self, "cfConn"))
    {
      -[__NSCFURLSessionConnection cancel](-[__NSCFLocalSessionTask cfConn](self, "cfConn"), "cancel");
    }
    -[__NSCFLocalSessionTask _onqueue_didFinishWithError:](self, "_onqueue_didFinishWithError:", a3);
  }
}

- (void)_onqueue_adjustPriorityHint:(float)a3 incremental:(BOOL)a4
{
  _BOOL8 v4;
  __NSCFURLSessionConnection *v7;
  double v8;

  v4 = a4;
  if (-[__NSCFLocalSessionTask cfConn](self, "cfConn"))
  {
    v7 = -[__NSCFLocalSessionTask cfConn](self, "cfConn");
    *(float *)&v8 = a3;
    -[__NSCFURLSessionConnection setPriorityHint:incremental:](v7, "setPriorityHint:incremental:", v4, v8);
  }
}

- (void)connection:(id)a3 didReceiveData:(id)a4 completion:(id)a5
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63____NSCFLocalSessionTask_connection_didReceiveData_completion___block_invoke;
  v5[3] = &unk_1E14FE070;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = a5;
  if (self)
  {
    if (self->_connectionWorkQueue)
      -[NSOperationQueue addOperationWithBlock:](self->_connectionWorkQueue, "addOperationWithBlock:", v5);
    else
      -[__NSCFLocalSessionTask _onqueue_didReceiveDispatchData:completion:](self, "_onqueue_didReceiveDispatchData:completion:", a4, a5);
  }
}

- (void)_onqueue_didReceiveDispatchData:(id)a3 completion:(id)a4
{
  NSObject *pendingResponseBytes;

  if (-[NSURLSessionTask state](self, "state") < NSURLSessionTaskStateCanceling)
  {
    -[NSURLSessionTask setCountOfBytesReceived:](self, "setCountOfBytesReceived:", -[NSURLSessionTask countOfBytesReceived](self, "countOfBytesReceived")+ dispatch_data_get_size((dispatch_data_t)a3));
    if (!self || !self->_pendingResponseDisposition)
    {
      -[__NSCFLocalSessionTask _task_onqueue_didReceiveDispatchData:completionHandler:](self, "_task_onqueue_didReceiveDispatchData:completionHandler:", a3, a4);
      return;
    }
    pendingResponseBytes = self->_pendingResponseBytes;
    if (pendingResponseBytes)
    {
      self->_pendingResponseBytes = (OS_dispatch_data *)dispatch_data_create_concat((dispatch_data_t)self->_pendingResponseBytes, (dispatch_data_t)a3);
      dispatch_release(pendingResponseBytes);
    }
    else
    {
      dispatch_retain((dispatch_object_t)a3);
      self->_pendingResponseBytes = (OS_dispatch_data *)a3;
    }
  }
  (*((void (**)(id))a4 + 2))(a4);
}

- (void)_task_onqueue_didReceiveDispatchData:(id)a3 completionHandler:(id)a4
{
  __NSCFLocalSessionTask *v6;
  NSObject *dataTaskData;
  __NSCFLocalSessionTask *v8;

  if (!self)
  {
    v8 = 0;
LABEL_8:
    -[__NSCFURLSessionDelegateWrapper dataTask:didReceiveData:completionHandler:]((uint64_t)self, v8, a3, a4);
    return;
  }
  v6 = self;
  if (!objc_getProperty(self, a2, 784, 1))
  {
    self = (__NSCFLocalSessionTask *)v6->super._internalDelegateWrapper;
    if (!self)
      self = (__NSCFLocalSessionTask *)v6->super._publicDelegateWrapper;
    v8 = v6;
    goto LABEL_8;
  }
  dataTaskData = v6->_dataTaskData;
  if (dataTaskData)
  {
    v6->_dataTaskData = (OS_dispatch_data *)dispatch_data_create_concat((dispatch_data_t)v6->_dataTaskData, (dispatch_data_t)a3);
    dispatch_release(dataTaskData);
  }
  else
  {
    if (a3)
      dispatch_retain((dispatch_object_t)a3);
    v6->_dataTaskData = (OS_dispatch_data *)a3;
  }
  (*((void (**)(id))a4 + 2))(a4);
}

- (void)connection:(id)a3 didFinishLoadingWithError:(id)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63____NSCFLocalSessionTask_connection_didFinishLoadingWithError___block_invoke;
  v4[3] = &unk_1E14FDE88;
  v4[4] = self;
  v4[5] = a4;
  if (self)
  {
    if (self->_connectionWorkQueue)
      -[NSOperationQueue addOperationWithBlock:](self->_connectionWorkQueue, "addOperationWithBlock:", v4);
    else
      -[__NSCFLocalSessionTask _onqueue_didFinishWithError:](self, "_onqueue_didFinishWithError:", a4);
  }
}

- (void)connectionWillFinishLoading:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54____NSCFLocalSessionTask_connectionWillFinishLoading___block_invoke;
  v3[3] = &unk_1E14FE118;
  v3[4] = self;
  if (self)
  {
    if (self->_connectionWorkQueue)
      -[NSOperationQueue addOperationWithBlock:](self->_connectionWorkQueue, "addOperationWithBlock:", v3);
    else
      -[NSURLSessionTask _releasePreventIdleSleepAssertionIfAppropriate](self, "_releasePreventIdleSleepAssertionIfAppropriate", a3);
  }
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4 completion:(id)a5
{
  uint64_t v8;
  NSOperationQueue *connectionWorkQueue;
  uint64_t v10;
  NSOperationQueue *v11;
  NSURLSession *v12;
  OS_dispatch_queue *workQueue;
  _QWORD v14[7];
  _QWORD v15[6];

  if (!self->_didCheckMixedReplace)
  {
    self->_didCheckMixedReplace = 1;
    v10 = *(_QWORD *)(objc_msgSend(a4, "_inner", a3) + 88);
    if (v10)
    {
      if ((*(_WORD *)(v10 + 297) & 0x8000) != 0)
      {
        v11 = (NSOperationQueue *)objc_opt_new();
        self->_connectionWorkQueue = v11;
        -[NSOperationQueue setMaxConcurrentOperationCount:](v11, "setMaxConcurrentOperationCount:", 1);
        v12 = -[NSURLSessionTask session](self, "session");
        if (v12)
          workQueue = v12->_workQueue;
        else
          workQueue = 0;
        -[NSOperationQueue setUnderlyingQueue:](self->_connectionWorkQueue, "setUnderlyingQueue:", workQueue);
      }
    }
  }
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67____NSCFLocalSessionTask_connection_didReceiveResponse_completion___block_invoke;
  v14[3] = &unk_1E14FE070;
  v14[4] = self;
  v14[5] = a4;
  v14[6] = a5;
  connectionWorkQueue = self->_connectionWorkQueue;
  if (connectionWorkQueue)
  {
    -[NSOperationQueue addOperationWithBlock:](connectionWorkQueue, "addOperationWithBlock:", v14);
  }
  else
  {
    -[__NSCFLocalSessionTask _onqueue_suspendWorkQueue]((uint64_t)self);
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __67____NSCFLocalSessionTask_connection_didReceiveResponse_completion___block_invoke_2;
    v15[3] = &unk_1E14FE190;
    v15[4] = self;
    v15[5] = a5;
    -[__NSCFLocalSessionTask _onqueue_didReceiveResponse:completion:](self, "_onqueue_didReceiveResponse:completion:", a4, v15);
  }
}

- (void)connection:(id)a3 willCacheResponse:(id)a4 responseCallback:(id)a5
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72____NSCFLocalSessionTask_connection_willCacheResponse_responseCallback___block_invoke;
  v5[3] = &unk_1E14FE070;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = a5;
  if (self)
  {
    if (self->_connectionWorkQueue)
      -[NSOperationQueue addOperationWithBlock:](self->_connectionWorkQueue, "addOperationWithBlock:", v5);
    else
      -[__NSCFLocalSessionTask _onqueue_willCacheResponse:withCompletion:](self, "_onqueue_willCacheResponse:withCompletion:", a4, a5);
  }
}

- (void)_onqueue_willCacheResponse:(id)a3 withCompletion:(id)a4
{
  __NSCFLocalSessionTask *v6;
  __NSCFLocalSessionTask *v7;

  if (self)
  {
    v6 = self;
    if (objc_getProperty(self, a2, 784, 1))
    {
      (*((void (**)(id, id))a4 + 2))(a4, a3);
      return;
    }
    self = (__NSCFLocalSessionTask *)v6->super._internalDelegateWrapper;
    if (!self)
      self = (__NSCFLocalSessionTask *)v6->super._publicDelegateWrapper;
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  -[__NSCFURLSessionDelegateWrapper dataTask:willCacheResponse:completionHandler:]((uint64_t)self, v7, a3, a4);
}

- (void)connection:(id)a3 challenged:(id)a4 authCallback:(id)a5
{
  NSOperationQueue *connectionWorkQueue;
  _QWORD v7[7];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61____NSCFLocalSessionTask_connection_challenged_authCallback___block_invoke;
  v7[3] = &unk_1E14FE070;
  v7[4] = self;
  v7[5] = a4;
  v7[6] = a5;
  if (self)
  {
    connectionWorkQueue = self->_connectionWorkQueue;
    if (connectionWorkQueue)
      -[NSOperationQueue addOperationWithBlock:](connectionWorkQueue, "addOperationWithBlock:", v7);
    else
      -[__NSCFLocalSessionTask _onqueue_didReceiveChallenge:request:withCompletion:](self, "_onqueue_didReceiveChallenge:request:withCompletion:", a4, -[NSURLSessionTask currentRequest](self, "currentRequest", a3), a5);
  }
}

- (void)_onqueue_didReceiveChallenge:(id)a3 request:(id)a4 withCompletion:(id)a5
{
  const char *v8;
  __NSCFURLSessionDelegateWrapper *internalDelegateWrapper;
  __NSCFURLSessionDelegateWrapper *publicDelegateWrapper;
  __NSCFURLSessionDelegateWrapper *v11;
  char v12;

  if (isSessionChallenge((NSURLAuthenticationChallenge *)a3))
  {
    if (self)
    {
      internalDelegateWrapper = self->super._internalDelegateWrapper;
      if (!internalDelegateWrapper)
        internalDelegateWrapper = self->super._publicDelegateWrapper;
      if ((-[__NSCFURLSessionDelegateWrapper sessionDidReceiveChallenge]((uint64_t)internalDelegateWrapper, v8) & 1) != 0)
      {
        publicDelegateWrapper = self->super._internalDelegateWrapper;
        if (!publicDelegateWrapper)
          publicDelegateWrapper = self->super._publicDelegateWrapper;
        goto LABEL_8;
      }
      goto LABEL_10;
    }
    v12 = -[__NSCFURLSessionDelegateWrapper sessionDidReceiveChallenge](0, v8);
    publicDelegateWrapper = 0;
    v11 = 0;
    if ((v12 & 1) != 0)
    {
LABEL_8:
      -[__NSCFURLSessionDelegateWrapper didReceiveChallenge:completionHandler:]((uint64_t)publicDelegateWrapper, a3, a5);
      return;
    }
  }
  else
  {
    if (self)
    {
LABEL_10:
      v11 = self->super._internalDelegateWrapper;
      if (!v11)
        v11 = self->super._publicDelegateWrapper;
      goto LABEL_12;
    }
    v11 = 0;
  }
LABEL_12:
  -[__NSCFURLSessionDelegateWrapper task:didReceiveChallenge:completionHandler:]((uint64_t)v11, self, a3, a5);
}

- (void)connection:(id)a3 sentBodyBytes:(id)a4 totalBytes:(id)a5 expectedBytes:(id)a6
{
  NSOperationQueue *connectionWorkQueue;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(id *);
  void *v11;
  __NSCFLocalSessionTask *v12;
  id v13;
  id v14;
  id v15;

  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __76____NSCFLocalSessionTask_connection_sentBodyBytes_totalBytes_expectedBytes___block_invoke;
  v11 = &unk_1E14FBED8;
  v12 = self;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (self)
  {
    connectionWorkQueue = self->_connectionWorkQueue;
    if (connectionWorkQueue)
      -[NSOperationQueue addOperationWithBlock:](connectionWorkQueue, "addOperationWithBlock:", &v8);
    else
      -[__NSCFLocalSessionTask _onqueue_didSendBodyBytes:totalBytesSent:totalBytesExpectedToSend:](self, "_onqueue_didSendBodyBytes:totalBytesSent:totalBytesExpectedToSend:", objc_msgSend(a4, "longLongValue", a3, v8, v9, v10, v11, v12, v13, v14, v15), objc_msgSend(a5, "longLongValue"), objc_msgSend(a6, "longLongValue"));
  }
}

- (void)_onqueue_didSendBodyBytes:(int64_t)a3 totalBytesSent:(int64_t)a4 totalBytesExpectedToSend:(int64_t)a5
{
  __NSCFURLSessionDelegateWrapper *internalDelegateWrapper;

  -[NSURLSessionTask setCountOfBytesSent:](self, "setCountOfBytesSent:", a4);
  -[NSURLSessionTask setCountOfBytesExpectedToSend:](self, "setCountOfBytesExpectedToSend:", a5);
  if (self)
  {
    internalDelegateWrapper = self->super._internalDelegateWrapper;
    if (!internalDelegateWrapper)
      internalDelegateWrapper = self->super._publicDelegateWrapper;
  }
  else
  {
    internalDelegateWrapper = 0;
  }
  -[__NSCFURLSessionDelegateWrapper task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:]((uint64_t)internalDelegateWrapper, self, a3, a4, a5);
}

- (void)connection:(id)a3 wasRedirected:(id)a4 newRequest:(id)a5 responseCallback:(id)a6
{
  _QWORD v6[8];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79____NSCFLocalSessionTask_connection_wasRedirected_newRequest_responseCallback___block_invoke;
  v6[3] = &unk_1E14FCA28;
  v6[4] = self;
  v6[5] = a4;
  v6[6] = a5;
  v6[7] = a6;
  if (self)
  {
    if (self->_connectionWorkQueue)
      -[NSOperationQueue addOperationWithBlock:](self->_connectionWorkQueue, "addOperationWithBlock:", v6);
    else
      -[__NSCFLocalSessionTask _onqueue_didReceiveResponse:redirectRequest:withCompletion:](self, "_onqueue_didReceiveResponse:redirectRequest:withCompletion:", a4, a5, a6);
  }
}

- (void)_onqueue_didReceiveResponse:(id)a3 redirectRequest:(id)a4 withCompletion:(id)a5
{
  __NSCFLocalSessionTask **v5;
  _QWORD v6[6];

  v5 = (__NSCFLocalSessionTask **)self;
  if (self)
  {
    self = (__NSCFLocalSessionTask *)self->super._internalDelegateWrapper;
    if (!self)
      self = v5[87];
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85____NSCFLocalSessionTask__onqueue_didReceiveResponse_redirectRequest_withCompletion___block_invoke;
  v6[3] = &unk_1E14F8860;
  v6[4] = v5;
  v6[5] = a5;
  -[__NSCFURLSessionDelegateWrapper task:willPerformHTTPRedirection:newRequest:completionHandler:]((uint64_t)self, v5, a3, a4, v6);
}

- (void)connection:(id)a3 _willSendRequestForEstablishedConnection:(id)a4 completion:(id)a5
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __89____NSCFLocalSessionTask_connection__willSendRequestForEstablishedConnection_completion___block_invoke;
  v5[3] = &unk_1E14FE070;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = a5;
  if (self)
  {
    if (self->_connectionWorkQueue)
      -[NSOperationQueue addOperationWithBlock:](self->_connectionWorkQueue, "addOperationWithBlock:", v5);
    else
      -[__NSCFLocalSessionTask _onqueue_willSendRequestForEstablishedConnection:withCompletion:](self, "_onqueue_willSendRequestForEstablishedConnection:withCompletion:", a4, a5);
  }
}

- (void)_onqueue_willSendRequestForEstablishedConnection:(id)a3 withCompletion:(id)a4
{
  NSObject *startTimeoutTimer;
  const char *v8;
  double v9;
  double v10;
  OS_dispatch_queue *v11;
  OS_dispatch_source *v12;
  __NSCFURLSessionDelegateWrapper *internalDelegateWrapper;
  NSURLSession *v14;
  NSObject *workQueue;
  uint64_t v16;
  OS_dispatch_source *v17;
  NSObject *willSendRequestTimer;
  dispatch_time_t v19;
  __NSCFURLSessionDelegateWrapper *publicDelegateWrapper;
  _QWORD v21[5];
  _QWORD handler[6];
  _QWORD v23[7];
  _QWORD v24[5];
  void *v25;

  startTimeoutTimer = self->_startTimeoutTimer;
  if (startTimeoutTimer)
  {
    self->_startTimeoutTimer = 0;
    dispatch_source_cancel(startTimeoutTimer);
    dispatch_release(startTimeoutTimer);
  }
  -[NSURLRequest _payloadTransmissionTimeout](-[NSURLSessionTask currentRequest](self, "currentRequest"), "_payloadTransmissionTimeout");
  if (v9 > 0.0 && !self->_payloadTransmissionTimer)
  {
    v10 = v9;
    v11 = -[NSURLSessionTask workQueue](self, "workQueue");
    v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v11);
    self->_payloadTransmissionTimer = v12;
    -[__NSCFLocalSessionTask _onqueue_startTimer:withTimeoutInNanos:streamErrorCode:](self, v12, (uint64_t)(v10 * 1000000000.0), -2107);
  }
  internalDelegateWrapper = self->super._internalDelegateWrapper;
  if (!internalDelegateWrapper)
    internalDelegateWrapper = self->super._publicDelegateWrapper;
  if (-[__NSCFURLSessionDelegateWrapper _willSendRequestForEstablishedConnection]((uint64_t)internalDelegateWrapper, v8))
  {
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3052000000;
    v24[3] = __Block_byref_object_copy__461;
    v24[4] = __Block_byref_object_dispose__462;
    v25 = 0;
    v25 = _Block_copy(a4);
    v14 = -[NSURLSessionTask session](self, "session");
    if (v14)
      workQueue = v14->_workQueue;
    else
      workQueue = 0;
    v16 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __90____NSCFLocalSessionTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke;
    v23[3] = &unk_1E14F6950;
    v23[4] = workQueue;
    v23[5] = self;
    v23[6] = v24;
    if (!self->_willSendRequestTimer)
    {
      v17 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, workQueue);
      self->_willSendRequestTimer = v17;
      handler[0] = v16;
      handler[1] = 3221225472;
      handler[2] = __90____NSCFLocalSessionTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke_2;
      handler[3] = &unk_1E14FDF00;
      handler[4] = self;
      handler[5] = v23;
      dispatch_source_set_event_handler((dispatch_source_t)v17, handler);
      willSendRequestTimer = self->_willSendRequestTimer;
      v19 = dispatch_time(0, 180000000000);
      dispatch_source_set_timer(willSendRequestTimer, v19, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      dispatch_resume((dispatch_object_t)self->_willSendRequestTimer);
    }
    publicDelegateWrapper = self->super._internalDelegateWrapper;
    if (!publicDelegateWrapper)
      publicDelegateWrapper = self->super._publicDelegateWrapper;
    v21[0] = v16;
    v21[1] = 3221225472;
    v21[2] = __90____NSCFLocalSessionTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke_102;
    v21[3] = &unk_1E14F9A58;
    v21[4] = v23;
    -[__NSCFURLSessionDelegateWrapper task:_willSendRequestForEstablishedConnection:completionHandler:]((uint64_t)publicDelegateWrapper, self, a3, v21);
    _Block_object_dispose(v24, 8);
  }
  else
  {
    (*((void (**)(id, id))a4 + 2))(a4, a3);
  }
}

- (__NSCFLocalSessionTask)initWithOriginalRequest:(id)a3 ident:(unint64_t)a4 taskGroup:(id)a5
{
  __NSCFLocalSessionTask *v6;
  __NSCFLocalSessionTask *v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)__NSCFLocalSessionTask;
  v6 = -[NSURLSessionTask initWithOriginalRequest:ident:taskGroup:](&v10, sel_initWithOriginalRequest_ident_taskGroup_, a3, a4, a5);
  v7 = v6;
  if (v6)
  {
    v6->_connKeyLock._os_unfair_lock_opaque = 0;
    v6->_suspendCount = 1;
    objc_msgSend((id)objc_msgSend(a3, "_startTimeoutDate"), "timeIntervalSinceReferenceDate");
    v7->_startTimeoutTime = v8;
    -[NSURLSessionTask setState:](v7, "setState:", 1);
  }
  return v7;
}

- (void)_onqueue_resume
{
  unint64_t v3;
  SEL v4;

  if (self)
  {
    v3 = self->_suspendCount - 1;
    self->_suspendCount = v3;
    if (!v3)
    {
      -[NSURLSessionTask setState:](self, "setState:", 0);
      if (objc_getProperty(self, v4, 808, 1))
      {
        -[__NSCFLocalSessionTask _onqueue_completeInitialization](self, "_onqueue_completeInitialization");
      }
      else if (-[__NSCFLocalSessionTask cfConn](self, "cfConn"))
      {
        -[__NSCFURLSessionConnection resume](-[__NSCFLocalSessionTask cfConn](self, "cfConn"), "resume");
      }
    }
  }
}

- (void)_onSessionQueue_disavow
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x186DB8C8C](self, a2);
  -[__NSCFLocalSessionTask cfConn](self, "cfConn");
  -[__NSCFLocalSessionTask setConnection:](self, 0);
  v4 = -[__NSCFLocalSessionTask localSession](self);
  -[__NSURLSessionLocal task:terminatedConnection:]((uint64_t)v4, (uint64_t)self);
  objc_autoreleasePoolPop(v3);
}

- (void)_onqueue_adjustPoolPriority
{
  if (-[__NSCFLocalSessionTask cfConn](self, "cfConn"))
    -[__NSCFURLSessionConnection setPoolPriority:](-[__NSCFLocalSessionTask cfConn](self, "cfConn"), "setPoolPriority:", -[NSURLSessionTask computeAdjustedPoolPriority](self, "computeAdjustedPoolPriority"));
}

- (__NSCFURLSessionConnection)cfConn
{
  return (__NSCFURLSessionConnection *)objc_getProperty(self, a2, 760, 1);
}

- (void)_onqueue_setupNextEffectiveConfigurationWithCompletionHandler:(id)a3
{
  NSURLSessionConfiguration *v5;
  __NSCFURLSessionDelegateWrapper *internalDelegateWrapper;
  _QWORD v7[7];

  v5 = -[NSURLSessionTask _effectiveConfiguration](self, "_effectiveConfiguration");
  if (self)
  {
    internalDelegateWrapper = self->super._internalDelegateWrapper;
    if (!internalDelegateWrapper)
      internalDelegateWrapper = self->super._publicDelegateWrapper;
  }
  else
  {
    internalDelegateWrapper = 0;
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88____NSCFLocalSessionTask__onqueue_setupNextEffectiveConfigurationWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E14F6928;
  v7[4] = self;
  v7[5] = v5;
  v7[6] = a3;
  -[__NSCFURLSessionDelegateWrapper task:_willUseEffectiveConfiguration:completionHandler:]((uint64_t)internalDelegateWrapper, self, v5, v7);
}

- (void)setConnection:(_QWORD *)a1
{
  double v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;

  if (a1)
  {
    objc_msgSend(a1, "setCfConn:", a2);
    if (a2)
    {
      objc_msgSend(a1, "_timeoutIntervalForResource");
      -[__NSCFLocalSessionTask _onqueue_startResourceTimer:]((uint64_t)a1, v4);
      -[__NSCFLocalSessionTask _onqueue_startStartTimer]((uint64_t)a1);
    }
    else
    {
      v5 = a1[102];
      if (v5)
      {
        a1[102] = 0;
        dispatch_source_cancel(v5);
        dispatch_release(v5);
      }
      v6 = a1[106];
      if (v6)
      {
        a1[106] = 0;
        dispatch_source_cancel(v6);
        dispatch_release(v6);
      }
      v7 = a1[107];
      if (v7)
      {
        a1[107] = 0;
        dispatch_source_cancel(v7);
        dispatch_release(v7);
      }
      v8 = a1[108];
      if (v8)
      {
        a1[108] = 0;
        dispatch_source_cancel(v8);
        dispatch_release(v8);
      }
    }
  }
}

- (void)setCfConn:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 760);
}

- (void)_onqueue_startStartTimer
{
  double v2;
  double v3;
  double v4;
  int64_t v5;
  NSObject *v6;
  NSObject *v7;

  if (a1)
  {
    if (*(double *)(a1 + 840) > 0.0)
    {
      objc_msgSend((id)a1, "startTime");
      if (v2 != 0.0 && !*(_QWORD *)(a1 + 848))
      {
        v3 = *(double *)(a1 + 840);
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        v5 = (uint64_t)((v3 - v4) * 1000000000.0);
        if (v5 < 1)
        {
          objc_msgSend((id)a1, "_onqueue_cancel_with_error:", -[__NSCFLocalSessionTask timeoutErrorWithStreamErrorCode:]((void *)a1, 4294965191));
        }
        else
        {
          v6 = objc_msgSend((id)a1, "workQueue");
          v7 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v6);
          *(_QWORD *)(a1 + 848) = v7;
          -[__NSCFLocalSessionTask _onqueue_startTimer:withTimeoutInNanos:streamErrorCode:]((void *)a1, v7, v5, -2105);
        }
      }
    }
  }
}

- (void)_onqueue_startTimer:(int64_t)a3 withTimeoutInNanos:(int)a4 streamErrorCode:
{
  id v8;
  uint64_t v9;
  dispatch_block_t v10;
  dispatch_time_t v11;
  _QWORD handler[5];
  _QWORD block[5];
  int v14;

  v8 = a1;
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81____NSCFLocalSessionTask__onqueue_startTimer_withTimeoutInNanos_streamErrorCode___block_invoke;
  block[3] = &unk_1E14FDF30;
  block[4] = a1;
  v14 = a4;
  v10 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_source_set_event_handler(a2, v10);
  _Block_release(v10);
  handler[0] = v9;
  handler[1] = 3221225472;
  handler[2] = __81____NSCFLocalSessionTask__onqueue_startTimer_withTimeoutInNanos_streamErrorCode___block_invoke_2;
  handler[3] = &unk_1E14FE118;
  handler[4] = a1;
  dispatch_source_set_cancel_handler(a2, handler);
  v11 = dispatch_time(0x8000000000000000, a3);
  dispatch_source_set_timer(a2, v11, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_resume(a2);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 111) = 0;
  *((_QWORD *)self + 112) = 0;
  return self;
}

- (void).cxx_destruct
{
  std::shared_ptr<HTTPResponseMessage>::~shared_ptr[abi:nn180100]((uint64_t)&self->_connectionForUpgrade);
}

- (void)startResourceTimer
{
  NSURLSession *v3;
  _QWORD block[5];

  v3 = -[NSURLSessionTask session](self, "session");
  if (v3)
    v3 = (NSURLSession *)v3->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44____NSCFLocalSessionTask_startResourceTimer__block_invoke;
  block[3] = &unk_1E14FE118;
  block[4] = self;
  dispatch_async(&v3->super, block);
}

- (void)set_timeoutIntervalForResource:(double)a3
{
  double v5;
  NSURLSession *v6;
  NSURLSession *v7;
  _QWORD v8[6];
  objc_super v9;

  -[NSURLSessionTask _timeoutIntervalForResource](self, "_timeoutIntervalForResource");
  if (v5 != a3)
  {
    v9.receiver = self;
    v9.super_class = (Class)__NSCFLocalSessionTask;
    -[NSURLSessionTask set_timeoutIntervalForResource:](&v9, sel_set_timeoutIntervalForResource_, a3);
    if (-[NSURLSessionTask session](self, "session"))
    {
      v6 = -[NSURLSessionTask session](self, "session");
      if (v6)
      {
        if (v6->_workQueue)
        {
          v7 = -[NSURLSessionTask session](self, "session");
          if (v7)
            v7 = (NSURLSession *)v7->_workQueue;
          v8[0] = MEMORY[0x1E0C809B0];
          v8[1] = 3221225472;
          v8[2] = __57____NSCFLocalSessionTask_set_timeoutIntervalForResource___block_invoke;
          v8[3] = &unk_1E14FE140;
          v8[4] = self;
          *(double *)&v8[5] = a3;
          dispatch_async(&v7->super, v8);
        }
      }
    }
  }
}

- (void)set_TLSMinimumSupportedProtocolVersion:(unsigned __int16)a3
{
  OS_dispatch_queue *v5;
  _QWORD v6[5];
  unsigned __int16 v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)__NSCFLocalSessionTask;
  -[NSURLSessionTask set_TLSMinimumSupportedProtocolVersion:](&v8, sel_set_TLSMinimumSupportedProtocolVersion_);
  if (-[NSURLSessionTask session](self, "session"))
  {
    v5 = -[NSURLSessionTask workQueue](self, "workQueue");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __65____NSCFLocalSessionTask_set_TLSMinimumSupportedProtocolVersion___block_invoke;
    v6[3] = &unk_1E14FE168;
    v6[4] = self;
    v7 = a3;
    dispatch_async((dispatch_queue_t)v5, v6);
  }
}

- (void)set_TLSMaximumSupportedProtocolVersion:(unsigned __int16)a3
{
  OS_dispatch_queue *v5;
  _QWORD v6[5];
  unsigned __int16 v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)__NSCFLocalSessionTask;
  -[NSURLSessionTask set_TLSMaximumSupportedProtocolVersion:](&v8, sel_set_TLSMaximumSupportedProtocolVersion_);
  if (-[NSURLSessionTask session](self, "session"))
  {
    v5 = -[NSURLSessionTask workQueue](self, "workQueue");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __65____NSCFLocalSessionTask_set_TLSMaximumSupportedProtocolVersion___block_invoke;
    v6[3] = &unk_1E14FE168;
    v6[4] = self;
    v7 = a3;
    dispatch_async((dispatch_queue_t)v5, v6);
  }
}

- (uint64_t)_finishBecomeDownload:(uint64_t)result
{
  _BYTE *v3;

  if (result)
  {
    v3 = (_BYTE *)result;
    result = objc_msgSend(a2, "_onqueue_resume");
    if ((v3[925] & 1) != 0)
    {
      v3[925] = 0;
      objc_msgSend(a2, "setError:", objc_msgSend(v3, "error"));
      return objc_msgSend(a2, "_task_onqueue_didFinish");
    }
  }
  return result;
}

- (__NSCFLocalSessionTask)initWithBackgroundTaskInfo:(id)a3 taskGroup:(id)a4
{
  __NSCFLocalSessionTask *v5;
  __NSCFLocalSessionTask *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)__NSCFLocalSessionTask;
  v5 = -[NSURLSessionTask initWithOriginalRequest:ident:taskGroup:](&v9, sel_initWithOriginalRequest_ident_taskGroup_, objc_msgSend(a3, "originalRequest"), objc_msgSend(a3, "identifier"), a4);
  v6 = v5;
  if (v5)
  {
    v5->_connKeyLock._os_unfair_lock_opaque = 0;
    -[NSURLSessionTask updateCurrentRequest:](v5, "updateCurrentRequest:", objc_msgSend(a3, "currentRequest"));
    -[NSURLSessionTask setResponse:](v6, "setResponse:", objc_msgSend(a3, "response"));
    -[NSURLSessionTask setState:](v6, "setState:", objc_msgSend(a3, "state"));
    -[NSURLSessionTask setError:](v6, "setError:", objc_msgSend(a3, "error"));
    -[NSURLSessionTask setTaskIdentifier:](v6, "setTaskIdentifier:", objc_msgSend(a3, "identifier"));
    -[NSURLSessionTask setTaskDescription:](v6, "setTaskDescription:", objc_msgSend(a3, "taskDescription"));
    -[NSURLSessionTask setEarliestBeginDate:](v6, "setEarliestBeginDate:", objc_msgSend(a3, "earliestBeginDate"));
    -[NSURLSessionTask setCountOfBytesClientExpectsToSend:](v6, "setCountOfBytesClientExpectsToSend:", objc_msgSend(a3, "countOfBytesClientExpectsToSend"));
    -[NSURLSessionTask setCountOfBytesClientExpectsToReceive:](v6, "setCountOfBytesClientExpectsToReceive:", objc_msgSend(a3, "countOfBytesClientExpectsToReceive"));
    -[NSURLSessionTask set_uniqueIdentifier:](v6, "set_uniqueIdentifier:", objc_msgSend(a3, "uniqueIdentifier"));
    -[NSURLSessionTask set_storagePartitionIdentifier:](v6, "set_storagePartitionIdentifier:", objc_msgSend(a3, "storagePartitionIdentifier"));
    -[NSURLSessionTask set_pathToDownloadTaskFile:](v6, "set_pathToDownloadTaskFile:", objc_msgSend(a3, "pathToDownloadTaskFile"));
    if (objc_msgSend(a3, "taskKind") == 1)
    {
      v7 = +[__NSCFResumableUploadState rusWithResumeData:originalRequest:](__NSCFResumableUploadState, "rusWithResumeData:originalRequest:", objc_msgSend(a3, "resumableUploadData"), objc_msgSend(a3, "originalRequest"));
      if (v7)
        -[NSURLSessionTask setResumableUploadState:](v6, "setResumableUploadState:", v7);
    }
  }
  return v6;
}

- (void)_onqueue_didReceiveResponse:(id)a3 completion:(id)a4
{
  abort();
}

- (void)_onqueue_needNewBodyStream:(id)a3 withCompletion:(id)a4
{
  __NSCFLocalSessionTask **v4;

  v4 = (__NSCFLocalSessionTask **)self;
  if (self)
  {
    self = (__NSCFLocalSessionTask *)self->super._internalDelegateWrapper;
    if (!self)
      self = v4[87];
  }
  -[__NSCFURLSessionDelegateWrapper task:needNewBodyStream:]((uint64_t)self, v4, a4);
}

- (void)_onqueue_needNewBodyStream:(id)a3 fromOffset:(int64_t)a4 withCompletion:(id)a5
{
  __NSCFLocalSessionTask **v5;

  v5 = (__NSCFLocalSessionTask **)self;
  if (self)
  {
    self = (__NSCFLocalSessionTask *)self->super._internalDelegateWrapper;
    if (!self)
      self = v5[87];
  }
  -[__NSCFURLSessionDelegateWrapper task:needNewBodyStreamFromOffset:completionHandler:]((uint64_t)self, v5, a4, a5);
}

- (void)_onqueue_connectionWaitingWithReason:(int64_t)a3
{
  __NSCFURLSessionDelegateWrapper *internalDelegateWrapper;
  __NSCFURLSessionDelegateWrapper *publicDelegateWrapper;

  -[NSURLSessionTask _releasePreventIdleSleepAssertionIfAppropriate](self, "_releasePreventIdleSleepAssertionIfAppropriate");
  if (self)
  {
    internalDelegateWrapper = self->super._internalDelegateWrapper;
    if (!internalDelegateWrapper)
      internalDelegateWrapper = self->super._publicDelegateWrapper;
  }
  else
  {
    internalDelegateWrapper = 0;
  }
  -[__NSCFURLSessionDelegateWrapper task:_isWaitingForConnectionWithError:]((uint64_t)internalDelegateWrapper, self, (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NSTCPConnectionConditionsUnmetReasonErrorDomain"), a3, 0));
  if (objc_msgSend((id)-[__NSURLSessionTaskGroupForConfiguration _groupConfiguration](-[NSURLSessionTask _taskGroup](self, "_taskGroup"), "_groupConfiguration"), "waitsForConnectivity"))
  {
    if (self)
    {
      if (!self->_didIssueWaitingForConnectivity)
      {
        self->_didIssueWaitingForConnectivity = 1;
        publicDelegateWrapper = self->super._internalDelegateWrapper;
        if (!publicDelegateWrapper)
          publicDelegateWrapper = self->super._publicDelegateWrapper;
        -[__NSCFURLSessionDelegateWrapper taskIsWaitingForConnectivity:]((uint64_t)publicDelegateWrapper, self);
      }
    }
    else
    {

    }
  }
}

- (void)_onqueue_conditionalRequirementsChanged:(BOOL)a3
{
  __NSCFLocalSessionTask **v3;

  v3 = (__NSCFLocalSessionTask **)self;
  if (self)
  {
    self = (__NSCFLocalSessionTask *)self->super._internalDelegateWrapper;
    if (!self)
      self = v3[87];
  }
  -[__NSCFURLSessionDelegateWrapper task:_conditionalRequirementsChanged:]((uint64_t)self, v3, a3);
}

- (void)_onqueue_alternatePathAvailable:(int)a3
{
  __NSCFLocalSessionTask **v3;

  v3 = (__NSCFLocalSessionTask **)self;
  if (self)
  {
    self = (__NSCFLocalSessionTask *)self->super._internalDelegateWrapper;
    if (!self)
      self = v3[87];
  }
  -[__NSCFURLSessionDelegateWrapper task:_alternatePathAvailable:]((uint64_t)self, v3, *(uint64_t *)&a3);
}

- (void)_onqueue_expectedProgressTargetChanged
{
  if (-[__NSCFLocalSessionTask cfConn](self, "cfConn"))
    -[__NSCFURLSessionConnection expectedProgressTargetChanged](-[__NSCFLocalSessionTask cfConn](self, "cfConn"), "expectedProgressTargetChanged");
}

- (void)cancel_with_error:(id)a3
{
  NSURLSession *v5;
  _QWORD v6[6];

  v5 = -[NSURLSessionTask session](self, "session");
  if (v5)
    v5 = (NSURLSession *)v5->_workQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44____NSCFLocalSessionTask_cancel_with_error___block_invoke;
  v6[3] = &unk_1E14FDE88;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(&v5->super, v6);
}

- (id)resourceTimeoutError
{
  return (id)-[__NSCFLocalSessionTask timeoutErrorWithStreamErrorCode:](self, 4294965193);
}

- (void)connection:(id)a3 didReceiveInformationalResponse:(id)a4
{
  NSOperationQueue *connectionWorkQueue;
  __NSCFURLSessionDelegateWrapper *internalDelegateWrapper;
  _QWORD v7[6];

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69____NSCFLocalSessionTask_connection_didReceiveInformationalResponse___block_invoke;
  v7[3] = &unk_1E14FDE88;
  v7[4] = self;
  v7[5] = a4;
  if (self)
  {
    connectionWorkQueue = self->_connectionWorkQueue;
    if (connectionWorkQueue)
    {
      -[NSOperationQueue addOperationWithBlock:](connectionWorkQueue, "addOperationWithBlock:", v7);
    }
    else
    {
      internalDelegateWrapper = self->super._internalDelegateWrapper;
      if (!internalDelegateWrapper)
        internalDelegateWrapper = self->super._publicDelegateWrapper;
      -[__NSCFURLSessionDelegateWrapper task:didReceiveInformationalResponse:]((uint64_t)internalDelegateWrapper, self, a4);
    }
  }
}

- (void)connection:(id)a3 request:(id)a4 needsNewBodyStreamCallback:(id)a5
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72____NSCFLocalSessionTask_connection_request_needsNewBodyStreamCallback___block_invoke;
  v5[3] = &unk_1E14FE070;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = a5;
  if (self)
  {
    if (self->_connectionWorkQueue)
      -[NSOperationQueue addOperationWithBlock:](self->_connectionWorkQueue, "addOperationWithBlock:", v5);
    else
      -[__NSCFLocalSessionTask _onqueue_needNewBodyStream:withCompletion:](self, "_onqueue_needNewBodyStream:withCompletion:", a4, a5);
  }
}

- (void)connection:(id)a3 request:(id)a4 needsNewBodyStreamFromOffset:(int64_t)a5 callback:(id)a6
{
  _QWORD v6[8];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83____NSCFLocalSessionTask_connection_request_needsNewBodyStreamFromOffset_callback___block_invoke;
  v6[3] = &unk_1E14FCE60;
  v6[4] = self;
  v6[5] = a4;
  v6[6] = a6;
  v6[7] = a5;
  if (self)
  {
    if (self->_connectionWorkQueue)
      -[NSOperationQueue addOperationWithBlock:](self->_connectionWorkQueue, "addOperationWithBlock:", v6);
    else
      -[__NSCFLocalSessionTask _onqueue_needNewBodyStream:fromOffset:withCompletion:](self, "_onqueue_needNewBodyStream:fromOffset:withCompletion:", a4, a5, a6);
  }
}

- (void)connection:(id)a3 waitingWithReason:(int64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55____NSCFLocalSessionTask_connection_waitingWithReason___block_invoke;
  v4[3] = &unk_1E14FE140;
  v4[4] = self;
  v4[5] = a4;
  if (self)
  {
    if (self->_connectionWorkQueue)
      -[NSOperationQueue addOperationWithBlock:](self->_connectionWorkQueue, "addOperationWithBlock:", v4);
    else
      -[__NSCFLocalSessionTask _onqueue_connectionWaitingWithReason:](self, "_onqueue_connectionWaitingWithReason:", a4);
  }
}

- (void)connection:(id)a3 _conditionalRequirementsChanged:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69____NSCFLocalSessionTask_connection__conditionalRequirementsChanged___block_invoke;
  v4[3] = &unk_1E14FDF58;
  v4[4] = self;
  v5 = a4;
  if (self)
  {
    if (self->_connectionWorkQueue)
      -[NSOperationQueue addOperationWithBlock:](self->_connectionWorkQueue, "addOperationWithBlock:", v4);
    else
      -[__NSCFLocalSessionTask _onqueue_conditionalRequirementsChanged:](self, "_onqueue_conditionalRequirementsChanged:", a4);
  }
}

- (void)connection:(id)a3 alternatePathAvailable:(int)a4
{
  _QWORD v4[5];
  int v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60____NSCFLocalSessionTask_connection_alternatePathAvailable___block_invoke;
  v4[3] = &unk_1E14FDF30;
  v4[4] = self;
  v5 = a4;
  if (self)
  {
    if (self->_connectionWorkQueue)
      -[NSOperationQueue addOperationWithBlock:](self->_connectionWorkQueue, "addOperationWithBlock:", v4);
    else
      -[__NSCFLocalSessionTask _onqueue_alternatePathAvailable:](self, "_onqueue_alternatePathAvailable:", *(_QWORD *)&a4);
  }
}

- (void)connection:(id)a3 didReceiveSocketInputStream:(id)a4 outputStream:(id)a5
{
  NSOperationQueue *connectionWorkQueue;
  _QWORD v9[7];
  uint8_t buf[16];

  if (*(_OWORD *)&self->_socketReadStreamForUpgrade != 0
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "already have socket is and os", buf, 2u);
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78____NSCFLocalSessionTask_connection_didReceiveSocketInputStream_outputStream___block_invoke;
  v9[3] = &unk_1E14FE1E0;
  v9[4] = self;
  v9[5] = a4;
  v9[6] = a5;
  connectionWorkQueue = self->_connectionWorkQueue;
  if (connectionWorkQueue)
  {
    -[NSOperationQueue addOperationWithBlock:](connectionWorkQueue, "addOperationWithBlock:", v9);
  }
  else
  {
    self->_socketReadStreamForUpgrade = (NSInputStream *)a4;
    self->_socketWriteStreamForUpgrade = (NSOutputStream *)a5;
  }
}

- (void)connection:(id)a3 didReceiveTCPConnection:(shared_ptr<TransportConnection>)a4 extraBytes:(id)a5
{
  __shared_weak_count *cntrl;
  uint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  __NSCFLocalSessionTask *v17;
  __shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;

  cntrl = a4.__cntrl_;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3321888768;
  v15 = __72____NSCFLocalSessionTask_connection_didReceiveTCPConnection_extraBytes___block_invoke;
  v16 = &unk_1E14F3EB8;
  v6 = *(_QWORD *)a4.__ptr_;
  v7 = *((_QWORD *)a4.__ptr_ + 1);
  v17 = self;
  v19 = v6;
  v20 = (std::__shared_weak_count *)v7;
  if (v7)
  {
    v8 = (unint64_t *)(v7 + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  v18 = a4.__cntrl_;
  if (self)
  {
    if (self->_connectionWorkQueue)
    {
      -[NSOperationQueue addOperationWithBlock:](self->_connectionWorkQueue, "addOperationWithBlock:", &v13);
    }
    else
    {
      std::shared_ptr<__CFString const>::operator=[abi:nn180100](&self->_connectionForUpgrade.__ptr_, v6, v7);
      v17->_extraBytes = (OS_dispatch_data *)-[__shared_weak_count copy](cntrl, "copy", v13, v14, v15, v16);
    }
  }
  v10 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
}

- (uint64_t)_onqueue_suspendWorkQueue
{
  int v1;

  if (result && *(_QWORD *)(result + 912))
  {
    v1 = *(_DWORD *)(result + 920);
    if (v1 < 0)
      __assert_rtn("-[__NSCFLocalSessionTask _onqueue_suspendWorkQueue]", "LocalSessionTask.mm", 1314, "_connectionWorkQueueSuspensionCount >= 0");
    *(_DWORD *)(result + 920) = v1 + 1;
    if (!v1)
      return objc_msgSend(*(id *)(result + 912), "setSuspended:", 1);
  }
  return result;
}

- (uint64_t)timeoutErrorWithStreamErrorCode:(void *)a1
{
  void *v2;
  uint64_t v4;
  const CFStringRef *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v2 = a1;
  if (!a1)
    return (uint64_t)v2;
  if (objc_msgSend(a1, "_proxySettings")
    && objc_msgSend(v2, "_proxyHandshakePending")
    && !objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "currentRequest_URL"), "scheme"), "caseInsensitiveCompare:", CFSTR("https")))
  {
    v5 = &kCFErrorDomainCFNetwork;
    v4 = 310;
  }
  else
  {
    v4 = -1001;
    v5 = (const CFStringRef *)MEMORY[0x1E0CB32E8];
  }
  v2 = (void *)objc_msgSend(v2, "error:code:", *v5, v4);
  v6 = objc_msgSend(v2, "userInfo");
  if (v6)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v6);
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4), CFSTR("_kCFStreamErrorDomainKey"));
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2), CFSTR("_kCFStreamErrorCodeKey"));
    v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v7);
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4);
    v8 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, CFSTR("_kCFStreamErrorDomainKey"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2), CFSTR("_kCFStreamErrorCodeKey"), 0);
  }
  if (v8)
    return objc_msgSend(MEMORY[0x1E0CB39B8], "errorWithDomain:code:userInfo:", objc_msgSend(v2, "domain"), objc_msgSend(v2, "code"), v8);
  else
    return (uint64_t)v2;
}

- (_BYTE)_finishAllow
{
  _BYTE *v1;

  if (result)
  {
    v1 = result;
    if (result[928])
      result = (_BYTE *)objc_msgSend(result, "_onqueue_resume");
    if ((v1[925] & 1) != 0)
    {
      v1[925] = 0;
      return (_BYTE *)objc_msgSend(v1, "_task_onqueue_didFinish");
    }
  }
  return result;
}

- (uint64_t)_finishBecomeStream:(void *)a3 forConnection:(uint64_t)a4 completionHandler:
{
  _BYTE *v6;
  __int128 v7;
  uint64_t v8;

  if (result)
  {
    v6 = (_BYTE *)result;
    v8 = 0;
    v7 = xmmword_18411DB20;
    (*(void (**)(uint64_t, __int128 *))(a4 + 16))(a4, &v7);
    objc_msgSend(a2, "resume");
    result = objc_msgSend(a3, "resume");
    if ((v6[925] & 1) != 0)
    {
      v6[925] = 0;
      objc_msgSend(a2, "setError:", objc_msgSend(v6, "error"));
      return objc_msgSend(a2, "_task_onqueue_didFinish");
    }
  }
  return result;
}

@end

@implementation __NSCFBackgroundDataTask

- (id).cxx_construct
{
  *((_QWORD *)self + 98) = 0;
  *((_QWORD *)self + 99) = 0;
  return self;
}

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)__NSCFBackgroundDataTask;
  if (-[__NSCFBackgroundDataTask isKindOfClass:](&v5, sel_isKindOfClass_))
    return 1;
  else
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
}

- (__NSCFBackgroundDataTask)initWithOriginalRequest:(id)a3 ident:(unint64_t)a4 taskGroup:(id)a5
{
  __NSCFBackgroundDataTask *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)__NSCFBackgroundDataTask;
  v6 = -[__NSCFBackgroundSessionTask initWithOriginalRequest:ident:taskGroup:](&v8, sel_initWithOriginalRequest_ident_taskGroup_, a3, a4, a5);
  if (v6)
    v6->_initialStream = (NSInputStream *)(id)objc_msgSend(a3, "HTTPBodyStream");
  return v6;
}

- (void)_onqueue_willSendRequestForEstablishedConnection:(id)a3 withCompletion:(id)a4
{
  __NSCFURLSessionDelegateWrapper *internalDelegateWrapper;
  _QWORD v8[7];

  -[NSURLSessionTask setCountOfBytesReceived:](self, "setCountOfBytesReceived:", 0);
  -[NSURLSessionTask setCountOfBytesExpectedToReceive:](self, "setCountOfBytesExpectedToReceive:", 0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __92____NSCFBackgroundDataTask__onqueue_willSendRequestForEstablishedConnection_withCompletion___block_invoke;
  v8[3] = &unk_1E14FE230;
  v8[4] = a3;
  v8[5] = self;
  v8[6] = a4;
  if (self)
  {
    internalDelegateWrapper = self->super.super._internalDelegateWrapper;
    if (!internalDelegateWrapper)
      internalDelegateWrapper = self->super.super._publicDelegateWrapper;
  }
  else
  {
    internalDelegateWrapper = 0;
  }
  -[__NSCFURLSessionDelegateWrapper task:_willSendRequestForEstablishedConnection:completionHandler:]((uint64_t)internalDelegateWrapper, self, a3, v8);
}

- (void)_onqueue_didFinishWithError:(id)a3
{
  objc_super v5;

  -[__NSCFBackgroundDataTask _onqueue_finishStream:]((uint64_t)self, 1u);
  v5.receiver = self;
  v5.super_class = (Class)__NSCFBackgroundDataTask;
  -[__NSCFBackgroundSessionTask _onqueue_didFinishWithError:](&v5, sel__onqueue_didFinishWithError_, a3);
}

- (void)dealloc
{
  RequestBody *ptr;
  objc_super v4;

  ptr = self->_requestBody.__ptr_;
  if (ptr)
    (*(void (**)(RequestBody *, SEL))(*(_QWORD *)ptr + 64))(ptr, a2);

  v4.receiver = self;
  v4.super_class = (Class)__NSCFBackgroundDataTask;
  -[__NSCFBackgroundSessionTask dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  std::shared_ptr<HTTPResponseMessage>::~shared_ptr[abi:nn180100]((uint64_t)&self->_requestBody);
}

- (void)_onqueue_finishStream:(uint64_t)a1
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  const char *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  _BYTE v21[22];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend((id)a1, "workQueue"));
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v4 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v21 = 138412546;
    *(_QWORD *)&v21[4] = a1;
    *(_WORD *)&v21[12] = 1024;
    *(_DWORD *)&v21[14] = a2;
    _os_log_debug_impl(&dword_183ECA000, v4, OS_LOG_TYPE_DEBUG, "%@ finish reading from stream (force stop: %{BOOL}d)", v21, 0x12u);
  }
  if (*(_QWORD *)(a1 + 784))
  {
    if (!*(_QWORD *)(a1 + 824))
      goto LABEL_19;
    v5 = (void *)objc_msgSend(*(id *)(a1 + 800), "propertyForKey:", 0x1EDCFA528);
    if (!v5)
      goto LABEL_19;
    v6 = v5;
    if (!objc_msgSend(v5, "count"))
      goto LABEL_19;
    v7 = objc_msgSend((id)a1, "session");
    v8 = objc_msgSend((id)a1, "taskIdentifier");
    if (!v7)
      goto LABEL_19;
    v9 = v8;
    if (-[__NSURLBackgroundSession taskForIdentifier:]((id *)v7, v8))
    {
      objc_msgSend(*(id *)(v7 + 168), "setPropertyOnStreamWithIdentifier:propDict:propKey:withReply:", v9, v6, 0x1EDCFA528, &__block_literal_global_174);
LABEL_19:
      if (*(_BYTE *)(a1 + 841))
      {
        *(_BYTE *)(a1 + 841) = 0;
        (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 784) + 24))(*(_QWORD *)(a1 + 784));
      }
      (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 784) + 64))(*(_QWORD *)(a1 + 784));
      *(_QWORD *)v21 = 0;
      *(_QWORD *)&v21[8] = 0;
      std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100](a1 + 784, (__int128 *)v21);
      v15 = *(std::__shared_weak_count **)&v21[8];
      if (*(_QWORD *)&v21[8])
      {
        v16 = (unint64_t *)(*(_QWORD *)&v21[8] + 8);
        do
          v17 = __ldaxr(v16);
        while (__stlxr(v17 - 1, v16));
        if (!v17)
        {
          ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
          std::__shared_weak_count::__release_weak(v15);
        }
      }

      *(_QWORD *)(a1 + 800) = 0;
      goto LABEL_27;
    }
    v10 = objc_msgSend(*(id *)(v7 + 112), "_isProxySession");
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v11 = CFNLog::logger;
    v12 = os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG);
    if (v10)
    {
      if (!v12)
        goto LABEL_19;
      v13 = *(_QWORD *)(v7 + 128);
      *(_DWORD *)v21 = 138543618;
      *(_QWORD *)&v21[4] = v13;
      *(_WORD *)&v21[12] = 2048;
      *(_QWORD *)&v21[14] = v9;
      v14 = "ProxySession <%{public}@> Cannot set property on data task with identifier %lu because there is no such task";
    }
    else
    {
      if (!v12)
        goto LABEL_19;
      v20 = *(_QWORD *)(v7 + 128);
      *(_DWORD *)v21 = 138543618;
      *(_QWORD *)&v21[4] = v20;
      *(_WORD *)&v21[12] = 2048;
      *(_QWORD *)&v21[14] = v9;
      v14 = "BackgroundSession <%{public}@> Cannot set property on data task with identifier %lu because there is no such task";
    }
    _os_log_debug_impl(&dword_183ECA000, v11, OS_LOG_TYPE_DEBUG, v14, v21, 0x16u);
    goto LABEL_19;
  }
LABEL_27:
  v18 = *(void **)(a1 + 816);
  if (v18)
  {

    *(_QWORD *)(a1 + 816) = 0;
  }
  v19 = *(NSObject **)(a1 + 824);
  if (v19)
  {
    *(_QWORD *)(a1 + 824) = 0;
    dispatch_io_close(v19, a2);
    dispatch_release(v19);
  }
}

- (void)_onqueue_captureStream:(uint64_t)a1
{
  void *v4;
  id v5;
  dispatch_fd_t v6;
  NSObject *v7;
  NSObject *v8;
  std::__shared_weak_count_vtbl *v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  NSObject *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  CoreSchedulingSet *v21;
  void *v22;
  CFAllocatedReferenceCountedObject *v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  __int128 v30;
  std::__shared_weak_count_vtbl *v31;
  std::__shared_weak_count *v32;
  _QWORD cleanup_handler[5];
  CFAllocatedReferenceCountedObject *v34;
  std::__shared_weak_count *v35;

  if (a1)
  {
    -[__NSCFBackgroundDataTask _onqueue_finishStream:](a1, 1u);
    if (a2)
    {
      v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3860], "pipe");
      *(_QWORD *)(a1 + 816) = (id)objc_msgSend(v4, "fileHandleForReading");
      v5 = (id)objc_msgSend(v4, "fileHandleForWriting");
      v6 = objc_msgSend(v5, "fileDescriptor");
      v7 = objc_msgSend((id)a1, "workQueue");
      cleanup_handler[0] = MEMORY[0x1E0C809B0];
      cleanup_handler[1] = 3221225472;
      cleanup_handler[2] = __51____NSCFBackgroundDataTask__onqueue_captureStream___block_invoke;
      cleanup_handler[3] = &unk_1E14FB818;
      cleanup_handler[4] = v5;
      v8 = dispatch_io_create(0, v6, v7, cleanup_handler);
      *(_QWORD *)(a1 + 824) = v8;
      dispatch_io_set_low_water(v8, 0xFFFFFFFFFFFFFFFFLL);
      *(_QWORD *)(a1 + 800) = a2;
      v9 = (std::__shared_weak_count_vtbl *)CFRetain(a2);
      v31 = v9;
      v10 = (std::__shared_weak_count *)operator new();
      v10->__shared_owners_ = 0;
      p_shared_owners = (unint64_t *)&v10->__shared_owners_;
      v10->__vftable = (std::__shared_weak_count_vtbl *)&off_1E14F15C0;
      v10->__shared_weak_owners_ = 0;
      v10[1].__vftable = v9;
      v32 = v10;
      v12 = objc_msgSend((id)a1, "workQueue");
      v13 = operator new(0xE0uLL);
      v14 = v13;
      v13[1] = 0;
      v13[2] = 0;
      *v13 = &off_1E14F0BE8;
      v15 = (uint64_t)(v13 + 3);
      v34 = (CFAllocatedReferenceCountedObject *)v9;
      v35 = v10;
      do
        v16 = __ldxr(p_shared_owners);
      while (__stxr(v16 + 1, p_shared_owners));
      RequestBodyStream::RequestBodyStream((uint64_t)(v13 + 3), (uint64_t *)&v34, v12, 0, 0x20000, 0, 0);
      do
        v17 = __ldaxr(p_shared_owners);
      while (__stlxr(v17 - 1, p_shared_owners));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
      *(_QWORD *)&v30 = v15;
      *((_QWORD *)&v30 + 1) = v14;
      std::shared_ptr<HTTPEngine>::__enable_weak_this[abi:nn180100]<HTTPEngine,HTTPEngine,void>((uint64_t)&v30, v14 + 4, v15);
      std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100](a1 + 784, &v30);
      v18 = (std::__shared_weak_count *)*((_QWORD *)&v30 + 1);
      if (*((_QWORD *)&v30 + 1))
      {
        v19 = (unint64_t *)(*((_QWORD *)&v30 + 1) + 8);
        do
          v20 = __ldaxr(v19);
        while (__stlxr(v20 - 1, v19));
        if (!v20)
        {
          ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
          std::__shared_weak_count::__release_weak(v18);
        }
      }
      v21 = (CoreSchedulingSet *)objc_msgSend((id)a1, "workQueue");
      v23 = CoreSchedulingSet::createWithDispatchQueue(v21, v22);
      v34 = v23;
      v24 = (std::__shared_weak_count *)operator new();
      v24->__shared_owners_ = 0;
      v25 = (unint64_t *)&v24->__shared_owners_;
      v24->__vftable = (std::__shared_weak_count_vtbl *)&off_1E14F1668;
      v24->__shared_weak_owners_ = 0;
      v24[1].__vftable = (std::__shared_weak_count_vtbl *)v23;
      v35 = v24;
      (*(void (**)(_QWORD, CFAllocatedReferenceCountedObject *, _QWORD))(**(_QWORD **)(a1 + 784) + 40))(*(_QWORD *)(a1 + 784), v23, 0);
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
        std::__shared_weak_count::__release_weak(v24);
      }
      v27 = v32;
      if (v32)
      {
        v28 = (unint64_t *)&v32->__shared_owners_;
        do
          v29 = __ldaxr(v28);
        while (__stlxr(v29 - 1, v28));
        if (!v29)
        {
          ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
          std::__shared_weak_count::__release_weak(v27);
        }
      }
    }
  }
}

- (void)_onqueue_needNewBodyStream:(uint64_t)a3 withCompletion:
{
  uint64_t v4;
  _QWORD v5[6];
  char v6;

  if (a1)
  {
    v4 = a1[88];
    if (!v4)
      v4 = a1[87];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __70____NSCFBackgroundDataTask__onqueue_needNewBodyStream_withCompletion___block_invoke;
    v5[3] = &unk_1E14F9990;
    v6 = a2;
    v5[4] = a1;
    v5[5] = a3;
    -[__NSCFURLSessionDelegateWrapper task:needNewBodyStream:](v4, a1, v5);
  }
}

- (void)_onqueue_startReadingFromStream
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  NSObject *v6;
  unint64_t *v7;
  unint64_t v8;
  _QWORD v9[7];
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)objc_msgSend((id)a1, "workQueue"));
    v3 = *(_QWORD *)(a1 + 784);
    v2 = *(std::__shared_weak_count **)(a1 + 792);
    v9[5] = v3;
    v9[6] = v2;
    if (v2)
    {
      p_shared_owners = (unint64_t *)&v2->__shared_owners_;
      do
        v5 = __ldxr(p_shared_owners);
      while (__stxr(v5 + 1, p_shared_owners));
    }
    if (v3 && !*(_BYTE *)(a1 + 841))
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v6 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v11 = a1;
        _os_log_debug_impl(&dword_183ECA000, v6, OS_LOG_TYPE_DEBUG, "%@ start reading from stream", buf, 0xCu);
      }
      *(_BYTE *)(a1 + 841) = 1;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __59____NSCFBackgroundDataTask__onqueue_startReadingFromStream__block_invoke;
      v9[3] = &unk_1E14F99B8;
      v9[4] = a1;
      (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v3 + 16))(v3, v9);
    }
    if (v2)
    {
      v7 = (unint64_t *)&v2->__shared_owners_;
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 - 1, v7));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
        std::__shared_weak_count::__release_weak(v2);
      }
    }
  }
}

- (void)_onqueue_didReceiveData:(void *)a3 withCompletion:
{
  uint64_t v6;

  if (a1)
  {
    objc_msgSend(a1, "setCountOfBytesReceived:", objc_msgSend(a1, "countOfBytesReceived") + objc_msgSend(a2, "length"));
    v6 = a1[88];
    if (!v6)
      v6 = a1[87];
    -[__NSCFURLSessionDelegateWrapper dataTask:didReceiveData:completionHandler:](v6, a1, a2, a3);
  }
}

@end

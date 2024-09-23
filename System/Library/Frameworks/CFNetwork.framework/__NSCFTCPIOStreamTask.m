@implementation __NSCFTCPIOStreamTask

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)__NSCFTCPIOStreamTask;
  if (-[__NSCFTCPIOStreamTask isKindOfClass:](&v5, sel_isKindOfClass_))
    return 1;
  else
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
}

- (__NSCFTCPIOStreamTask)initWithHost:(id)a3 port:(int64_t)a4 taskGroup:(id)a5 disavow:(id)a6
{
  id v11;
  NSURLRequest *v12;
  __NSCFTCPIOStreamTask *v13;
  uint64_t v14;
  void *v15;
  char *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  __CFN_TransactionMetrics *v23;
  void *v24;
  const char *v25;
  _QWORD *v26;
  void *v27;
  const char *v28;
  CFNetworkTimer *v29;
  NSObject *v30;
  uint64_t v31;
  CFNetworkTimer *v32;
  NSObject *v33;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  __int128 location;
  objc_super v40;

  v11 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v11, "setScheme:", 0x1EDD00AE0);
  objc_msgSend(v11, "setHost:", a3);
  objc_msgSend(v11, "setPort:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4));
  v12 = -[NSURLRequest initWithURL:]([NSURLRequest alloc], "initWithURL:", objc_msgSend(v11, "URL"));
  v40.receiver = self;
  v40.super_class = (Class)__NSCFTCPIOStreamTask;
  v13 = -[NSURLSessionTask initWithOriginalRequest:ident:taskGroup:](&v40, sel_initWithOriginalRequest_ident_taskGroup_, v12, 0, a5);
  v14 = (uint64_t)v13;
  if (v13)
  {
    -[NSURLSessionTask updateCurrentRequest:](v13, "updateCurrentRequest:", v12);
    *(_QWORD *)(v14 + 760) = _Block_copy(a6);
    *(_QWORD *)(v14 + 944) = dispatch_queue_create("com.apple.CFNetwork.StreamTaskConnection", 0);
    v15 = (void *)nw_context_copy_implicit_context();
    nw_queue_context_target_dispatch_queue();
    nw_release(v15);
    v16 = (char *)operator new(0x50uLL);
    *((_QWORD *)v16 + 1) = 0;
    *((_QWORD *)v16 + 2) = 0;
    *(_QWORD *)v16 = &off_1E14F0E18;
    TransportConnectionObjCPP::TransportConnectionObjCPP((TransportConnectionObjCPP *)(v16 + 24), *(NSObject **)(v14 + 944));
    *(_QWORD *)&location = v16 + 24;
    *((_QWORD *)&location + 1) = v16;
    std::shared_ptr<HTTPEngine>::__enable_weak_this[abi:nn180100]<HTTPEngine,HTTPEngine,void>((uint64_t)&location, (_QWORD *)v16 + 4, (uint64_t)(v16 + 24));
    std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100](v14 + 784, &location);
    v17 = (std::__shared_weak_count *)*((_QWORD *)&location + 1);
    if (*((_QWORD *)&location + 1))
    {
      v18 = (unint64_t *)(*((_QWORD *)&location + 1) + 8);
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    std::allocate_shared[abi:nn180100]<TCPIO_Establish,std::allocator<TCPIO_Establish>,__NSCFTCPIOStreamTask *&,void>(&location, v14);
    std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100](v14 + 768, &location);
    v20 = (std::__shared_weak_count *)*((_QWORD *)&location + 1);
    if (*((_QWORD *)&location + 1))
    {
      v21 = (unint64_t *)(*((_QWORD *)&location + 1) + 8);
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    (*(void (**)(_QWORD, id, int64_t))(**(_QWORD **)(v14 + 768) + 16))(*(_QWORD *)(v14 + 768), a3, a4);
    v23 = objc_alloc_init(__CFN_TransactionMetrics);
    v24 = (void *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(v14 + 784) + 24) + 248))(*(_QWORD *)(*(_QWORD *)(v14 + 784) + 24));
    if (v23)
    {
      objc_setProperty_atomic(v23, v25, v24, 88);
      *(_WORD *)&v23->_scheduledOriginLoad = 257;
    }
    v26 = (_QWORD *)objc_msgSend((id)v14, "_metrics");
    if (v26)
      v26 = (_QWORD *)v26[5];
    objc_msgSend(v26, "addObject:", v23);
    v27 = (void *)objc_msgSend((id)v14, "_metrics");
    if (v27)
      objc_setProperty_atomic(v27, v28, v23, 96);

    *(_QWORD *)(v14 + 832) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    objc_msgSend((id)v14, "setState:", 1);
    *(_DWORD *)(v14 + 852) = 0;
    objc_initWeak((id *)&location, (id)v14);
    v29 = [CFNetworkTimer alloc];
    v30 = objc_msgSend((id)v14, "workQueue");
    v31 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __61____NSCFTCPIOStreamTask_initWithHost_port_taskGroup_disavow___block_invoke;
    v37[3] = &unk_1E14FCD98;
    objc_copyWeak(&v38, (id *)&location);
    *(_QWORD *)(v14 + 912) = -[CFNetworkTimer initWithQueue:completionHandler:](v29, v30, v37);
    v32 = [CFNetworkTimer alloc];
    v33 = objc_msgSend((id)v14, "workQueue");
    v35[0] = v31;
    v35[1] = 3221225472;
    v35[2] = __61____NSCFTCPIOStreamTask_initWithHost_port_taskGroup_disavow___block_invoke_2;
    v35[3] = &unk_1E14FCD98;
    objc_copyWeak(&v36, (id *)&location);
    *(_QWORD *)(v14 + 920) = -[CFNetworkTimer initWithQueue:completionHandler:](v32, v33, v35);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&v38);
    objc_destroyWeak((id *)&location);
  }
  return (__NSCFTCPIOStreamTask *)v14;
}

- (id)workQueue
{
  id result;
  objc_super v4;

  result = self->_workQueueForStreamTask;
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)__NSCFTCPIOStreamTask;
    return -[NSURLSessionTask workQueue](&v4, sel_workQueue);
  }
  return result;
}

- (__NSCFTCPIOStreamTask)initWithTask:(id)a3 connection:(shared_ptr<TransportConnection>)a4 extraBytes:(id)a5 disavow:(id)a6
{
  NSObject *cntrl;
  TransportConnection *ptr;
  __NSCFTCPIOStreamTask *v9;
  OS_dispatch_queue *v10;
  NSObject *v11;
  char *v12;
  shared_ptr<TransportConnectionObjCPP> *p_ios;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  TransportConnectionObjCPP *v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  CFNetworkTimer *v27;
  NSObject *v28;
  uint64_t v29;
  CFNetworkTimer *v30;
  NSObject *v31;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  __int128 location;
  objc_super v38;

  cntrl = a4.__cntrl_;
  ptr = a4.__ptr_;
  v38.receiver = self;
  v38.super_class = (Class)__NSCFTCPIOStreamTask;
  v9 = -[NSURLSessionTask initWithTask:](&v38, sel_initWithTask_, a3, a4.__ptr_, a4.__cntrl_, a5, a6);
  if (v9)
  {
    v10 = *(OS_dispatch_queue **)(*(_QWORD *)ptr + 120);
    if (v10)
      dispatch_retain(*(dispatch_object_t *)(*(_QWORD *)ptr + 120));
    v9->_workQueueForStreamTask = v10;
    v9->_disavow = _Block_copy(a5);
    v11 = -[__NSCFTCPIOStreamTask workQueue](v9, "workQueue");
    v12 = (char *)operator new(0x50uLL);
    *((_QWORD *)v12 + 1) = 0;
    *((_QWORD *)v12 + 2) = 0;
    *(_QWORD *)v12 = &off_1E14F0E18;
    TransportConnectionObjCPP::TransportConnectionObjCPP((TransportConnectionObjCPP *)(v12 + 24), v11);
    *(_QWORD *)&location = v12 + 24;
    *((_QWORD *)&location + 1) = v12;
    std::shared_ptr<HTTPEngine>::__enable_weak_this[abi:nn180100]<HTTPEngine,HTTPEngine,void>((uint64_t)&location, (_QWORD *)v12 + 4, (uint64_t)(v12 + 24));
    p_ios = &v9->_ios;
    std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100]((uint64_t)&v9->_ios, &location);
    v14 = (std::__shared_weak_count *)*((_QWORD *)&location + 1);
    if (*((_QWORD *)&location + 1))
    {
      v15 = (unint64_t *)(*((_QWORD *)&location + 1) + 8);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    v17 = p_ios->__ptr_;
    v18 = *(_QWORD *)ptr;
    v19 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
    if (v19)
    {
      p_shared_owners = (unint64_t *)&v19->__shared_owners_;
      do
        v21 = __ldxr(p_shared_owners);
      while (__stxr(v21 + 1, p_shared_owners));
      std::shared_ptr<__CFString const>::operator=[abi:nn180100]((_QWORD *)v17 + 3, v18, (uint64_t)v19);
      v22 = (unint64_t *)&v19->__shared_owners_;
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    else
    {
      std::shared_ptr<__CFString const>::operator=[abi:nn180100]((_QWORD *)v17 + 3, v18, 0);
    }
    if (cntrl)
    {
      *((_QWORD *)p_ios->__ptr_ + 6) = cntrl;
      dispatch_retain(cntrl);
    }
    v9->_connectionState = 2;
    -[NSURLSessionTask setState:](v9, "setState:", 0);
    std::allocate_shared[abi:nn180100]<TCPIO_Establish,std::allocator<TCPIO_Establish>,__NSCFTCPIOStreamTask *&,void>(&location, (uint64_t)v9);
    std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100]((uint64_t)&v9->_establish, &location);
    v24 = (std::__shared_weak_count *)*((_QWORD *)&location + 1);
    if (*((_QWORD *)&location + 1))
    {
      v25 = (unint64_t *)(*((_QWORD *)&location + 1) + 8);
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
        std::__shared_weak_count::__release_weak(v24);
      }
    }
    v9->_pendingWork = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    objc_initWeak((id *)&location, v9);
    v27 = [CFNetworkTimer alloc];
    v28 = -[__NSCFTCPIOStreamTask workQueue](v9, "workQueue");
    v29 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __68____NSCFTCPIOStreamTask_initWithTask_connection_extraBytes_disavow___block_invoke;
    v35[3] = &unk_1E14FCD98;
    objc_copyWeak(&v36, (id *)&location);
    v9->_writeTimer = (CFNetworkTimer *)-[CFNetworkTimer initWithQueue:completionHandler:](v27, v28, v35);
    v30 = [CFNetworkTimer alloc];
    v31 = -[__NSCFTCPIOStreamTask workQueue](v9, "workQueue");
    v33[0] = v29;
    v33[1] = 3221225472;
    v33[2] = __68____NSCFTCPIOStreamTask_initWithTask_connection_extraBytes_disavow___block_invoke_2;
    v33[3] = &unk_1E14FCD98;
    objc_copyWeak(&v34, (id *)&location);
    v9->_readTimer = (CFNetworkTimer *)-[CFNetworkTimer initWithQueue:completionHandler:](v30, v31, v33);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)&location);
  }
  return v9;
}

- (void)dealloc
{
  shared_ptr<TCPIO_EstablishBase> *p_establish;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  NSObject *workQueueForStreamTask;
  objc_super v8;
  __int128 v9;

  p_establish = &self->_establish;
  -[__NSURLSessionLocal removeUnresumedTask:]((uint64_t)-[NSURLSessionTask session](self, "session"), (uint64_t)self);
  if (p_establish->__ptr_)
  {
    (*(void (**)(TCPIO_EstablishBase *))(*(_QWORD *)p_establish->__ptr_ + 32))(p_establish->__ptr_);
    v9 = 0uLL;
    std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100]((uint64_t)p_establish, &v9);
    v4 = (std::__shared_weak_count *)*((_QWORD *)&v9 + 1);
    if (*((_QWORD *)&v9 + 1))
    {
      v5 = (unint64_t *)(*((_QWORD *)&v9 + 1) + 8);
      do
        v6 = __ldaxr(v5);
      while (__stlxr(v6 - 1, v5));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
  }
  workQueueForStreamTask = self->_workQueueForStreamTask;
  if (workQueueForStreamTask)
  {
    dispatch_release(workQueueForStreamTask);
    self->_workQueueForStreamTask = 0;
  }

  self->_pendingWork = 0;
  self->__initialDataPayload = 0;

  self->_currentWriteTask = 0;
  self->_currentReadTask = 0;
  v8.receiver = self;
  v8.super_class = (Class)__NSCFTCPIOStreamTask;
  -[NSURLSessionTask dealloc](&v8, sel_dealloc);
}

- (void)readDataOfMinLength:(unint64_t)a3 maxLength:(unint64_t)a4 timeout:(double)a5 completionHandler:(id)a6
{
  NSObject *v11;
  _QWORD block[9];

  v11 = -[__NSCFTCPIOStreamTask workQueue](self, "workQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81____NSCFTCPIOStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke;
  block[3] = &unk_1E14FCE10;
  block[4] = self;
  block[5] = a6;
  block[6] = a3;
  block[7] = a4;
  *(double *)&block[8] = a5;
  dispatch_async(v11, block);
}

- (void)writeData:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  NSObject *v9;
  _QWORD v10[8];

  v9 = -[__NSCFTCPIOStreamTask workQueue](self, "workQueue");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61____NSCFTCPIOStreamTask_writeData_timeout_completionHandler___block_invoke;
  v10[3] = &unk_1E14FCE60;
  v10[5] = a3;
  v10[6] = a5;
  v10[4] = self;
  *(double *)&v10[7] = a4;
  dispatch_async(v9, v10);
}

- (void)captureStreams
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  self->_captureStreamsUponCompletion = 1;
  if ((objc_msgSend((id)-[__NSURLSessionTaskGroupForConfiguration _groupConfiguration](-[NSURLSessionTask _taskGroup](self, "_taskGroup"), "_groupConfiguration"), "_allowTCPIOConnectionStreamTask") & 1) == 0)
  {
    if (-[NSURLSessionTask state](self, "state") == NSURLSessionTaskStateCompleted)
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v3 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_183ECA000, v3, OS_LOG_TYPE_ERROR, "[API MISUSE]: Capture streams called on a URLSessionStreamTask after task has completed", buf, 2u);
      }
    }
    else
    {
      v4 = -[__NSCFTCPIOStreamTask workQueue](self, "workQueue");
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __39____NSCFTCPIOStreamTask_captureStreams__block_invoke;
      block[3] = &unk_1E14FE118;
      block[4] = self;
      dispatch_async(v4, block);
    }
  }
}

- (void)closeWrite
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  if (-[NSURLSessionTask state](self, "state") == NSURLSessionTaskStateCompleted)
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v3 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_183ECA000, v3, OS_LOG_TYPE_ERROR, "[API MISUSE]: Attempting to closeWrite on a URLSessionStreamTask after task has completed", buf, 2u);
    }
  }
  else
  {
    v4 = -[__NSCFTCPIOStreamTask workQueue](self, "workQueue");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35____NSCFTCPIOStreamTask_closeWrite__block_invoke;
    block[3] = &unk_1E14FE118;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

- (void)closeRead
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  if (-[NSURLSessionTask state](self, "state") == NSURLSessionTaskStateCompleted)
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v3 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_183ECA000, v3, OS_LOG_TYPE_ERROR, "[API MISUSE]: Attempting to closeRead on a URLSessionStreamTask after task has completed", buf, 2u);
    }
  }
  else
  {
    v4 = -[__NSCFTCPIOStreamTask workQueue](self, "workQueue");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34____NSCFTCPIOStreamTask_closeRead__block_invoke;
    block[3] = &unk_1E14FE118;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

- (void)copyStreamProperty:(id)a3 completionHandler:(id)a4
{
  NSObject *v7;
  _QWORD block[7];

  v7 = -[__NSCFTCPIOStreamTask workQueue](self, "workQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62____NSCFTCPIOStreamTask_copyStreamProperty_completionHandler___block_invoke;
  block[3] = &unk_1E14FE070;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async(v7, block);
}

- (void)startSecureConnection
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  if (-[NSURLSessionTask state](self, "state") == NSURLSessionTaskStateCompleted)
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v3 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_183ECA000, v3, OS_LOG_TYPE_ERROR, "[API MISUSE]: Attempting to startSecureConnection on a URLSessionStreamTask after task has completed", buf, 2u);
    }
  }
  else if ((objc_msgSend((id)-[__NSURLSessionTaskGroupForConfiguration _groupConfiguration](-[NSURLSessionTask _taskGroup](self, "_taskGroup"), "_groupConfiguration"), "_allowTCPIOConnectionStreamTask") & 1) != 0|| !self->_ios.__ptr_)
  {
    self->_secure = 1;
  }
  else
  {
    v4 = -[__NSCFTCPIOStreamTask workQueue](self, "workQueue");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46____NSCFTCPIOStreamTask_startSecureConnection__block_invoke;
    block[3] = &unk_1E14FE118;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

- (void)stopSecureConnection
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  if (-[NSURLSessionTask state](self, "state") == NSURLSessionTaskStateCompleted)
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v3 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_183ECA000, v3, OS_LOG_TYPE_ERROR, "[API MISUSE]: Attempting to stopSecureConnection on a URLSessionStreamTask after task has completed", buf, 2u);
    }
  }
  else
  {
    v4 = -[__NSCFTCPIOStreamTask workQueue](self, "workQueue");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45____NSCFTCPIOStreamTask_stopSecureConnection__block_invoke;
    block[3] = &unk_1E14FE118;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

- (void)_onqueue_stopSecureConnection
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54____NSCFTCPIOStreamTask__onqueue_stopSecureConnection__block_invoke;
  v3[3] = &unk_1E14FE118;
  v3[4] = self;
  -[__NSCFTCPIOStreamTask _onqueue_addBlockOp:description:](self, "_onqueue_addBlockOp:description:", v3, "stopSecureConnection");
  -[__NSCFTCPIOStreamTask _onqueue_ioTick](self, "_onqueue_ioTick");
  self->_secure = 0;
}

- (void)_onqueue_startSecureConnection
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55____NSCFTCPIOStreamTask__onqueue_startSecureConnection__block_invoke;
  v3[3] = &unk_1E14FE118;
  v3[4] = self;
  -[__NSCFTCPIOStreamTask _onqueue_addBlockOp:description:](self, "_onqueue_addBlockOp:description:", v3, "startSecureConnection");
  -[__NSCFTCPIOStreamTask _onqueue_ioTick](self, "_onqueue_ioTick");
  self->_secure = 1;
}

- (void)_onqueue_closeRead
{
  _QWORD v3[5];
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43____NSCFTCPIOStreamTask__onqueue_closeRead__block_invoke;
  v4[3] = &unk_1E14FE118;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43____NSCFTCPIOStreamTask__onqueue_closeRead__block_invoke_3;
  v3[3] = &unk_1E14FDEB0;
  v3[4] = v4;
  -[__NSCFTCPIOStreamTask _onqueue_addBlockOp:description:](self, "_onqueue_addBlockOp:description:", v3, "closeRead");
  -[__NSCFTCPIOStreamTask _onqueue_ioTick](self, "_onqueue_ioTick");
}

- (void)_onqueue_closeWrite
{
  _QWORD v3[5];
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44____NSCFTCPIOStreamTask__onqueue_closeWrite__block_invoke;
  v4[3] = &unk_1E14FE118;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44____NSCFTCPIOStreamTask__onqueue_closeWrite__block_invoke_3;
  v3[3] = &unk_1E14FDEB0;
  v3[4] = v4;
  -[__NSCFTCPIOStreamTask _onqueue_addBlockOp:description:](self, "_onqueue_addBlockOp:description:", v3, "closeWrite");
  -[__NSCFTCPIOStreamTask _onqueue_ioTick](self, "_onqueue_ioTick");
}

- (void)_onqueue_captureStreams
{
  _QWORD v3[6];
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke;
  v4[3] = &unk_1E14FE118;
  v4[4] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48____NSCFTCPIOStreamTask__onqueue_captureStreams__block_invoke_2;
  v3[3] = &unk_1E14FDF00;
  v3[4] = self;
  v3[5] = v4;
  -[__NSCFTCPIOStreamTask _onqueue_addBlockOp:description:shouldWaitForTls:](self, "_onqueue_addBlockOp:description:shouldWaitForTls:", v3, "captureStreams", 1);
  -[__NSCFTCPIOStreamTask _onqueue_ioTick](self, "_onqueue_ioTick");
}

- (void)_onqueue_addBlockOp:(id)a3 description:(const char *)a4
{
  -[NSMutableArray addObject:](self->_pendingWork, "addObject:", +[__NSCFURLLocalStreamTaskWorkBlockOp opWithBlock:description:]((uint64_t)__NSCFURLLocalStreamTaskWorkBlockOp, a3, (uint64_t)a4));
}

- (void)_onqueue_addBlockOp:(id)a3 description:(const char *)a4 shouldWaitForTls:(BOOL)a5
{
  _QWORD *v7;

  v7 = +[__NSCFURLLocalStreamTaskWorkBlockOp opWithBlock:description:]((uint64_t)__NSCFURLLocalStreamTaskWorkBlockOp, a3, (uint64_t)a4);
  if (v7)
    *((_BYTE *)v7 + 56) = a5;
  -[NSMutableArray addObject:](self->_pendingWork, "addObject:", v7);
}

- (BOOL)shouldDoWorkConsideringTlsState
{
  return !self->_secure || self->_goneSecure;
}

- (void)_onqueue_ioTick
{
  NSObject *v3;
  NSMutableArray *pendingWork;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_doingWorkOnThisQueue)
  {
    v3 = -[__NSCFTCPIOStreamTask workQueue](self, "workQueue");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40____NSCFTCPIOStreamTask__onqueue_ioTick__block_invoke;
    block[3] = &unk_1E14FE118;
    block[4] = self;
    dispatch_async(v3, block);
    return;
  }
  if (-[NSURLSessionTask state](self, "state") != NSURLSessionTaskStateSuspended && self->_connectionState >= 2)
  {
    if (self->_doingWorkOnThisQueue)
      __assert_rtn("-[__NSCFTCPIOStreamTask _onqueue_ioTick]", "LocalTCPIOStreamTask.mm", 1916, "_doingWorkOnThisQueue == false");
    self->_doingWorkOnThisQueue = 1;
    if (-[NSURLSessionTask state](self, "state") != NSURLSessionTaskStateSuspended)
    {
      pendingWork = self->_pendingWork;
      self->_pendingWork = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pendingWork, "countByEnumeratingWithState:objects:count:", &v13, v22, 16);
      if (!v5)
        goto LABEL_31;
      v6 = v5;
      v7 = *(_QWORD *)v14;
      while (1)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(pendingWork);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          v10 = objc_opt_class();
          if (v10 == objc_opt_class())
          {
            if (!self->_writeInProgress
              && -[__NSCFTCPIOStreamTask shouldDoWorkConsideringTlsState](self, "shouldDoWorkConsideringTlsState"))
            {
              -[__NSCFTCPIOStreamTask _onqueue_processWriteWork:](self, "_onqueue_processWriteWork:", v9);
              continue;
            }
            goto LABEL_28;
          }
          if (v10 == objc_opt_class())
          {
            if (!self->_readInProgress
              && -[__NSCFTCPIOStreamTask shouldDoWorkConsideringTlsState](self, "shouldDoWorkConsideringTlsState"))
            {
              -[__NSCFTCPIOStreamTask _onqueue_processReadWork:](self, "_onqueue_processReadWork:", v9);
              continue;
            }
            goto LABEL_28;
          }
          if (v10 != objc_opt_class())
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
            {
              v11 = objc_opt_class();
              *(_DWORD *)buf = 138412546;
              v19 = v11;
              v20 = 2112;
              v21 = v9;
              _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "class %@ not  known for %@", buf, 0x16u);
            }
LABEL_28:
            -[NSMutableArray addObject:](self->_pendingWork, "addObject:", v9);
            continue;
          }
          if (!v9)
            continue;
          if (*(_BYTE *)(v9 + 56)
            && !-[__NSCFTCPIOStreamTask shouldDoWorkConsideringTlsState](self, "shouldDoWorkConsideringTlsState"))
          {
            goto LABEL_28;
          }
          v12 = *(_QWORD *)(v9 + 48);
          if (v12)
            (*(void (**)(void))(v12 + 16))();
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pendingWork, "countByEnumeratingWithState:objects:count:", &v13, v22, 16);
        if (!v6)
        {
LABEL_31:

          break;
        }
      }
    }
    self->_doingWorkOnThisQueue = 0;
  }
}

- (void)_onqueue_timeoutOccured
{
  __NSCFURLLocalStreamTaskWorkWrite *currentWriteTask;
  SEL v4;
  __NSCFURLLocalStreamTaskWorkRead *currentReadTask;
  SEL v6;

  self->_writeError.domain = 1;
  self->_writeError.error = 60;
  self->_readError.domain = 1;
  self->_readError.error = 60;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], self->_writeError.error, 0);
  currentWriteTask = self->_currentWriteTask;
  if (currentWriteTask)
  {
    (*((void (**)(void))currentWriteTask->_completion + 2))();
    self->_currentWriteTask->super._hasBeenCalledBack = 1;
    objc_setProperty_nonatomic(self, v4, 0, 928);
  }
  currentReadTask = self->_currentReadTask;
  if (currentReadTask)
  {
    (*((void (**)(void))currentReadTask->_completion + 2))();
    self->_currentReadTask->super._hasBeenCalledBack = 1;
    objc_setProperty_nonatomic(self, v6, 0, 936);
  }
  self->_writeInProgress = 0;
  self->_readInProgress = 0;
  -[CFNetworkTimer setTimer:]((uint64_t)self->_writeTimer, 0.0);
  -[CFNetworkTimer setTimer:]((uint64_t)self->_readTimer, 0.0);
}

- (void)_onqueue_callbackCompletedWork
{
  NSMutableArray *completedSuspendedWork;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  completedSuspendedWork = self->_completedSuspendedWork;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](completedSuspendedWork, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(completedSuspendedWork);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        v8 = objc_opt_class();
        if (v8 == objc_opt_class())
        {
          (*(void (**)(void))(*(_QWORD *)(v7 + 64) + 16))();
        }
        else
        {
          v9 = *(void **)(v7 + 64);
          (*(void (**)(void))(*(_QWORD *)(v7 + 56) + 16))();

        }
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](completedSuspendedWork, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  self->_completedSuspendedWork = 0;
}

- (void)_onqueue_processWriteWork:(id)a3
{
  size_t v5;
  void *v6;
  NSObject *v7;
  double v8;
  TransportConnectionObjCPP *ptr;
  _QWORD v10[6];

  if (self)
    objc_setProperty_nonatomic(self, a2, a3, 928);
  if (-[NSURLSessionTask error](self, "error")
    || -[NSURLSessionTask state](self, "state") == NSURLSessionTaskStateCompleted)
  {
    if (!*((_BYTE *)a3 + 40))
      (*(void (**)(_QWORD, NSError *))(*((_QWORD *)a3 + 8) + 16))(*((_QWORD *)a3 + 8), -[NSURLSessionTask error](self, "error"));
    goto LABEL_7;
  }
  v5 = objc_msgSend(*((id *)a3 + 6), "length");
  v6 = (void *)*((_QWORD *)a3 + 6);
  if (!v5)
  {

    (*(void (**)(_QWORD, _QWORD))(*((_QWORD *)a3 + 8) + 16))(*((_QWORD *)a3 + 8), 0);
LABEL_7:
    -[__NSCFTCPIOStreamTask _onqueue_ioTick](self, "_onqueue_ioTick");
    return;
  }
  v7 = dispatch_data_create((const void *)objc_msgSend(v6, "bytes"), v5, 0, 0);

  v8 = *((double *)a3 + 2);
  self->_writeInProgress = v8 != 0.0;
  if (!*((_BYTE *)a3 + 41))
    -[CFNetworkTimer setTimer:]((uint64_t)self->_writeTimer, v8);
  ptr = self->_ios.__ptr_;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51____NSCFTCPIOStreamTask__onqueue_processWriteWork___block_invoke;
  v10[3] = &unk_1E14F9580;
  v10[4] = self;
  v10[5] = a3;
  TransportConnectionObjCPP::write((uint64_t)ptr, (uint64_t)v7, (uint64_t)v10);
  dispatch_release(v7);
}

- (void)_onqueue_processReadWork:(id)a3
{
  double v5;
  TransportConnectionObjCPP *ptr;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[6];

  if (self)
    objc_setProperty_nonatomic(self, a2, a3, 936);
  if (-[NSURLSessionTask error](self, "error"))
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD, NSError *))(*((_QWORD *)a3 + 7) + 16))(*((_QWORD *)a3 + 7), 0, 0, -[NSURLSessionTask error](self, "error"));
    goto LABEL_8;
  }
  if (-[NSURLSessionTask state](self, "state") == NSURLSessionTaskStateCompleted || self->_receivedEof)
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t, _QWORD))(*((_QWORD *)a3 + 7) + 16))(*((_QWORD *)a3 + 7), 0, 1, 0);
    goto LABEL_8;
  }
  if (!*((_DWORD *)a3 + 11) && !*((_DWORD *)a3 + 12))
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*((_QWORD *)a3 + 7) + 16))(*((_QWORD *)a3 + 7), objc_msgSend(MEMORY[0x1E0C99D50], "data"), 0, 0);
LABEL_8:
    if (!*((_BYTE *)a3 + 40))
      -[__NSCFTCPIOStreamTask _onqueue_ioTick](self, "_onqueue_ioTick");
    return;
  }
  v5 = *((double *)a3 + 2);
  self->_readInProgress = v5 != 0.0;
  if (!*((_BYTE *)a3 + 41))
    -[CFNetworkTimer setTimer:]((uint64_t)self->_readTimer, v5);
  ptr = self->_ios.__ptr_;
  v7 = *((unsigned int *)a3 + 11);
  v8 = *((unsigned int *)a3 + 12);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50____NSCFTCPIOStreamTask__onqueue_processReadWork___block_invoke;
  v9[3] = &unk_1E14F95A8;
  v9[4] = self;
  v9[5] = a3;
  TransportConnectionObjCPP::read((uint64_t)ptr, v7, v8, (uint64_t)v9);
}

- (id)_onqueue_errorOrCancelError
{
  if (!-[NSURLSessionTask error](self, "error"))
    -[NSURLSessionTask setError:](self, "setError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -999, 0));
  return -[NSURLSessionTask error](self, "error");
}

- (BOOL)_onqueue_usingProxy
{
  BOOL result;
  NSDictionary *v4;
  __CFDictionary *v5;
  __CFDictionary *v6;
  NSURL *v7;
  const __CFArray *v8;
  const __CFArray *v9;
  const __CFDictionary *ValueAtIndex;
  const __CFString *Value;
  const __CFString *v12;

  if (__CFNUseNWHTTPSProxies::useProxyOnce != -1)
    dispatch_once(&__CFNUseNWHTTPSProxies::useProxyOnce, &__block_literal_global_11_4775);
  if (__CFNUseNWHTTPSProxies::useNWHTTPSProxy)
    return 0;
  if (-[NSURLSessionTask _proxySettings](self, "_proxySettings"))
  {
    v4 = -[NSURLSessionTask _proxySettings](self, "_proxySettings");
    if (!v4)
    {
      v6 = 0;
      goto LABEL_13;
    }
    v5 = (__CFDictionary *)CFRetain(v4);
    goto LABEL_11;
  }
  if (!__sProxyOverrideDict || (v6 = (__CFDictionary *)CFRetain((CFTypeRef)__sProxyOverrideDict)) == 0)
  {
    v5 = CFNetworkCopySystemProxySettings();
LABEL_11:
    v6 = v5;
  }
LABEL_13:
  v7 = -[NSURLRequest URL](-[NSURLSessionTask originalRequest](self, "originalRequest"), "URL");
  if (v6 && v7)
  {
    v8 = (const __CFArray *)__CFNetworkCopyProxiesForURLWithInterface((const __CFURL *)v7, v6, 0);
    v9 = v8;
    if (v8)
    {
      if (CFArrayGetCount(v8) >= 1)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v9, 0);
        if (ValueAtIndex)
        {
          Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("kCFProxyTypeKey"));
          v12 = Value;
          if (!Value)
          {
LABEL_28:
            CFRelease(v9);
            goto LABEL_29;
          }
          if (CFStringCompare(Value, CFSTR("kCFProxyTypeHTTPS"), 0) == kCFCompareEqualTo
            || CFStringCompare(v12, CFSTR("kCFProxyTypeAutoConfigurationURL"), 0) == kCFCompareEqualTo
            || CFStringCompare(v12, CFSTR("kCFProxyTypeAutoConfigurationJavaScript"), 0) == kCFCompareEqualTo
            || CFStringCompare(v12, CFSTR("kCFProxyTypeSOCKS"), 0) == kCFCompareEqualTo)
          {
            LOBYTE(v12) = 1;
            goto LABEL_28;
          }
        }
      }
      LOBYTE(v12) = 0;
      goto LABEL_28;
    }
    LOBYTE(v12) = 0;
LABEL_29:
    CFRelease(v6);
    return (char)v12;
  }
  LOBYTE(v12) = 0;
  result = 0;
  if (v6)
    goto LABEL_29;
  return result;
}

- (void)_onqueue_resume
{
  NSObject *v3;
  shared_ptr<TCPIO_EstablishBase> *p_establish;
  __shared_weak_count *cntrl;
  TransportConnectionObjCPP *ptr;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  __shared_weak_count *v10;
  TransportConnectionObjCPP *v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  __shared_weak_count *v16;
  TransportConnectionObjCPP *v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  TransportConnectionObjCPP *v21;
  __shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  char *v28;
  _QWORD *v29;
  shared_ptr<HTTPProtocol> *p_httpProtocol;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  HTTPProtocol *v34;
  TCPIO_EstablishBase *v35;
  __shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  NSObject *v42;
  NSString *v43;
  __int128 v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (-[NSURLSessionTask state](self, "state") == NSURLSessionTaskStateCompleted)
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v3 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v44) = 0;
      _os_log_error_impl(&dword_183ECA000, v3, OS_LOG_TYPE_ERROR, "[API MISUSE]: Resuming URLSessionStreamTaskk after task has completed", (uint8_t *)&v44, 2u);
    }
    return;
  }
  p_establish = &self->_establish;
  if (!self->_establish.__ptr_)
  {
    -[__NSCFTCPIOStreamTask _onqueue_cancel](self, "_onqueue_cancel");
    return;
  }
  if (-[NSURLSessionTask _TCPConnectionMetadata](self, "_TCPConnectionMetadata"))
  {
    ptr = self->_ios.__ptr_;
    cntrl = self->_ios.__cntrl_;
    if (cntrl)
    {
      v7 = (unint64_t *)((char *)cntrl + 8);
      do
        v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
      do
        v9 = __ldaxr(v7);
      while (__stlxr(v9 - 1, v7));
      if (!v9)
      {
        (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
      }
    }
    if (ptr)
    {
      v11 = self->_ios.__ptr_;
      v10 = self->_ios.__cntrl_;
      *(_QWORD *)&v44 = v11;
      *((_QWORD *)&v44 + 1) = v10;
      if (v10)
      {
        v12 = (unint64_t *)((char *)v10 + 8);
        do
          v13 = __ldxr(v12);
        while (__stxr(v13 + 1, v12));
      }
      (*(void (**)(_QWORD, uint64_t, NSData *))(**((_QWORD **)v11 + 3) + 200))(*((_QWORD *)v11 + 3), 0x1EDCFAD40, -[NSURLSessionTask _TCPConnectionMetadata](self, "_TCPConnectionMetadata", (_QWORD)v44, *((_QWORD *)&v44 + 1)));
      if (v10)
      {
        v14 = (unint64_t *)((char *)v10 + 8);
        do
          v15 = __ldaxr(v14);
        while (__stlxr(v15 - 1, v14));
        if (!v15)
        {
          (*(void (**)(__shared_weak_count *))(*(_QWORD *)v10 + 16))(v10);
          std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v10);
        }
      }
    }
  }
  if (self->__initialDataPayload)
  {
    v17 = self->_ios.__ptr_;
    v16 = self->_ios.__cntrl_;
    if (v16)
    {
      v18 = (unint64_t *)((char *)v16 + 8);
      do
        v19 = __ldxr(v18);
      while (__stxr(v19 + 1, v18));
      do
        v20 = __ldaxr(v18);
      while (__stlxr(v20 - 1, v18));
      if (!v20)
      {
        (*(void (**)(__shared_weak_count *))(*(_QWORD *)v16 + 16))(v16);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v16);
      }
    }
    if (v17)
    {
      v21 = self->_ios.__ptr_;
      v22 = self->_ios.__cntrl_;
      *(_QWORD *)&v44 = v21;
      *((_QWORD *)&v44 + 1) = v22;
      if (v22)
      {
        v23 = (unint64_t *)((char *)v22 + 8);
        do
          v24 = __ldxr(v23);
        while (__stxr(v24 + 1, v23));
      }
      (*(void (**)(_QWORD, uint64_t, NSData *))(**((_QWORD **)v21 + 3) + 200))(*((_QWORD *)v21 + 3), 0x1EDCFA598, self->__initialDataPayload);
      if (v22)
      {
        v25 = (unint64_t *)((char *)v22 + 8);
        do
          v26 = __ldaxr(v25);
        while (__stlxr(v26 - 1, v25));
        if (!v26)
        {
          (*(void (**)(__shared_weak_count *))(*(_QWORD *)v22 + 16))(v22);
          std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v22);
        }
      }
    }
  }
  if (-[__NSCFTCPIOStreamTask _onqueue_usingProxy](self, "_onqueue_usingProxy", (_QWORD)v44, *((_QWORD *)&v44 + 1)))
  {
    v27 = HTTPProtocol::_instantiateProtocol(*MEMORY[0x1E0C9AE00], &self->super, 0, 1);
    if (v27)
    {
      v28 = (char *)v27;
      if (TCFObject<URLProtocol>::Class(void)::sOnce != -1)
        dispatch_once(&TCFObject<URLProtocol>::Class(void)::sOnce, &__block_literal_global_288);
      CFRetain(v28);
      *(_QWORD *)&v44 = v28 + 16;
      v29 = (_QWORD *)operator new();
      *v29 = &off_1E14F10F0;
      v29[1] = 0;
      v29[2] = 0;
      v29[3] = v28 + 16;
      *((_QWORD *)&v44 + 1) = v29;
      p_httpProtocol = &self->_httpProtocol;
      std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100]((uint64_t)&self->_httpProtocol, &v44);
      v31 = (std::__shared_weak_count *)*((_QWORD *)&v44 + 1);
      if (*((_QWORD *)&v44 + 1))
      {
        v32 = (unint64_t *)(*((_QWORD *)&v44 + 1) + 8);
        do
          v33 = __ldaxr(v32);
        while (__stlxr(v33 - 1, v32));
        if (!v33)
        {
          ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
          std::__shared_weak_count::__release_weak(v31);
        }
      }
      v34 = p_httpProtocol->__ptr_;
      if (p_httpProtocol->__ptr_)
      {
        v35 = p_establish->__ptr_;
        v36 = self->_establish.__cntrl_;
        if (v36)
        {
          v37 = (unint64_t *)((char *)v36 + 8);
          do
            v38 = __ldxr(v37);
          while (__stxr(v38 + 1, v37));
          if (v35)
            v39 = (uint64_t)v35 + 24;
          else
            v39 = 0;
          std::shared_ptr<__CFString const>::operator=[abi:nn180100]((_QWORD *)v34 + 101, v39, (uint64_t)v36);
          do
            v40 = __ldaxr(v37);
          while (__stlxr(v40 - 1, v37));
          if (!v40)
          {
            (*(void (**)(__shared_weak_count *))(*(_QWORD *)v36 + 16))(v36);
            std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v36);
          }
        }
        else
        {
          if (v35)
            v41 = (uint64_t)v35 + 24;
          else
            v41 = 0;
          std::shared_ptr<__CFString const>::operator=[abi:nn180100]((_QWORD *)v34 + 101, v41, (uint64_t)self->_establish.__cntrl_);
        }
        (*(void (**)(HTTPProtocol *, _QWORD))(*(_QWORD *)p_httpProtocol->__ptr_ + 88))(p_httpProtocol->__ptr_, 0);
        CFRelease(v28);
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v42 = CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
        {
          v43 = -[NSURLSessionTask _loggableDescription](self, "_loggableDescription", (_QWORD)v44);
          LODWORD(v44) = 138543362;
          *(_QWORD *)((char *)&v44 + 4) = v43;
          _os_log_impl(&dword_183ECA000, v42, OS_LOG_TYPE_DEFAULT, "Proxy configured for Stream%{public}@", (uint8_t *)&v44, 0xCu);
        }
        goto LABEL_64;
      }
      CFRelease(v28);
    }
  }
  if (self->_connectionState == 2)
  {
    -[__NSCFTCPIOStreamTask _onqueue_ioTick](self, "_onqueue_ioTick");
  }
  else
  {
    -[__NSURLSessionLocal addConnectionlessTask:]((uint64_t)-[NSURLSessionTask session](self, "session"), (uint64_t)self);
    (*(void (**)(TCPIO_EstablishBase *, BOOL))(*(_QWORD *)p_establish->__ptr_ + 24))(p_establish->__ptr_, self->_secure != 0);
    self->_connectionState = 1;
  }
LABEL_64:
  if (self->_completedSuspendedWork)
    -[__NSCFTCPIOStreamTask _onqueue_callbackCompletedWork](self, "_onqueue_callbackCompletedWork");
}

- (void)_onqueue_cancel
{
  _QWORD v3[5];
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40____NSCFTCPIOStreamTask__onqueue_cancel__block_invoke;
  v4[3] = &unk_1E14FE118;
  v4[4] = self;
  if (self->_connectionState > 1)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __40____NSCFTCPIOStreamTask__onqueue_cancel__block_invoke_2;
    v3[3] = &unk_1E14FDEB0;
    v3[4] = v4;
    -[__NSCFTCPIOStreamTask _onqueue_addBlockOp:description:](self, "_onqueue_addBlockOp:description:", v3, "Cancel");
    -[__NSCFTCPIOStreamTask _onqueue_ioTick](self, "_onqueue_ioTick");
  }
  else
  {
    __40____NSCFTCPIOStreamTask__onqueue_cancel__block_invoke((uint64_t)v4);
  }
}

- (void)_onqueue_checkForCompletion
{
  shared_ptr<TransportConnectionObjCPP> *p_ios;
  const char *v4;
  TransportConnectionObjCPP *ptr;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  __int128 v10;

  if (-[NSURLSessionTask state](self, "state") <= NSURLSessionTaskStateCanceling)
  {
    p_ios = &self->_ios;
    if (self->_ios.__ptr_)
    {
      if (-[NSURLSessionTask state](self, "state") <= NSURLSessionTaskStateSuspended)
        -[NSURLSessionTask setState:](self, "setState:", 2);
      ptr = p_ios->__ptr_;
      if (p_ios->__ptr_)
      {
        if (self->_secure)
        {
          (*(void (**)(TCPIO_EstablishBase *))(*(_QWORD *)self->_establish.__ptr_ + 56))(self->_establish.__ptr_);
          self->_secure = 0;
          self->_goneSecure = 0;
          ptr = p_ios->__ptr_;
        }
        v6 = *((_QWORD *)ptr + 3);
        if (v6 && !*((_BYTE *)ptr + 40))
        {
          *((_BYTE *)ptr + 40) = 1;
          (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v6 + 152))(v6, 0);
        }
        self->_connectionState = 4;
        v10 = 0uLL;
        std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100]((uint64_t)&self->_ios, &v10);
        v7 = (std::__shared_weak_count *)*((_QWORD *)&v10 + 1);
        if (*((_QWORD *)&v10 + 1))
        {
          v8 = (unint64_t *)(*((_QWORD *)&v10 + 1) + 8);
          do
            v9 = __ldaxr(v8);
          while (__stlxr(v9 - 1, v8));
          if (!v9)
          {
            ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
            std::__shared_weak_count::__release_weak(v7);
          }
        }
      }
      if (self->_captureStreamsUponCompletion)
      {
        -[NSURLSessionTask _resetTaskDelegate]((uint64_t)self, v4);
      }
      else
      {
        -[NSURLSession _onqueue_didCompleteTask:withError:]((uint64_t)-[NSURLSessionTask session](self, "session"), self, -[NSURLSessionTask error](self, "error"));
        -[__NSURLSessionLocal removeUnresumedTask:]((uint64_t)-[NSURLSessionTask session](self, "session"), (uint64_t)self);
      }
      -[NSURLSessionTask setState:](self, "setState:", 3);
      -[__NSCFTCPIOStreamTask _onqueue_ioTick](self, "_onqueue_ioTick");
    }
  }
}

- (void)cancel
{
  NSObject *v3;
  _QWORD block[5];

  v3 = -[__NSCFTCPIOStreamTask workQueue](self, "workQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31____NSCFTCPIOStreamTask_cancel__block_invoke;
  block[3] = &unk_1E14FE118;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_onqueue_preConnectionConfiguration:(id)a3 parameters:(id)a4 completionHandler:(id)a5
{
  NSURL *v9;
  NSObject *v10;
  int v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (__CFNUseNWHTTPSProxies::useProxyOnce != -1)
    dispatch_once(&__CFNUseNWHTTPSProxies::useProxyOnce, &__block_literal_global_11_4775);
  if (__CFNUseNWHTTPSProxies::useNWHTTPSProxy)
  {
    v9 = -[NSURLRequest URL](-[NSURLSessionTask originalRequest](self, "originalRequest"), "URL");
    if (v9)
      ProxyConnectionEstablishment::SetProxyURL((const __CFURL *)v9, (uint64_t)a3, (uint64_t)a4);
    if (-[NSURLSessionTask _proxySettings](self, "_proxySettings"))
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v10 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
      {
        v11 = 138543362;
        v12 = -[NSURLSessionTask _loggableDescription](self, "_loggableDescription");
        _os_log_debug_impl(&dword_183ECA000, v10, OS_LOG_TYPE_DEBUG, "%{public}@ has custom proxy settings", (uint8_t *)&v11, 0xCu);
      }
      ProxyConnectionEstablishment::SetProxies((uint64_t)a3, (uint64_t)a4, (uint64_t)-[NSURLSessionTask _proxySettings](self, "_proxySettings"));
    }
  }
  (*((void (**)(id))a5 + 2))(a5);
}

- (void)_onqueue_dealWithSessionTrustAuth:(int64_t)a3 credential:(id)a4 completionHandler:(id)a5
{
  uint64_t v5;

  if ((unint64_t)(a3 - 2) < 2)
  {
    (*((void (**)(id, uint64_t, uint64_t, id))a5 + 2))(a5, 2, 1, a4);
    -[__NSCFTCPIOStreamTask _onqueue_cancel](self, "_onqueue_cancel");
  }
  else if (a3 == 1)
  {
    (*((void (**)(id, _QWORD, _QWORD))a5 + 2))(a5, 0, 0);
  }
  else if (!a3)
  {
    if (a4)
      v5 = 1;
    else
      v5 = 2;
    (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, v5, 0);
  }
}

- (BOOL)_onqueue_sendSessionChallenge:(id)a3 completionHandler:(id)a4
{
  __NSCFURLSessionDelegateWrapper *internalDelegateWrapper;
  const char *v8;
  int v9;
  __NSCFURLSessionDelegateWrapper *v10;
  __NSCFURLSessionDelegateWrapper *publicDelegateWrapper;
  const char *v13;
  char v14;
  char v15;

  if (self)
  {
    internalDelegateWrapper = self->super._internalDelegateWrapper;
    if (!internalDelegateWrapper)
      internalDelegateWrapper = self->super._publicDelegateWrapper;
    v9 = -[__NSCFURLSessionDelegateWrapper sessionDidReceiveChallenge]((uint64_t)internalDelegateWrapper, a2);
    v10 = self->super._internalDelegateWrapper;
    if (v10)
    {
      if (!v9)
      {
LABEL_9:
        if ((-[__NSCFURLSessionDelegateWrapper didReceiveChallenge]((uint64_t)v10, v8) & 1) != 0)
        {
          publicDelegateWrapper = self->super._internalDelegateWrapper;
          if (!publicDelegateWrapper)
            publicDelegateWrapper = self->super._publicDelegateWrapper;
          goto LABEL_12;
        }
        return 0;
      }
    }
    else
    {
      v10 = self->super._publicDelegateWrapper;
      if ((v9 & 1) == 0)
        goto LABEL_9;
    }
LABEL_8:
    -[__NSCFURLSessionDelegateWrapper didReceiveChallenge:completionHandler:]((uint64_t)v10, a3, a4);
    return 1;
  }
  v14 = -[__NSCFURLSessionDelegateWrapper sessionDidReceiveChallenge](0, a2);
  v10 = 0;
  if ((v14 & 1) != 0)
    goto LABEL_8;
  v15 = -[__NSCFURLSessionDelegateWrapper didReceiveChallenge](0, v13);
  publicDelegateWrapper = 0;
  if ((v15 & 1) != 0)
  {
LABEL_12:
    -[__NSCFURLSessionDelegateWrapper task:didReceiveChallenge:completionHandler:]((uint64_t)publicDelegateWrapper, self, a3, a4);
    return 1;
  }
  return 0;
}

- (void)_onqueue_needServerTrust:(id)a3 completionHandler:(id)a4
{
  _QWORD v7[7];

  self->_receivedServerTrustChallenge = 1;
  if (-[NSURLSessionTask state](self, "state") < NSURLSessionTaskStateCanceling)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68____NSCFTCPIOStreamTask__onqueue_needServerTrust_completionHandler___block_invoke;
    v7[3] = &unk_1E14FCEB0;
    v7[4] = self;
    v7[5] = a3;
    v7[6] = a4;
    if (!-[__NSCFTCPIOStreamTask _onqueue_sendSessionChallenge:completionHandler:](self, "_onqueue_sendSessionChallenge:completionHandler:", a3, v7))(*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
  }
  else
  {
    (*((void (**)(id, _QWORD, uint64_t))a4 + 2))(a4, 0, 1);
  }
}

- (void)_onqueue_needClientCert:(id)a3 completionHandler:(id)a4
{
  _QWORD v7[7];

  if (-[NSURLSessionTask state](self, "state") < NSURLSessionTaskStateCanceling)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67____NSCFTCPIOStreamTask__onqueue_needClientCert_completionHandler___block_invoke;
    v7[3] = &unk_1E14FCEB0;
    v7[4] = self;
    v7[5] = a3;
    v7[6] = a4;
    if (!-[__NSCFTCPIOStreamTask _onqueue_sendSessionChallenge:completionHandler:](self, "_onqueue_sendSessionChallenge:completionHandler:", a3, v7))(*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  }
  else
  {
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  }
}

- (void)_onqueue_dealWithSessionClientCertAuth:(int64_t)a3 credential:(id)a4 completionHandler:(id)a5
{
  CFMutableArrayRef Mutable;
  char *v7;
  const void *v8;
  const __CFArray *v9;
  const __CFArray *v10;
  unint64_t Count;
  CFRange v12;
  const void **v13;
  CFIndex v15;
  CFTypeRef v16;
  CFIndex range;
  const void **v18;
  _BYTE v19[248];
  CFIndex v20;

  if ((unint64_t)(a3 - 2) < 2)
  {
    (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
    -[__NSCFTCPIOStreamTask _onqueue_cancel](self, "_onqueue_cancel");
    return;
  }
  if (a3 == 1)
  {
    (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
    return;
  }
  if (!a3)
  {
    if (a4)
    {
      Mutable = (CFMutableArrayRef)objc_msgSend(a4, "_CFURLCredential");
      if (!Mutable)
        goto LABEL_18;
      if (URLCredential::Class(void)::sOnce_URLCredential != -1)
        dispatch_once(&URLCredential::Class(void)::sOnce_URLCredential, &__block_literal_global_8521);
      if (*((_DWORD *)Mutable + 12) == 3)
      {
        v7 = (char *)Mutable + 16;
        v8 = (const void *)(*(uint64_t (**)(uint64_t))(*((_QWORD *)Mutable + 2) + 120))((uint64_t)Mutable + 16);
        if (v8)
        {
          Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
          CFArrayAppendValue(Mutable, v8);
          v9 = (const __CFArray *)(*(uint64_t (**)(char *))(*(_QWORD *)v7 + 112))(v7);
          v10 = v9;
          if (!v9 || CFArrayGetCount(v9) < 1)
            goto LABEL_18;
          v16 = CFRetain(v10);
          Count = CFArrayGetCount(v10);
          v12.length = Count;
          range = Count;
          if (Count - 1 > 0x1FFFFFFFFFFFFFFDLL)
          {
            v18 = 0;
            goto LABEL_25;
          }
          if (Count > 0x1E)
          {
            v13 = (const void **)malloc_type_malloc(8 * Count, 0x89ED541CuLL);
            v18 = v13;
            if (!v13)
              goto LABEL_25;
            v12.length = range;
          }
          else
          {
            v13 = (const void **)v19;
            v18 = (const void **)v19;
          }
          v12.location = 0;
          CFArrayGetValues(v10, v12, v13);
LABEL_25:
          v20 = 0;
          while (1)
          {
            v15 = v20;
            if (v20 >= range)
              break;
            ++v20;
            CFArrayAppendValue(Mutable, v18[v15]);
          }
          CFContainerEnumeratorBase::~CFContainerEnumeratorBase((CFContainerEnumeratorBase *)&v16);
          goto LABEL_18;
        }
      }
    }
    Mutable = 0;
LABEL_18:
    (*((void (**)(id, CFMutableArrayRef))a5 + 2))(a5, Mutable);
    if (Mutable)
      CFRelease(Mutable);
  }
}

- (void)_onqueue_postConnectConfiguration:(id)a3 parameters:(id)a4 completionHandler:(id)a5
{
  (*((void (**)(id))a5 + 2))(a5);
}

- (void)_onqueue_setTransportConnection:(shared_ptr<TransportConnection>)a3
{
  TransportConnection *ptr;
  TransportConnectionObjCPP *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  OS_dispatch_queue *v13;
  NSObject *v14;
  int v15;
  NSString *v16;
  uint64_t v17;

  ptr = a3.__ptr_;
  v17 = *MEMORY[0x1E0C80C00];
  v5 = self->_ios.__ptr_;
  v6 = *(_QWORD *)a3.__ptr_;
  v7 = (std::__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
    std::shared_ptr<__CFString const>::operator=[abi:nn180100]((_QWORD *)v5 + 3, v6, (uint64_t)v7);
    v10 = (unint64_t *)&v7->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  else
  {
    std::shared_ptr<__CFString const>::operator=[abi:nn180100]((_QWORD *)v5 + 3, v6, 0);
  }

  v12 = *((_QWORD *)self->_ios.__ptr_ + 3);
  v13 = *(OS_dispatch_queue **)(v12 + 120);
  if (v13)
    dispatch_retain(*(dispatch_object_t *)(v12 + 120));
  self->_workQueueForStreamTask = v13;
  if (self->_secure)
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v14 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = -[NSURLSessionTask _loggableDescription](self, "_loggableDescription");
      _os_log_impl(&dword_183ECA000, v14, OS_LOG_TYPE_DEFAULT, "Stream%{public}@ enabling TLS", (uint8_t *)&v15, 0xCu);
    }
    (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)ptr + 24))(*(_QWORD *)ptr, 1);
  }
}

- (void)_onqueue_tlsCompletion
{
  if (-[NSURLSessionTask state](self, "state") != NSURLSessionTaskStateCompleted
    && (objc_msgSend((id)-[__NSURLSessionTaskGroupForConfiguration _groupConfiguration](-[NSURLSessionTask _taskGroup](self, "_taskGroup"), "_groupConfiguration"), "_allowTCPIOConnectionStreamTask") & 1) == 0)
  {
    self->_goneSecure = 1;
    -[__NSCFTCPIOStreamTask _onqueue_ioTick](self, "_onqueue_ioTick");
  }
}

- (void)_onqueue_tlsDisabled
{
  if (-[NSURLSessionTask state](self, "state") != NSURLSessionTaskStateCompleted
    && (objc_msgSend((id)-[__NSURLSessionTaskGroupForConfiguration _groupConfiguration](-[NSURLSessionTask _taskGroup](self, "_taskGroup"), "_groupConfiguration"), "_allowTCPIOConnectionStreamTask") & 1) == 0)
  {
    self->_goneSecure = 0;
    -[__NSCFTCPIOStreamTask _onqueue_ioTick](self, "_onqueue_ioTick");
  }
}

- (void)_onqueue_cleanUpConnectionEstablishmentState
{
  NSObject *v3;
  NSObject *v4;
  NSString *v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  TransportConnectionObjCPP *ptr;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_receivedServerTrustChallenge)
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v3 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v10) = 138543362;
      *(_QWORD *)((char *)&v10 + 4) = -[NSURLSessionTask _loggableDescription](self, "_loggableDescription");
      _os_log_impl(&dword_183ECA000, v3, OS_LOG_TYPE_DEFAULT, "Stream%{public}@ is complete and received server trust, marking as secure", (uint8_t *)&v10, 0xCu);
    }
    self->_goneSecure = 1;
  }
  if (self->_httpProtocol.__ptr_)
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v4 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
    {
      v5 = -[NSURLSessionTask _loggableDescription](self, "_loggableDescription");
      LODWORD(v10) = 138543362;
      *(_QWORD *)((char *)&v10 + 4) = v5;
      _os_log_impl(&dword_183ECA000, v4, OS_LOG_TYPE_DEFAULT, "Stream%{public}@ has completed HTTP protocol connection establishment", (uint8_t *)&v10, 0xCu);
    }
    std::shared_ptr<__CFString const>::operator=[abi:nn180100]((_QWORD *)self->_httpProtocol.__ptr_ + 101, 0, 0);
    v10 = 0uLL;
    std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100]((uint64_t)&self->_httpProtocol, &v10);
    v6 = (std::__shared_weak_count *)*((_QWORD *)&v10 + 1);
    if (*((_QWORD *)&v10 + 1))
    {
      v7 = (unint64_t *)(*((_QWORD *)&v10 + 1) + 8);
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 - 1, v7));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
  ptr = self->_ios.__ptr_;
  if (ptr)
    TransportConnection::rstConnectionEstablishmentDelegate(*((TransportConnection **)ptr + 3));
}

- (void)_onqueue_connectionEstablishedWithError:(id)a3 callbackReferent:(id)a4
{
  int var1;
  int64_t var0;
  const char *v8;
  __NSCFURLSessionDelegateWrapper *internalDelegateWrapper;
  uint64_t v10;
  void *v11;
  void *v12;
  __NSCFURLSessionDelegateWrapper *publicDelegateWrapper;
  __int128 v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  TCPIO_EstablishBase *ptr;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  _QWORD v33[12];
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  _OWORD *(*v37)(uint64_t, uint64_t);
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  __n128 (*v44)(__n128 *, uint64_t);
  void *v45;
  $C9A20311543CE7131523B4F7AC24AF8E v46;
  uint64_t v47;
  uint64_t v48;
  __n128 (*v49)(__n128 *, uint64_t);
  void *v50;
  $C9A20311543CE7131523B4F7AC24AF8E v51;
  $C9A20311543CE7131523B4F7AC24AF8E valuePtr;

  var1 = a3.var1;
  var0 = a3.var0;
  valuePtr = a3;
  if (-[NSURLSessionTask error](self, "error"))
  {
    -[NSURLSession _onqueue_didCompleteTask:withError:]((uint64_t)-[NSURLSessionTask session](self, "session"), self, -[NSURLSessionTask error](self, "error"));
    -[NSURLSessionTask setState:](self, "setState:", 3);
    return;
  }
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
  if (!-[__NSCFURLSessionDelegateWrapper didBecomeInputOutputStream]((uint64_t)internalDelegateWrapper, v8)|| !objc_msgSend((id)-[__NSURLSessionTaskGroupForConfiguration _groupConfiguration](-[NSURLSessionTask _taskGroup](self, "_taskGroup"), "_groupConfiguration"), "_allowTCPIOConnectionStreamTask"))
  {
    if (var0 && var1)
    {
      -[NSURLSessionTask setError:](self, "setError:", __cfnCreateCFErrorWithStreamError((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (int *)&valuePtr));
      self->_connectionState = 4;
      self->_secure = 0;
      -[__NSCFTCPIOStreamTask _onqueue_checkForCompletion](self, "_onqueue_checkForCompletion");
    }
    else
    {
      self->_connectionState = 2;
    }
    -[__NSCFTCPIOStreamTask _onqueue_ioTick](self, "_onqueue_ioTick");
    return;
  }
  v10 = MEMORY[0x1E0C809B0];
  if (!var0 || !var1)
  {
    std::allocate_shared[abi:nn180100]<TCPIO_Delegate,std::allocator<TCPIO_Delegate>,std::shared_ptr<TransportConnectionObjCPP> &,void>(&v41, (std::__shared_weak_count_vtbl *)self->_ios.__ptr_, (std::__shared_weak_count *)self->_ios.__cntrl_);
    v35 = v10;
    v36 = 3321888768;
    v37 = __82____NSCFTCPIOStreamTask__onqueue_connectionEstablishedWithError_callbackReferent___block_invoke_3;
    v38 = &unk_1E14F3158;
    v14 = v41;
    v40 = v41;
    if (*((_QWORD *)&v41 + 1))
    {
      v15 = (unint64_t *)(*((_QWORD *)&v41 + 1) + 8);
      do
        v16 = __ldxr(v15);
      while (__stxr(v16 + 1, v15));
    }
    v39 = a4;
    v11 = (void *)CFReadStreamCreate();
    v33[7] = v10;
    v33[8] = 3321888768;
    v33[9] = __82____NSCFTCPIOStreamTask__onqueue_connectionEstablishedWithError_callbackReferent___block_invoke_4;
    v33[10] = &unk_1E14F3190;
    v34 = v14;
    if (*((_QWORD *)&v14 + 1))
    {
      v17 = (unint64_t *)(*((_QWORD *)&v14 + 1) + 8);
      do
        v18 = __ldxr(v17);
      while (__stxr(v18 + 1, v17));
    }
    v33[11] = a4;
    v12 = (void *)CFWriteStreamCreate();
    if (*((_QWORD *)&v34 + 1))
    {
      v19 = (unint64_t *)(*((_QWORD *)&v34 + 1) + 8);
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        (*(void (**)(_QWORD))(**((_QWORD **)&v34 + 1) + 16))(*((_QWORD *)&v34 + 1));
        std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v34 + 1));
      }
    }
    if (*((_QWORD *)&v40 + 1))
    {
      v21 = (unint64_t *)(*((_QWORD *)&v40 + 1) + 8);
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        (*(void (**)(_QWORD))(**((_QWORD **)&v40 + 1) + 16))(*((_QWORD *)&v40 + 1));
        std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v40 + 1));
      }
    }
    v23 = (std::__shared_weak_count *)*((_QWORD *)&v41 + 1);
    if (*((_QWORD *)&v41 + 1))
    {
      v24 = (unint64_t *)(*((_QWORD *)&v41 + 1) + 8);
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }
    -[NSURLSessionTask setState:](self, "setState:", 3);
    goto LABEL_40;
  }
  v47 = MEMORY[0x1E0C809B0];
  v48 = 3221225472;
  v49 = __82____NSCFTCPIOStreamTask__onqueue_connectionEstablishedWithError_callbackReferent___block_invoke;
  v50 = &__block_descriptor_48_e26__v16__0____CFReadStream__8l;
  v51 = valuePtr;
  v11 = (void *)CFReadStreamCreate();
  v42 = v10;
  v43 = 3221225472;
  v44 = __82____NSCFTCPIOStreamTask__onqueue_connectionEstablishedWithError_callbackReferent___block_invoke_2;
  v45 = &__block_descriptor_48_e27__v16__0____CFWriteStream__8l;
  v46 = valuePtr;
  v12 = (void *)CFWriteStreamCreate();
  -[NSURLSessionTask setState:](self, "setState:", 3);
  if (self)
  {
LABEL_40:
    publicDelegateWrapper = self->super._internalDelegateWrapper;
    if (!publicDelegateWrapper)
      publicDelegateWrapper = self->super._publicDelegateWrapper;
    goto LABEL_42;
  }
  publicDelegateWrapper = 0;
LABEL_42:
  v33[0] = v10;
  v33[1] = 3221225472;
  v33[2] = __82____NSCFTCPIOStreamTask__onqueue_connectionEstablishedWithError_callbackReferent___block_invoke_5;
  v33[3] = &unk_1E14FB048;
  v33[5] = v11;
  v33[6] = v12;
  v33[4] = self;
  -[__NSCFURLSessionDelegateWrapper streamTask:didBecomeInputStream:outputStream:completionHandler:]((uint64_t)publicDelegateWrapper, self, v11, v12, v33);
  if (v11)
    CFRelease(v11);
  if (v12)
    CFRelease(v12);
  ptr = self->_establish.__ptr_;
  if (ptr)
  {
    (*(void (**)(TCPIO_EstablishBase *))(*(_QWORD *)ptr + 32))(ptr);
    v41 = 0uLL;
    std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100]((uint64_t)&self->_establish, &v41);
    v27 = (std::__shared_weak_count *)*((_QWORD *)&v41 + 1);
    if (*((_QWORD *)&v41 + 1))
    {
      v28 = (unint64_t *)(*((_QWORD *)&v41 + 1) + 8);
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
  v41 = 0uLL;
  std::shared_ptr<CoreSchedulingSet>::operator=[abi:nn180100]((uint64_t)&self->_ios, &v41);
  v30 = (std::__shared_weak_count *)*((_QWORD *)&v41 + 1);
  if (*((_QWORD *)&v41 + 1))
  {
    v31 = (unint64_t *)(*((_QWORD *)&v41 + 1) + 8);
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
}

- (void)_onqueue_suspend
{
  self->_completedSuspendedWork = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  -[NSURLSessionTask setState:](self, "setState:", 1);
}

- (void)_onqueue_adjustPoolPriority
{
  int v3;
  uint64_t v4;
  __int16 v5;
  const char *Name;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v3 = 138412546;
    v4 = objc_opt_class();
    v5 = 2080;
    Name = sel_getName(a2);
    _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "%@ - %s - can only be used with -captureStreams", (uint8_t *)&v3, 0x16u);
  }
}

- (void)_onqueue_adjustLoadingPoolPriority
{
  int v3;
  uint64_t v4;
  __int16 v5;
  const char *Name;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v3 = 138412546;
    v4 = objc_opt_class();
    v5 = 2080;
    Name = sel_getName(a2);
    _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "%@ - %s - can only be used with -captureStreams", (uint8_t *)&v3, 0x16u);
  }
}

- (void)_onSessionQueue_disavow
{
  void (**disavow)(id, __NSCFTCPIOStreamTask *);

  disavow = (void (**)(id, __NSCFTCPIOStreamTask *))self->_disavow;
  if (disavow)
  {
    self->_disavow = 0;
    disavow[2](disavow, self);
    _Block_release(disavow);
  }
}

- (void)_onSessionQueue_cleanupAndBreakCycles
{
  CFNetworkTimer *writeTimer;
  CFNetworkTimer *readTimer;
  SEL v5;
  objc_super v6;

  writeTimer = self->_writeTimer;
  if (writeTimer)
  {
    -[CFNetworkTimer cancelTimer]((uint64_t)writeTimer);

    self->_writeTimer = 0;
  }
  readTimer = self->_readTimer;
  if (readTimer)
  {
    -[CFNetworkTimer cancelTimer]((uint64_t)readTimer);

    self->_readTimer = 0;
  }
  objc_setProperty_nonatomic(self, a2, 0, 936);
  objc_setProperty_nonatomic(self, v5, 0, 928);
  v6.receiver = self;
  v6.super_class = (Class)__NSCFTCPIOStreamTask;
  -[NSURLSessionTask _onSessionQueue_cleanupAndBreakCycles](&v6, sel__onSessionQueue_cleanupAndBreakCycles);
}

- (NSData)_initialDataPayload
{
  return (NSData *)objc_getProperty(self, a2, 808, 1);
}

- (void)set_initialDataPayload:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 808);
}

- (void).cxx_destruct
{
  std::shared_ptr<HTTPResponseMessage>::~shared_ptr[abi:nn180100]((uint64_t)&self->_httpProtocol);
  std::shared_ptr<HTTPResponseMessage>::~shared_ptr[abi:nn180100]((uint64_t)&self->_ios);
  std::shared_ptr<HTTPResponseMessage>::~shared_ptr[abi:nn180100]((uint64_t)&self->_establish);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 96) = 0;
  *((_QWORD *)self + 97) = 0;
  *((_QWORD *)self + 98) = 0;
  *((_QWORD *)self + 99) = 0;
  *((_QWORD *)self + 102) = 0;
  *((_QWORD *)self + 103) = 0;
  return self;
}

@end

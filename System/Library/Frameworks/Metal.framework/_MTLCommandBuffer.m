@implementation _MTLCommandBuffer

- (unint64_t)globalTraceObjectID
{
  return self->_globalTraceObjectID;
}

- (void)setCurrentCommandEncoder:(id)a3
{
  self->_currentCommandEncoder = (MTLCommandEncoder *)a3;
}

- (BOOL)ownedByParallelEncoder
{
  return self->_ownedByParallelEncoder;
}

- (BOOL)skipRender
{
  return self->_skipRender;
}

- (MTLCommandQueue)commandQueue
{
  return self->_queue;
}

- (BOOL)isProfilingEnabled
{
  return self->_profilingEnabled;
}

- (void)dealloc
{
  NSError *error;
  MTLDispatch *scheduledDispatchList;
  MTLDispatch *completedDispatchList;
  void *v6;
  id perfSampleHandlerBlock;
  objc_super v8;

  if (MEMORY[0x1E0D227A8] && !self->_didComplete)
    FPCommandBufferCompleted();
  error = self->_error;
  if (error)
  {

    self->_error = 0;
  }
  pthread_cond_destroy(&self->_completedCond);
  pthread_cond_destroy(&self->_scheduledCond);
  pthread_mutex_destroy(&self->_mutex);
  scheduledDispatchList = self->_scheduledDispatchList;
  if (scheduledDispatchList)
  {
    MTLDispatchListApply(scheduledDispatchList);
    self->_scheduledDispatchList = 0;
    self->_scheduledDispatchListTail = 0;
  }
  completedDispatchList = self->_completedDispatchList;
  if (completedDispatchList)
  {
    MTLDispatchListApply(completedDispatchList);
    self->_completedDispatchList = 0;
    self->_completedDispatchListTail = 0;
  }
  -[_MTLCommandBuffer executeSynchronizationNotifications:](self, "executeSynchronizationNotifications:", 3);
  if (!self->_status)
    -[_MTLCommandBuffer signalCommandBufferAvailable](self, "signalCommandBufferAvailable");
  if (self->_progressBuffer)
  {
    v6 = *(void **)(-[MTLCommandQueue device](self->_queue, "device") + 320);
    objc_sync_enter(v6);
    objc_msgSend(*(id *)(-[MTLCommandQueue device](self->_queue, "device") + 320), "addObject:", self->_progressBuffer);
    objc_sync_exit(v6);

    self->_progressBuffer = 0;
  }

  self->_encoderInfos = 0;
  if (self->_privateData)
    -[MTLCommandQueue releasePrivateData:privateDataOffset:](self->_queue, "releasePrivateData:privateDataOffset:");

  perfSampleHandlerBlock = self->_perfSampleHandlerBlock;
  if (perfSampleHandlerBlock)
    _Block_release(perfSampleHandlerBlock);

  self->_retainedObjects = 0;
  v8.receiver = self;
  v8.super_class = (Class)_MTLCommandBuffer;
  -[_MTLObjectWithLabel dealloc](&v8, sel_dealloc);
}

- (void)didScheduleWithStartTime:(unint64_t)a3 endTime:(unint64_t)a4 error:(id)a5
{
  NSString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  -[_MTLCommandBuffer didSchedule:error:](self, "didSchedule:error:", a3, a5);
  self->_kernelStartTime = a3;
  self->_kernelEndTime = a4;
  if (a5)
  {
    self->_error = (NSError *)a5;
    __dmb(0xBu);
    self->_status = 5;
    v9 = -[NSError localizedDescription](self->_error, "localizedDescription");
    MTLReportFailure(4uLL, "-[_MTLCommandBuffer didScheduleWithStartTime:endTime:error:]", 1020, (uint64_t)CFSTR("Execution of the command buffer was aborted due to an error during execution. %@"), v10, v11, v12, v13, (uint64_t)v9);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[_MTLCommandBuffer didScheduleWithStartTime:endTime:error:].cold.1((id *)&self->_error);
  }
  else
  {
    self->_status = 3;
  }
  if (MEMORY[0x1E0D227B8])
    FPCommandBufferScheduled();
  if (self->_scheduledDispatchList)
  {
    if (MTLTraceEnabled())
      kdebug_trace();
    MTLDispatchListApply(self->_scheduledDispatchList);
    if (MTLTraceEnabled())
      kdebug_trace();
    self->_scheduledDispatchList = 0;
    self->_scheduledDispatchListTail = 0;
  }
  pthread_mutex_lock(&self->_mutex);
  self->_scheduledCallbacksDone = 1;
  pthread_cond_broadcast(&self->_scheduledCond);
  pthread_mutex_unlock(&self->_mutex);
}

- (void)didCompleteWithStartTime:(unint64_t)a3 endTime:(unint64_t)a4 error:(id)a5
{
  id *p_error;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  MTLLogState *logState;
  NSMutableArray *retainedObjects;

  if (self->_profilingEnabled)
    self->_completionHandlerExecutionTime = mach_absolute_time();
  self->_gpuStartTime = a3;
  self->_gpuEndTime = a4;
  p_error = (id *)&self->_error;
  if (!self->_error)
  {
    if (a5)
    {
      if (self->_errorOptions)
      {
        -[_MTLCommandBuffer processEncoderInfos](self, "processEncoderInfos");
        v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", objc_msgSend(a5, "userInfo"));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", self->_encoderInfos, CFSTR("MTLCommandBufferEncoderInfoErrorKey"));
        v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", objc_msgSend(a5, "domain"), objc_msgSend(a5, "code"), v10);
      }
      else
      {
        v11 = a5;
      }
      *p_error = v11;
      __dmb(0xBu);
      self->_status = 5;
      v12 = objc_msgSend(*p_error, "localizedDescription");
      MTLReportFailure(4uLL, "-[_MTLCommandBuffer didCompleteWithStartTime:endTime:error:]", 1156, (uint64_t)CFSTR("Execution of the command buffer was aborted due to an error during execution. %@"), v13, v14, v15, v16, v12);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[_MTLCommandBuffer didScheduleWithStartTime:endTime:error:].cold.1((id *)&self->_error);
    }
    else
    {
      self->_status = 4;
    }
  }
  if (self->_StatEnabled)
    -[_MTLCommandBuffer runPerfCounterCallbackWithBlock:](self, "runPerfCounterCallbackWithBlock:", self->_perfSampleHandlerBlock);
  logState = self->_logState;
  if (logState)
    -[MTLLogState decodeLog](logState, "decodeLog");
  if (self->_privateData)
    -[MTLCommandQueue releasePrivateData:privateDataOffset:](self->_queue, "releasePrivateData:privateDataOffset:");
  if (MEMORY[0x1E0D227A8])
  {
    FPCommandBufferCompleted();
    self->_didComplete = 1;
  }
  if (self->_completedDispatchList)
  {
    if (MTLTraceEnabled())
      kdebug_trace();
    MTLDispatchListApply(self->_completedDispatchList);
    if (MTLTraceEnabled())
      kdebug_trace();
    self->_completedDispatchList = 0;
    self->_completedDispatchListTail = 0;
  }
  retainedObjects = self->_retainedObjects;
  if (retainedObjects)
  {

    self->_retainedObjects = 0;
  }
  -[_MTLCommandBuffer signalCommandBufferAvailable](self, "signalCommandBufferAvailable");
  pthread_mutex_lock(&self->_mutex);
  self->_completedCallbacksDone = 1;
  pthread_cond_broadcast(&self->_completedCond);
  pthread_mutex_unlock(&self->_mutex);
}

- (void)signalCommandBufferAvailable
{
  if (self->_needsCommandBufferSemaphoreSignal)
  {
    self->_needsCommandBufferSemaphoreSignal = 0;
    dispatch_semaphore_signal(*((dispatch_semaphore_t *)self->_queue + 26));
  }
}

- (_MTLCommandBuffer)initWithQueue:(id)a3 retainedReferences:(BOOL)a4 synchronousDebugMode:(BOOL)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _MTLCommandBuffer *v16;
  _MTLCommandBuffer *v17;
  MTLLogState *v18;
  uint64_t v19;
  int v20;
  objc_super v22;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      MTLReportFailure(1uLL, "-[_MTLCommandBuffer initWithQueue:retainedReferences:synchronousDebugMode:]", 326, (uint64_t)CFSTR("queue is not a MTLCommandQueue."), v12, v13, v14, v15, (uint64_t)v22.receiver);
    v22.receiver = self;
    v22.super_class = (Class)_MTLCommandBuffer;
    v16 = -[_MTLObjectWithLabel init](&v22, sel_init);
    v17 = v16;
    if (v16)
    {
      v16->_error = 0;
      v16->_queue = (MTLCommandQueue *)a3;
      v17->_needsCommandBufferSemaphoreSignal = 1;
      dispatch_semaphore_wait(*((dispatch_semaphore_t *)v17->_queue + 26), 0xFFFFFFFFFFFFFFFFLL);
      *(_OWORD *)&v17->_mutex.__sig = _mutex_init;
      *(_OWORD *)&v17->_mutex.__opaque[8] = *(_OWORD *)algn_18281BFD0;
      *(_OWORD *)&v17->_mutex.__opaque[24] = xmmword_18281BFE0;
      *(_OWORD *)&v17->_mutex.__opaque[40] = unk_18281BFF0;
      *(_OWORD *)&v17->_completedCond.__sig = _cond_init;
      *(_OWORD *)&v17->_completedCond.__opaque[8] = *(_OWORD *)algn_18281C010;
      *(_OWORD *)&v17->_completedCond.__opaque[24] = xmmword_18281C020;
      *(_OWORD *)&v17->_scheduledCond.__sig = _cond_init;
      *(_OWORD *)&v17->_scheduledCond.__opaque[8] = *(_OWORD *)algn_18281C010;
      *(_OWORD *)&v17->_scheduledCond.__opaque[24] = xmmword_18281C020;
      v17->_retainedReferences = a4;
      v17->_synchronousDebugMode = a5;
      v17->_logs = 0;
      v17->_privateData = 0;
      v17->_privateDataOffset = 0;
      v17->_privateLoggingBuffer = 0;
      v18 = (MTLLogState *)*((id *)v17->_queue + 31);
      v17->_logState = v18;
      if (v18)
      {
        -[MTLCommandQueue getPrivateDataAndOffset:privateDataOffset:](v17->_queue, "getPrivateDataAndOffset:privateDataOffset:", &v17->_privateData, &v17->_privateDataOffset);
        v17->_requiresBindingLogState = 1;
      }
      if (*((_BYTE *)v17->_queue + 240))
        v17->_profilingEnabled = 1;
      v19 = mach_absolute_time();
      if (v17->_profilingEnabled)
        v17->_creationTime = v19;
      v17->_skipRender = *((_BYTE *)v17->_queue + 346);
      v17->_wakeOnCommit = 1;
      v17->_hasPresent = 0;
      v17->_numThisCommandBuffer = -[MTLCommandQueue getAndIncrementNumCommandBuffers](v17->_queue, "getAndIncrementNumCommandBuffers");
      v20 = *((unsigned __int8 *)v17->_queue + 256);
      v17->_StatEnabled = v20;
      if (v20)
      {
        v17->_perfSampleHandlerBlock = _Block_copy(*((const void **)v17->_queue + 36));
        v17->_numEncoders = 0;
        v17->_listIndex = -[MTLCommandQueue getListIndex](v17->_queue, "getListIndex");
      }
      v17->_errorOptions = objc_msgSend((id)-[MTLCommandQueue device](v17->_queue, "device"), "commandBufferErrorOptions");
      v17->_progressBuffer = 0;
      v17->_progressOffset = 0;
      v17->_creatingProgressEncoder = 0;
      v17->_needsFrameworkAssistedErrorTracking = objc_msgSend((id)-[MTLCommandQueue device](v17->_queue, "device"), "getSupportedCommandBufferErrorOptions") == 0;
      v17->_deadlineProfile = 0;
      if (MEMORY[0x1E0D227B0])
        FPCommandBufferCreated();
    }
  }
  else
  {
    MTLReportFailure(0, "-[_MTLCommandBuffer initWithQueue:retainedReferences:synchronousDebugMode:]", 323, (uint64_t)CFSTR("queue must not be nil."), a5, v5, v6, v7, (uint64_t)v22.receiver);

    return 0;
  }
  return v17;
}

- (unint64_t)errorOptions
{
  return self->_errorOptions;
}

- (void)executeSynchronizationNotifications:(int)a3
{
  _OWORD v3[2];

  memset(v3, 0, sizeof(v3));
  LODWORD(v3[0]) = a3;
  if (self->_syncDispatchList)
    _doMTLSyncDispatch((uint64_t)self, (_QWORD **)&self->_syncDispatchList, &self->_syncDispatchListTail, v3);
}

- (BOOL)isStatEnabled
{
  return self->_StatEnabled;
}

- (void)initProgressTracking
{
  void *v3;
  MTLBuffer *v4;

  if (!self->_encoderInfos)
    self->_encoderInfos = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!self->_progressBuffer && self->_needsFrameworkAssistedErrorTracking)
  {
    objc_msgSend((id)-[MTLCommandQueue device](self->_queue, "device"), "initProgressTracking");
    v3 = *(void **)(-[MTLCommandQueue device](self->_queue, "device") + 320);
    objc_sync_enter(v3);
    v4 = (MTLBuffer *)(id)objc_msgSend(*(id *)(-[MTLCommandQueue device](self->_queue, "device") + 320), "lastObject");
    self->_progressBuffer = v4;
    if (v4)
      objc_msgSend(*(id *)(-[MTLCommandQueue device](self->_queue, "device") + 320), "removeLastObject");
    objc_sync_exit(v3);
    if (!self->_progressBuffer)
      self->_progressBuffer = (MTLBuffer *)objc_msgSend((id)-[MTLCommandQueue device](self->_queue, "device"), "newBufferWithLength:options:", 0x10000, 256);
  }
}

- (BOOL)commitAndWaitUntilSubmitted
{
  self->_wakeOnCommit = 0;
  -[_MTLCommandBuffer commit](self, "commit");
  return -[MTLCommandQueue submitCommandBuffer:](self->_queue, "submitCommandBuffer:", self);
}

- (void)setCommitted:(BOOL)a3
{
  self->_status = 2;
}

- (void)addCompletedHandler:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;

  if (self->_status >= 2)
    MTLReportFailure(0, "-[_MTLCommandBuffer addCompletedHandler:]", 976, (uint64_t)CFSTR("Completed handler provided after commit call"), v3, v4, v5, v6, v9);
  MTLDispatchListAppendBlock(&self->_completedDispatchList, (_QWORD **)&self->_completedDispatchListTail, a3);
}

- (BOOL)isCommitted
{
  return self->_status > 1;
}

- (NSError)error
{
  return self->_error;
}

- (void)commit
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  if (self->_status >= 2)
    MTLReportFailure(0, "-[_MTLCommandBuffer commit]", 682, (uint64_t)CFSTR("commit an already committed command buffer"), v2, v3, v4, v5, v7);
  if (self->_currentCommandEncoder)
    MTLReportFailure(0, "-[_MTLCommandBuffer commit]", 683, (uint64_t)CFSTR("commit command buffer with uncommitted encoder"), v2, v3, v4, v5, v7);
  -[MTLCommandQueue setPrivateData:privateDataOffset:logState:](self->_queue, "setPrivateData:privateDataOffset:logState:", self->_privateData, self->_privateDataOffset, self->_logState);
  -[_MTLCommandBuffer executeSynchronizationNotifications:](self, "executeSynchronizationNotifications:", 2);
  if (!self->_status)
  {
    -[MTLCommandQueue enqueueCommandBuffer:](self->_queue, "enqueueCommandBuffer:", self);
    self->_status = 1;
  }
  if (self->_profilingEnabled)
    self->_commitTime = mach_absolute_time();
  if (MEMORY[0x1E0D227A0])
    FPCommandBufferCommitted();
  -[MTLCommandQueue commitCommandBuffer:wake:](self->_queue, "commitCommandBuffer:wake:", self, self->_wakeOnCommit);
}

- (void)presentDrawable:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13[5];
  _QWORD v14[6];
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  if (_MTLShouldRemapPresent())
  {
    v15[0] = CFSTR("enableFIFO");
    v15[1] = CFSTR("presentationMode");
    v16[0] = MEMORY[0x1E0C9AAB0];
    v16[1] = &unk_1E103B450;
    v15[2] = CFSTR("presentTimeInterval");
    v16[2] = &unk_1E103B4B0;
    -[_MTLCommandBuffer presentDrawable:options:](self, "presentDrawable:options:", a3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3));
    return;
  }
  if (a3)
  {
    if (!MTLFailureTypeGetEnabled(1uLL) || (objc_msgSend(a3, "conformsToProtocol:", &unk_1EDCF2028) & 1) != 0)
      goto LABEL_5;
    v10 = CFSTR("drawable is not a MTLDrawable.");
    v11 = 1;
    v12 = 879;
  }
  else
  {
    v10 = CFSTR("drawable must not be nil.");
    v11 = 0;
    v12 = 876;
  }
  MTLReportFailure(v11, "-[_MTLCommandBuffer presentDrawable:]", v12, (uint64_t)v10, v5, v6, v7, v8, v13[0]);
LABEL_5:
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __37___MTLCommandBuffer_presentDrawable___block_invoke;
  v14[3] = &unk_1E0FE3C98;
  v14[4] = a3;
  v14[5] = self;
  -[_MTLCommandBuffer addScheduledHandler:](self, "addScheduledHandler:", v14);
  self->_hasPresent = 1;
  ++self->_numPresentWaits;
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = (uint64_t)__37___MTLCommandBuffer_presentDrawable___block_invoke_2;
  v13[3] = (uint64_t)&unk_1E0FE5480;
  v13[4] = (uint64_t)self;
  objc_msgSend(a3, "addPresentScheduledHandler:", v13);
}

- (void)presentDrawable:(id)a3 options:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  _QWORD v23[7];
  char v24;

  if (!a3)
  {
    v15 = CFSTR("drawable must not be nil.");
    v16 = 826;
    goto LABEL_15;
  }
  if (MTLFailureTypeGetEnabled(1uLL) && (objc_msgSend(a3, "conformsToProtocol:", &unk_1EDCF3AF0) & 1) == 0)
    MTLReportFailure(1uLL, "-[_MTLCommandBuffer presentDrawable:options:]", 829, (uint64_t)CFSTR("drawable is not a MTLDrawableSPI."), v17, v18, v19, v20, v21);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v15 = CFSTR("drawable does not implement presentWithOptions:, is it a CAMetalDrawable?");
    v16 = 830;
LABEL_15:
    MTLReportFailure(0, "-[_MTLCommandBuffer presentDrawable:options:]", v16, (uint64_t)v15, v4, v5, v6, v7, v21);
    if (a4)
      goto LABEL_5;
    goto LABEL_16;
  }
  if (a4)
    goto LABEL_5;
LABEL_16:
  MTLReportFailure(0, "-[_MTLCommandBuffer presentDrawable:options:]", 833, (uint64_t)CFSTR("options must not be nil."), v4, v5, v6, v7, v21);
LABEL_5:
  v11 = (void *)objc_msgSend(a4, "copy");
  v12 = (void *)objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("enableFIFO"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v13 = objc_msgSend(v12, "BOOLValue");
  else
    v13 = 0;
  v14 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __45___MTLCommandBuffer_presentDrawable_options___block_invoke;
  v23[3] = &unk_1E0FE5458;
  v23[4] = a3;
  v23[5] = v11;
  v24 = v13;
  v23[6] = self;
  -[_MTLCommandBuffer addScheduledHandler:](self, "addScheduledHandler:", v23);
  self->_hasPresent = 1;
  if ((v13 & 1) == 0)
  {
    ++self->_numPresentWaits;
    v22[0] = v14;
    v22[1] = 3221225472;
    v22[2] = __45___MTLCommandBuffer_presentDrawable_options___block_invoke_2;
    v22[3] = &unk_1E0FE5480;
    v22[4] = self;
    objc_msgSend(a3, "addPresentScheduledHandler:", v22);
  }
}

- (void)addScheduledHandler:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;

  if (self->_status >= 2)
    MTLReportFailure(0, "-[_MTLCommandBuffer addScheduledHandler:]", 787, (uint64_t)CFSTR("Scheduled handler provided after commit call"), v3, v4, v5, v6, v9);
  MTLDispatchListAppendBlock(&self->_scheduledDispatchList, (_QWORD **)&self->_scheduledDispatchListTail, a3);
}

- (void)setErrorOptions:(unint64_t)a3
{
  self->_errorOptions = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)enqueue
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  if (!self->_status
    || (MTLReportFailure(0, "-[_MTLCommandBuffer enqueue]", 669, (uint64_t)CFSTR("enqueue an already enqueued command buffer"), v2, v3, v4, v5, v7), !self->_status))
  {
    if (self->_profilingEnabled)
      self->_enqueueTime = mach_absolute_time();
    -[MTLCommandQueue enqueueCommandBuffer:](self->_queue, "enqueueCommandBuffer:", self);
    self->_status = 1;
  }
}

- (double)GPUEndTime
{
  return *(double *)&time_scale * (double)self->_gpuEndTime;
}

- (NSMutableDictionary)userDictionary
{
  NSMutableDictionary *result;

  result = self->_userDictionary;
  if (!result)
  {
    result = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_userDictionary = result;
  }
  return result;
}

- (void)waitUntilScheduled
{
  _opaque_pthread_mutex_t *p_mutex;

  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  while (!self->_scheduledCallbacksDone)
    pthread_cond_wait(&self->_scheduledCond, p_mutex);
  pthread_mutex_unlock(p_mutex);
}

- (double)GPUStartTime
{
  return *(double *)&time_scale * (double)self->_gpuStartTime;
}

- (void)waitUntilCompleted
{
  _opaque_pthread_mutex_t *p_mutex;

  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  while (!self->_completedCallbacksDone)
    pthread_cond_wait(&self->_completedCond, p_mutex);
  pthread_mutex_unlock(p_mutex);
}

- (BOOL)retainedReferences
{
  return self->_retainedReferences;
}

- (double)kernelStartTime
{
  return *(double *)&time_scale * (double)self->_kernelStartTime;
}

- (double)kernelEndTime
{
  return *(double *)&time_scale * (double)self->_kernelEndTime;
}

+ (void)initialize
{
  unint64_t v2;
  unint64_t v3;
  mach_timebase_info info;

  info = 0;
  if (!mach_timebase_info(&info))
  {
    LODWORD(v2) = info.numer;
    LODWORD(v3) = info.denom;
    *(double *)&time_scale = (double)v2 / (double)v3 * 0.000000001;
  }
}

- (void)pushDebugGroup:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!a3)
  {
    v7 = CFSTR("string must not be nil.");
    v8 = 0;
    v9 = 1370;
LABEL_5:
    MTLReportFailure(v8, "-[_MTLCommandBuffer pushDebugGroup:]", v9, (uint64_t)v7, v3, v4, v5, v6, v10);
    return;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = CFSTR("string is not a NSString.");
    v8 = 1;
    v9 = 1373;
    goto LABEL_5;
  }
}

- (id)progressTrackingBlitCommandEncoder
{
  id result;

  self->_creatingProgressEncoder = 1;
  result = (id)-[_MTLCommandBuffer blitCommandEncoder](self, "blitCommandEncoder");
  self->_creatingProgressEncoder = 0;
  return result;
}

- (id)progressTrackingRenderCommandEncoder
{
  void *v3;
  void *v4;

  self->_creatingProgressEncoder = 1;
  v3 = (void *)objc_opt_new();
  v4 = (void *)-[_MTLCommandBuffer renderCommandEncoderWithDescriptor:](self, "renderCommandEncoderWithDescriptor:", v3);

  self->_creatingProgressEncoder = 0;
  return v4;
}

- (id)progressTrackingComputeCommandEncoder
{
  id result;

  self->_creatingProgressEncoder = 1;
  result = (id)-[_MTLCommandBuffer computeCommandEncoder](self, "computeCommandEncoder");
  self->_creatingProgressEncoder = 0;
  return result;
}

- (void)processEncoderInfos
{
  unsigned int v3;
  void *v4;
  int v5;
  uint64_t v6;
  int v7;

  if (self->_encoderInfos)
  {
    if (self->_needsFrameworkAssistedErrorTracking)
    {
      if (self->_progressOffset)
      {
        v3 = 0;
        do
        {
          v4 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_encoderInfos, "objectAtIndexedSubscript:", v3 >> 1);
          objc_msgSend(v4, "setErrorState:", 3);
          v5 = *(_DWORD *)(-[MTLBuffer contents](self->_progressBuffer, "contents") + 4 * v3);
          v6 = -[MTLBuffer contents](self->_progressBuffer, "contents");
          if (v5 == -1)
          {
            v7 = *(_DWORD *)(v6 + 4 * (v3 + 1));
            objc_msgSend(v4, "setErrorState:", 2);
            if (v7 == -1)
              objc_msgSend(v4, "setErrorState:", 1);
          }
          v3 += 2;
        }
        while (v3 < self->_progressOffset);
      }
    }
    else
    {
      -[_MTLCommandBuffer getDriverEncoderInfoData:](self, "getDriverEncoderInfoData:");
    }
  }
}

- (_MTLCommandBuffer)initWithQueue:(id)a3 retainedReferences:(BOOL)a4
{
  return -[_MTLCommandBuffer initWithQueue:retainedReferences:synchronousDebugMode:](self, "initWithQueue:retainedReferences:synchronousDebugMode:", a3, a4, 0);
}

- (void)encodeDashboardTagForResourceGroup:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  MTLReportFailure(0, "-[_MTLCommandBuffer encodeDashboardTagForResourceGroup:]", 538, (uint64_t)CFSTR("%s not supported on this device"), v3, v4, v5, v6, (uint64_t)"-[_MTLCommandBuffer encodeDashboardTagForResourceGroup:]");
}

- (void)encodeDashboardFinalizeForResourceGroup:(id)a3 dashboard:(unint64_t)a4 value:(unint64_t)a5 forIndex:(unint64_t)a6
{
  uint64_t v6;
  uint64_t v7;

  MTLReportFailure(0, "-[_MTLCommandBuffer encodeDashboardFinalizeForResourceGroup:dashboard:value:forIndex:]", 546, (uint64_t)CFSTR("%s not supported on this device"), a5, a6, v6, v7, (uint64_t)"-[_MTLCommandBuffer encodeDashboardFinalizeForResourceGroup:dashboard:value:forIndex:]");
}

- (void)encodeDashboardFinalizeForResourceGroup:(id)a3 dashboard:(unint64_t)a4 values:(const unint64_t *)a5 indices:(const unint64_t *)a6 count:(unint64_t)a7
{
  uint64_t v7;

  MTLReportFailure(0, "-[_MTLCommandBuffer encodeDashboardFinalizeForResourceGroup:dashboard:values:indices:count:]", 557, (uint64_t)CFSTR("%s not supported on this device"), (uint64_t)a5, (uint64_t)a6, a7, v7, (uint64_t)"-[_MTLCommandBuffer encodeDashboardFinalizeForResourceGroup:dashboard:values:indices:count:]");
}

- (id)formattedDescription:(unint64_t)a3
{
  unint64_t v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  id v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  objc_super v14;
  _QWORD v15[13];

  v15[12] = *MEMORY[0x1E0C80C00];
  v4 = a3 + 4;
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v6 = -[_MTLObjectWithLabel retainedLabel](self, "retainedLabel");
  v7 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)_MTLCommandBuffer;
  v8 = -[_MTLCommandBuffer description](&v14, sel_description);
  v15[0] = v5;
  v15[1] = CFSTR("label =");
  v9 = CFSTR("<none>");
  if (v6)
    v9 = v6;
  v15[2] = v9;
  v15[3] = v5;
  v15[4] = CFSTR("device =");
  v10 = (const __CFString *)objc_msgSend((id)-[_MTLCommandBuffer device](self, "device"), "formattedDescription:", v4);
  v11 = CFSTR("<null>");
  if (!v10)
    v10 = CFSTR("<null>");
  v15[5] = v10;
  v15[6] = v5;
  v15[7] = CFSTR("commandQueue =");
  if (self->_queue)
    v11 = (const __CFString *)-[MTLCommandQueue formattedDescription:](self->_queue, "formattedDescription:", v4);
  v15[8] = v11;
  v15[9] = v5;
  v15[10] = CFSTR("retainedReferences =");
  v15[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_retainedReferences);
  v12 = (void *)objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@"), v8, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 12), "componentsJoinedByString:", CFSTR(" ")));

  return v12;
}

- (id)description
{
  return -[_MTLCommandBuffer formattedDescription:](self, "formattedDescription:", 0);
}

- (void)commitAndHold
{
  self->_wakeOnCommit = 0;
  -[_MTLCommandBuffer commit](self, "commit");
}

- (void)commitAndReset
{
  MTLDispatch *scheduledDispatchList;
  MTLDispatch *completedDispatchList;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t status;
  MTLCommandEncoder *currentCommandEncoder;
  uint64_t v12;

  currentCommandEncoder = self->_currentCommandEncoder;
  self->_currentCommandEncoder = 0;
  scheduledDispatchList = self->_scheduledDispatchList;
  self->_scheduledDispatchList = 0;
  self->_scheduledDispatchListTail = 0;
  completedDispatchList = self->_completedDispatchList;
  self->_completedDispatchList = 0;
  self->_completedDispatchListTail = 0;
  -[_MTLCommandBuffer commit](self, "commit");
  -[_MTLCommandBuffer waitUntilCompleted](self, "waitUntilCompleted");
  status = self->_status;
  self->_status = 0;
  self->_error = 0;
  self->_scheduledCallbacksDone = 0;
  self->_completedCallbacksDone = 0;
  v5 = mach_absolute_time();
  if (self->_profilingEnabled)
    self->_creationTime = v5;
  if (MEMORY[0x1E0D227A8] && !self->_didComplete)
    FPCommandBufferCompleted();
  self->_didComplete = 0;
  if (MEMORY[0x1E0D227B0])
    FPCommandBufferCreated();
  self->_currentCommandEncoder = currentCommandEncoder;
  self->_scheduledDispatchList = scheduledDispatchList;
  self->_scheduledDispatchListTail = scheduledDispatchList;
  self->_completedDispatchList = completedDispatchList;
  self->_completedDispatchListTail = completedDispatchList;
  if (status != 4)
    MTLReportFailure(0, "-[_MTLCommandBuffer commitAndReset]", 778, (uint64_t)CFSTR("Command buffer failed"), v6, v7, v8, v9, v12);
}

- (void)presentDrawable:(id)a3 atTime:(double)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  _QWORD v17[7];
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  if (_MTLShouldRemapPresent())
  {
    v18[0] = CFSTR("enableFIFO");
    v18[1] = CFSTR("presentationMode");
    v19[0] = MEMORY[0x1E0C9AAB0];
    v19[1] = &unk_1E103B468;
    v18[2] = CFSTR("presentTimeInterval");
    v19[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    -[_MTLCommandBuffer presentDrawable:options:](self, "presentDrawable:options:", a3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3));
    return;
  }
  if (a3)
  {
    if (!MTLFailureTypeGetEnabled(1uLL) || (objc_msgSend(a3, "conformsToProtocol:", &unk_1EDCF2028) & 1) != 0)
      goto LABEL_5;
    v12 = CFSTR("drawable is not a MTLDrawable.");
    v13 = 1;
    v14 = 912;
  }
  else
  {
    v12 = CFSTR("drawable must not be nil.");
    v13 = 0;
    v14 = 909;
  }
  MTLReportFailure(v13, "-[_MTLCommandBuffer presentDrawable:atTime:]", v14, (uint64_t)v12, v7, v8, v9, v10, v15);
LABEL_5:
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __44___MTLCommandBuffer_presentDrawable_atTime___block_invoke;
  v17[3] = &unk_1E0FE54A8;
  *(double *)&v17[6] = a4;
  v17[4] = a3;
  v17[5] = self;
  -[_MTLCommandBuffer addScheduledHandler:](self, "addScheduledHandler:", v17);
  self->_hasPresent = 1;
  ++self->_numPresentWaits;
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __44___MTLCommandBuffer_presentDrawable_atTime___block_invoke_2;
  v16[3] = &unk_1E0FE5480;
  v16[4] = self;
  objc_msgSend(a3, "addPresentScheduledHandler:", v16);
}

- (void)presentDrawable:(id)a3 afterMinimumDuration:(double)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  _QWORD v17[7];
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  if (_MTLShouldRemapPresent())
  {
    v18[0] = CFSTR("enableFIFO");
    v18[1] = CFSTR("presentationMode");
    v19[0] = MEMORY[0x1E0C9AAB0];
    v19[1] = &unk_1E103B480;
    v18[2] = CFSTR("presentTimeInterval");
    v19[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    -[_MTLCommandBuffer presentDrawable:options:](self, "presentDrawable:options:", a3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3));
    return;
  }
  if (a3)
  {
    if (!MTLFailureTypeGetEnabled(1uLL) || (objc_msgSend(a3, "conformsToProtocol:", &unk_1EDCF2028) & 1) != 0)
      goto LABEL_5;
    v12 = CFSTR("drawable is not a MTLDrawable.");
    v13 = 1;
    v14 = 948;
  }
  else
  {
    v12 = CFSTR("drawable must not be nil.");
    v13 = 0;
    v14 = 945;
  }
  MTLReportFailure(v13, "-[_MTLCommandBuffer presentDrawable:afterMinimumDuration:]", v14, (uint64_t)v12, v7, v8, v9, v10, v15);
LABEL_5:
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __58___MTLCommandBuffer_presentDrawable_afterMinimumDuration___block_invoke;
  v17[3] = &unk_1E0FE54A8;
  *(double *)&v17[6] = a4;
  v17[4] = a3;
  v17[5] = self;
  -[_MTLCommandBuffer addScheduledHandler:](self, "addScheduledHandler:", v17);
  self->_hasPresent = 1;
  ++self->_numPresentWaits;
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __58___MTLCommandBuffer_presentDrawable_afterMinimumDuration___block_invoke_2;
  v16[3] = &unk_1E0FE5480;
  v16[4] = self;
  objc_msgSend(a3, "addPresentScheduledHandler:", v16);
}

- (void)_addRetainedObject:(id)a3
{
  NSMutableArray *retainedObjects;

  retainedObjects = self->_retainedObjects;
  if (!retainedObjects)
  {
    retainedObjects = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_retainedObjects = retainedObjects;
  }
  -[NSMutableArray addObject:](retainedObjects, "addObject:", a3);
}

- (void)kernelSubmitTime
{
  self->_submitToKernelTime = mach_absolute_time();
}

- (void)setProfilingEnabled:(BOOL)a3
{
  self->_profilingEnabled = a3;
}

- (NSDictionary)profilingResults
{
  NSDictionary *v3;
  _QWORD v5[10];
  _QWORD v6[11];

  v6[10] = *MEMORY[0x1E0C80C00];
  if (!self->_profilingEnabled)
    return 0;
  v5[0] = CFSTR("MTLCommandBufferCreationTime");
  v6[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_creationTime);
  v5[1] = CFSTR("MTLCommandBufferEnqueueTime");
  v6[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_enqueueTime);
  v5[2] = CFSTR("MTLCommandBufferCommitTime");
  v6[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_commitTime);
  v5[3] = CFSTR("MTLCommandBufferSubmitToKernelTime");
  v6[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_submitToKernelTime);
  v5[4] = CFSTR("MTLCommandBufferKernelScheduledTime");
  v6[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_kernelEndTime);
  v5[5] = CFSTR("MTLCommandBufferSubmitToHWTime");
  v6[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_submitToHardwareTime);
  v5[6] = CFSTR("MTLCommandBufferCompletionInterruptTime");
  v6[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_completionInterruptTime);
  v5[7] = CFSTR("MTLCommandBufferKernelCompleteTime");
  v6[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_gpuEndTime);
  v5[8] = CFSTR("MTLCommandBufferCompletionHandlerEnqueueTime");
  v6[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_completionHandlerEnqueueTime);
  v5[9] = CFSTR("MTLCommandBufferCompletionHandlerExecutionTime");
  v6[9] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_completionHandlerExecutionTime);
  v3 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 10);
  self->_profilingResults = v3;
  return v3;
}

- (unint64_t)getAndIncrementNumEncoders
{
  unint64_t numEncoders;

  numEncoders = self->_numEncoders;
  self->_numEncoders = numEncoders + 1;
  return numEncoders;
}

- (void)addSynchronizationNotification:(id)a3
{
  MTLSyncDispatch *v5;
  void *v6;
  MTLSyncDispatch **p_syncDispatchListTail;
  MTLSyncDispatch *syncDispatchListTail;

  v5 = (MTLSyncDispatch *)malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
  v6 = _Block_copy(a3);
  v5->var0 = 0;
  v5->var1 = v6;
  p_syncDispatchListTail = &self->_syncDispatchListTail;
  syncDispatchListTail = self->_syncDispatchListTail;
  if (syncDispatchListTail)
  {
    syncDispatchListTail->var0 = v5;
  }
  else
  {
    *p_syncDispatchListTail = v5;
    p_syncDispatchListTail = &self->_syncDispatchList;
  }
  *p_syncDispatchListTail = v5;
}

- (void)executeSynchronizationNotifications:(int)a3 scope:(unint64_t)a4 resources:(const void *)a5 count:(unint64_t)a6
{
  _QWORD v6[4];

  v6[1] = a4;
  v6[0] = a3;
  v6[2] = a5;
  v6[3] = a6;
  if (self->_syncDispatchList)
    _doMTLSyncDispatch((uint64_t)self, (_QWORD **)&self->_syncDispatchList, &self->_syncDispatchListTail, v6);
}

- (id)computeCommandEncoderWithDescriptor:(id)a3
{
  return -[_MTLCommandBuffer computeCommandEncoderWithDispatchType:](self, "computeCommandEncoderWithDispatchType:", objc_msgSend(a3, "dispatchType"));
}

- (void)debugBufferContentsWithLength:(unint64_t *)a3
{
  if (a3)
    *a3 = 0;
  return 0;
}

- (id)accelerationStructureCommandEncoder
{
  if (objc_msgSend((id)-[_MTLCommandBuffer device](self, "device"), "requiresRaytracingEmulation"))
    return -[_MTLSWRaytracingAccelerationStructureCommandEncoder initWithCommandBuffer:]([_MTLSWRaytracingAccelerationStructureCommandEncoder alloc], "initWithCommandBuffer:", self);
  -[_MTLCommandBuffer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)accelerationStructureCommandEncoderWithDescriptor:(id)a3
{
  if (objc_msgSend((id)-[_MTLCommandBuffer device](self, "device"), "requiresRaytracingEmulation"))
    return -[_MTLSWRaytracingAccelerationStructureCommandEncoder initWithCommandBuffer:descriptor:]([_MTLSWRaytracingAccelerationStructureCommandEncoder alloc], "initWithCommandBuffer:descriptor:", self, a3);
  -[_MTLCommandBuffer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)commitWithDeadline:(unint64_t)a3
{
  -[_MTLCommandBuffer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (BOOL)commitAndWaitUntilSubmittedWithDeadline:(unint64_t)a3
{
  self->_wakeOnCommit = 0;
  -[_MTLCommandBuffer commitWithDeadline:](self, "commitWithDeadline:", a3);
  return -[MTLCommandQueue submitCommandBuffer:](self->_queue, "submitCommandBuffer:", self);
}

- (NSArray)logs
{
  if (self->_logs)
    return self->_logs;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)setLogs:(id)a3
{
  id v5;

  v5 = a3;

  self->_logs = (NSArray *)a3;
}

- (void)encodeConditionalAbortEvent:(id)a3
{
  -[_MTLCommandBuffer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setResponsibleTaskIDs:(const unsigned int *)a3 count:(unsigned int)a4
{
  -[_MTLCommandBuffer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, *(_QWORD *)&a4);
}

- (void)useResidencySet:(id)a3
{
  -[_MTLCommandBuffer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4
{
  -[_MTLCommandBuffer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)configWithCommandBufferDescriptor:(id)a3
{
  MTLLogState *logState;
  MTLLogState *v6;

  if (objc_msgSend(a3, "logState"))
  {
    logState = self->_logState;
    if (!logState)
    {
      -[MTLCommandQueue getPrivateDataAndOffset:privateDataOffset:](self->_queue, "getPrivateDataAndOffset:privateDataOffset:", &self->_privateData, &self->_privateDataOffset);
      logState = self->_logState;
    }

    v6 = (MTLLogState *)(id)objc_msgSend(a3, "logState");
    self->_logState = v6;
    self->_requiresBindingLogState = v6 != 0;
  }
}

- (void)bindLogState
{
  -[_MTLCommandBuffer useInternalResidencySet:](self, "useInternalResidencySet:", *((_QWORD *)self->_logState + 4));
}

- (BOOL)synchronousDebugMode
{
  return self->_synchronousDebugMode;
}

- (MTLBuffer)privateData
{
  return self->_privateData;
}

- (void)setPrivateData:(id)a3
{
  self->_privateData = (MTLBuffer *)a3;
}

- (unint64_t)privateDataOffset
{
  return self->_privateDataOffset;
}

- (void)setPrivateDataOffset:(unint64_t)a3
{
  self->_privateDataOffset = a3;
}

- (MTLBuffer)privateLoggingBuffer
{
  return self->_privateLoggingBuffer;
}

- (void)setPrivateLoggingBuffer:(id)a3
{
  self->_privateLoggingBuffer = (MTLBuffer *)a3;
}

- (void)setStatEnabled:(BOOL)a3
{
  self->_StatEnabled = a3;
}

- (unint64_t)getListIndex
{
  return self->_listIndex;
}

- (unint64_t)numThisCommandBuffer
{
  return self->_numThisCommandBuffer;
}

- (void)setNumThisCommandBuffer:(unint64_t)a3
{
  self->_numThisCommandBuffer = a3;
}

- (unint64_t)numEncoders
{
  return self->_numEncoders;
}

- (void)setNumEncoders:(unint64_t)a3
{
  self->_numEncoders = a3;
}

- (void)setOwnedByParallelEncoder:(BOOL)a3
{
  self->_ownedByParallelEncoder = a3;
}

- (MTLDeadlineProfile)deadlineProfile
{
  return (MTLDeadlineProfile *)objc_getProperty(self, a2, 536, 1);
}

- (void)didScheduleWithStartTime:(id *)a1 endTime:error:.cold.1(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, *MEMORY[0x1E0C80C00]), "UTF8String");
  OUTLINED_FUNCTION_0_2(&dword_182636000, MEMORY[0x1E0C81028], v1, "Execution of the command buffer was aborted due to an error during execution. %{public}s", v2, v3, v4, v5, 2u);
}

@end

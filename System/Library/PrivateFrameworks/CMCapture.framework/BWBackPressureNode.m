@implementation BWBackPressureNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs", a3), "objectAtIndexedSubscript:", objc_msgSend(a4, "index")), "setFormat:", objc_msgSend(a4, "format"));
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs", a3, a4), "objectAtIndexedSubscript:", objc_msgSend(a5, "index")), "makeConfiguredFormatLive");
}

- (id)nodeType
{
  return CFSTR("Synchronizer");
}

- (BWBackPressureNode)initWithNumberOfInputsAndOutputs:(unsigned int)a3 initialSemaphoreValue:(int64_t)a4
{
  BWBackPressureNode *v6;
  uint64_t v7;
  uint64_t v8;
  BWNodeInput *v9;
  BWNodeOutput *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BWBackPressureNode;
  v6 = -[BWNode init](&v12, sel_init);
  if (v6)
  {
    if (a4)
      v6->_semaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(a4);
    v6->_initialSemaphoreValue = a4;
    v6->_numberOfInputs = a3;
    v6->_presentationTimestampLock._os_unfair_lock_opaque = 0;
    v6->_receivedPresentationTimestampByInput = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v6->_numberOfInputs);
    if (a3)
    {
      v7 = 0;
      v8 = a3;
      do
      {
        v9 = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v6, v7);
        -[BWNodeInput setFormatRequirements:](v9, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
        -[BWNodeInput setPassthroughMode:](v9, "setPassthroughMode:", 1);
        -[BWNode addInput:](v6, "addInput:", v9);

        v10 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v6);
        -[BWNodeOutput setFormatRequirements:](v10, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
        -[BWNodeOutput setPassthroughMode:](v10, "setPassthroughMode:", 1);
        -[BWNodeOutput setIndexOfInputWhichDrivesThisOutput:](v10, "setIndexOfInputWhichDrivesThisOutput:", v7);
        -[BWNode addOutput:](v6, "addOutput:", v10);

        -[NSMutableArray setObject:atIndexedSubscript:](v6->_receivedPresentationTimestampByInput, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "array"), v7++);
      }
      while (v8 != v7);
    }
    v6->_limitedGMErrorLogger = -[BWLimitedGMErrorLogger initWithName:maxLoggingCount:]([BWLimitedGMErrorLogger alloc], "initWithName:maxLoggingCount:", CFSTR("Back Pressure"), 10);
    v6->_stateLock._os_unfair_lock_opaque = 0;
    -[BWNode setSupportsConcurrentLiveInputCallbacks:](v6, "setSupportsConcurrentLiveInputCallbacks:", 1);
  }
  return v6;
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  os_unfair_lock_s *p_stateLock;
  objc_super v4;

  if (!self->_semaphore)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Initial semaphore value must be set before format resolution"), 0));
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  self->_numEODMessagesReceived = 0;
  os_unfair_lock_unlock(p_stateLock);
  v4.receiver = self;
  v4.super_class = (Class)BWBackPressureNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v4, sel_prepareForCurrentConfigurationToBecomeLive);
}

- (void)setInitialSemaphoreValue:(int)a3
{
  int64_t v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;

  if (!a3)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99768];
    v7 = CFSTR("Initial semaphore value must be non-zero");
    goto LABEL_6;
  }
  if (self->_semaphore)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99768];
    v7 = CFSTR("Initial semaphore value can only be set once");
LABEL_6:
    objc_exception_throw((id)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0));
  }
  v4 = a3;
  self->_semaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(a3);
  self->_initialSemaphoreValue = v4;
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (void)setSemaphoreSignalQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (void)setBackPressureSourceNode:(id)a3
{
  self->_backPressureSourceNode = (BWNodeBackPressureSource *)a3;
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

- (BWBackPressureNode)init
{
  -[BWBackPressureNode doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  os_unfair_lock_lock(&self->_presentationTimestampLock);
  os_unfair_lock_unlock(&self->_presentationTimestampLock);

  v3.receiver = self;
  v3.super_class = (Class)BWBackPressureNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (void)_setSemaphore:(id)a3
{
  OS_dispatch_semaphore *semaphore;

  semaphore = self->_semaphore;
  if (semaphore != a3)
  {

    self->_semaphore = (OS_dispatch_semaphore *)a3;
  }
}

- (id)nodeSubType
{
  return CFSTR("BackPressure");
}

- (void)didReachEndOfDataForInput:(id)a3
{
  os_unfair_lock_s *p_stateLock;
  uint64_t numEODMessagesReceived;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  numEODMessagesReceived = self->_numEODMessagesReceived;
  self->_numEODMessagesReceived = numEODMessagesReceived + 1;
  if (-[NSArray count](-[BWNode inputs](self, "inputs"), "count") == numEODMessagesReceived + 1)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = -[BWNode outputs](self, "outputs", 0);
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "markEndOfLiveOutput");
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }
  }
  os_unfair_lock_unlock(p_stateLock);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v6;
  id v7;
  CFTypeRef v8;
  const void *v9;
  CFTypeID v10;
  CMTime v11;
  CMTime v12;

  v6 = objc_msgSend(a4, "index");
  v7 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", v6);
  memset(&v12, 0, sizeof(v12));
  CMSampleBufferGetPresentationTimeStamp(&v12, a3);
  if (BWSampleBufferIsMarkerBuffer(a3))
  {
    -[BWLimitedGMErrorLogger resetCurrentLoggingCounter](self->_limitedGMErrorLogger, "resetCurrentLoggingCounter");
    v8 = CMGetAttachment(a3, CFSTR("FileWriterAction"), 0);
    if (v8)
    {
      v9 = v8;
      v10 = CFGetTypeID(v8);
      if (v10 == CFStringGetTypeID()
        && (CFEqual(v9, CFSTR("Stop"))
         || CFEqual(v9, CFSTR("Pause"))
         || CFEqual(v9, CFSTR("Flush"))
         || CFEqual(v9, CFSTR("Terminate"))))
      {
        self->_receivedFirstFrame = 0;
        -[BWNodeBackPressureSource setFirstFrameProcessed:](self->_backPressureSourceNode, "setFirstFrameProcessed:", 0);
      }
    }
  }
  else
  {
    v11 = v12;
    -[BWBackPressureNode _handleUpdatedPresentationTimestamp:forIndex:](self, "_handleUpdatedPresentationTimestamp:forIndex:", &v11, v6);
  }
  objc_msgSend(v7, "emitSampleBuffer:", a3);
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  uint64_t v6;
  id v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  v6 = objc_msgSend(a4, "index");
  v7 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", v6);
  if ((objc_msgSend((id)objc_msgSend(a3, "backPressureSemaphoresToIgnore"), "containsObject:", self->_semaphore) & 1) == 0)
  {
    v10 = 0uLL;
    v11 = 0;
    if (a3)
      objc_msgSend(a3, "pts");
    v8 = v10;
    v9 = v11;
    -[BWBackPressureNode _handleUpdatedPresentationTimestamp:forIndex:](self, "_handleUpdatedPresentationTimestamp:forIndex:", &v8, v6);
  }
  objc_msgSend(v7, "emitDroppedSample:", a3);
}

- (void)_handleUpdatedPresentationTimestamp:(id *)a3 forIndex:(unint64_t)a4
{
  double Seconds;
  os_unfair_lock_s *p_presentationTimestampLock;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unsigned int numberOfInputs;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  int v20;
  double v21;
  void *v22;
  unint64_t i;
  uint64_t v24;
  NSObject *semaphoreSignalQueue;
  _QWORD v26[2];
  os_unfair_lock_s *v27;
  _QWORD block[5];
  CMTime time;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  time = *(CMTime *)a3;
  Seconds = CMTimeGetSeconds(&time);
  if ((a3->var2 & 1) == 0)
    -[BWLimitedGMErrorLogger logErrorNumber:errorString:](self->_limitedGMErrorLogger, "logErrorNumber:errorString:", 0, CFSTR("Backpressure received unexpected invalid PTS"));
  p_presentationTimestampLock = &self->_presentationTimestampLock;
  os_unfair_lock_lock(&self->_presentationTimestampLock);
  MEMORY[0x1E0C80A78](v9, v10, v11, v12);
  v14 = (char *)v26 - v13;
  numberOfInputs = self->_numberOfInputs;
  if (!numberOfInputs)
    goto LABEL_15;
  v26[1] = v26;
  v27 = &self->_presentationTimestampLock;
  v16 = 0;
  v17 = 0;
  do
  {
    *(_DWORD *)&v14[4 * v16] = -1;
    if (v16 != a4)
    {
      v18 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_receivedPresentationTimestampByInput, "objectAtIndexedSubscript:", v16);
      if (objc_msgSend(v18, "count"))
      {
        v19 = 0;
        v20 = 0;
        while (1)
        {
          objc_msgSend((id)objc_msgSend(v18, "objectAtIndexedSubscript:", v19), "doubleValue");
          if (vabdd_f64(v21, Seconds) < 0.00001)
            break;
          v19 = ++v20;
          if (objc_msgSend(v18, "count") <= (unint64_t)v20)
            goto LABEL_10;
        }
        *(_DWORD *)&v14[4 * v16] = v20;
      }
      else
      {
LABEL_10:
        v20 = -1;
      }
      v17 += v20 >= 0;
      numberOfInputs = self->_numberOfInputs;
    }
    ++v16;
  }
  while (v16 < numberOfInputs);
  p_presentationTimestampLock = v27;
  if (v17 >= numberOfInputs - 1)
  {
    if (numberOfInputs)
    {
      for (i = 0; i < numberOfInputs; ++i)
      {
        v24 = *(unsigned int *)&v14[4 * i];
        if ((v24 & 0x80000000) == 0)
        {
          objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_receivedPresentationTimestampByInput, "objectAtIndexedSubscript:", i), "removeObjectAtIndex:", v24);
          numberOfInputs = self->_numberOfInputs;
        }
      }
    }
    os_unfair_lock_unlock(p_presentationTimestampLock);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__BWBackPressureNode__handleUpdatedPresentationTimestamp_forIndex___block_invoke;
    block[3] = &unk_1E491E720;
    block[4] = self;
    semaphoreSignalQueue = self->_semaphoreSignalQueue;
    if (semaphoreSignalQueue)
      dispatch_async(semaphoreSignalQueue, block);
    else
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
    if (!self->_receivedFirstFrame)
    {
      self->_receivedFirstFrame = 1;
      -[BWNodeBackPressureSource setFirstFrameProcessed:](self->_backPressureSourceNode, "setFirstFrameProcessed:", 1);
    }
  }
  else
  {
LABEL_15:
    v22 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_receivedPresentationTimestampByInput, "objectAtIndexedSubscript:", a4);
    objc_msgSend(v22, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", Seconds));
    objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_receivedPresentationTimestampByInput, "objectAtIndexedSubscript:", a4), "count");
    os_unfair_lock_unlock(p_presentationTimestampLock);
  }
}

intptr_t __67__BWBackPressureNode__handleUpdatedPresentationTimestamp_forIndex___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 96));
}

- (OS_dispatch_queue)semaphoreSignalQueue
{
  return self->_semaphoreSignalQueue;
}

- (BWNodeBackPressureSource)backPressureSourceNode
{
  return self->_backPressureSourceNode;
}

@end

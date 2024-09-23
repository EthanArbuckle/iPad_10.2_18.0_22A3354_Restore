@implementation AVAssetWriterInputTerminalHelper

- (AVAssetWriterInputTerminalHelper)initWithConfigurationState:(id)a3
{
  return -[AVAssetWriterInputTerminalHelper initWithConfigurationState:terminalStatus:](self, "initWithConfigurationState:terminalStatus:", a3, 0);
}

- (AVAssetWriterInputTerminalHelper)initWithConfigurationState:(id)a3 terminalStatus:(int64_t)a4
{
  AVAssetWriterInputTerminalHelper *result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AVAssetWriterInputTerminalHelper;
  result = -[AVAssetWriterInputHelper initWithConfigurationState:](&v13, sel_initWithConfigurationState_, a3);
  if ((unint64_t)(a4 - 2) >= 3)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)result, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v7, v8, v9, v10, v11, (uint64_t)"(terminalStatus == AVAssetWriterStatusCompleted) || (terminalStatus == AVAssetWriterStatusCancelled) || (terminalStatus == AVAssetWriterStatusFailed)"), 0);
    objc_exception_throw(v12);
  }
  if (result)
    result->_terminalStatus = a4;
  return result;
}

- (int64_t)status
{
  return self->_terminalStatus;
}

- (id)transitionToAndReturnTerminalHelperWithTerminalStatus:(int64_t)a3
{
  return 0;
}

- (BOOL)isReadyForMoreMediaData
{
  objc_super v4;

  if (-[AVAssetWriterInputTerminalHelper status](self, "status") == 3)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)AVAssetWriterInputTerminalHelper;
  return -[AVAssetWriterInputHelper isReadyForMoreMediaData](&v4, sel_isReadyForMoreMediaData);
}

- (void)requestMediaDataWhenReadyOnQueue:(id)a3 usingBlock:(id)a4
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  objc_super v28;

  if (-[AVAssetWriterInputTerminalHelper status](self, "status") == 3)
  {
    if (self->_didRequestMediaDataOnce)
    {
      v13 = (void *)MEMORY[0x1E0C99DA0];
      v14 = *MEMORY[0x1E0C99768];
      v15 = (objc_class *)objc_opt_class();
      v21 = AVMethodExceptionReasonWithClassAndSelector(v15, a2, (uint64_t)CFSTR("cannot be called more than once."), v16, v17, v18, v19, v20, v27);
      v22 = v13;
      v23 = v14;
    }
    else
    {
      self->_didRequestMediaDataOnce = 1;
      if (a3)
      {
        if (a4)
        {
          dispatch_async((dispatch_queue_t)a3, a4);
          return;
        }
        v24 = (void *)MEMORY[0x1E0C99DA0];
        v25 = *MEMORY[0x1E0C99778];
        v26 = "block != nil";
      }
      else
      {
        v24 = (void *)MEMORY[0x1E0C99DA0];
        v25 = *MEMORY[0x1E0C99778];
        v26 = "queue != NULL";
      }
      v21 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v8, v9, v10, v11, v12, (uint64_t)v26);
      v22 = v24;
      v23 = v25;
    }
    objc_exception_throw((id)objc_msgSend(v22, "exceptionWithName:reason:userInfo:", v23, v21, 0));
  }
  v28.receiver = self;
  v28.super_class = (Class)AVAssetWriterInputTerminalHelper;
  -[AVAssetWriterInputHelper requestMediaDataWhenReadyOnQueue:usingBlock:](&v28, sel_requestMediaDataWhenReadyOnQueue_usingBlock_, a3, a4);
}

- (void)stopRequestingMediaData
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AVAssetWriterInputTerminalHelper;
  -[AVAssetWriterInputHelper stopRequestingMediaData](&v2, sel_stopRequestingMediaData);
}

- (BOOL)mediaDataRequesterShouldRequestMediaData
{
  id v3;
  int64_t v4;
  BOOL result;

  v3 = -[AVWeakReference referencedObject](-[AVAssetWriterInputHelper weakReferenceToAssetWriterInput](self, "weakReferenceToAssetWriterInput"), "referencedObject");
  v4 = -[AVAssetWriterInputTerminalHelper status](self, "status");
  result = 0;
  if (v4 == 3 && v3)
  {
    if (objc_msgSend(v3, "numberOfAppendFailures"))
      return 0;
    else
      return objc_msgSend(v3, "_markAsFinishedCalled") ^ 1;
  }
  return result;
}

- (void)requestMediaDataOnceIfNecessaryWithMediaDataRequester:(id)a3
{
  NSObject *v5;
  _QWORD v6[6];

  v5 = objc_msgSend(a3, "requestQueue");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __90__AVAssetWriterInputTerminalHelper_requestMediaDataOnceIfNecessaryWithMediaDataRequester___block_invoke;
  v6[3] = &unk_1E302FCE8;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async(v5, v6);
}

uint64_t __90__AVAssetWriterInputTerminalHelper_requestMediaDataOnceIfNecessaryWithMediaDataRequester___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "requestMediaDataIfNecessary");
  return objc_msgSend(*(id *)(a1 + 32), "setDelegate:", 0);
}

- (BOOL)canStartRespondingToEachPassDescriptionReturningReason:(id *)a3
{
  int64_t v4;

  v4 = -[AVAssetWriterInputTerminalHelper status](self, "status");
  if (a3 && v4 != 3)
    *a3 = CFSTR("cannot be called after canceling or finishing writing");
  return v4 == 3;
}

- (int64_t)appendSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  return 2;
}

- (BOOL)appendPixelBuffer:(__CVBuffer *)a3 withPresentationTime:(id *)a4
{
  return 0;
}

- (BOOL)appendTaggedPixelBufferGroup:(OpaqueCMTaggedBufferGroup *)a3 withPresentationTime:(id *)a4
{
  return 0;
}

- (int64_t)appendCaption:(id)a3 error:(id *)a4
{
  return 2;
}

- (int64_t)appendCaptionGroup:(id)a3 error:(id *)a4
{
  return 2;
}

- (void)markCurrentPassAsFinished
{
  objc_super v3;

  if (-[AVAssetWriterInputTerminalHelper status](self, "status") == 2)
  {
    v3.receiver = self;
    v3.super_class = (Class)AVAssetWriterInputTerminalHelper;
    -[AVAssetWriterInputHelper markCurrentPassAsFinished](&v3, sel_markCurrentPassAsFinished);
  }
}

@end

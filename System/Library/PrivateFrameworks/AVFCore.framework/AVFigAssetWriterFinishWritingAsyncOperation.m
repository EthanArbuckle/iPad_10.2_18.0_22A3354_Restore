@implementation AVFigAssetWriterFinishWritingAsyncOperation

- (AVFigAssetWriterFinishWritingAsyncOperation)init
{
  void *v4;
  uint64_t v5;
  NSString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  v6 = NSStringFromSelector(sel_initWithFigAssetWriter_);
  v12 = (void *)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Not available.  Use %@ instead."), v7, v8, v9, v10, v11, (uint64_t)v6), 0);
  objc_exception_throw(v12);
}

- (AVFigAssetWriterFinishWritingAsyncOperation)initWithFigAssetWriter:(OpaqueFigAssetWriter *)a3
{
  AVFigAssetWriterFinishWritingAsyncOperation *v4;
  AVFigAssetWriterFinishWritingAsyncOperation *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  if (!a3)
  {
    v8 = self;
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v9, v10, v11, v12, v13, (uint64_t)"figAssetWriter != NULL"), 0);
    objc_exception_throw(v14);
  }
  v15.receiver = self;
  v15.super_class = (Class)AVFigAssetWriterFinishWritingAsyncOperation;
  v4 = -[AVOperation init](&v15, sel_init);
  if (v4)
  {
    v4->_figAssetWriter = (OpaqueFigAssetWriter *)CFRetain(a3);
    v4->_notificationHandler = -[AVAssetWriterFigAssetWriterNotificationHandler initWithFigAssetWriter:]([AVAssetWriterFigAssetWriterNotificationHandler alloc], "initWithFigAssetWriter:", a3);
  }
  return v4;
}

- (void)dealloc
{
  OpaqueFigAssetWriter *figAssetWriter;
  objc_super v4;

  figAssetWriter = self->_figAssetWriter;
  if (figAssetWriter)
    CFRelease(figAssetWriter);

  v4.receiver = self;
  v4.super_class = (Class)AVFigAssetWriterFinishWritingAsyncOperation;
  -[AVOperation dealloc](&v4, sel_dealloc);
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)start
{
  OpaqueFigAssetWriter *figAssetWriter;
  uint64_t (*v4)(OpaqueFigAssetWriter *);
  uint64_t v5;
  uint64_t v6;

  if (-[AVOperation evaluateDependenciesAndMarkAsExecuting](self, "evaluateDependenciesAndMarkAsExecuting"))
  {
    -[AVAssetWriterFigAssetWriterNotificationHandler setDelegate:](self->_notificationHandler, "setDelegate:", self);
    figAssetWriter = self->_figAssetWriter;
    v4 = *(uint64_t (**)(OpaqueFigAssetWriter *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 128);
    if (!v4)
    {
      v6 = 4294954514;
LABEL_8:
      -[AVOperation markAsFailedWithError:](self, "markAsFailedWithError:", +[AVAssetWriter _errorForOSStatus:](AVAssetWriter, "_errorForOSStatus:", v6));
      return;
    }
    v5 = v4(figAssetWriter);
    if ((_DWORD)v5)
    {
      v6 = v5;
      if ((_DWORD)v5 == -12785)
      {
        -[AVOperation markAsCancelled](self, "markAsCancelled", v5);
        return;
      }
      goto LABEL_8;
    }
  }
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVFigAssetWriterFinishWritingAsyncOperation;
  -[AVFigAssetWriterFinishWritingAsyncOperation cancel](&v3, sel_cancel);
  -[AVOperation markAsCancelled](self, "markAsCancelled");
}

- (void)didEnterTerminalState
{
  uint64_t FigBaseObject;
  uint64_t v3;
  void (*v4)(uint64_t);

  if ((unint64_t)(-[AVOperation status](self, "status") - 3) <= 1)
  {
    FigBaseObject = FigAssetWriterGetFigBaseObject();
    if (FigBaseObject)
    {
      v3 = FigBaseObject;
      v4 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
      if (v4)
        v4(v3);
    }
  }
}

- (void)didReceiveFigAssetWriterNotificationWithSuccess:(BOOL)a3 error:(id)a4
{
  if (a3)
    -[AVOperation markAsCompleted](self, "markAsCompleted", a3, a4);
  else
    -[AVOperation markAsFailedWithError:](self, "markAsFailedWithError:", a4);
}

@end

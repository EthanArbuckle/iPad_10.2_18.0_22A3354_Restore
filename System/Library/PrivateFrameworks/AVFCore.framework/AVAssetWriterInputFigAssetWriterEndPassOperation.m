@implementation AVAssetWriterInputFigAssetWriterEndPassOperation

- (AVAssetWriterInputFigAssetWriterEndPassOperation)init
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
  v6 = NSStringFromSelector(sel_initWithFigAssetWriter_trackID_);
  v12 = (void *)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Not available.  Use %@ instead."), v7, v8, v9, v10, v11, (uint64_t)v6), 0);
  objc_exception_throw(v12);
}

- (AVAssetWriterInputFigAssetWriterEndPassOperation)initWithFigAssetWriter:(OpaqueFigAssetWriter *)a3 trackID:(int)a4
{
  AVAssetWriterInputFigAssetWriterEndPassOperation *v8;
  OpaqueFigAssetWriter *v9;
  objc_super v11;

  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AVAssetWriterInput.m"), 5366, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("figAssetWriter != NULL"));
    if (a4)
      goto LABEL_3;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AVAssetWriterInput.m"), 5367, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("trackID != kCMPersistentTrackID_Invalid"));
LABEL_3:
  v11.receiver = self;
  v11.super_class = (Class)AVAssetWriterInputFigAssetWriterEndPassOperation;
  v8 = -[AVOperation init](&v11, sel_init);
  if (v8)
  {
    if (a3)
      v9 = (OpaqueFigAssetWriter *)CFRetain(a3);
    else
      v9 = 0;
    v8->_figAssetWriter = v9;
    v8->_trackID = a4;
  }
  return v8;
}

- (void)dealloc
{
  OpaqueFigAssetWriter *figAssetWriter;
  objc_super v4;

  figAssetWriter = self->_figAssetWriter;
  if (figAssetWriter)
    CFRelease(figAssetWriter);
  v4.receiver = self;
  v4.super_class = (Class)AVAssetWriterInputFigAssetWriterEndPassOperation;
  -[AVOperation dealloc](&v4, sel_dealloc);
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)start
{
  OpaqueFigAssetWriter *figAssetWriter;
  uint64_t trackID;
  uint64_t (*v5)(OpaqueFigAssetWriter *, uint64_t);
  signed int v6;

  if (-[AVOperation evaluateDependenciesAndMarkAsExecuting](self, "evaluateDependenciesAndMarkAsExecuting"))
  {
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterAddWeakListener();
    figAssetWriter = self->_figAssetWriter;
    trackID = self->_trackID;
    v5 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 144);
    if (v5)
    {
      v6 = v5(figAssetWriter, trackID);
      if (!v6)
        return;
    }
    else
    {
      v6 = -12782;
    }
    -[AVOperation markAsFailedWithError:](self, "markAsFailedWithError:", AVLocalizedErrorWithUnderlyingOSStatus(v6, 0));
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
  }
}

- (void)_notifyWhetherMorePassesAreNeeded:(BOOL)a3 timeRanges:(id)a4 forTrackWithID:(int)a5
{
  if (self->_trackID == a5)
  {
    if (a3)
      self->_nextPassDescription = -[AVAssetWriterInputPassDescription initWithTimeRanges:]([AVAssetWriterInputPassDescription alloc], "initWithTimeRanges:", a4);
    -[AVOperation markAsCompleted](self, "markAsCompleted");
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterRemoveWeakListener();
  }
}

- (AVAssetWriterInputPassDescription)descriptionForNextPass
{
  return self->_nextPassDescription;
}

@end

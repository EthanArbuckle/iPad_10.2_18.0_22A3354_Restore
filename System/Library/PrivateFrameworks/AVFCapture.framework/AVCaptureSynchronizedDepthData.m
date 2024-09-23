@implementation AVCaptureSynchronizedDepthData

+ (void)initialize
{
  objc_opt_class();
}

- (id)_initWithDepthData:(id)a3 timestamp:(id *)a4 depthDataWasDropped:(BOOL)a5 droppedReason:(int64_t)a6
{
  _QWORD *v10;
  AVCaptureSynchronizedDepthDataInternal *v11;
  void *v12;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14;
  objc_super v15;

  if (!a3)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);

    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v12);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v12);
    return 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)AVCaptureSynchronizedDepthData;
  v14 = *a4;
  v10 = -[AVCaptureSynchronizedData _initWithTimestamp:](&v15, sel__initWithTimestamp_, &v14);
  if (v10)
  {
    v11 = objc_alloc_init(AVCaptureSynchronizedDepthDataInternal);
    v10[2] = v11;
    if (v11)
    {
      *(_QWORD *)(v10[2] + 8) = a3;
      *(_BYTE *)(v10[2] + 16) = a5;
      *(_QWORD *)(v10[2] + 24) = a6;
      return v10;
    }

    return 0;
  }
  return v10;
}

- (void)dealloc
{
  AVCaptureSynchronizedDepthDataInternal *internal;
  objc_super v4;

  internal = self->_internal;
  if (internal)
  {

  }
  v4.receiver = self;
  v4.super_class = (Class)AVCaptureSynchronizedDepthData;
  -[AVCaptureSynchronizedData dealloc](&v4, sel_dealloc);
}

- (id)debugDescription
{
  const __CFString *v3;

  if (-[AVCaptureSynchronizedDepthData depthDataWasDropped](self, "depthDataWasDropped"))
    v3 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", dropped reason (%d)"), -[AVCaptureSynchronizedDepthData droppedReason](self, "droppedReason"));
  else
    v3 = &stru_1E421DB28;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), -[AVDepthData debugDescription](-[AVCaptureSynchronizedDepthData depthData](self, "depthData"), "debugDescription"), v3);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[AVCaptureSynchronizedDepthData debugDescription](self, "debugDescription"));
}

- (AVDepthData)depthData
{
  return self->_internal->depthData;
}

- (BOOL)depthDataWasDropped
{
  return self->_internal->depthDataWasDropped;
}

- (AVCaptureOutputDataDroppedReason)droppedReason
{
  return self->_internal->droppedReason;
}

@end

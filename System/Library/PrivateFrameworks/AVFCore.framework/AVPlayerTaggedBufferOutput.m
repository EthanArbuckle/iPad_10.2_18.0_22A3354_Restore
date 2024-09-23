@implementation AVPlayerTaggedBufferOutput

- (AVPlayerTaggedBufferOutput)init
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
  v6 = NSStringFromSelector(sel_initWithSpecification_);
  v12 = (void *)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Not available.  Use %@ instead."), v7, v8, v9, v10, v11, (uint64_t)v6), 0);
  objc_exception_throw(v12);
}

- (AVPlayerTaggedBufferOutput)initWithSpecification:(id)a3
{
  return -[AVPlayerTaggedBufferOutput initWithVideoOutput:](self, "initWithVideoOutput:", -[AVPlayerVideoOutput initWithSpecification:]([AVPlayerVideoOutput alloc], "initWithSpecification:", objc_msgSend(a3, "realSpecification")));
}

- (AVPlayerTaggedBufferOutput)initWithVideoOutput:(id)a3
{
  AVPlayerTaggedBufferOutput *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVPlayerTaggedBufferOutput;
  v4 = -[AVPlayerTaggedBufferOutput init](&v6, sel_init);
  if (v4)
    v4->_realOutput = (AVPlayerVideoOutput *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVPlayerTaggedBufferOutput;
  -[AVPlayerTaggedBufferOutput dealloc](&v3, sel_dealloc);
}

+ (AVPlayerTaggedBufferOutput)taggedBufferOutputWithVideoOutput:(id)a3
{
  return -[AVPlayerTaggedBufferOutput initWithVideoOutput:]([AVPlayerTaggedBufferOutput alloc], "initWithVideoOutput:", a3);
}

- (id)realOutput
{
  return self->_realOutput;
}

- (BOOL)hasNewTaggedBufferGroupForHostTime:(id *)a3
{
  AVPlayerVideoOutput *realOutput;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  realOutput = self->_realOutput;
  v5 = *a3;
  return -[AVPlayerVideoOutput hasNewTaggedBufferGroupForHostTime:](realOutput, "hasNewTaggedBufferGroupForHostTime:", &v5);
}

- (OpaqueCMTaggedBufferGroup)copyTaggedBufferGroupForHostTime:(id *)a3 presentationTimeStamp:(id *)a4
{
  AVPlayerVideoOutput *realOutput;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  realOutput = self->_realOutput;
  v6 = *a3;
  return -[AVPlayerVideoOutput copyTaggedBufferGroupForHostTime:presentationTimeStamp:activeConfiguration:](realOutput, "copyTaggedBufferGroupForHostTime:presentationTimeStamp:activeConfiguration:", &v6, a4, 0);
}

- (BOOL)_attachToPlayer:(id)a3
{
  return -[AVPlayerVideoOutput _attachToPlayer:exceptionReason:](self->_realOutput, "_attachToPlayer:exceptionReason:", a3, 0);
}

- (void)_detachFromPlayer:(id)a3
{
  -[AVPlayerVideoOutput _detachFromPlayer:](self->_realOutput, "_detachFromPlayer:", a3);
}

- (void)_setResourceLifeCycleHandler:(id)a3
{
  -[AVPlayerVideoOutput _setResourceLifeCycleHandler:](self->_realOutput, "_setResourceLifeCycleHandler:", a3);
}

@end

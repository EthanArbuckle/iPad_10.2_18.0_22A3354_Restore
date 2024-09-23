@implementation AVRunLoopConditionRunLoopState

- (__CFRunLoopSource)signalSource
{
  return self->_signalSource;
}

- (__CFRunLoop)runLoop
{
  return self->_runLoop;
}

- (void)setSignaled:(BOOL)a3
{
  self->_signaled = a3;
}

- (BOOL)signaled
{
  return self->_signaled;
}

- (void)setSignalSource:(__CFRunLoopSource *)a3
{
  self->_signalSource = a3;
}

+ (id)runLoopStateWithRunLoop:(__CFRunLoop *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRunLoop:", a3);
}

- (AVRunLoopConditionRunLoopState)initWithRunLoop:(__CFRunLoop *)a3
{
  AVRunLoopConditionRunLoopState *v4;
  AVRunLoopConditionRunLoopState *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVRunLoopConditionRunLoopState;
  v4 = -[AVRunLoopConditionRunLoopState init](&v7, sel_init);
  v5 = v4;
  if (a3)
  {
    if (v4)
    {
      v4->_runLoop = (__CFRunLoop *)CFRetain(a3);
      v5->_signaled = 0;
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  __CFRunLoop *runLoop;
  objc_super v4;

  runLoop = self->_runLoop;
  if (runLoop)
    CFRelease(runLoop);
  v4.receiver = self;
  v4.super_class = (Class)AVRunLoopConditionRunLoopState;
  -[AVRunLoopConditionRunLoopState dealloc](&v4, sel_dealloc);
}

@end

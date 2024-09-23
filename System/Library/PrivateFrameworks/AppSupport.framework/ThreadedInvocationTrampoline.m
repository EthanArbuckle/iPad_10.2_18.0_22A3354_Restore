@implementation ThreadedInvocationTrampoline

- (ThreadedInvocationTrampoline)initWithTarget:(id)a3 thread:(id)a4 immediateForMatchingThread:(BOOL)a5
{
  ThreadedInvocationTrampoline *v8;
  ThreadedInvocationTrampoline *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ThreadedInvocationTrampoline;
  v8 = -[ThreadedInvocationTrampoline init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[InvocationTrampoline setTarget:](v8, "setTarget:", a3);
    v9->_thread = (NSThread *)a4;
    v9->_immediateForMatchingThread = a5;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ThreadedInvocationTrampoline;
  -[InvocationTrampoline dealloc](&v3, sel_dealloc);
}

- (void)forwardInvocation:(id)a3
{
  NSThread *thread;

  objc_msgSend(a3, "retainArguments");
  thread = self->_thread;
  if (thread)
  {
    if (self->_immediateForMatchingThread)
    {
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread"), "isEqual:", self->_thread) & 1) != 0)
      {
        -[InvocationTrampoline performInvocation:](self, "performInvocation:", a3);
        return;
      }
      thread = self->_thread;
    }
    -[ThreadedInvocationTrampoline performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel_performInvocation_, thread, a3, 0);
  }
  else
  {
    -[ThreadedInvocationTrampoline performSelectorInBackground:withObject:](self, "performSelectorInBackground:withObject:", sel_performInvocation_, a3);
  }
}

@end

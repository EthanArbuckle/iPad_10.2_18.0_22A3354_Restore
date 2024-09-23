@implementation CNObservableContractTerminationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callStack, 0);
}

+ (id)currentContext
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCallStack:threadId:", v3, objc_msgSend(a1, "currentThreadId"));

  return v4;
}

- (CNObservableContractTerminationContext)initWithCallStack:(id)a3 threadId:(unint64_t)a4
{
  id v6;
  CNObservableContractTerminationContext *v7;
  uint64_t v8;
  NSArray *callStack;
  CNObservableContractTerminationContext *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNObservableContractTerminationContext;
  v7 = -[CNObservableContractTerminationContext init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    callStack = v7->_callStack;
    v7->_callStack = (NSArray *)v8;

    v7->_threadId = a4;
    v10 = v7;
  }

  return v7;
}

+ (unint64_t)currentThreadId
{
  _opaque_pthread_t *v2;
  __uint64_t v4;

  v4 = 0;
  if (!pthread_threadid_np(0, &v4))
    return v4;
  v2 = pthread_self();
  return pthread_mach_thread_np(v2);
}

- (NSArray)callStack
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)threadId
{
  return self->_threadId;
}

@end

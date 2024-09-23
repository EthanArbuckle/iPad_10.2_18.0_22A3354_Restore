@implementation IMThreadedInvocationTrampoline

- (IMThreadedInvocationTrampoline)initWithTarget:(id)a3 thread:(id)a4 immediateForMatchingThread:(BOOL)a5
{
  id v8;
  id v9;
  IMThreadedInvocationTrampoline *v10;
  const char *v11;
  uint64_t v12;
  IMThreadedInvocationTrampoline *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IMThreadedInvocationTrampoline;
  v10 = -[IMThreadedInvocationTrampoline init](&v15, sel_init);
  v13 = v10;
  if (v10)
  {
    objc_msgSend_setTarget_(v10, v11, (uint64_t)v8, v12);
    objc_storeStrong((id *)&v13->_thread, a4);
    v13->_immediateForMatchingThread = a5;
  }

  return v13;
}

- (void)forwardInvocation:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSThread *thread;
  void *v10;
  const char *v11;
  uint64_t v12;
  char isEqual;
  uint64_t v14;
  id v15;

  v15 = a3;
  objc_msgSend_retainArguments(v15, v4, v5, v6);
  thread = self->_thread;
  if (!thread)
  {
    objc_msgSend_performSelectorInBackground_withObject_(self, v7, (uint64_t)sel_performInvocation_, (uint64_t)v15);
    goto LABEL_8;
  }
  if (!self->_immediateForMatchingThread)
  {
LABEL_7:
    objc_msgSend_performSelector_onThread_withObject_waitUntilDone_(self, v7, (uint64_t)sel_performInvocation_, (uint64_t)thread, v15, 0);
    goto LABEL_8;
  }
  objc_msgSend_currentThread(MEMORY[0x1E0CB3978], v7, v8, (uint64_t)thread);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v10, v11, (uint64_t)self->_thread, v12);

  if ((isEqual & 1) == 0)
  {
    thread = self->_thread;
    goto LABEL_7;
  }
  objc_msgSend_performInvocation_(self, v7, (uint64_t)v15, v14);
LABEL_8:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thread, 0);
}

@end

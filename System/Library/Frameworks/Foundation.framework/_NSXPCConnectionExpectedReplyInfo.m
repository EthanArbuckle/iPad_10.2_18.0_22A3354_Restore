@implementation _NSXPCConnectionExpectedReplyInfo

- (_QWORD)initWithSelector:(_QWORD *)result
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)_NSXPCConnectionExpectedReplyInfo;
    result = objc_msgSendSuper2(&v3, sel_init);
    result[4] = a2;
  }
  return result;
}

- (void)dealloc
{
  NSObject *timeoutSemaphore;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];

  timeoutSemaphore = self->_timeoutSemaphore;
  if (timeoutSemaphore)
    dispatch_release(timeoutSemaphore);

  v4.receiver = self;
  v4.super_class = (Class)_NSXPCConnectionExpectedReplyInfo;
  -[_NSXPCConnectionExpectedReplyInfo dealloc](&v4, sel_dealloc);
}

- (void)cleanup
{
  NSObject *v2;

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 24);
    if (v2)
    {
      dispatch_semaphore_signal(v2);
      dispatch_release(*(dispatch_object_t *)(a1 + 24));
      *(_QWORD *)(a1 + 24) = 0;
    }
  }
}

@end

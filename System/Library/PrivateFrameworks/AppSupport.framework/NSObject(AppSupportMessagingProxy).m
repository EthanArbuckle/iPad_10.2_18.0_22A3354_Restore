@implementation NSObject(AppSupportMessagingProxy)

- (uint64_t)pep_onMainThread
{
  return objc_msgSend(a1, "pep_onThread:", objc_msgSend(MEMORY[0x1E0CB3978], "mainThread"));
}

- (uint64_t)pep_onMainThreadIfNecessary
{
  return objc_msgSend(a1, "pep_onThread:immediateForMatchingThread:", objc_msgSend(MEMORY[0x1E0CB3978], "mainThread"), 1);
}

- (ThreadedInvocationTrampoline)pep_onThread:()AppSupportMessagingProxy immediateForMatchingThread:
{
  return -[ThreadedInvocationTrampoline initWithTarget:thread:immediateForMatchingThread:]([ThreadedInvocationTrampoline alloc], "initWithTarget:thread:immediateForMatchingThread:", a1, a3, a4);
}

- (uint64_t)pep_onThread:()AppSupportMessagingProxy
{
  return objc_msgSend(a1, "pep_onThread:immediateForMatchingThread:", a3, 0);
}

- (DelayedInvocationTrampoline)pep_afterDelay:()AppSupportMessagingProxy
{
  return -[DelayedInvocationTrampoline initWithTarget:delay:]([DelayedInvocationTrampoline alloc], "initWithTarget:delay:", a1, a2);
}

- (uint64_t)pep_onOperationQueue:()AppSupportMessagingProxy
{
  return objc_msgSend(a1, "pep_onOperationQueue:priority:", a3, 0);
}

- (OperationQueueInvocationTrampoline)pep_onOperationQueue:()AppSupportMessagingProxy priority:
{
  return -[OperationQueueInvocationTrampoline initWithTarget:operationQueue:priority:]([OperationQueueInvocationTrampoline alloc], "initWithTarget:operationQueue:priority:", a1, a3, a4);
}

- (CapturedInvocationTrampoline)pep_getInvocation:()AppSupportMessagingProxy
{
  return -[CapturedInvocationTrampoline initWithTarget:outInvocation:]([CapturedInvocationTrampoline alloc], "initWithTarget:outInvocation:", a1, a3);
}

@end

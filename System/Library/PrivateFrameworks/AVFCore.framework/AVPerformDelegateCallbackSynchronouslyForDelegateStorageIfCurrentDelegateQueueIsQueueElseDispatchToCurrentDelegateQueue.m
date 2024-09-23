@implementation AVPerformDelegateCallbackSynchronouslyForDelegateStorageIfCurrentDelegateQueueIsQueueElseDispatchToCurrentDelegateQueue

void __AVPerformDelegateCallbackSynchronouslyForDelegateStorageIfCurrentDelegateQueueIsQueueElseDispatchToCurrentDelegateQueue_block_invoke(_QWORD *a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1940343FC]();
  AVPerformDelegateCallbackSynchronouslyForDelegateStorageIfCurrentDelegateQueueIsQueueElseDispatchToCurrentDelegateQueue(a1[4], a1[5], a1[6]);
  objc_autoreleasePoolPop(v2);
}

@end

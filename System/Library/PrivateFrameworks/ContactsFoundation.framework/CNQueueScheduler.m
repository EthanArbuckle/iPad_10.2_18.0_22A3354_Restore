@implementation CNQueueScheduler

uint64_t __62___CNQueueScheduler_afterDelay_performBlock_qualityOfService___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

uint64_t __61___CNQueueScheduler_performCancelableBlock_qualityOfService___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCanceled");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

void __62___CNQueueScheduler_afterDelay_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x194004260]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "cancel");
  objc_autoreleasePoolPop(v2);
}

@end
